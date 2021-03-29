Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2F534D176
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 15:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADA96E435;
	Mon, 29 Mar 2021 13:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53F76E43F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 13:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HlMwXG9F7rQxfE/ioYymVGNdhct+UgKTq50Xm1a9H1c=; b=G0SYq1BXP79XG8q9w7ezdwDBQT
 AGNhH0Ueqe4huQf2nr89NHEW+vg2bWJs0PR5fHWdXBfr8qTWeiqQZotyjOQxrzfhxve/Qni6+oAKQ
 bIsPrBbzSc7eHH9so3qIe7F0jPxaJNV78znBj4SN5pKIZf4/I6NPa2z3DUvACEmQFQaU7jOQwhLz6
 grfeOa/U4dxpBvkZpn4faWTvywwsII/BPspmXEwACTTOfw5faouWh6SvkyglcTmDwUGBwaWJ6LbrO
 AURXv2Vn8qsheBqR+8Ut1IeHwsCISs6vcbIAFYb4AYPCnblY8qsZX7hnpuMkb+Wo+SDbTVE4jwamu
 gYhk8r0w==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1lQs6n-0000Yj-RZ; Mon, 29 Mar 2021 16:39:09 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com
Subject: [PATCH v6 09/10] gpu: host1x: Assign intr waiter inside lock
Date: Mon, 29 Mar 2021 16:38:35 +0300
Message-Id: <20210329133836.2115236-10-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210329133836.2115236-1-mperttunen@nvidia.com>
References: <20210329133836.2115236-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the assignment of the ref out-pointer in host1x_intr_add_action
to happen within the spinlock. With the current arrangement,
it is possible for the waiter to complete before the assignment
has happened, which breaks horribly if the waiter completion
callback tries to use the reference.

In practice, there is currently no situation where this issue can
manifest -- it was first noticed with the upcoming DMA fence
implementation patches. As such this doesn't need to be backported.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/intr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
index 69b0e8e41466..6d1f3c0fdbe7 100644
--- a/drivers/gpu/host1x/intr.c
+++ b/drivers/gpu/host1x/intr.c
@@ -235,10 +235,11 @@ int host1x_intr_add_action(struct host1x *host, struct host1x_syncpt *syncpt,
 			host1x_hw_intr_enable_syncpt_intr(host, syncpt->id);
 	}
 
-	spin_unlock(&syncpt->intr.lock);
-
 	if (ref)
 		*ref = waiter;
+
+	spin_unlock(&syncpt->intr.lock);
+
 	return 0;
 }
 
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
