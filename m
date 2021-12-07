Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E76A46BB49
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 13:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5BFEAFA1;
	Tue,  7 Dec 2021 12:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C387AB63
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 12:34:25 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d24so29319445wra.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 04:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pldTMC4RaLfk2VlDsi1M7JoBSDyFXLyiGqqy6PtuOhM=;
 b=c+0NOkdT/QqTSQAF6PmNLtGkrvVqf+24DUlL1C3JcbL8Qs+qC6YwzNQduLJK3ZfIf5
 GcOpat2T1/SRP1c8qU4mjI5+IKr+4kd2/y9GDiVCm+8HPFLLkxs1ed8K8OvY+HwB3zki
 Wxc349MPcU3SG+HM3jHs5nblFHwvw99+hHfopGVRkoJXg010FKnqAHvHGCNT1/MLpQk6
 nba4ogHEcTJvbUxcMFsOEuKfwXPaHrIT/3I2sDtll5QAg+J+wQbkURhT7iawRz2p1eJW
 zfJJ1LVAviH5illjT6HwVXi1+0fK9XNj5zSF2qTc63oaFdZ5Dn4KIC25PqKbUd2JF2yb
 778w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pldTMC4RaLfk2VlDsi1M7JoBSDyFXLyiGqqy6PtuOhM=;
 b=mo2kHtrtqXbDFxJ4/oW3AwxGYnu16K5+RN/RjmOTu/0zmLNvAJP5+lzLqyKaFkjuHO
 p60eDOFl0G8W7Z8f+W7kbH5U4+k0cCAvz4ZArrziPv1V7+/hGVselChd0Qez6O6yrF9E
 mwAuzG51aVY5wPQQKEuw77rJinCNrfFs8Z+bAMpP8lHkdqNXksT4Ris/gz435/B3R2S2
 nQm5iylEFn1f4sGyQfJEEoHrPrqzr/H9flDdO0R5epnQIFb/RF/B31tPFqq/hqgXK9ZJ
 1Q+Wcef8Q5msQhpbTfXXAwBvXywV6dga+vKN4sGc+5RhPn0k6zzZBNTjlOanK+jCWpjt
 s0Xw==
X-Gm-Message-State: AOAM531CGeSVzZoqtCB+tt03Sxuf+YpI1d+cyLpfTV4RgrTuUeq6RAnT
 PYRCvRZsuzqhlfZUpy2u63s=
X-Google-Smtp-Source: ABdhPJxJpHkmDeikHdyonzJqnlmZZkB+TfvfV4pk5/CeTV94ATIJ+fr695BoYYJjI0oxRSz04MIjGA==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr52747900wrm.280.1638880464586; 
 Tue, 07 Dec 2021 04:34:24 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 04:34:23 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 10/24] drm/amdgpu: remove excl as shared workarounds
Date: Tue,  7 Dec 2021 13:33:57 +0100
Message-Id: <20211207123411.167006-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This was added because of the now dropped shared on excl dependency.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 5 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 6 ------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 0311d799a010..53e407ea4c89 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1275,14 +1275,11 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 		/*
 		 * Work around dma_resv shortcommings by wrapping up the
 		 * submission in a dma_fence_chain and add it as exclusive
-		 * fence, but first add the submission as shared fence to make
-		 * sure that shared fences never signal before the exclusive
-		 * one.
+		 * fence.
 		 */
 		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
 				     dma_fence_get(p->fence), 1);
 
-		dma_resv_add_shared_fence(resv, p->fence);
 		rcu_assign_pointer(resv->fence_excl, &chain->base);
 		e->chain = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index a1e63ba4c54a..85d31d85c384 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -226,12 +226,6 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	if (!amdgpu_vm_ready(vm))
 		goto out_unlock;
 
-	fence = dma_resv_excl_fence(bo->tbo.base.resv);
-	if (fence) {
-		amdgpu_bo_fence(bo, fence, true);
-		fence = NULL;
-	}
-
 	r = amdgpu_vm_clear_freed(adev, vm, &fence);
 	if (r || !fence)
 		goto out_unlock;
-- 
2.25.1

