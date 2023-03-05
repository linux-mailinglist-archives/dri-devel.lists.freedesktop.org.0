Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 164056AAE4A
	for <lists+dri-devel@lfdr.de>; Sun,  5 Mar 2023 06:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AC710E047;
	Sun,  5 Mar 2023 05:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEF510E047;
 Sun,  5 Mar 2023 05:22:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DC629B80924;
 Sun,  5 Mar 2023 05:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7FF3C433D2;
 Sun,  5 Mar 2023 05:21:55 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/amdgpu: Use uncached ioremap() for LoongArch
Date: Sun,  5 Mar 2023 13:21:37 +0800
Message-Id: <20230305052137.4030323-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.1
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
Cc: Xuefeng Li <lixuefeng@loongson.cn>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LoongArch maintains cache coherency in hardware, but its WUC attribute
(Weak-ordered UnCached, which is similar to WC) is out of the scope of
cache coherency machanism. This means WUC can only used for write-only
memory regions. So use uncached ioremap() for LoongArch in the amdgpu
driver.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index c5ef7f7bdc15..c6888a58819a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1750,8 +1750,13 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 
 	else
 #endif
+#ifdef CONFIG_LOONGARCH
+		adev->mman.aper_base_kaddr = ioremap(adev->gmc.aper_base,
+				adev->gmc.visible_vram_size);
+#else
 		adev->mman.aper_base_kaddr = ioremap_wc(adev->gmc.aper_base,
 				adev->gmc.visible_vram_size);
+#endif
 #endif
 
 	/*
-- 
2.39.1

