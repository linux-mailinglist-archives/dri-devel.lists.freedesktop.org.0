Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A8B4081DC
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 23:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA3B6E09C;
	Sun, 12 Sep 2021 21:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tartarus.angband.pl (tartarus.angband.pl [51.83.246.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEDC6E09C
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 21:32:01 +0000 (UTC)
Received: from 89-73-149-240.dynamic.chello.pl ([89.73.149.240]
 helo=barad-dur.angband.pl)
 by tartarus.angband.pl with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kilobyte@angband.pl>)
 id 1mPX2l-00C2du-Di; Sun, 12 Sep 2021 23:29:45 +0200
Received: from [2a02:a31c:8245:f980::4] (helo=valinor.angband.pl)
 by barad-dur.angband.pl with esmtp (Exim 4.94.2)
 (envelope-from <kilobyte@angband.pl>)
 id 1mPX2k-0003DH-LK; Sun, 12 Sep 2021 23:29:42 +0200
Received: from kilobyte by valinor.angband.pl with local (Exim 4.95-RC2)
 (envelope-from <kilobyte@valinor.angband.pl>) id 1mPX2j-00037U-2U;
 Sun, 12 Sep 2021 23:29:41 +0200
From: Adam Borowski <kilobyte@angband.pl>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Cc: Adam Borowski <kilobyte@angband.pl>
Date: Sun, 12 Sep 2021 23:29:35 +0200
Message-Id: <20210912212935.11965-1-kilobyte@angband.pl>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 89.73.149.240
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on tartarus.angband.pl
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001,SPF_PASS=-0.001,TVD_RCVD_IP=0.001 autolearn=no
 autolearn_force=no languages=en
Subject: [PATCH] drm/rockchip: fix a -Werror fail on !CONFIG_PM_SLEEP
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on tartarus.angband.pl)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 With Linus suddenly loving -Werror, let's get clean.

 drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 8ab3247dbc4a..bee0f2d2a9be 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -1123,6 +1123,7 @@ static int cdn_dp_suspend(struct device *dev)
 	return ret;
 }
 
+#ifdef CONFIG_PM_SLEEP
 static int cdn_dp_resume(struct device *dev)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
@@ -1135,6 +1136,7 @@ static int cdn_dp_resume(struct device *dev)
 
 	return 0;
 }
+#endif
 
 static int cdn_dp_probe(struct platform_device *pdev)
 {
-- 
2.33.0

