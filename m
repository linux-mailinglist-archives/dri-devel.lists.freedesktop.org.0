Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D3B382EE7
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0E96E979;
	Mon, 17 May 2021 14:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91F86E975
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:11:41 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id a25so7056789edr.12
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xt3NABxpywAvvR6VPkv8lAm7fXhnKgnyzb3m+fNVeUo=;
 b=HBMsiDCnkg8q6WJeZba0+meqo7/6wak/E589gphpPEG1HVCQDkwYOXqZqFHWsWyy8m
 LLCzXhox4X3a7ABpEZriAAB1+oLe4yPKvX4ib3GelAwxlR5v6XbvNBIFkmAhoKhs/iYc
 F2srM1ZIOBxT1ZmY6O+VPauqL/kZf0LeDasDTROI87urWxBC/K/pRo/+rwW/JelsQPjj
 w9VdOd9uFx5xrI3f2aXYYzbpGraRU6LhSgS7hpYiQzcHef0qbKjAf30BXd6Wjyl8IIQ4
 cUX5SHmXPBJ7NoQBcJup8nZn7AOcKW3h+ZPRjVbaBQyZ2d/tQvfJ3KdYa/MV7dUkTXPT
 eriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xt3NABxpywAvvR6VPkv8lAm7fXhnKgnyzb3m+fNVeUo=;
 b=UqE97i4e3H/r14oQ8Z+53/5tqoZY9BwSMpWqw9BAt4dzTAB9zC8GA/ZBaTMh9iLgMc
 4/fNzIPBGmMAv9fjH3GAYbuxyRaR+OCguI9AnlEAZHMhkik/gMXzccQiQ6RtNp0T2bzQ
 sRQqsFC6JqhDFgmmzmMx9DhUYrhZbHq96j+Zau5SFqHDQdVE8PdYP51AG/FPptmkQJ+x
 s+TqJsWgM2tHGjkQEsC1Js7B9LNbD9C3DUv2xbTSiypOHgrft7k8DMjcKf/67Von59Gp
 1JdO0VdjjVLhteniL+HB6/EsP4NNgpsCrECcXvY94lVkRkSjNjqEDUm8raJj/tqldvvF
 vuug==
X-Gm-Message-State: AOAM531sImKtZwHAB5Pya+tD0o/4YNOjPWGU04H+m/YzANZxE4gAO4KG
 GlKdYW99TUEDhVc5n7eWQIUDYyQfr3M=
X-Google-Smtp-Source: ABdhPJxobpB36uMi5VYCY/9yNi3dWFU7MQChGpDZL7IOrslL73L4i8sHXWhiyHs/b2HSghEVt5Bl6w==
X-Received: by 2002:aa7:db93:: with SMTP id u19mr221239edt.227.1621260700438; 
 Mon, 17 May 2021 07:11:40 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1df4:c5b6:b8fd:3c4b])
 by smtp.gmail.com with ESMTPSA id b9sm2419624edt.71.2021.05.17.07.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:11:40 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 11/11] drm/amdgpu: fix shared access to exported DMA-bufs
Date: Mon, 17 May 2021 16:11:29 +0200
Message-Id: <20210517141129.2225-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517141129.2225-1-christian.koenig@amd.com>
References: <20210517141129.2225-1-christian.koenig@amd.com>
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

We are running into more and more problems with that approach since every
command submission to the buffer in question is now serializing.

Since the i915 where we originally added that for is now fixed we should
be able to remove this.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 10 ++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  6 ------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |  5 -----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 -
 5 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index b5c766998045..6b610a2df52f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -614,14 +614,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	gws = p->bo_list->gws_obj;
 	oa = p->bo_list->oa_obj;
 
-	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
-
-		/* Make sure we use the exclusive slot for shared BOs */
-		if (bo->prime_shared_count)
-			e->tv.num_shared = 0;
-		e->bo_va = amdgpu_vm_bo_find(vm, bo);
-	}
+	amdgpu_bo_list_for_each_entry(e, p->bo_list)
+		e->bo_va = amdgpu_vm_bo_find(vm, ttm_to_amdgpu_bo(e->tv.bo));
 
 	if (gds) {
 		p->job->gds_base = amdgpu_bo_gpu_offset(gds) >> PAGE_SHIFT;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 67cef80e25c8..76a2ac547698 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -167,7 +167,6 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
 	if (r)
 		goto out;
 
-	bo->prime_shared_count++;
 	amdgpu_bo_unreserve(bo);
 	return 0;
 
@@ -191,9 +190,6 @@ static void amdgpu_dma_buf_detach(struct dma_buf *dmabuf,
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 
-	if (attach->dev->driver != adev->dev->driver && bo->prime_shared_count)
-		bo->prime_shared_count--;
-
 	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 }
@@ -446,8 +442,6 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
 	bo = gem_to_amdgpu_bo(gobj);
 	bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
 	bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
-	if (dma_buf->ops != &amdgpu_dmabuf_ops)
-		bo->prime_shared_count = 1;
 
 	dma_resv_unlock(resv);
 	return gobj;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 94da44d97e7f..33eddea5d83d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -775,11 +775,6 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
 		break;
 	}
 	case AMDGPU_GEM_OP_SET_PLACEMENT:
-		if (robj->prime_shared_count && (args->value & AMDGPU_GEM_DOMAIN_VRAM)) {
-			r = -EINVAL;
-			amdgpu_bo_unreserve(robj);
-			break;
-		}
 		if (amdgpu_ttm_tt_get_usermm(robj->tbo.ttm)) {
 			r = -EPERM;
 			amdgpu_bo_unreserve(robj);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 1190781cefcb..158c9e94d42f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -906,7 +906,7 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u32 domain,
 		return -EINVAL;
 
 	/* A shared bo cannot be migrated to VRAM */
-	if (bo->prime_shared_count || bo->tbo.base.import_attach) {
+	if (bo->tbo.base.import_attach) {
 		if (domain & AMDGPU_GEM_DOMAIN_GTT)
 			domain = AMDGPU_GEM_DOMAIN_GTT;
 		else
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index b37d36ac6b5a..d7355396995d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -92,7 +92,6 @@ struct amdgpu_bo {
 	struct ttm_buffer_object	tbo;
 	struct ttm_bo_kmap_obj		kmap;
 	u64				flags;
-	unsigned			prime_shared_count;
 	/* per VM structure for page tables and with virtual addresses */
 	struct amdgpu_vm_bo_base	*vm_bo;
 	/* Constant after initialization */
-- 
2.25.1

