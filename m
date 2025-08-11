Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC33B2178A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 23:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B5910E550;
	Mon, 11 Aug 2025 21:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="xhcBAhyP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BB010E54E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 21:39:02 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-70740598a9dso44666126d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 14:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1754948341;
 x=1755553141; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MLFY/gPsJryxB7dKnCFP91YGCa6bmOw593PDTexR7mY=;
 b=xhcBAhyPHAgpTtXMQ7cjvfJ0Nsqi7VqkAYzv6ahd+dEs8X4o/N+Ud1pyeYuZIUnBA1
 QXSWY2FlWaT2+WtAAwyj52bro02p/AAEFAccc8dnBSqR5NN+WCi8YeF/mR44cuj4iML7
 SIVVypz9jrgMmNrh1YKxBz9fSKqLwMJ1AlR78vSRvFx0synQzwDpniRIrQTaUGWtuvZN
 e7KIthCZh1Q7bqUIPY2bmKUYsKju5V4JGp7/0GuEqTISBMOoF+nh8BByccg8TEgovBGX
 biOTHn6a1/1YTVIJ9ouBTGAKMLMtzppqlYO3uGl1Rx/tRGeKHPEkaKzNRJYmU+9tsbbm
 Z8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754948341; x=1755553141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MLFY/gPsJryxB7dKnCFP91YGCa6bmOw593PDTexR7mY=;
 b=QJJIXapR8V2wzAkKgCHiHSkB4OPBlJMMvgvx9pLqeNjTCCiqEsB5pHCKDKoS6PcLXM
 rKcH0qHGDvX0eMojNIJVV+ubxb+kE4yMjfS7OMsuwgi4mOk8HKgVofP7u7SgotoYY4n8
 y/5aLFUmUu5MZkPxG1382ddzjnGS60iEu1UoCr8Gk1gO9Tg4BqRYiBDhvMZRWxAWi5bn
 cEy5DhuAv/CSqjt01V2n31f/z7xwgUedi1R14XYVWtiWShgqi97bhf5XvL5PHkqw8tAf
 I1Wj55b+aWTtr4spIESyEuJGgVASPa58GpM8qapUEwaSvotTF3z/nZk25M7sBWs3riVf
 tXyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkAVC8Fb+aD4eXzKuiWi1riHeVW+weD3VaB7qah+CWaOsZzsWnyO0mIgMhyMkm2JpF8H9liCeT/Ms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxlkktl/8dsoP6Tz/TIeTQswho00adStIeh0sMaYvzK4wpURYBs
 4fjaSkA4IG6izN4NXBasBlFI12eDKb2IQQVkVKiINiWjbcnht+hjV/O80hHSUBCKGQc=
X-Gm-Gg: ASbGncvj34hlqHJX0AuT5ly9myqFp0pSWldWZqhcZj0SuDtPWGBmc84X9Ru6QelNBxu
 6tdpkbb+6PLvtQWrtHiZycpkkgpBO0fo96Jt5W5tEPhaUif0JDG4yNNkYA5jyOoFSPEPp6hopAr
 yNPgkOC3pRC8EIkbFLwvsMt0CjV75vks6oB6CQ8+Ksip6KpCM2HpziqS2aRYAzfDYB1WDsfkukU
 ULEVreSehxWtFob9Pyzfq9GWhJOifeQzQO5eI/lStvEIteVIe0mg3pFfbYG70dQ+KMFj/2mshe7
 m7cYVnT4vXOFLosw5nqXkhvt0g3QPFTCLMmg3jNoAVcD/Xa57alkQHcSk605Zu5lIDIMThah2Zb
 DWcT004P6KDC05ipiz61GuDlpuqCQhdKUYu6HtErHrxaJ0V658sqQHBMjRdvsW9dvRHdu60okUB
 odzqUJ3+WU93naBw4=
X-Google-Smtp-Source: AGHT+IENqR2pPqRpqpwA8UKhF74Kc3nviYN8IzC81o2Q+EZxLrJNUKFfStyDY1OIaplNcbt3vkGisQ==
X-Received: by 2002:a05:6214:cac:b0:707:4710:a551 with SMTP id
 6a1803df08f44-7099a3d0150mr177690126d6.46.1754948341327; 
 Mon, 11 Aug 2025 14:39:01 -0700 (PDT)
Received: from m-kiwi.verizon.net
 (pool-108-18-253-193.washdc.fios.verizon.net. [108.18.253.193])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077ca1d5ecsm163097136d6.26.2025.08.11.14.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 14:39:00 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH 1/3] drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT config
Date: Mon, 11 Aug 2025 17:32:31 -0400
Message-ID: <20250811213843.4294-2-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811213843.4294-1-mhenning@darkrefraction.com>
References: <20250811213843.4294-1-mhenning@darkrefraction.com>
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

