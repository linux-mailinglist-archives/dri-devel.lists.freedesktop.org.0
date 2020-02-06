Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80963153FD5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAA66F9E1;
	Thu,  6 Feb 2020 08:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A8A6F9AD
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 03:18:16 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id 203so2954138pfx.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 19:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=KEIH1qwXja/ZmU3/27elfahliyGtpPNLFM8jJAbIPe0=;
 b=t6ozdDcWXnqlycYXVvxHhOWC41qF8dQhtkxMgc3cj9ys3LWT7swok1SnhBVAqh4iIK
 8NGSfV4wb+JIYUnOBtkwGiKW7JzQK9Fbhjvr2h71WZluUnlT9W0Bgr8EhRAlKqKxDztE
 0d9+GSbN9KCNqXWGRSEM/FSn/rRn+D8W6XEcFtH27mvwDZUFKXCYgdT3hVS5EWHVu/gw
 PF+v4DFja2f+vDZtTesIeq+13RktcT/86fnEUJd6gxFj9jDTQ/A4tu/vpr5NXiqjgmwY
 sKlio/9K9cB+vXBOcyXXIYz+P3CWg0IwHwRwAVQ5UJU7ydufexjk2HoQyc1cdNCiCFN7
 DDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=KEIH1qwXja/ZmU3/27elfahliyGtpPNLFM8jJAbIPe0=;
 b=GRXXGv23MAdHUYA6Opr4opH59GHaf40Zjjf/4KQHVk6oINpcnaCI3e3XvGQVu5oipG
 01EoUkDCEuzPUQ0WOCCEJ9bSD1j9QHVJ9fwRw+xjA0xZ0NOUbnUcR3plDuEajuBq8x5y
 KU3m030N91vkooXbnPrr31TgsXFmNcOqY0+X0pekdWtcYYNUWC61KwJDRWyz2xsjjW0+
 3aTHD5WQTW3qjmmrajtSoiU1335+9DE5mTHauCWWTqoVuDYcfR+7JL+lCiBmHfNfTCiD
 m3BExKbdvI6oYw6v9K1UPicHcsp10dPM2ViQm8etRzEUtl3uFsXSb0HMVnykgA8uU6Ck
 tEPw==
X-Gm-Message-State: APjAAAUXVY3jpyT0L/1byIKsgyyawXQJwtkDIq7pqNEfy9XMzYE5xLgM
 lQH9MwxvzlKD1266wwBIl+mL/7O3yplI
X-Google-Smtp-Source: APXvYqwvYH4hqfpVMgHnlTJXAR9wXcKrV1aylz6TVB7wVNgSuffWm5cIKjVzB2ZMIRRMPL4bBaqkFWGwqZ2Y
X-Received: by 2002:a63:ff5c:: with SMTP id s28mr1290924pgk.196.1580959095995; 
 Wed, 05 Feb 2020 19:18:15 -0800 (PST)
Date: Thu,  6 Feb 2020 11:17:50 +0800
In-Reply-To: <20200206031752.193298-1-tzungbi@google.com>
Message-Id: <20200206102509.1.Ieba8d422486264eb7aaa3aa257620a1b0c74c6db@changeid>
Mime-Version: 1.0
References: <20200206031752.193298-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v2 1/3] drm/mediatek: exit earlier if failed to register audio
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
