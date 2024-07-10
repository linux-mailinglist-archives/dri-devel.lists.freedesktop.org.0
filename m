Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DED92D1D8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 14:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E9110E78F;
	Wed, 10 Jul 2024 12:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bAsubeF+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D17E10E78C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:43:12 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ee88c4443eso66423491fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 05:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720615390; x=1721220190; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=umrby2MQnpwBnZqHdFG3/JwLGYUDmvuInXq96jEbSz4=;
 b=bAsubeF+jHY1nJSoFD68Yb5SnObzLNfTGSTpTDlPOY/piK7K0yPYnfnuK6Q9WQKIId
 z3q0slyOVBkS8GiDQeKuRHfWbiY7w002A30zFcqWZKwxmbbGp4mMq4oMMsK3Ef7roFG6
 qUK5Fprect+TlE9pJj4qZ0sCi2xtIACcEEWRcpr32FLmK/HdWaUnx2jwuM5v+1hUq2In
 f+ThxpK/SxxlizTo/wi10a85CfEFJXVSWZtKaQnJH7B36SMMs6APZ1uzigeb0KWUhkJY
 WFmseSSziWUSOS1LpgyBN+Ko/9KR7OQhmJk+DWNePcM+HDxaawoKMhp2V14gWZPuQsGu
 p+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720615390; x=1721220190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=umrby2MQnpwBnZqHdFG3/JwLGYUDmvuInXq96jEbSz4=;
 b=w/3c3OeL6yjq4Rbg+QeVmvAmKKTiQgVI21Bqw+0ux1l3O7dkjHEz28VrnU0RxHRVu3
 hqInXPO2wXNMPkOmdnTQaiq0ffM/NYtnSS3B+fa+s5bBe+2k+nQlSPsrgaIXYdmy7WMw
 UgV78GgK2SuoZbInTpAimLpqKCj8Er9a/cXpp2LDmxCWWpll9/gBr1wEjmbdRKdEkGcs
 j5zYpXHWCNlaRDoc9OwdH87IGdnvQ+PxGjZ5EsCE6IGgX07RcNWj0mOD0Xq1y95J/itX
 00f7db3VqqXgk6jT9LzGEwPgs8Sx98pkfUzQTFQ+cShURNC6CAqHAPkbFFCWLF9jWyLZ
 vbRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl/aWG+Owt2yv+XrLGWY+57G+fdhVWPnVnewlbhDFXMGZOyW9MouDIehdPf3rr2whxjwJlpgT/GVnfJF8rIjNhM43Rs8XKfdZAJ4CRNUP2
X-Gm-Message-State: AOJu0YyrS79ti0MLjBp2dbx/BDV9iVX+NcgejzN74NtsiHJED/01VuGY
 RTuZ152iMNC0ov/yKdSXNycAPJ4ZRzmU38lj5p55CUvvp1ypbewV
X-Google-Smtp-Source: AGHT+IHShUw8PJmudP1U5KmobFkNtnD0gXpYoSxeWfQTX4ax8yvc34JKVIuBOJzXpqDk/10/YBTnPw==
X-Received: by 2002:a05:651c:11c7:b0:2ee:4623:93e with SMTP id
 38308e7fff4ca-2eeb30e398cmr36527401fa.20.1720615389492; 
 Wed, 10 Jul 2024 05:43:09 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1504:6f00:b310:1e44:6e5e:7646])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bb9604f7sm2171868a12.15.2024.07.10.05.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 05:43:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] drm/amdgpu: use drm_exec during BO validation
Date: Wed, 10 Jul 2024 14:43:01 +0200
Message-Id: <20240710124301.1628-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710124301.1628-1-christian.koenig@amd.com>
References: <20240710124301.1628-1-christian.koenig@amd.com>
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

This allows to detect deadlocks happening because of resource
constraints.

Especially submissions which want to use all of GDS doesn't result in
sporadic -ENOMEM any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 86 ++++++++++++++------------
 1 file changed, 46 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index ec888fc6ead8..ff532c8b7a62 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -782,7 +782,7 @@ static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
 		.no_wait_gpu = false,
-		.resv = bo->tbo.base.resv
+		.exec = &p->exec,
 	};
 	uint32_t domain;
 	int r;
@@ -834,7 +834,10 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 				union drm_amdgpu_cs *cs)
 {
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
-	struct ttm_operation_ctx ctx = { true, false };
+	struct ttm_operation_ctx ctx = {
+		.interruptible =true,
+		.exec = &p->exec
+	};
 	struct amdgpu_vm *vm = &fpriv->vm;
 	struct amdgpu_bo_list_entry *e;
 	struct drm_gem_object *obj;
@@ -919,50 +922,56 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 			if (unlikely(r))
 				goto out_free_user_pages;
 		}
-	}
-
-	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
-		struct mm_struct *usermm;
 
-		usermm = amdgpu_ttm_tt_get_usermm(e->bo->tbo.ttm);
-		if (usermm && usermm != current->mm) {
-			r = -EPERM;
-			goto out_free_user_pages;
-		}
+		amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
+			struct mm_struct *usermm;
 
-		if (amdgpu_ttm_tt_is_userptr(e->bo->tbo.ttm) &&
-		    e->user_invalidated && e->user_pages) {
-			amdgpu_bo_placement_from_domain(e->bo,
-							AMDGPU_GEM_DOMAIN_CPU);
-			r = ttm_bo_validate(&e->bo->tbo, &e->bo->placement,
-					    &ctx);
-			if (r)
+			usermm = amdgpu_ttm_tt_get_usermm(e->bo->tbo.ttm);
+			if (usermm && usermm != current->mm) {
+				r = -EPERM;
 				goto out_free_user_pages;
+			}
+
+			if (amdgpu_ttm_tt_is_userptr(e->bo->tbo.ttm) &&
+			    e->user_invalidated && e->user_pages) {
+				amdgpu_bo_placement_from_domain(e->bo,
+								AMDGPU_GEM_DOMAIN_CPU);
+				r = ttm_bo_validate(&e->bo->tbo, &e->bo->placement,
+						    &ctx);
+				drm_exec_retry_on_contention(&p->exec);
+				if (r)
+					goto out_free_user_pages;
+
+				amdgpu_ttm_tt_set_user_pages(e->bo->tbo.ttm,
+							     e->user_pages);
+			}
 
-			amdgpu_ttm_tt_set_user_pages(e->bo->tbo.ttm,
-						     e->user_pages);
+			kvfree(e->user_pages);
+			e->user_pages = NULL;
 		}
 
-		kvfree(e->user_pages);
-		e->user_pages = NULL;
-	}
+		amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
+						  &p->bytes_moved_vis_threshold);
+		p->bytes_moved = 0;
+		p->bytes_moved_vis = 0;
 
-	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
-					  &p->bytes_moved_vis_threshold);
-	p->bytes_moved = 0;
-	p->bytes_moved_vis = 0;
+		r = amdgpu_vm_validate(p->adev, &fpriv->vm, NULL,
+				       amdgpu_cs_bo_validate, p);
+		drm_exec_retry_on_contention(&p->exec);
+		if (r) {
+			DRM_ERROR("amdgpu_vm_validate() failed.\n");
+			goto out_free_user_pages;
+		}
 
-	r = amdgpu_vm_validate(p->adev, &fpriv->vm, NULL,
-			       amdgpu_cs_bo_validate, p);
-	if (r) {
-		DRM_ERROR("amdgpu_vm_validate() failed.\n");
-		goto out_free_user_pages;
-	}
+		drm_exec_for_each_locked_object(&p->exec, index, obj) {
+			r = amdgpu_cs_bo_validate(p, gem_to_amdgpu_bo(obj));
+			drm_exec_retry_on_contention(&p->exec);
+			if (unlikely(r))
+				goto out_free_user_pages;
+		}
 
-	drm_exec_for_each_locked_object(&p->exec, index, obj) {
-		r = amdgpu_cs_bo_validate(p, gem_to_amdgpu_bo(obj));
-		if (unlikely(r))
-			goto out_free_user_pages;
+		amdgpu_cs_report_moved_bytes(p->adev, p->bytes_moved,
+					     p->bytes_moved_vis);
 	}
 
 	if (p->uf_bo) {
@@ -973,9 +982,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		p->gang_leader->uf_addr += amdgpu_bo_gpu_offset(p->uf_bo);
 	}
 
-	amdgpu_cs_report_moved_bytes(p->adev, p->bytes_moved,
-				     p->bytes_moved_vis);
-
 	for (i = 0; i < p->gang_size; ++i)
 		amdgpu_job_set_resources(p->jobs[i], p->bo_list->gds_obj,
 					 p->bo_list->gws_obj,
-- 
2.34.1

