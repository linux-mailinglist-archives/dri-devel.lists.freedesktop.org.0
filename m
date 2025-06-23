Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B24AE5550
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 00:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3858210E471;
	Mon, 23 Jun 2025 22:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="iS9JG7yK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD9210E46E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 22:09:52 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6facf4d8e9eso54952316d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 15:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1750716591;
 x=1751321391; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CrkeGXcopvS5zvz/vg3v4v635JNtDuSfnXEaK+Z4RIU=;
 b=iS9JG7yKZZwevUjZdh//2i4csnqbYxaV8YkzQ/69Ab77z3AGT/NyQcnELojnkkXq3F
 Bc9K+vRBa+6fE2A3mqAedEO9T75Bgy8BboxdNR4fBxTs03SPG24+nkWTx1QMHYnM5kW3
 tj82TyvQTGFwHeOeF0wj5JRNK5NFl7Aams4iq+aN/VMUAJ6UhB64EQEpOj7lFqCHsD09
 R6J3zTKZv5gLpSZHuzEj3YXKY3JSaHdbc5US/k6wzuPieWi/45MtsEgAVtO3et0vM7N7
 ZMuTDox1ORROQmFUj3SyWcs27AzLLOALJsyx5962LyeED0N3srDdFSbuo0ENH6ljmYsX
 bR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750716591; x=1751321391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CrkeGXcopvS5zvz/vg3v4v635JNtDuSfnXEaK+Z4RIU=;
 b=RucnQG1MBQJ3qEJ22X9JhG8dO6/iPQ9L7tpoajHKxSJcjHCzeKmrsSKLDlka85p4M4
 S3C/BdHXoTSvG+l7P8FRCMWfAc7Y7e8eS8ZEa+RprWl+3EWHBawePzQwFiSMPKWRbXPp
 2e17y57o2DZZoD5glAjVRjsx2OS9pU/7eihTlEoTdxzUnE8Q1R6ReeNZ4Fx/2/99m+u0
 +mxD1E4ZOa8aVFoJdWAdFA4AxhbblImJNIyHWsaKJJYfSUEo5dYic8wm+rOohJuEHI2m
 uIYvguv86HMwO2MOs17KLfl6J4AwCzsZq+bedsff1WKUp5Hg+QKScS71hBhIV+ZfQGnr
 W5VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeE7w3kUn36IDz0l6N/FG7IOZ/E5IVJh7snM1vRD0LeWalCvoqDovya3hb32Qa0hC6iG6iKxZO+Ng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxhn9yGmybikrjy77zpCG4do7WdXfICorLf8eZchpYQ07/aCgmD
 aPqM9mMplUg7D8c6n0jwoBOGZrIS9vTckS+C145yxgMI1/b/7vnM4c4UIF/No/JEYSs=
X-Gm-Gg: ASbGnctMN9eAZ/GDepQgwdGsyKnj1pKTcg71r/CfmtBDZ4nS1O89l/eoJzwzZy0Fu5K
 bdkwRAlna7IkHBhnFfY8SA1Lw70XRgTNzLen+s0ZvFqaPTf11dd4eoIyVjnZ4fWeGFcr49eKNil
 HQ4hKUlJgXI9Hy/Y3U/2l3UelcTV7ti6EjrKXyITlps71jFvksqdctvryve5Pg69Vg80mG5uCW/
 4XDs8g4w2rrA+KXDSLAbo+2uCU48VcU4lQAqDC7bRNrtnTBvTyZesMErj0fEvVbt6QGMwUq/5J4
 t9X3/OkfY1xvtcD7wdmSUz30i+1gqSntZ6kdeqKBMC8WY6f6lC5o2k24EPDfK7UQoitLVUVC1Bz
 +QAdJM6ZMTchZFNocSIkp2QHx2E6PLlEDM4ym09oLlUAy7UTFJRc=
X-Google-Smtp-Source: AGHT+IG1ICCdIoZvmRMhW0AWQJ0U2kQiMNTTwq/2mRvUAzlizBv01XX7ya32XhBYGhdiqm4deIUuwQ==
X-Received: by 2002:a05:6214:20c4:b0:6fa:cdc9:8afa with SMTP id
 6a1803df08f44-6fd0a50af00mr238352106d6.17.1750716591003; 
 Mon, 23 Jun 2025 15:09:51 -0700 (PDT)
Received: from m-kiwi.verizon.net (pool-71-167-25-61.nycmny.fios.verizon.net.
 [71.167.25.61]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fd09425af6sm50019856d6.27.2025.06.23.15.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 15:09:50 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH 1/2] drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT config
Date: Mon, 23 Jun 2025 18:04:01 -0400
Message-ID: <20250623220909.7591-2-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623220909.7591-1-mhenning@darkrefraction.com>
References: <20250623220909.7591-1-mhenning@darkrefraction.com>
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
2.50.0

