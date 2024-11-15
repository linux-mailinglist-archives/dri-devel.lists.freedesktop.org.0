Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F1F9CF6B6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 22:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E41F10E8C1;
	Fri, 15 Nov 2024 21:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uxE4gs+3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A6610E8D9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 21:09:48 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a9a68480164so308729466b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 13:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731704987; x=1732309787; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JsYKkvhpGxYN/nsXndcDcczu/pyOBha9maYVfqCaIuo=;
 b=uxE4gs+3g7re6PR9jpvBWsyjne8EBjbSFWQ29fuUM8rLOBXzD+he3kv+aN4TWNHevR
 sbryMygQinxI0x0SK/TO4vIZBQ1FNZ7m62yRx9A3H8nY1zLk4ATLKDsDDJKRUUnDzG8+
 H02Bnxoi4onnk4xYcbQuRTMQqHTOnSbqKPG8+4YvdTZqSKNDbvCLBs7/7FhVO/HM4esV
 32JXxXEDpKc9gQ3TClE1pH0th0LYAx8O8vdY+BySJAn1yvkl2aYgyEpJUe+JSUXcppxc
 JkNU+ZVtsFACqzw/dSz35YEQ/rwMLWLdln3Q+xMYifMGw0I/23aCLWgG7SpmCs8Sl0gB
 tM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731704987; x=1732309787;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JsYKkvhpGxYN/nsXndcDcczu/pyOBha9maYVfqCaIuo=;
 b=w+HTa93a8FH2+EvtafpMERDtVFC7Ob0Q2uEgPsexT+cTJMWR37QIYGR+AJNe1660OA
 kh3SgPgE7Udev4lkr19WqsVPsCWonQ4L3R2SLvDEpG9A21pDFDcefZ8r/cQMuUxExOLk
 JAHADdNYJOGdiAbxB7FKJnsNjtFEkdSKP/qnfc3mzFbJGcqTCnlBpb9vG7plYxdmfKlw
 H4Tvj8CrBG3qWkpFyCIHxYK80//dxGVTvyxdb9pXYi8FApISGPZs7BkQVV4NZyShaSXN
 OYsWZm0k8hKypnTkHHLUBxiNbvAI2nfMDzm1G98I1V9swaAvavWhJvfSQrsnR1y/vADh
 rpVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkLlxDOGeLlr82Fq2TrqVq56pND+yRfuqEtrOyJsdCol8PvDNoVzi7WlKHNsgEMbQUx+0vgV1J+5w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrY1uwZfi2Bnbnf5svJ2UQblfd+AiEhHdMjK8P3ftUdiuU3D2h
 jNFZntZicfoQEybsQpOqIOBvszSiQ465NuP99FPkVuWHX9+8Un0PWyouRaFLixs=
X-Google-Smtp-Source: AGHT+IFDdo4Ez6qAhnttBnH0913iVcsIQD4O+jaLTiUgGyLyyVbk2JIgfGuTK7H0cxIlhnYIHXnI6A==
X-Received: by 2002:a17:907:3f8c:b0:a99:f1aa:a71f with SMTP id
 a640c23a62f3a-aa4833f7487mr324293366b.11.1731704986921; 
 Fri, 15 Nov 2024 13:09:46 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df51648sm219626366b.62.2024.11.15.13.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 13:09:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Nov 2024 23:09:29 +0200
Subject: [PATCH 4/5] drm/connector: make mode_valid_ctx accept const struct
 drm_display_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241115-drm-connector-mode-valid-const-v1-4-b1b523156f71@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1695;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oLY7+gEEQX5y+IrkZsspi4uhz4i0DjMFBoH6fdvMkJw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnN7iIEAveRWXmQWe1stGwllWWTGsdTdE1s1iig
 2BzWZCF0MOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZze4iAAKCRCLPIo+Aiko
 1VHTCACzeIvQM2U7UstBpUccYyFqIL0ngRGXT9/4FmsiQcx0+H2ouTVyisjg/LLZ/vRZ+Sy9Dap
 CcwztsrQ/32zb6SYfgOsdyQRoOBbTT5d4lzTS3Pe9PABuei6dm0lj3mJUX/Od2xwaIJT3Zqa/Du
 JVKMw0vQvye08hlE3x6j/j8rF64zNh4t+0I5ejSfX+SAor0P0cJvSZQSJyi541ezhAuP0uOH1Mr
 rZ4A7KbZFucqd4yp5jfQ5ttsyivo13fQRvEsVxt7dLMmFxP7HQgPei8s2hZj530wtj+eTAExRFs
 NJFXe4LNfD5wLcUeRZiZMoWytSAqd5NxU3rpWQDXs06KLhfd
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
accept const struct drm_display_mode argument. Change the mode_valid_ctx
callback of drm_connector to also accept const argument.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 2 +-
 include/drm/drm_modeset_helper_vtables.h    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 7be8fb047b6c17cb37b9021a2dbf430f0aaecfa2..cfefd89209ca864e19771c538ca00016f9322e74 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1432,7 +1432,7 @@ static int intel_dp_mst_get_modes(struct drm_connector *connector)
 
 static int
 intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
-			    struct drm_display_mode *mode,
+			    const struct drm_display_mode *mode,
 			    struct drm_modeset_acquire_ctx *ctx,
 			    enum drm_mode_status *status)
 {
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index ec59015aec3cf3ba01510031c55df8c0b3e0b382..fa9ee6a128bec0205f501df6f7634757f5fcb9ee 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1006,7 +1006,7 @@ struct drm_connector_helper_funcs {
 	 *
 	 */
 	int (*mode_valid_ctx)(struct drm_connector *connector,
-			      struct drm_display_mode *mode,
+			      const struct drm_display_mode *mode,
 			      struct drm_modeset_acquire_ctx *ctx,
 			      enum drm_mode_status *status);
 

-- 
2.39.5

