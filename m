Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4814EABDA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 13:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A283610EFFE;
	Tue, 29 Mar 2022 11:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8A210EFF0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 11:03:00 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id a8so34205878ejc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 04:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v5jq7ohM1YOaYUMwZw9cwHn9T3xEZUV5PESY8jlBY1E=;
 b=k8gR57kZkAExHJJydwtsXKQRX7nZhfheX7kmelCKingI27eFdLhJGGCHIQ2BXzqoKR
 Kc8DWiGZR8hF/3jjAXEzYuJeUtzOU9CqNPm/3IjvRhhU6HwxzV3bxW3oBe6uiF/Ir6+c
 Qf1limVZeKlB811LGxTldg2fAbnhN55DBdhu9R+xuFNJ898JJd13TkxXJ/dgyG+dK388
 rhNAC23niqenKwsVjiSHvyPfICvmJiB9qYTVUIZvPqfJZrXIg3+TKfjEWWOYl6PuBmB1
 1/DuDtlHW25O+dAzcYhY9Eg1Z1IkkxCPGCog9PRHlsNWVn2NErzyYJdFYV+/zxECFBYC
 N3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v5jq7ohM1YOaYUMwZw9cwHn9T3xEZUV5PESY8jlBY1E=;
 b=VFatMUQ4A8fhDGtT1Ax3nyp/aiXpwCMvHvcTR3a9vzl0RmA6DM/OFUSSiZLgcG2ENN
 hssWiMddbRzvrB6ZgTxpY72QDcgoNjyGFbjAMS8fQK7ER0KiLCrHzYi07zMuPaHtMGEM
 rzLuseFWr60HNa+TjhFE+3vW5wGTfqTmLErpXnidfPKYP82lCcuxWVpdZoIWM/wDGc9u
 kILlUVqIIdqJnI/83qrbekFo5toEnzrXRIrw85zKkHQxAzQ+mVWEAMJD/1awlkFxGZuP
 uaC4QiuNLn2EiF3yEfOd7DdP7+UGfvVRJWxWvSdw90CAgexGeKgldK+vobc8tpxToAFp
 gvPA==
X-Gm-Message-State: AOAM532LRmuKn3ZdammcwjLm6vbNGlUwj7c/ld+FmxcoPdgoPbNeA4h0
 HW7pJ425E39OVb/CG3KNhNw=
X-Google-Smtp-Source: ABdhPJzfS2sieixAOFMK+3Flt3OEiuc18j+FPdptZQ1Gk9Zjp28M1qZPFfqWU+YHMaF9m9pe7jTlfA==
X-Received: by 2002:a17:907:c018:b0:6df:e7d8:3397 with SMTP id
 ss24-20020a170907c01800b006dfe7d83397mr33165154ejc.143.1648551777160; 
 Tue, 29 Mar 2022 04:02:57 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1709060f5400b006d6d54b9203sm6958402ejj.38.2022.03.29.04.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 04:02:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/11] drm/amdgpu: audit bo->resource usage
Date: Tue, 29 Mar 2022 13:02:39 +0200
Message-Id: <20220329110243.6335-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329110243.6335-1-christian.koenig@amd.com>
References: <20220329110243.6335-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure we can at least move and release BOs without backing store.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 4cb3afbdf6b9..49e8ba118322 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1299,7 +1299,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (bo->base.resv == &bo->base._resv)
 		amdgpu_amdkfd_remove_fence_on_pt_pd_bos(abo);
 
-	if (bo->resource->mem_type != TTM_PL_VRAM ||
+	if (!bo->resource || bo->resource->mem_type != TTM_PL_VRAM ||
 	    !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
 		return;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 57ac118fc266..22954c84df39 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -476,7 +476,8 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	adev = amdgpu_ttm_adev(bo->bdev);
 
-	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
+	if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM &&
+			 bo->ttm == NULL)) {
 		ttm_bo_move_null(bo, new_mem);
 		goto out;
 	}
-- 
2.25.1

