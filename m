Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9571FA9570D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 22:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B4310E489;
	Mon, 21 Apr 2025 20:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="mOlwOVjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D45010E489
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 20:13:19 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5e677f59438so6180173a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 13:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1745266397; x=1745871197;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HQ3M+bxooYYic4r0LufR96nrU2z3BmGWMkGOU6zDDn4=;
 b=mOlwOVjM60hl/crXBTTl7n+n6pPgO7V2O5YaOxC8LD4Y+/LQDb8b8ZaqruB3ztT7Ua
 6m1aaf7dksuB1v8Jp4M+SMMCaHPY0PW1TVYRU4U8Foyqw4iVdoLsuADtNxu/o3V32yny
 mBFGUmPfbg7i98Q6VgnizhtVnoxmh5LHJjaUuXop++Yr7CIaosWyRT0G7MFT8uLnQD70
 LR6KUxGp3i+wI1tus179I2dLlsaCce3l3usPKAQKyofA1ZIOwEu1by2RqN79OkQEbXfQ
 ap6j5jawyiihmpfUfWYkvctidWUwBuXAC0TdkgT/eEiQz0er2wAX4ZyLfI0xT88cETd2
 B2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745266397; x=1745871197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HQ3M+bxooYYic4r0LufR96nrU2z3BmGWMkGOU6zDDn4=;
 b=pFDTLRrs0xIO+mV5wz/SnA7mKbkgJkrA4qy1n2C7tNWOHb0RhgGm0K3NvkCswXYc2V
 DEDmHSuOQZtO0i5yhfcmCDJWhKerpUv24IMB1t/nuXnpE3NBsIDerjLGzqYyDZI4niEI
 BkfyrFEQuur5SYLspYHIg0UOF13aGUER+C2KrT58nqmANWAYfq8SvZ0Z6NJU5J3LLXHG
 VhH793quX2hz7tDOG6F/Ptor5Iby+HPYSX4uDDZQyLRG5EnpsUfxDYReKGCEDNmCHZFH
 Yy+NsLNTv401R03tXHjadTHW8FPbRvGjo08bLOW6ygO+4XLAOsP9UlZcr3Libw9YQ55P
 8ElA==
X-Gm-Message-State: AOJu0Yz9zhQ3hMFzGmHsD145QkUlJfh1LJOYIwm/36WiTvJiTe4B6fAX
 yE/I4o56CqhDolRz5ddKdDjpyZRLBWCuIa7d6PbpRFGXEn+kbPEif5ElPA==
X-Gm-Gg: ASbGncvy/uaY5Spq7ppjxjp6HG8do9wwHT5glnXaC4KyXlICa99yRzLExTh2FED/Z2H
 kS+J62bUg8KivFP+pchUvbWiQLadYjVqwMFEwGM7a0KZxNLl/rAW40c70drvs3Yb7vVHDzpx796
 JcdyO7T+FKpt9VYRM98Y6Vg0cPONfStGZ9ziuWoDL9ugxMaA/zjdmK9wYgAXVSoyNYgbu6aSusU
 IcMEOktK28P1oTgMxOe0q9MBBLpemt5AQ4+xHcXvA59NGE3DOODtG4EEFd9azPyItxF0andg+Vr
 ntPtZXv/fVVToK1u40/WxqzcUx6fSlrP/Yc3FigMI6zWXvABz3lv9kZmoW/oeCoYtrskII3BpTQ
 hQpyZpNJ7PcJl82ly/D/EyXuIgdDvbjDxN5BwgSmbbvFm5scAest69TI/er5eLtleRgKV2ICyLZ
 cL
X-Google-Smtp-Source: AGHT+IEaYd+jxjizAP2cVKjHkYaRIFui46Kp2EDtjubhkBoNX1u0J2KrystqnAigLWaQ0WwVYnx50w==
X-Received: by 2002:a50:ab11:0:b0:5f6:44de:d977 with SMTP id
 4fb4d7f45d1cf-5f644dee040mr5106066a12.1.1745266397171; 
 Mon, 21 Apr 2025 13:13:17 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a02-3100-a503-5900-0000-0000-0000-0e63.310.pool.telefonica.de.
 [2a02:3100:a503:5900::e63]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5f62557a547sm4955447a12.22.2025.04.21.13.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 13:13:15 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org, christianshewitt@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v2 1/2] Revert "drm/meson: vclk: fix calculation of 59.94
 fractional rates"
Date: Mon, 21 Apr 2025 22:12:59 +0200
Message-ID: <20250421201300.778955-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
References: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
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

From: Christian Hewitt <christianshewitt@gmail.com>

This reverts commit bfbc68e.

The patch does permit the offending YUV420 @ 59.94 phy_freq and
vclk_freq mode to match in calculations. It also results in all
fractional rates being unavailable for use. This was unintended
and requires the patch to be reverted.

Fixes: bfbc68e4d869 ("drm/meson: vclk: fix calculation of 59.94 fractional rates")
Cc: <stable@vger.kernel.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 2a942dc6a6dc..2a82119eb58e 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -790,13 +790,13 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
 				 FREQ_1000_1001(params[i].pixel_freq));
 		DRM_DEBUG_DRIVER("i = %d phy_freq = %d alt = %d\n",
 				 i, params[i].phy_freq,
-				 FREQ_1000_1001(params[i].phy_freq/1000)*1000);
+				 FREQ_1000_1001(params[i].phy_freq/10)*10);
 		/* Match strict frequency */
 		if (phy_freq == params[i].phy_freq &&
 		    vclk_freq == params[i].vclk_freq)
 			return MODE_OK;
 		/* Match 1000/1001 variant */
-		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/1000)*1000) &&
+		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/10)*10) &&
 		    vclk_freq == FREQ_1000_1001(params[i].vclk_freq))
 			return MODE_OK;
 	}
@@ -1070,7 +1070,7 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 
 	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
 		if ((phy_freq == params[freq].phy_freq ||
-		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/1000)*1000) &&
+		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/10)*10) &&
 		    (vclk_freq == params[freq].vclk_freq ||
 		     vclk_freq == FREQ_1000_1001(params[freq].vclk_freq))) {
 			if (vclk_freq != params[freq].vclk_freq)
-- 
2.49.0

