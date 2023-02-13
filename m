Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BAC69413D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 10:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947A410E516;
	Mon, 13 Feb 2023 09:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DFA10E515
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 09:32:25 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id w13so4946175ilv.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 01:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HBz92z5A8CZa/xH83NbuX5+91oG8R3c7gdeOhlTDlKA=;
 b=PTUc3vXyXoqSkn9BsgwWHkXFDBT0xwJkWyWTC06HDyAu0xsxh3wUGX1fSckmu64gDn
 LfMFHtwdZRRgfR2hl26pjCvG/Ptp6QdqNgWxQ1gq26Hz8QeF6ieFlTzuwqSmNr9IozIn
 ObSkHz1bBsm/sdePESII2BNovcKIPjnreiVQMuRpiHH4IP6f2gOqcLxpP5IDQJaGK32f
 Ww9Yz2RNxx0wdfykTiuZUIOrbHK/nvix7akhBdZ80wmN8muS7F635m61YLYj1141VZj0
 z6/fqyMlVSyfHKvl9FlRRZ3gUAhCTY6bo4hssX+Uz1pBn0FvI66VijCs6UBbg76vEke3
 fgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HBz92z5A8CZa/xH83NbuX5+91oG8R3c7gdeOhlTDlKA=;
 b=V6ZwMbM5dxQAKWGCJX8LVh9WrG2vSB38hZvaVrphieBcd3b0RyIDAsNEfyPjpns0uc
 5H55EMOexHDNYi3yxLaCmnO0HQ3CJU0dIONv9kazjT0D+mugllEeF3DEiHF127nJ5yOS
 7kouNA29j8CCTRZHCJquDcekToXvQMI9+i5zVXm+RS3SWHvmYsTx2GrKJgRU49L3sofT
 aUM+va8SVNuXrfF3W8HZPkGlbn+J/AaDZEuvtoWURqNNct7EJ5uI0Rdfd3uUA+cc2OGZ
 U7pPU4FmBn+rlnIdcZwqDS1YOmVU0gYxRp1eDKkpwAe0yeX+Gy/X+Qj81BUBrdEMneMN
 Mn3g==
X-Gm-Message-State: AO0yUKUBG3O649Yf0edIZt83HVfLYs0YFwDPlETdYqzYvz4/DTkIg93B
 d7oW5F4FcgxrY+/XDeq7w2rAag==
X-Google-Smtp-Source: AK7set+hjjq9yGMomTKRGA59ne7HDilQggjbF/jlQkSZf17NedHYh2S0uP13f98jIUFirkZ0Z844Gg==
X-Received: by 2002:a05:6e02:2143:b0:315:35d4:1d28 with SMTP id
 d3-20020a056e02214300b0031535d41d28mr6432722ilv.8.1676280744277; 
 Mon, 13 Feb 2023 01:32:24 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:2487:f87c:fb5b:9046])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a02b90e000000b003a0565a5750sm3695383jan.119.2023.02.13.01.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 01:32:23 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 13 Feb 2023 10:32:09 +0100
Subject: [PATCH v2] drm/meson/meson_venc: Relax the supported mode checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230210-relax_dmt_limits-v2-1-318913f08121@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAJgD6mMC/32NXQrCMBCEr1L22UiSthZ88h4iZZOudiE/kNRgK
 bm7wQP4NHwD38wBmRJThmt3QKLCmWNooE8d2BXDiwQvjUFL3UutpEjk8DMvfpsde96y6MeRNCo
 7WfuEphnMJEzCYNcmhrdzrVw5bzHtv5uiWtz/LBYlpEA1TMNFD8vYy5vB3bFJdLbRw6PW+gVai
 TTvuAAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Da Xue <da@lessconfused.com>
X-Mailer: b4 0.12.1
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
Cc: linux-amlogic@lists.infradead.org, Carlo Caione <ccaione@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Relax a bit the supported modes list by including also 480x1920 and
400x1280. This was actually tested on real hardware and it works
correctly.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
In particular relax the resolution checks to allow more resolutions like
480x1920 and 400x1280.
---
Changes in v2:
- Lower the hdisplay limit to support 400x1280 as well.
- Link to v1: https://lore.kernel.org/r/20230210-relax_dmt_limits-v1-0-a1474624d530@baylibre.com
---
 drivers/gpu/drm/meson/meson_venc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 3c55ed003359..fcd532db19c1 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -866,10 +866,10 @@ meson_venc_hdmi_supported_mode(const struct drm_display_mode *mode)
 			    DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC))
 		return MODE_BAD;
 
-	if (mode->hdisplay < 640 || mode->hdisplay > 1920)
+	if (mode->hdisplay < 400 || mode->hdisplay > 1920)
 		return MODE_BAD_HVALUE;
 
-	if (mode->vdisplay < 480 || mode->vdisplay > 1200)
+	if (mode->vdisplay < 480 || mode->vdisplay > 1920)
 		return MODE_BAD_VVALUE;
 
 	return MODE_OK;

---
base-commit: 38c1e0c65865426676123cc9a127526fa02bcac6
change-id: 20230210-relax_dmt_limits-355e2a1c7ccf

Best regards,
-- 
Carlo Caione

