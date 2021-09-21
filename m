Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B375E413C4E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 23:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8936E839;
	Tue, 21 Sep 2021 21:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631876E839
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 21:21:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4559760F24;
 Tue, 21 Sep 2021 21:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632259311;
 bh=/qSWIbShMWBa5x9vPNqVBXY3/tfR8X1Q/6APO+n3E8M=;
 h=From:To:Cc:Subject:Date:From;
 b=u+C4MxQyIHJogdIwFLOJnhMhHM+MjSY0I4hqwKXbS2eaXmMvybZtz3hLRy/zN2Kkh
 4VbmovxiSEaNdqSMHf6s0wVZHuIyVjazh1jEWzU39NWQI/vYihl4s5NJl8mGem+Okd
 0Zw9qlsbPmXkD22NFaRx6G9QdSHdBS5bzRUcaakuQyuPPQBZE/t9REnqJBxWoamhEt
 Y1Hw/jhACRoOZDlH2VajCJjL8J4jpcc9xBnJew4QW+ERRqOWCKck1YEnqXvxrobU5y
 NHfjdtv2OnkC8ZNnV7QYDBwm0mxWpXk0WZYxxRy+0Yf1yPoPAcncT869ozzew7DJgp
 XAz0XB4nwsTGg==
From: Mark Brown <broonie@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: gbefb: Only instantiate device when built for
 IP32
Date: Tue, 21 Sep 2021 22:21:02 +0100
Message-Id: <20210921212102.30803-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; h=from:subject;
 bh=/qSWIbShMWBa5x9vPNqVBXY3/tfR8X1Q/6APO+n3E8M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSkyy+ZgVzBZM7oBzf1FmoKw3YCH+vFjPuiZuIgHt
 1OBvB0aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpMsgAKCRAk1otyXVSH0KKyB/
 4hmzdZd71Qc0N3hTk+UlgM+anFiOMJZszXSBDnPXecSmwPJuB5Fc3terGOa/H3xRUqI2osAqBQoPii
 SqSv5/RgR/+mqYcgU4BOMe3AesZ9dycqOrIWZ9G95gTkWo/oMcF/4AAHVDNnDhsaHLZ3t0V4BQtcA2
 As7ZgFBHUVqTRHiNsQMXOqm6xsGt/Ax3dipbYdCKOFeuFlVvGD50g19U+q8XgIUV8JrFJjG+/3pELF
 Q2y0hHeC1opGO8u3POmgcBlszTJHvvQphb2MIhiPCQEE25fa1m70RtNSlQoiynaFSvh55rE/Xmey8j
 mHTSwfT+GQzXz+f7GsEFuN4R+ougOU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
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

The gbefb driver not only registers a driver but also the device for that
driver. This is all well and good when run on the IP32 machines that are
supported by the driver but since the driver supports building with
COMPILE_TEST we might also be building on other platforms which do not have
this hardware and will crash instantiating the driver. Add an IS_ENABLED()
check so we compile out the device registration if we don't have the Kconfig
option for the machine enabled.

Fixes: 552ccf6b259d290c0c ("video: fbdev: gbefb: add COMPILE_TEST support")
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/gbefb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
index c5b99a4861e8..6b4d5a7f3e15 100644
--- a/drivers/video/fbdev/gbefb.c
+++ b/drivers/video/fbdev/gbefb.c
@@ -1267,7 +1267,7 @@ static struct platform_device *gbefb_device;
 static int __init gbefb_init(void)
 {
 	int ret = platform_driver_register(&gbefb_driver);
-	if (!ret) {
+	if (IS_ENABLED(CONFIG_SGI_IP32) && !ret) {
 		gbefb_device = platform_device_alloc("gbefb", 0);
 		if (gbefb_device) {
 			ret = platform_device_add(gbefb_device);
-- 
2.20.1

