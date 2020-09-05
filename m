Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7A625E712
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 12:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BACF6ED5F;
	Sat,  5 Sep 2020 10:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437A56ED44
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Sep 2020 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N/bRBmyQkJLgSyUzsVQ6uNyTLjcI6xyjAhEB1wYIDE4=; b=L8+NEkp53MNU0AfyY1A7hdM56I
 XjvXk9kzkMNCN6jWkN0GppOMFZvstj2YtyyawRbyRNEX2MRzvlX6iDNt+mlPJaYTG17Kixu2/iaq+
 B4A6fARpZeILsQlfu/IMj5LSfO5HRCa6iV0heBDRgMKVWj2adJU7o0uYVcEbwC5s36onrqLpNvX60
 9HPSKGN86MoZuX1lsiUnei7F6BY2Wodge2UeP6l11fSFJQ4hSG/tdevepyJtkpP9UcgrTrhmWYBMl
 HmP7aiWXBta7F0aa62FM87EoJCzegwTvPVMZc63aty7fklRrDkI99RwCRAa1yn1+LcRBl1AbkfS6S
 m6e1RAhA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kEVXy-0003SS-F2; Sat, 05 Sep 2020 13:35:50 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [RFC PATCH v2 13/17] gpu: host1x: Reset max value when freeing a
 syncpoint
Date: Sat,  5 Sep 2020 13:34:16 +0300
Message-Id: <20200905103420.3021852-14-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905103420.3021852-1-mperttunen@nvidia.com>
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.250.171.65
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
 drivers/gpu/host1x/syncpt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index 2fad8b2a55cc..82ecb4ac387e 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -385,6 +385,7 @@ static void syncpt_release(struct kref *ref)
 {
 	struct host1x_syncpt *sp = container_of(ref, struct host1x_syncpt, ref);
 
+	atomic_set(&sp->max_val, host1x_syncpt_read_min(sp));
 	sp->locked = false;
 
 	mutex_lock(&sp->host->syncpt_mutex);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
