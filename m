Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547B52BA8FD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 12:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD0C6E8AD;
	Fri, 20 Nov 2020 11:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72ABB6E8B3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 11:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0O2oLaPvIQ9KzWmiqrQPn/haDbaFhV5R4yd0BV2bH4w=; b=wurDZZIaixXu/Fg1E+MrOtu+HD
 bbQA8qjlYYV4KNtmquFVjdD6P6XWvpdyu2VThk9e2t/4I/BhfXasKDrqOWpwRn+7VjIGRr8yO+k/e
 HrjPFG2dJdc37DO2MgI6I3VrFMmZba+uqUQizkUNA/KDgsUFkPnslYOMKO5xQzIBrwLLn+l9x6dDz
 kTYv6/ok2DuO4rlhRiBgF5aTnfOJOKWUxC3TGo8dfne03w1V7megqks4/r7NeH24uxGkn612Qisoo
 qld0hj7LmWRcgjfz3CVZu6J7tqLt/UJtVyvA/4WaCI8Pd6/HkTqu+p/g64fPkWmmgIfT6No+OjqLo
 NsqxxFtg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kg4Yr-0003lG-CO; Fri, 20 Nov 2020 13:26:41 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v4 13/21] gpu: host1x: Reset max value when freeing a syncpoint
Date: Fri, 20 Nov 2020 13:25:52 +0200
Message-Id: <20201120112600.935082-14-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120112600.935082-1-mperttunen@nvidia.com>
References: <20201120112600.935082-1-mperttunen@nvidia.com>
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With job recovery becoming optional, syncpoints may have a mismatch
between their value and max value when freed. As such, when freeing,
set the max value to the current value of the syncpoint so that it
is in a sane state for the next user.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v3:
* Use host1x_syncpt_read instead of read_min to ensure syncpoint
  value is current.
---
 drivers/gpu/host1x/syncpt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index 8d658e5f7db2..99d31932eb34 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -385,6 +385,7 @@ static void syncpt_release(struct kref *ref)
 {
 	struct host1x_syncpt *sp = container_of(ref, struct host1x_syncpt, ref);
 
+	atomic_set(&sp->max_val, host1x_syncpt_read(sp));
 	sp->locked = false;
 
 	mutex_lock(&sp->host->syncpt_mutex);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
