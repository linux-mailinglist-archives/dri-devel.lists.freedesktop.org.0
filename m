Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6778280343C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 14:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6831F10E260;
	Mon,  4 Dec 2023 13:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FE610E24E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 13:15:01 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50bdec453c8so3069293e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 05:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701695700; x=1702300500; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bMzxGsdhOYwtNdEG7l3DHCnll9vKNfEMYjXGBc92HI8=;
 b=hWa8Mv/f7HVdWnqyUgNOSYojfKz1tu2UAGK38okgFCI26W8PHcgcfafKItZdpSiXv1
 08MS1z8LapCfvb5jicE5MXxQho5LILrRZbopfDcdR9IiS0EsRpwp1mRmHMw9WEidcGC9
 VHMXHWoweMSYrE5k9L4WWvbHs+7YsBa+Z6R6TTyl0s8r4SL4mi8qHAZJYqU1AC5TMAqv
 QtxW0j+RQSyLvbs3tts24Jyhf12OI4vSmV0eR/iQcu1NYCjbtq2jK0AnFtw4P2EIaOFx
 XmNCJb4T3hK39tr0hGYjIgWgkwkySbIA0AAE8IrrxgY9ON4VGZH3crkFkP+FqsIwhMCh
 f5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701695700; x=1702300500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bMzxGsdhOYwtNdEG7l3DHCnll9vKNfEMYjXGBc92HI8=;
 b=Xp5NLTtmxDa3xrb3GrXz063GL4S6JhLYYjvaZDBX64iS/TiubdrPTDbMGQr4E1bKkJ
 h0D11VaI9gHa8Rhfk8oR9UpRkMlBihkU5AmjvTx6FuQ7UTmgcRbGpWakrEuW9xFTVhxT
 ojAoiRjPQPCP47yegPi+D4U42GBuMGhwU38nPnmjFDC3zj2KMyDV/0JqOHrhCPsJZHJe
 jj3LfsGN4QUnrbaJFomghUYZFx8zM6HF2hlRjmzoQNfYLkRjNFxfyOWg9ZfynGfX+R/j
 OSUGEu1JkyL8Q3ymb3t6nZ9n2DJyPPF3XlYH6q8hirZqbMIXEogymMnNCOXMC7qJE85q
 XdhA==
X-Gm-Message-State: AOJu0YwjtB3hGCOWYsmToqI3m9P5fQl4YTk+/pmt7B2LNP0+5LCqrkvI
 XSpJQhU4vVTDFVPl5xkWIvJ/Wg==
X-Google-Smtp-Source: AGHT+IGDRYksrIZYOlwzn0xx8ixTEo9STmmWtMePPWUDb7lGPmASc5VjLGKKYGaFagK6R+9iyaaIuQ==
X-Received: by 2002:ac2:4e06:0:b0:50b:e20c:e54e with SMTP id
 e6-20020ac24e06000000b0050be20ce54emr2561562lfr.115.1701695700202; 
 Mon, 04 Dec 2023 05:15:00 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 br25-20020a056512401900b0050bc59642casm1251924lfb.286.2023.12.04.05.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 05:14:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 5/7] Revert "drm: Add solid fill pixel source"
Date: Mon,  4 Dec 2023 15:13:52 +0200
Message-ID: <20231204131455.19023-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
References: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 4b64167042927531f4cfaf035b8f88c2f7a05f06.

Altough the Solid Fill planes patchset got all reviews and
acknowledgements, it doesn't fulfill requirements for the new uABI. It
has neither corresponding open-source userspace implementation nor the
IGT tests coverage. Reverting this patchset until userspace obligations
are fulfilled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_blend.c | 10 +---------
 include/drm/drm_plane.h     |  1 -
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 37b31b7e5ce5..665c5d9b056f 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -204,9 +204,6 @@
  *	"FB":
  *		Framebuffer source set by the "FB_ID" property.
  *
- *	"SOLID_FILL":
- *		Solid fill color source set by the "solid_fill" property.
- *
  * solid_fill:
  *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
  *	contains pixel data that drivers can use to fill a plane.
@@ -645,7 +642,6 @@ EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
 static const struct drm_prop_enum_list drm_pixel_source_enum_list[] = {
 	{ DRM_PLANE_PIXEL_SOURCE_NONE, "NONE" },
 	{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
-	{ DRM_PLANE_PIXEL_SOURCE_SOLID_FILL, "SOLID_FILL" },
 };
 
 /**
@@ -670,9 +666,6 @@ static const struct drm_prop_enum_list drm_pixel_source_enum_list[] = {
  * "FB":
  *	Framebuffer pixel source
  *
- * "SOLID_FILL":
- * 	Solid fill color pixel source
- *
  * Returns:
  * Zero on success, negative errno on failure.
  */
@@ -682,8 +675,7 @@ int drm_plane_create_pixel_source_property(struct drm_plane *plane,
 	struct drm_device *dev = plane->dev;
 	struct drm_property *prop;
 	static const unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
-						      BIT(DRM_PLANE_PIXEL_SOURCE_NONE) |
-						      BIT(DRM_PLANE_PIXEL_SOURCE_SOLID_FILL);
+						      BIT(DRM_PLANE_PIXEL_SOURCE_NONE);
 	int i;
 
 	/* FB is supported by default */
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 4b7af4381bbe..5bac644d4cc3 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -43,7 +43,6 @@ enum drm_scaling_filter {
 enum drm_plane_pixel_source {
 	DRM_PLANE_PIXEL_SOURCE_NONE,
 	DRM_PLANE_PIXEL_SOURCE_FB,
-	DRM_PLANE_PIXEL_SOURCE_SOLID_FILL,
 	DRM_PLANE_PIXEL_SOURCE_MAX
 };
 
-- 
2.42.0

