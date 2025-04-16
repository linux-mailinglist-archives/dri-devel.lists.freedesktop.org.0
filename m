Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07146A914FE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 09:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A1510EA3F;
	Thu, 17 Apr 2025 07:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AQAyKQgN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEAE10E24E;
 Wed, 16 Apr 2025 09:11:50 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-224019ad9edso86622385ad.1; 
 Wed, 16 Apr 2025 02:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744794710; x=1745399510; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3ijzgK4iv6W9/SkZI5SFAq7Ny3NSkdxIDk62807ZYl0=;
 b=AQAyKQgNpfg7Nlb7lf7LRF/B2BvHpe+DIFcjgAyTHgW7Y5s5hfeO2VrriR4iSrSQXh
 NEiGz0fediu+kzdKnbNoghp2eO45zxMGFzCKr9lYAH/C1RiP/6fpSimUVfPlBnq6wehp
 z3BN844STvgFThRnvvwAF6YSv0WOAQ09J3jwRIL0Z20pUbjfaCoaz/VF9xUXnkgscUG+
 pEDbrQ7RGyvY66x0Vxs/eaP94pHD0dUxqSypXsZ6XI83J72PQR1ZiWyk7nZlMcBg/d89
 mzqoacqOP3g4bcvOb+dtOGmiKbRQgqOMPpWO929C+yw7uxb7OHXDGOmKjYl3zfrfjyKR
 Wxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744794710; x=1745399510;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3ijzgK4iv6W9/SkZI5SFAq7Ny3NSkdxIDk62807ZYl0=;
 b=WbM2HfL/h3hpPsnIBao/Q3nyf91fdYC6sac6peFLMcPMg3kgLiCpdL/AnD1N+PRQr1
 cYGhf3J0HOV80Hlr+aaAD8coG7y+hj9fVZy4PBdjkN5ayWfozJGz8E85+jR54+rd/x97
 BjnrirVh5Qm353ARjU+Zedds+TiMYHzNBq8bV83QwLsR/to/yQuE84bUe2Q4DQ726/YA
 2eZUbWQ42K8pksmrlkJbkXUGXDy3u+e1ey7kIc3BGoRt2VQBLxuQDZkqqreV1l9ah9Vz
 9mQDQvGZgMie1NpqTQdlLwXOZVzTDl2tByElvyXdBxwNioxp6840xcH5ej3s/6GYkBaK
 aRJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5IQAqwIz1X4FCTD+rqeRv29pAASoIOmomHti4eX8z2S55DGM94rVi0P6gX1x97O7/xKJimgitTWpf@lists.freedesktop.org,
 AJvYcCXQp1AYwHeSta7Nz52RlFJa92NbujCEg1WBAEWi0l96YNDzsVMoU+n0pHE9vjyUqEFaYB751Gxl@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk0GuFD/TtLi3cBboR5WMwOc1RCvzOIqWaskrVZkpxSvvDwZIZ
 Y/mbh/esRal/N1NuEXKBCGIyZFZX08kQbt31vvxgraD1i/HNVqY=
X-Gm-Gg: ASbGnctAo0td/dV4bddNed3Y2pUruGWR4nis3Z6m+t87bWDeRnXGeZO37lMB9aH+D67
 d4aMTTiEXmsKUOB+JZphwmamY7v90ffzFq2IK3NouZReyddlfblq7rUalT6ndxxWibKIIWiG5Xb
 w/63yYiavrllMCupvRXPzEkrWIqGfxkm7loRTWmq9FRr4b97+7aZQgeKzpav+1cmHmEdos64wxy
 +0IZABe2oLhXSEIIPXZeoVXR9fuPoj/cOQQsFF1gb17f6crHHsC6vOHoIMzwegQaUtf2sPsdok8
 1V4ljZnojAjFYXvge6nTUaGEwb1riLKfACWDhd/EWOgbIV9taAGzaic8uaeTz9Q7QUewwX+y3Qs
 cvaP5B2Palu2p
X-Google-Smtp-Source: AGHT+IHDqfPMPJDX6LvxJT/QXWmU2cwXxlIuD/lorTF2upHPyZaXQWfeUnGYg7CHwP7bV4uUaeb+XA==
X-Received: by 2002:a17:902:d2c7:b0:220:ff3f:6cba with SMTP id
 d9443c01a7336-22c3596b9dcmr21242515ad.38.1744794709972; 
 Wed, 16 Apr 2025 02:11:49 -0700 (PDT)
Received: from mac.lan (syn-066-215-112-203.res.spectrum.com. [66.215.112.203])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c33ef0f41sm9185545ad.41.2025.04.16.02.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 02:11:49 -0700 (PDT)
From: Luke Hofstetter <ldhofstetter@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luke Hofstetter <ldhofstetter@gmail.com>
Subject: [PATCH] drm/amd/include: fix kernel-doc formatting in amd_shared.h
Date: Wed, 16 Apr 2025 02:11:40 -0700
Message-ID: <20250416091143.67704-1-ldhofstetter@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Apr 2025 07:22:17 +0000
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

when doing make htmldocs, Sphinx complained about in-line documentation
in enum DC_DEBUG_MASK, so reformatted documentation to define each
member in kernel-doc comment above the enum instead.

Signed-off-by: Luke Hofstetter <ldhofstetter@gmail.com>
---
 drivers/gpu/drm/amd/include/amd_shared.h | 124 ++++++-----------------
 1 file changed, 32 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 4c95b885d1d0..7074ec3b467f 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -255,120 +255,60 @@ enum DC_FEATURE_MASK {
 
 /**
  * enum DC_DEBUG_MASK - Bits that are useful for debugging the Display Core IP
+ * @DC_DISABLE_PIPE_SPLIT: If set, disable pipe-splitting
+ * @DC_DISABLE_STUTTER: If set, disable memory stutter mode
+ * @DC_DISABLE_DSC: If set, disable display stream compression
+ * @DC_DISABLE_CLOCK_GATING: If set, disable clock gating optimizations
+ * @DC_DISABLE_PSR: If set, disable Panel self refresh v1 and PSR-SU
+ * @DC_FORCE_SUBVP_MCLK_SWITCH: If set, force mclk switch in subvp, even
+ *	 							if mclk switch in vblank is possible
+ * @DC_DISABLE_MPO: If set, disable multi-plane offloading
+ * @DC_ENABLE_DPIA_TRACE: If set, enable trace logging for DPIA
+ * @DC_ENABLE_DML2: If set, force usage of DML2, even if the DCN version
+ *	 				does not default to it.
+ * @DC_DISABLE_PSR_SU: If set, disable PSR SU
+ * @DC_DISABLE_REPLAY: If set, disable Panel Replay
+ * @DC_DISABLE_IPS: If set, disable all Idle Power States, all the time.
+ *	 				If more than one IPS debug bit is set, the lowest bit takes
+ *	 				precedence. For example, if DC_FORCE_IPS_ENABLE and
+ *	 				DC_DISABLE_IPS_DYNAMIC are set, then DC_DISABLE_IPS_DYNAMIC takes
+ *	 				precedence.
+ * @DC_DISABLE_IPS_DYNAMIC: If set, disable all IPS, all the time,
+ *	 						*except* when driver goes into suspend.
+ * @DC_DISABLE_IPS2_DYNAMIC: If set, disable IPS2 (IPS1 allowed) if
+ *	 						there is an enabled display. Otherwise, enable all IPS.
+ * @DC_FORCE_IPS_ENABLE: If set, force enable all IPS, all the time.
+ * @DC_DISABLE_ACPI_EDID: If set, don't attempt to fetch EDID for
+ *	 					  eDP display from ACPI _DDC method.
+ * @DC_DISABLE_HDMI_CEC: If set, disable HDMI-CEC feature in amdgpu driver.
+ * @DC_DISABLE_SUBVP: If set, disable DCN Sub-Viewport feature in amdgpu driver.
+ * @DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE: If set, disable support for custom brightness curves
+ * @DC_HDCP_LC_FORCE_FW_ENABLE: If set, use HDCP Locality Check FW
+ *	 					        path regardless of reported HW capabilities.
+ * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Check FW
+ *	                              path failure, retry using legacy SW path.
  */
 enum DC_DEBUG_MASK {
-	/**
-	 * @DC_DISABLE_PIPE_SPLIT: If set, disable pipe-splitting
-	 */
 	DC_DISABLE_PIPE_SPLIT = 0x1,
-
-	/**
-	 * @DC_DISABLE_STUTTER: If set, disable memory stutter mode
-	 */
 	DC_DISABLE_STUTTER = 0x2,
-
-	/**
-	 * @DC_DISABLE_DSC: If set, disable display stream compression
-	 */
 	DC_DISABLE_DSC = 0x4,
-
-	/**
-	 * @DC_DISABLE_CLOCK_GATING: If set, disable clock gating optimizations
-	 */
 	DC_DISABLE_CLOCK_GATING = 0x8,
-
-	/**
-	 * @DC_DISABLE_PSR: If set, disable Panel self refresh v1 and PSR-SU
-	 */
 	DC_DISABLE_PSR = 0x10,
-
-	/**
-	 * @DC_FORCE_SUBVP_MCLK_SWITCH: If set, force mclk switch in subvp, even
-	 * if mclk switch in vblank is possible
-	 */
 	DC_FORCE_SUBVP_MCLK_SWITCH = 0x20,
-
-	/**
-	 * @DC_DISABLE_MPO: If set, disable multi-plane offloading
-	 */
 	DC_DISABLE_MPO = 0x40,
-
-	/**
-	 * @DC_ENABLE_DPIA_TRACE: If set, enable trace logging for DPIA
-	 */
 	DC_ENABLE_DPIA_TRACE = 0x80,
-
-	/**
-	 * @DC_ENABLE_DML2: If set, force usage of DML2, even if the DCN version
-	 * does not default to it.
-	 */
 	DC_ENABLE_DML2 = 0x100,
-
-	/**
-	 * @DC_DISABLE_PSR_SU: If set, disable PSR SU
-	 */
 	DC_DISABLE_PSR_SU = 0x200,
-
-	/**
-	 * @DC_DISABLE_REPLAY: If set, disable Panel Replay
-	 */
 	DC_DISABLE_REPLAY = 0x400,
-
-	/**
-	 * @DC_DISABLE_IPS: If set, disable all Idle Power States, all the time.
-	 * If more than one IPS debug bit is set, the lowest bit takes
-	 * precedence. For example, if DC_FORCE_IPS_ENABLE and
-	 * DC_DISABLE_IPS_DYNAMIC are set, then DC_DISABLE_IPS_DYNAMIC takes
-	 * precedence.
-	 */
 	DC_DISABLE_IPS = 0x800,
-
-	/**
-	 * @DC_DISABLE_IPS_DYNAMIC: If set, disable all IPS, all the time,
-	 * *except* when driver goes into suspend.
-	 */
 	DC_DISABLE_IPS_DYNAMIC = 0x1000,
-
-	/**
-	 * @DC_DISABLE_IPS2_DYNAMIC: If set, disable IPS2 (IPS1 allowed) if
-	 * there is an enabled display. Otherwise, enable all IPS.
-	 */
 	DC_DISABLE_IPS2_DYNAMIC = 0x2000,
-
-	/**
-	 * @DC_FORCE_IPS_ENABLE: If set, force enable all IPS, all the time.
-	 */
 	DC_FORCE_IPS_ENABLE = 0x4000,
-	/**
-	 * @DC_DISABLE_ACPI_EDID: If set, don't attempt to fetch EDID for
-	 * eDP display from ACPI _DDC method.
-	 */
 	DC_DISABLE_ACPI_EDID = 0x8000,
-
-	/**
-	 * @DC_DISABLE_HDMI_CEC: If set, disable HDMI-CEC feature in amdgpu driver.
-	 */
 	DC_DISABLE_HDMI_CEC = 0x10000,
-
-	/**
-	 * @DC_DISABLE_SUBVP: If set, disable DCN Sub-Viewport feature in amdgpu driver.
-	 */
 	DC_DISABLE_SUBVP = 0x20000,
-	/**
-	 * @DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE: If set, disable support for custom brightness curves
-	 */
 	DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE = 0x40000,
-
-	/**
-	 * @DC_HDCP_LC_FORCE_FW_ENABLE: If set, use HDCP Locality Check FW
-	 * path regardless of reported HW capabilities.
-	 */
 	DC_HDCP_LC_FORCE_FW_ENABLE = 0x80000,
-
-	/**
-	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
-	 * path failure, retry using legacy SW path.
-	 */
 	DC_HDCP_LC_ENABLE_SW_FALLBACK = 0x100000,
 };
 
-- 
2.49.0

