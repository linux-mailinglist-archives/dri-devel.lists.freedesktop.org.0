Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0294D941274
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 14:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6171E10E51D;
	Tue, 30 Jul 2024 12:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KjGbttCw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0452310E51B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 12:50:44 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4281abc65daso20068235e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 05:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343842; x=1722948642;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v0bww741v4ESlaOBOd/IxNqqLNy/KYkDWPizVqdvx9s=;
 b=KjGbttCwO1Oe671tqveLF1bolnvgW9XBLiKPVjpRTqLtuxQ8MAFw/Z8jRKHhC+SqHy
 BegTMlhRsbsyFSLQ6G0n4w/tnMuzNLuxyUnZno1GvX7THUQkYx4xcmW97H6R74SEdmcq
 5sy7OnD6nTKUbiidT0mctk5sF1A62hRbxsnRKLMUHww8ZzeuRD6tdqANagkTe7pk5vYL
 MSn4eV4MqweKAZu2L5iAjEUoHNCTK4nE9zzdZCC5h/Fvuv6s0pa5Fw3VH93XkFWZocCA
 X9BMijJXDe2mfbOSw6VlfcVB2CYnr0FsomJ8Fq6QucxHB5znjrLgYPbiBt0IC+wy3zTv
 133w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722343842; x=1722948642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v0bww741v4ESlaOBOd/IxNqqLNy/KYkDWPizVqdvx9s=;
 b=M++M7d8aJwm3MN1r69r1H5JFJO/1JKfK5/B7rrjuGlVk2ah8CcsNE6mzu3uuuahr3F
 Yofl7J4fb8XMaZBps5vUnljDw4GMCAvkDKw6Qehu1C0E55csgI2a7vtmaZaGpYxFaz7m
 HGqK0epqaD0MHdU7lR/hHX1ac8Em985l1ObdrRqHpo8ri4g03Gc8ZRA+g+pfdjWqJdow
 Eenxhf68VIPjPiEz7mtvBpoJY+ZCceQy1/1vN1ELBvkxao39JCYH19mSwSYXi+FsXeSR
 JiHguNyesnbgGhWa24zWcDEMw8b06DlXm2X+Km69803pDiz64Rh5//m+uP3R2VcdeuUH
 k9VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7pOHnfpIJLMFHFva4P3DJYjcTh8ZfYtFbsefcWowvkd4ozrV6tzKyFp5LifqwLLpV+U1T+wK5RD6EdOcatUim2pHSDSZ5X9/1yjv0G2Ls
X-Gm-Message-State: AOJu0Yx1jsGvhWUJ8Xgi8WgnXIjvbD/1pUzMA4ebHBzXca8hjcGrinJS
 BBaWsPV+kjVHKrddDTLMqzxdkAugQmeM+AUuEde2LUP7xO6Ng+TNozJNtrYNXLo=
X-Google-Smtp-Source: AGHT+IFLDFq9LHqnUG6FBRbdJiqK71bxJQkIPCuJCS1JXepzU3MHqB97SQW7gMPpjbviNnFl2fKRWg==
X-Received: by 2002:a05:600c:1c93:b0:426:64a2:5362 with SMTP id
 5b1f17b1804b1-42811d71586mr72986835e9.8.1722343842261; 
 Tue, 30 Jul 2024 05:50:42 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 05:50:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH LATER 9/9] drm/meson: dw-hdmi: drop hdmi system clock setup
Date: Tue, 30 Jul 2024 14:50:19 +0200
Message-ID: <20240730125023.710237-10-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730125023.710237-1-jbrunet@baylibre.com>
References: <20240730125023.710237-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

Poking the HHI syscon is a way to setup clocks behind CCF's back.
Drop these poke and let CCF handle this using DT assigned-clocks.

HHI is a collection of Amlogic devices, such as clocks, reset,
power domains and phys.

This is another step to get rid of HHI access in Amlogic display drivers
and possibly stop using the component API.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 This change depends on:
 * 0602ba0dcd0e ("arm64: dts: amlogic: gx: correct hdmi clocks")
 * 1443b6ea806d ("arm64: dts: amlogic: setup hdmi system clock")

Time is needed for these changes to sink in u-boot and distros,
making this change safe to apply.

 drivers/gpu/drm/meson/meson_dw_hdmi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 6c18d97b8b16..b54c1e3093e9 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -111,7 +111,6 @@
 #define HDMITX_TOP_G12A_OFFSET	0x8000
 
 /* HHI Registers */
-#define HHI_HDMI_CLK_CNTL	0x1cc /* 0x73 */
 #define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 */
 #define HHI_HDMI_PHY_CNTL1	0x3a4 /* 0xe9 */
 #define  PHY_CNTL1_INIT		0x03900000
@@ -419,9 +418,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 {
 	struct meson_drm *priv = meson_dw_hdmi->priv;
 
-	/* Enable clocks */
-	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
-
 	/* Bring out of reset */
 	regmap_write(meson_dw_hdmi->top, HDMITX_TOP_SW_RESET, 0);
 	msleep(20);
-- 
2.43.0

