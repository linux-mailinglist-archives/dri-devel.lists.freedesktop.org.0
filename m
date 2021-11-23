Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFD745A569
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CBB6E89E;
	Tue, 23 Nov 2021 14:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A106E5CD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:40 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so2140919wms.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pldTMC4RaLfk2VlDsi1M7JoBSDyFXLyiGqqy6PtuOhM=;
 b=Bj8VXu498aYHYw2Lu4AJkw2hjKPHM004v59aCYY/c412UQ+F9D+lBFy88aNGRE64Zm
 W/f+lajYacxiR9UAXH4vKn6KnNaDN8gPGNG0imzR0ICVxtOQmIct0SC2g42pam0pOnGT
 VWFNJquTH06BhLX2NWLSW3uk5nOkmzONn9jHG9ymLVvGmVyODCSdNbbKiMglKBeHL0Ks
 90orZdqnAW0//9BUybqCSVg8hEWNH0vGH0tQ7knBclRM2BWYPWUd0pPIjM6fkCU7WzM+
 PK5xtlMzKxjROS9h7K+ahT0AKrwoGarqDvgE59PB4dnmzRTGJm5d76tKIEKX2lh5NrvT
 Qtaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pldTMC4RaLfk2VlDsi1M7JoBSDyFXLyiGqqy6PtuOhM=;
 b=Gp7BLT9LJVQ1oUatHdrsxjdTOm7xD51atngpR/lxaAdElMVKly8i7vNgHrIUsk97Lt
 plZPKgsOQcslxd0Id3ExCNAC/PX07955fRukhx8Z8ajIwGfnq4Akz6eiMpg9kM1zylRs
 4hW34fAliMCvrlDYpw2rvvdFH24OkOT6hfeSFfwCLq8FkyuzVZgHtuDA+EkyxEVChASH
 nRezcsvxYbUWMiSW9PGspcE+uAoAFborFwGTQCUg6YZ3TFpOce/GaD/MduHVO9m17B0G
 vfblIySgMLeG4lOElvtib+/OD+2PFgG+Ti/0+0kx5D+kXBF/NIwrOxBCGg8GDsgJOF14
 90iQ==
X-Gm-Message-State: AOAM530QxbpIbnMcNqBuPktMRW02mE4P+6W9fV7Fg8nsaAtF4DetJAhq
 E4iXgPbRL5Iko/cIVexunKY=
X-Google-Smtp-Source: ABdhPJz911F8IY9Y0VBvle8G+wVlmlq4mcVedn/iG/AUr/XpKjKYgEubS8eqreLXD4JqwGaF9cPBEw==
X-Received: by 2002:a05:600c:c1:: with SMTP id
 u1mr3426832wmm.163.1637677299261; 
 Tue, 23 Nov 2021 06:21:39 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:38 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 14/26] drm/amdgpu: remove excl as shared workarounds
Date: Tue, 23 Nov 2021 15:20:59 +0100
Message-Id: <20211123142111.3885-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
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

