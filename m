Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE3D4BBFF7
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 19:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC3810E730;
	Fri, 18 Feb 2022 18:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8714210E730;
 Fri, 18 Feb 2022 18:53:52 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 r64-20020a17090a43c600b001b8854e682eso9392874pjg.0; 
 Fri, 18 Feb 2022 10:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=McwjLSLaytCtK7tV2i/coh6cpneHZuWc7h/cZMMLVaQ=;
 b=qS5kgw9dlzff3cynK7hHxw9gR3U0R6hubv+YKcGJnsGj3VYm2oM+4O8weoW2p2sZyw
 c20WORhh8vLskTonGbwQkhF8S2qVv87wVcmcCnpfCuniNqBKPpM3SHHkZI1UBVKT3hdc
 /YYE0ThFOusvkuKpKTcnSmn257veUPiLnnl1YAaAZJfOWUdbvmQIunP9HnqoMI57Y1p3
 wrQfbe6PsnVJTG7l7cwGBJAlOs7W0U1A2yfEgqIt4vCTpNWdhS6rmjOn1/dRvj6lItI7
 5a4xFx3R6iXDH5namFQ8U8M1i30J62YRRSyRjFQ671TIwRe1D0dHHSvemmvCUID/eKhv
 rtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=McwjLSLaytCtK7tV2i/coh6cpneHZuWc7h/cZMMLVaQ=;
 b=YuczFHJpATBaNhfyvG7ZMriANTtISlBmPIsqgRe7Qrf1W67rmBD2yu94tDXt1BwZUf
 wETZNMR6TDRlyWN3aADyUnh/845DIxzfYuKzeWd5Ym73XCNIi5uTHeJANuOCb9TS/0gg
 yn/coFTg886IstSPEBdQQyZYLuV1U0TQ6CSl3OfqZHmfyeF8EFNGHAC34iTxQwVudx1f
 AzgSuhzgkf38hlfbAhFpV49V7HnP93Dq+zSoNWO3zI4RCrHFQn673YNR6WeoQecVwOm8
 O/DTVFvlfg2oge6vGEDd98AlXAEE3ouzxI5bzUrWiWnovIELaAYT3r0hjtGawPRBU93E
 k09Q==
X-Gm-Message-State: AOAM532LFPsVMXqjAzBahS/NcNXt6qc8seoXcdZuWECmWUlHUCGRgLoQ
 UWQKXuUIqC4KviZ6Jjs+dOE=
X-Google-Smtp-Source: ABdhPJzQQSZPxtLkIpcflnhLn+ubFoe7B07qM/ToZ1Aq0GEshzZY7TCT7UmLcClTvTCsiaUJa7UVgQ==
X-Received: by 2002:a17:902:da82:b0:14d:c6d8:822f with SMTP id
 j2-20020a170902da8200b0014dc6d8822fmr8509644plx.55.1645210432081; 
 Fri, 18 Feb 2022 10:53:52 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9005:88cd:7443:8052:dc37:e678])
 by smtp.gmail.com with ESMTPSA id p2sm125106pjo.38.2022.02.18.10.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 10:53:51 -0800 (PST)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org,
 desaulniers@google.com, Felix.Kuehling@amd.com, Oak.Zeng@amd.com,
 nirmoy.das@amd.com, jonathan.kim@amd.com, kevin1.wang@amd.com,
 tzimmermann@suse.de, Philip.Yang@amd.com
Subject: [PATCH] drm/amdgpu: Initialize value of r in amdgpu_fill_buffer()
Date: Sat, 19 Feb 2022 00:23:12 +0530
Message-Id: <20220218185312.34464-1-jrdr.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: amd-gfx@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Souptick Joarder \(HPE\)" <jrdr.linux@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>

Kernel test robot reported warning ->
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2129:2: warning: Undefined
or garbage value returned to caller [clang-analyzer-core.
uninitialized.UndefReturn]

Initialize r inside amdgpu_fill_buffer().

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 414a22dddc78..5fafb223177f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2089,7 +2089,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
 	struct dma_fence *fence = NULL;
 	struct amdgpu_res_cursor dst;
-	int r;
+	int r = 0;
 
 	if (!adev->mman.buffer_funcs_enabled) {
 		DRM_ERROR("Trying to clear memory with ring turned off.\n");
-- 
2.25.1

