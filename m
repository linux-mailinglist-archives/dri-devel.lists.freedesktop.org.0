Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0C59CF6A5
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 22:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDC310E8C6;
	Fri, 15 Nov 2024 21:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jWDSRC57";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C0B10E8C3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 21:09:37 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a99f3a5a44cso293822266b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 13:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731704976; x=1732309776; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MaDJsFjngdpTSC4UtZp0JvItJKL05hX1CQDURe5cIPs=;
 b=jWDSRC57BbjFjbmHXWMG1ODKY1m8VWXeTL/hZxQE459s9KUgfape+sx6NcZmXwsuAW
 Dxg+6CgpFlDZgMqEjhksOei278Qs5aB3quGUBzJL9eRRsMiSQyn2idaDIv4e+/i3UU+n
 IFWeypX0gyPOvlA9PATBj1qwN3ALCVBsPiFaCxQIyUPcaOCVxiSgCw3tbZEFXhgngFcE
 AHkCVdECPf0ij9jTzOc1Dh+xCHCYbcaXX3YWPuzCWaBMTN5lmNI3E6DupP9Oa044r7Ss
 32ev4gewmA5K8O4X5uUHQgCXzwgwNIYI1Ad339tVPyfnsnatqsuhUStFz7Wad6nMXFuh
 l8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731704976; x=1732309776;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MaDJsFjngdpTSC4UtZp0JvItJKL05hX1CQDURe5cIPs=;
 b=BvnETbbTp3Iq4dQNIMx3pFl9ZiqJvWn+0P3rrmPSdkKNc2w6YJ/3YJ4XkfG+0ArQSM
 qr2xZint5Ahf9UBnwpQBZ0OS2X4hFkCYKri8sWnhW1rOt8Z0K6gadseNHMGKiFt1EKqc
 ygz4j4at/2cQCv0BPdZ9oYNAtB/svWorLvrwJM5DnIq0ugQye2n2tdIQsdIFSvXB1/F5
 KeI72/8xYaoF9g4dJvVAWYFzTEpqbtZ7uKUlUIHOiKW6GvaVTohw6jTyLDnn/C0aDbGP
 zGSJIYyhPl/Va9LpDsJ98lSJviTxV4tWJscr91gfkLbWisbe5zsejuTaEU1EGRaGe3vJ
 53ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv0uMDbNuxtPemTVTWY7KkLkAQZCIDZ6JB22yp9cP2+MevTj7KJmnK6m1xiHPLhQy4V07ByXq/kq4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzP39N9vp5wPHvHJ1gWp7MBZdzwiD/NYO4aSeIBqyalm9ppSMeb
 WkHbT5t9UHiaeDxeWZhG64Z6xfxsrqFi9pCxwksGrWhp4mcIi8du0G/tzd0K6TE=
X-Google-Smtp-Source: AGHT+IFPY3knSoOjFOSw+FKqV/bCUh7TKMDj4KEvXFLpvr+Y8ELhi4rkKluEpzqZePJKQVtb4lya7g==
X-Received: by 2002:a17:907:2d91:b0:a99:43e5:ac37 with SMTP id
 a640c23a62f3a-aa483426214mr277344666b.15.1731704976085; 
 Fri, 15 Nov 2024 13:09:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df51648sm219626366b.62.2024.11.15.13.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 13:09:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Nov 2024 23:09:26 +0200
Subject: [PATCH 1/5] drm/encoder_slave: make mode_valid accept const struct
 drm_display_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241115-drm-connector-mode-valid-const-v1-1-b1b523156f71@linaro.org>
References: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
In-Reply-To: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=p73O++3wotedHVxEc/OS0iEeK5HjHEeyRJw8kmUrclY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnN7iHg3HP+UcGCGKYRySmptq7KP9Ng42lKX9lx
 EK9A+ybXVWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZze4hwAKCRCLPIo+Aiko
 1VmgB/9rxQm+iAzl+wi6vwGpdl+HNgPJZFXzu5cOtg8Q8IyEKfG0Mk/5Adwoa3BqRSDtrUZaI3X
 KiEQo8V0xPwWrJFzEmGzfoN72i6nWFebnQbjfIXt70HZPw6Gu7ufcvJsS3Duq/b/Th8/f3taLfo
 LJj+f+TWV1lC+9ObG14v3/4i6FFKkzzncn8HnS22OpAQ2AxdzLXYGSy7+E4Y7P2T1gDNumfgOHE
 juevCTvhN61ldGGOZFeCPby6Jjgp0M25sRRQkSL6SPQwau7HwCMbjckQexv5lAB9H+6+C6D8p9d
 nSe3+Sp7FKCb/pi71OeXv3z1csTh2P2cNnmAWuGLZ/zAdpir
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The mode_valid() callbacks of drm_encoder, drm_crtc and drm_bridge
accept const struct drm_display_mode argument. Change the mode_valid
callback of drm_encoder_slave to also accept const argument.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/i2c/ch7006_drv.c          | 2 +-
 drivers/gpu/drm/i2c/sil164_drv.c          | 2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 2 +-
 include/drm/drm_encoder_slave.h           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index 131512a5f3bd996ad1e2eb869ffa09837daba0c7..a57f0a41c1a9e2006142fe0bad2914b0c344c82a 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -104,7 +104,7 @@ static bool ch7006_encoder_mode_fixup(struct drm_encoder *encoder,
 }
 
 static int ch7006_encoder_mode_valid(struct drm_encoder *encoder,
-				     struct drm_display_mode *mode)
+				     const struct drm_display_mode *mode)
 {
 	if (ch7006_lookup_mode(encoder, mode))
 		return MODE_OK;
diff --git a/drivers/gpu/drm/i2c/sil164_drv.c b/drivers/gpu/drm/i2c/sil164_drv.c
index ff23422727fce290a188e495d343e32bc2c373ec..708e119072fcb50c31b5596b75dc341429b93697 100644
--- a/drivers/gpu/drm/i2c/sil164_drv.c
+++ b/drivers/gpu/drm/i2c/sil164_drv.c
@@ -255,7 +255,7 @@ sil164_encoder_restore(struct drm_encoder *encoder)
 
 static int
 sil164_encoder_mode_valid(struct drm_encoder *encoder,
-			  struct drm_display_mode *mode)
+			  const struct drm_display_mode *mode)
 {
 	struct sil164_priv *priv = to_sil164_priv(encoder);
 
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index 3ecb101d23e949b753b873d24eec01ad6fe7f5d6..35ad4e10d27323c87704a3ff35b7dc26462c82bd 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -308,7 +308,7 @@ static int nv17_tv_get_modes(struct drm_encoder *encoder,
 }
 
 static int nv17_tv_mode_valid(struct drm_encoder *encoder,
-			      struct drm_display_mode *mode)
+			      const struct drm_display_mode *mode)
 {
 	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
 
diff --git a/include/drm/drm_encoder_slave.h b/include/drm/drm_encoder_slave.h
index 49172166a164474f43e4afb2eeeb3cde8ae7c61a..b526643833dcf78bae29f9fbbe27de3f730b55d8 100644
--- a/include/drm/drm_encoder_slave.h
+++ b/include/drm/drm_encoder_slave.h
@@ -85,7 +85,7 @@ struct drm_encoder_slave_funcs {
 	 * @mode_valid: Analogous to &drm_encoder_helper_funcs @mode_valid.
 	 */
 	int (*mode_valid)(struct drm_encoder *encoder,
-			  struct drm_display_mode *mode);
+			  const struct drm_display_mode *mode);
 	/**
 	 * @mode_set: Analogous to &drm_encoder_helper_funcs @mode_set
 	 * callback. Wrapped by drm_i2c_encoder_mode_set().

-- 
2.39.5

