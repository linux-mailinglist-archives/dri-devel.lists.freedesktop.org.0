Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A7015BA90
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 09:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD6C6E197;
	Thu, 13 Feb 2020 08:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801E86E18F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 08:00:12 +0000 (UTC)
Received: by mail-pl1-x64a.google.com with SMTP id h8so2698703plr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 00:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=tSlvrP4m66P1XACDCZDaP68t1HESopkE2ZYSJ/oW5Fc=;
 b=O0GgSTgCFWMe+CSNK993pV/PwzdGIXWDBR5X0/FBv+KHqZ7K9sI8OSrRkyU2JF0+bK
 a0oFchkMZ4tO5BLEk4bqnVywm6K4MRwLuT6lzun7Hb0FO7W5GmcvMELg9+zjOEAdeVkm
 bSVmoX3bkve//nZfusUDzKoQkpuWEWx2ND7zPEikUeU5mF44vV+/iie9fotkaJAoilcd
 SmTm7Pm+KaDA+TUmnOd/MFzybL1naAUfM8Ow8c9XSDEUk43pq3NJSkxA23l228OFxcqy
 yfEXmL17ZGL6KyDE/6ENhvek7IcRNXzWn+5PVtqvvkRRXWIdpkeQr63Cn+yXUn3o56i2
 joAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=tSlvrP4m66P1XACDCZDaP68t1HESopkE2ZYSJ/oW5Fc=;
 b=GqrS9RHZNNf5VuB/coALXhW3AdJBSZiYoc/LRJ2BSliaL6TRoGbp5o7llvUNmZawP1
 aZnh0LR8sVrcQLE9w1dUfD6LgttYCOQWYke+BnMhrkNOlaf6A29FZOWrauRAXms2gxe2
 9CNuSQcybdy08SKNuv3tJ5NQNcf+g5Y+dwEGm50aXbGtuOoGqKcBw5LmzSUnSZjbUyPr
 0uKK5jObwZNceBXnN+KZHjBeD6gIlc4r9vIvt1FzszhyV5qGAckF8eIrfHX7zLbhERmq
 +c/BDUItA7lC/mEGtGI2hf6sWDma7kXapt+FlZq/WSsCdLgMUMy/nr+erH/1fbxxAKcO
 e47Q==
X-Gm-Message-State: APjAAAU3YGfCbYHCnVAOr6W+uRazXTOhrvayg91jqyLlk5ETC3B0CS4R
 u2hHbcKcBfc9V00u73Nt+cMLCphkeU9N
X-Google-Smtp-Source: APXvYqzDfbbpNkunl4GqakNBCLdfvlQrA9qA9iLtF3TS+2Mot3yuBl6sVFlx4f7nIe24WVH3YWORwiVOgN12
X-Received: by 2002:a63:4305:: with SMTP id q5mr17607821pga.64.1581580811962; 
 Thu, 13 Feb 2020 00:00:11 -0800 (PST)
Date: Thu, 13 Feb 2020 15:59:57 +0800
Message-Id: <20200213153226.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
Subject: [PATCH] drm/mediatek: fix race condition for HDMI jack status
 reporting
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
X-Mailman-Approved-At: Thu, 13 Feb 2020 08:12:52 +0000
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
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

plugged_cb and codec_dev are also in danger of race condition.  Instead
of using mutex to protect them:
- Checks NULLs first.
- Uses WRITE_ONCE() to prevent store tearing (i.e. write to plugged_cb
  after codec_dev).
- Uses codec_dev as a signal to report HDMI jack status.

Fixes: 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting")

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Previous discussion: https://patchwork.kernel.org/patch/11367625/
Previous attempt: https://patchwork.kernel.org/patch/11378413/

 drivers/gpu/drm/mediatek/mtk_hdmi.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 03aeb73005ef..b1e5d0c538fa 100644
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
 
-	if (hdmi->plugged_cb && hdmi->codec_dev)
+	mutex_lock(&hdmi->update_plugged_status_lock);
+	connected = mtk_cec_hpd_high(hdmi->cec_dev);
+	if (hdmi->codec_dev)
 		hdmi->plugged_cb(hdmi->codec_dev, connected);
+	mutex_unlock(&hdmi->update_plugged_status_lock);
 
 	return connected ?
 	       connector_status_connected : connector_status_disconnected;
@@ -1669,8 +1674,12 @@ static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
 {
 	struct mtk_hdmi *hdmi = data;
 
-	hdmi->plugged_cb = fn;
-	hdmi->codec_dev = codec_dev;
+	if (!fn || !codec_dev)
+		return -EINVAL;
+
+	/* Use WRITE_ONCE() to prevent store tearing. */
+	WRITE_ONCE(hdmi->plugged_cb, fn);
+	WRITE_ONCE(hdmi->codec_dev, codec_dev);
 	mtk_hdmi_update_plugged_status(hdmi);
 
 	return 0;
@@ -1729,6 +1738,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	mutex_init(&hdmi->update_plugged_status_lock);
 	platform_set_drvdata(pdev, hdmi);
 
 	ret = mtk_hdmi_output_init(hdmi);
-- 
2.25.0.225.g125e21ebc7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
