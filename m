Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5450161D14
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 23:04:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAC56E0A6;
	Mon, 17 Feb 2020 22:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 68DD66E0A6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 22:04:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC783106F;
 Mon, 17 Feb 2020 14:03:59 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F72E3F703;
 Mon, 17 Feb 2020 14:03:59 -0800 (PST)
Date: Mon, 17 Feb 2020 22:03:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Applied "drm/mediatek: fix race condition for HDMI jack status
 reporting" to the asoc tree
In-Reply-To: <20200217105513.2.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
Message-Id: <applied-20200217105513.2.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
X-Patchwork-Hint: ignore
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
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 dgreid@google.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch

   drm/mediatek: fix race condition for HDMI jack status reporting

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From f07980d4ed60fbb35857b655c94b111f4ddf2abf Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Feb 2020 11:16:53 +0800
Subject: [PATCH] drm/mediatek: fix race condition for HDMI jack status
 reporting

hdmi_conn_detect and mtk_hdmi_audio_hook_plugged_cb would be called
by different threads.

Imaging the following calling sequence:
           Thread A                            Thread B
--------------------------------------------------------------------
mtk_hdmi_audio_hook_plugged_cb()
mtk_cec_hpd_high() -> disconnected
                                     hdmi_conn_detect()
                                     mtk_cec_hpd_high() -> connected
                                     plugged_cb(connected)
plugged_cb(disconnected)

The latest disconnected is false reported.  Makes mtk_cec_hpd_high
and plugged_cb atomic to fix.

Also uses the same lock to protect read/write of plugged_cb and codec_dev.

Fixes: 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Acked-by: CK Hu <ck.hu@mediatek.com>
Link: https://lore.kernel.org/r/20200217105513.2.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 03aeb73005ef..d80017e3d84a 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
+#include <linux/mutex.h>
 #include <linux/of_platform.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
@@ -171,6 +172,7 @@ struct mtk_hdmi {
 	bool enabled;
 	hdmi_codec_plugged_cb plugged_cb;
 	struct device *codec_dev;
+	struct mutex update_plugged_status_lock;
 };
 
 static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
@@ -1199,10 +1201,13 @@ static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
 static enum drm_connector_status
 mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
 {
-	bool connected = mtk_cec_hpd_high(hdmi->cec_dev);
+	bool connected;
 
+	mutex_lock(&hdmi->update_plugged_status_lock);
+	connected = mtk_cec_hpd_high(hdmi->cec_dev);
 	if (hdmi->plugged_cb && hdmi->codec_dev)
 		hdmi->plugged_cb(hdmi->codec_dev, connected);
+	mutex_unlock(&hdmi->update_plugged_status_lock);
 
 	return connected ?
 	       connector_status_connected : connector_status_disconnected;
@@ -1669,8 +1674,11 @@ static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
 {
 	struct mtk_hdmi *hdmi = data;
 
+	mutex_lock(&hdmi->update_plugged_status_lock);
 	hdmi->plugged_cb = fn;
 	hdmi->codec_dev = codec_dev;
+	mutex_unlock(&hdmi->update_plugged_status_lock);
+
 	mtk_hdmi_update_plugged_status(hdmi);
 
 	return 0;
@@ -1729,6 +1737,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	mutex_init(&hdmi->update_plugged_status_lock);
 	platform_set_drvdata(pdev, hdmi);
 
 	ret = mtk_hdmi_output_init(hdmi);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
