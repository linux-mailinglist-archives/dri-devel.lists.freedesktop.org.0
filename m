Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F178153FD8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36E26F9F0;
	Thu,  6 Feb 2020 08:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com
 [IPv6:2607:f8b0:4864:20::f4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043BD6F4F7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 09:38:07 +0000 (UTC)
Received: by mail-qv1-xf4a.google.com with SMTP id n11so1109308qvp.15
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 01:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=KEIH1qwXja/ZmU3/27elfahliyGtpPNLFM8jJAbIPe0=;
 b=CoDv4bmuhxUgR9bmsyfNwNeOGpipEjZz8WHI+CF859hIUpkYWhXlhZwzAGsS+bPxJw
 Ni25hCPqGGwCReROxGvBFe85BqQlIdFwrDE8Aowsf/8AHVm8sqc7vLbbhkP17oOX64eb
 V9eMMRvIDW6H7Pz8nTq7LCrhZOZuL2C3HVODNKe2b6HpegWPXfbX1PzxIsimi9NcM4Xu
 CGVHfTG2rPKgIC8f/fJqIRs0ZAsBZr18+eBxoedw8zjw9rdjBhGLKhyTIMnZ1jiCjUib
 qHWvt/JaBhiM4wikSZFQXK0Qu3yEzmFTBljvuMJBn2OfWVYp40mGXjDSVIAJLqBKIP/K
 Jezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=KEIH1qwXja/ZmU3/27elfahliyGtpPNLFM8jJAbIPe0=;
 b=BKkX3VazeuYdQajSx/Dik1G7KpmvTLku2m0fJdRfOkr5pl+QF0RfECWd85JCp87RbS
 If7+hBjKj8K+mwu3+rLP/mKuKVNd9hgflsOLMT0OietURcU40QOjZLR2oU8h+wcVkeHD
 5ZtPcqZYNg8pC2F8mED6tSxSG+cd2dphlQbupLn1rkTolnz4chDdOfwtSI1a1KLAR165
 71+4DPbverYAeeqv81Su7EOVzd8nM3BYPLg1cjYIiwMHYtgRsYPhiivM6nU8QCNDf5o3
 zuGni80A0usFhnX1JDwDqmMj7OMBl6XzKidcsKOVLzspDo2fe+WJ2nKpu2B/jOBMFiS8
 hWlA==
X-Gm-Message-State: APjAAAUJIXESjtV4Svi0M3veVQgbShop8WQTnEcjtv3JLojmTsTKGmfa
 nGzUO9gl0F2q/9T7TgBsN2gj9c+ae/8u
X-Google-Smtp-Source: APXvYqxBmBAsv6b6o4/hWnX6IZaGVfp7aEruPTeKewWwwid+Xv/sFuCAvNLDBkRklTQQiyRmKKgqtlZR4Yp3
X-Received: by 2002:ac8:769a:: with SMTP id g26mr32402406qtr.259.1580895486103; 
 Wed, 05 Feb 2020 01:38:06 -0800 (PST)
Date: Wed,  5 Feb 2020 17:37:43 +0800
In-Reply-To: <20200205093745.79298-1-tzungbi@google.com>
Message-Id: <20200205170416.1.Ieba8d422486264eb7aaa3aa257620a1b0c74c6db@changeid>
Mime-Version: 1.0
References: <20200205093745.79298-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH 1/3] drm/mediatek: exit earlier if failed to register audio
 driver
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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

Exits earlier if register_audio_driver() returns errors.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index c79b1f855d89..23c2b0e8693d 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1656,7 +1656,7 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
 	.get_eld = mtk_hdmi_audio_get_eld,
 };
 
-static void mtk_hdmi_register_audio_driver(struct device *dev)
+static int mtk_hdmi_register_audio_driver(struct device *dev)
 {
 	struct hdmi_codec_pdata codec_data = {
 		.ops = &mtk_hdmi_audio_codec_ops,
@@ -1669,9 +1669,10 @@ static void mtk_hdmi_register_audio_driver(struct device *dev)
 					     PLATFORM_DEVID_AUTO, &codec_data,
 					     sizeof(codec_data));
 	if (IS_ERR(pdev))
-		return;
+		return PTR_ERR(pdev);
 
 	DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
+	return 0;
 }
 
 static int mtk_drm_hdmi_probe(struct platform_device *pdev)
@@ -1705,7 +1706,11 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	mtk_hdmi_register_audio_driver(dev);
+	ret = mtk_hdmi_register_audio_driver(dev);
+	if (ret) {
+		dev_err(dev, "Failed to register audio driver: %d\n", ret);
+		return ret;
+	}
 
 	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
 	hdmi->bridge.of_node = pdev->dev.of_node;
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
