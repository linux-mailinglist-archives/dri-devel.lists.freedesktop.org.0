Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D031B0CADB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 21:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D484F10E3B0;
	Mon, 21 Jul 2025 19:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="BVRz0u/h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E22E10E3B0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 19:12:31 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4a9bff7fc6dso45788481cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 12:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1753125150;
 x=1753729950; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MLFY/gPsJryxB7dKnCFP91YGCa6bmOw593PDTexR7mY=;
 b=BVRz0u/h9N9MRxgJebNNQnrCz/mX3F0YJ+MHaxDVKr6ACAOjBXJv7RfMPggs11yYpg
 2UrelIupLKqkF97hcSze6QGJml5bZEpXjDAL/8mj23eIkUa+gn6DIXU9rkmwIsRXgz0D
 Jz2HyfTPrRT3L1znmKF1Yjn5IqJHjP6t2TbJDerWlMmUG1XdOtevUzXz7I7nsK85PO2v
 28rcn2cZUMXJIrsX+8H5ib0QUIeXcZsTR/UblG+uMjDZlGgJMb51ebyjqtJqBAsn/I/C
 YCX1A/SstJRJBTpOxlEDGlDifkEieTLNH4KOTpO7z6abPEge/7Jmkd8wEm+yjRDsDJ1k
 vqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753125150; x=1753729950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MLFY/gPsJryxB7dKnCFP91YGCa6bmOw593PDTexR7mY=;
 b=UZf7ufZAo0kPXpDigSUszHZnaCqMiYbFpNxcaMJJvhP3ZqskxwFqdqoORMiFYQea+2
 aQ18bpxI+6kwbCLbTsKHJ9Ar1kEAD0nChogLTZ5NATkXqQVxP3mN7zC7QiJTes/AhTir
 s2hSnquJqb3akR4fbzkqqS+8EbV4kWa4f3OFvwGQBCTdOmLwgoPUZXg3EWisUoX+2o91
 JbagHYAIj4DtxKS6DG0J3yNiVaF/c1IDjBE7Dr6711tGRg7ghpO5fxLwWCJ8YjRTdflq
 36L7vpkviMxx6fz6E4kz3zQmeP9UJVKnhfOWx3YGHrItLLH/5S+9C8Qlo6ioCn5WBiiq
 P9OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeqIOz6u92J6CCxzADt6lXMLVur9S89zimLcA6msDNIO2ZFDLv5pz30zgx01OTM69MKTWYbP99Rkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGxmRd0JpUhVMhF92Dp7dO/GnMP/mN7TL2miBuVRdWU9ObapvY
 42o3y1IIaWMZ7ALhOD/MWRIaleFv0DaT2cFb5ViWJw487LUAXyQ/RYnskuDLovLHAQE=
X-Gm-Gg: ASbGncuqzgJYuQCrmPhIWd0D95wX01SoLxWtV1nCq7/UQ06X57fHLGw4Mh2yVDvRs3n
 1m4XUbAo9DIFYbkdwQU14MZpW9/F/RJxjRJsvHIuZX7NeZi1thfakeMbX9f7dA2uSDnpR+mJQ+N
 itz7VR5KS4PIO1veUjuHau273uUAJNC3xPdYwniTUOBD1kWp2uehXqoaJ+3x7CosIKBDS5k3UGN
 UJto9Hq4mPxCzoIQ7vvwd1Huf39eMHAyzcEJyen/Ahw86TQQj2jHYuO2MLTewjnw7iwd5iV3KDS
 iF/f8HG+2FKPeffVGmeQRXMB9d1WgTwKSlz6CRLwL2E0g8fTN9zxa4RVqEq9QK2NQkCrUuo+/5b
 keGKeojYrNbLtDz8sDIT9JHjuE7HM4fqquuHss94ECg==
X-Google-Smtp-Source: AGHT+IEJax/vuZ7vgG1pzF0jGnCfka7McK3Lzo3THd/DwTYQfHwde8kP7APhvWBM20hHyfnEPjF4Ww==
X-Received: by 2002:a05:622a:5e0f:b0:4ab:5b15:fdb1 with SMTP id
 d75a77b69052e-4ae5b8c6c7emr13012311cf.15.1753125150216; 
 Mon, 21 Jul 2025 12:12:30 -0700 (PDT)
Received: from m-kiwi.verizon.net ([108.27.160.38])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb4b24930sm44626211cf.51.2025.07.21.12.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 12:12:29 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH V2 1/3] drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT config
Date: Mon, 21 Jul 2025 15:09:14 -0400
Message-ID: <20250721191214.19800-2-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721191214.19800-1-mhenning@darkrefraction.com>
References: <20250721191214.19800-1-mhenning@darkrefraction.com>
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

This option was originally intoduced because the GSP code path was
not well tested and we wanted to leave it up to distros which code path
they shipped by default. By now though, the GSP path is probably better
tested than the old firmware eg. Fedora ships GSP by default and we
generally run CTS on GSP. We've always been GSP-only on Ada and later.

So, this path removes the option and effectively sets the option to
always on. We still fall back to the old firmware if GSP is not found.
This change only affects Turing and Ampere.

Users can still set nouveau.config=NvGspRm=0 on the kernel command line
to force using the old firmware on Turing/Ampere.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/Kconfig                 | 8 --------
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c | 6 +-----
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index d1587639ebb0..c88776d1e784 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -102,14 +102,6 @@ config DRM_NOUVEAU_SVM
 	  Say Y here if you want to enable experimental support for
 	  Shared Virtual Memory (SVM).
 
-config DRM_NOUVEAU_GSP_DEFAULT
-	bool "Use GSP firmware for Turing/Ampere (needs firmware installed)"
-	depends on DRM_NOUVEAU
-	default n
-	help
-	  Say Y here if you want to use the GSP codepaths by default on
-	  Turing and Ampere GPUs.
-
 config DRM_NOUVEAU_CH7006
 	tristate "Chrontel ch7006 TV encoder"
 	depends on DRM_NOUVEAU
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index 58e233bc53b1..81e56da0474a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -383,13 +383,9 @@ int
 tu102_gsp_load_rm(struct nvkm_gsp *gsp, const struct nvkm_gsp_fwif *fwif)
 {
 	struct nvkm_subdev *subdev = &gsp->subdev;
-	bool enable_gsp = fwif->enable;
 	int ret;
 
-#if IS_ENABLED(CONFIG_DRM_NOUVEAU_GSP_DEFAULT)
-	enable_gsp = true;
-#endif
-	if (!nvkm_boolopt(subdev->device->cfgopt, "NvGspRm", enable_gsp))
+	if (!nvkm_boolopt(subdev->device->cfgopt, "NvGspRm", true))
 		return -EINVAL;
 
 	ret = nvkm_gsp_load_fw(gsp, "gsp", fwif->ver, &gsp->fws.rm);
-- 
2.50.1

