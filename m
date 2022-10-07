Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A424A5F784D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 14:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13DA10E1B4;
	Fri,  7 Oct 2022 12:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F7310E159
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 12:50:07 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id f9so5565081ljk.12
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 05:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f59EU1a1WnDP8FmZf3wrh4O5KrGlofpHUXUgEfyspJQ=;
 b=CLZRyqPhA5+M6uyWDg31r6F8m+wKuz4Ptz9QRZt1FtszgNSWuDe5YGR3aeXy6AcqKT
 9tOE+oHq71rji+2VsBi5nKN5iHMLBSeUkMBJFFz+0ivIJRjXu9Kj9soi41d9E1xo65QC
 EsOszCdKg8/8ejmsZ+fXL92Os6Z2ej9gn1sJYMqJLIS/RzwHFWeEjbCLhXXQ50kWYDJl
 dzx+anyHHwGvYJnFoC3GCmOw/kY+iPbdje81zsQEfcnU3tK667WRAKPvl+jbImBNLlSq
 cbxGJh61HQ3VB8T7VReug6JcELNSW7Ng/KgSNbbob6ktvF+UVt7pFPg7+Yln2vqdNypH
 wNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f59EU1a1WnDP8FmZf3wrh4O5KrGlofpHUXUgEfyspJQ=;
 b=CMrcA05o+8ApR5A4jVTrA9bY2Anbz6XXKV3IRYv52Dqv83zkQf/+FCvRShtePpMDIe
 +kJADv0TVx8Zacej70wCTrO4mTp2oDBKibceT6H0sQZgBWPHLjXczmO2EzT5Nv2A01yz
 goy3rFROS+BeBewHlSPJIUHf52+77AY5TSMdn2tD3KNLXsfv0KA52DVY1HFBYvfqfHUZ
 UieIjPXdkRHXJk6ibu4UtqIyInZ2Ed3W8PPZin5SChO2G3oPaESgRJXkt2uyn/4dB8VE
 hqNEGfgnzyPZZZg4NNs50DfvAK/ee5sa5ncaCIyMz1CTKou138z6ZG9pcAKXDB3p2nsn
 GD1w==
X-Gm-Message-State: ACrzQf32rXoqi6Fm8HBuRleqPlu5/GCATwMjpE2+yGhvpG5KdOkcv27L
 fM2g+GZBk8LqAij4iIN9RY0=
X-Google-Smtp-Source: AMsMyM5SeUv5h3OUh7LPJ7KiK1szc0oaT23XlSZ9LQ469HdOnpVCJpK8bPnerKLBmkxqF7Uxlp8l/g==
X-Received: by 2002:a2e:bcc3:0:b0:26c:4c59:75ed with SMTP id
 z3-20020a2ebcc3000000b0026c4c5975edmr1564412ljp.505.1665147004219; 
 Fri, 07 Oct 2022 05:50:04 -0700 (PDT)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 a21-20020ac25055000000b0048b0099f40fsm281404lfm.216.2022.10.07.05.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 05:50:03 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 6/7] drm/simpledrm: Support the XB24/AB24 format
Date: Fri,  7 Oct 2022 14:49:45 +0200
Message-Id: <20221007124946.406808-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007124946.406808-1-thierry.reding@gmail.com>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Add XB24 and AB24 to the list of supported formats. The format helpers
support conversion to these formats and they are documented in the
simple-framebuffer device tree bindings.

v2: treat AB24 as XB24 and support both at the same time

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tiny/simpledrm.c       | 2 ++
 include/linux/platform_data/simplefb.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index cf36f67d22e4..ecb303c89320 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -559,6 +559,8 @@ static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
 static const uint32_t simpledrm_primary_plane_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_RGB565,
 	//DRM_FORMAT_XRGB1555,
 	//DRM_FORMAT_ARGB1555,
diff --git a/include/linux/platform_data/simplefb.h b/include/linux/platform_data/simplefb.h
index 27ea99af6e1d..4f94d52ac99f 100644
--- a/include/linux/platform_data/simplefb.h
+++ b/include/linux/platform_data/simplefb.h
@@ -22,6 +22,7 @@
 	{ "r8g8b8", 24, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_RGB888 }, \
 	{ "x8r8g8b8", 32, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_XRGB8888 }, \
 	{ "a8r8g8b8", 32, {16, 8}, {8, 8}, {0, 8}, {24, 8}, DRM_FORMAT_ARGB8888 }, \
+	{ "x8b8g8r8", 32, {0, 8}, {8, 8}, {16, 8}, {0, 0}, DRM_FORMAT_XBGR8888 }, \
 	{ "a8b8g8r8", 32, {0, 8}, {8, 8}, {16, 8}, {24, 8}, DRM_FORMAT_ABGR8888 }, \
 	{ "x2r10g10b10", 32, {20, 10}, {10, 10}, {0, 10}, {0, 0}, DRM_FORMAT_XRGB2101010 }, \
 	{ "a2r10g10b10", 32, {20, 10}, {10, 10}, {0, 10}, {30, 2}, DRM_FORMAT_ARGB2101010 }, \
-- 
2.37.3

