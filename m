Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E6B7D40BA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 22:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584B110E248;
	Mon, 23 Oct 2023 20:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0799010E248
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 20:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698092250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KAf5Rr1iVgdAw+Z3XFK7IgULN7/EDBIya+lJDvW29po=;
 b=Sd9SePXn4T1APtIJnwEmNs6qubY7WSy07ZmsV5/zUWokuuxLKNOWJRaCRQ+yCHrus5ejWB
 kgJojfja8Ppyf1AwzSgqcaeyROAP7OSZQFuCeDOAE+TJ+suU9Rz8PhyoYXt46YfdkERDGI
 +TfBrTLmrg9g377ntcvLN7Lz/8/xIcQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-E7wB9L1QMEO4r6n1MBE91w-1; Mon, 23 Oct 2023 16:17:28 -0400
X-MC-Unique: E7wB9L1QMEO4r6n1MBE91w-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9c797b497e8so179441066b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 13:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698092247; x=1698697047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KAf5Rr1iVgdAw+Z3XFK7IgULN7/EDBIya+lJDvW29po=;
 b=XBikWSeRzYd9uDSlX6zzIjLsDgkWQPL3w+poyXag/bqOekJTVZXUQAlo2V9PxhcS0E
 BjTu5fwjfBuNX3S5QnWiYZThiHHkDWY9vQXDDSVjF59BGztM/szbcMu7MGFfXlb8N1Om
 5+TzHP0jgy89y9LzvAUQrXHajv0RTBR7QXoglXWg+jY0LoxUS1ENKaz6K8cX556CQL5r
 u+IE4XaWvLzni0vVvmOHehIl3PBzNGZFkj1uJBECnmNsfYYB0MHSQviNBeWsFf9kEpYh
 rGeG1/rXnl1s2wTrjuAnS25IYu6WXOVgEvuouLPEtfvPL4UFg+rXcM6ER0MpL8yaTLWy
 xx/g==
X-Gm-Message-State: AOJu0YwpMGVLFCQajTCKcMzoVFiza9KKw5HX1J4UvaWuz1A5kWJ3Rq0e
 f+/dQTBOkhZ1ANqeQo665m4qU6qUSxWEiCZUy0iytnu4rqwSgHBP8IgqeE0I9v4umkLIdt/CZcs
 W09M8D6f6q513257HkfzZ1avmdLT0
X-Received: by 2002:a17:906:32da:b0:9ba:65e:750e with SMTP id
 k26-20020a17090632da00b009ba065e750emr6001249ejk.32.1698092247354; 
 Mon, 23 Oct 2023 13:17:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD4g3QAuTF8kVHCKeF6VyrY5PWPxzwc20qpCoZUcRTv0lXg6r40s20U0k1pvFmXDqRjaaTNQ==
X-Received: by 2002:a17:906:32da:b0:9ba:65e:750e with SMTP id
 k26-20020a17090632da00b009ba065e750emr6001236ejk.32.1698092247142; 
 Mon, 23 Oct 2023 13:17:27 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 dv24-20020a170906b81800b009a168ab6ee2sm7015109ejb.164.2023.10.23.13.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 13:17:26 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Subject: [PATCH drm-misc-next v7 6/7] drm/nouveau: make use of the GPUVM's
 shared dma-resv
Date: Mon, 23 Oct 2023 22:16:52 +0200
Message-ID: <20231023201659.25332-7-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023201659.25332-1-dakr@redhat.com>
References: <20231023201659.25332-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM GEM objects private to a single GPUVM can use a shared dma-resv.
Make use of the shared dma-resv of GPUVM rather than a driver specific
one.

The shared dma-resv originates from a "root" GEM object serving as
container for the dma-resv to make it compatible with drm_exec.

In order to make sure the object proving the shared dma-resv can't be
freed up before the objects making use of it, let every such GEM object
take a reference on it.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c   | 11 +++++++++--
 drivers/gpu/drm/nouveau/nouveau_bo.h   |  5 +++++
 drivers/gpu/drm/nouveau/nouveau_gem.c  | 10 ++++++++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  7 ++-----
 drivers/gpu/drm/nouveau/nouveau_uvmm.h |  1 -
 5 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 0f3bd187ede6..7afad86da64b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -148,10 +148,17 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
 	 * If nouveau_bo_new() allocated this buffer, the GEM object was never
 	 * initialized, so don't attempt to release it.
 	 */
-	if (bo->base.dev)
+	if (bo->base.dev) {
+		/* Gem objects not being shared with other VMs get their
+		 * dma_resv from a root GEM object.
+		 */
+		if (nvbo->no_share)
+			drm_gem_object_put(nvbo->r_obj);
+
 		drm_gem_object_release(&bo->base);
-	else
+	} else {
 		dma_resv_fini(&bo->base._resv);
+	}
 
 	kfree(nvbo);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index 07f671cf895e..70c551921a9e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -26,6 +26,11 @@ struct nouveau_bo {
 	struct list_head entry;
 	int pbbo_index;
 	bool validate_mapped;
+
+	/* Root GEM object we derive the dma_resv of in case this BO is not
+	 * shared between VMs.
+	 */
+	struct drm_gem_object *r_obj;
 	bool no_share;
 
 	/* GPU address space is independent of CPU word size */
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index a0d303e5ce3d..49c2bcbef129 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -111,7 +111,8 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 	if (vmm->vmm.object.oclass < NVIF_CLASS_VMM_NV50)
 		return 0;
 
-	if (nvbo->no_share && uvmm && &uvmm->resv != nvbo->bo.base.resv)
+	if (nvbo->no_share && uvmm &&
+	    drm_gpuvm_resv(&uvmm->base) != nvbo->bo.base.resv)
 		return -EPERM;
 
 	ret = ttm_bo_reserve(&nvbo->bo, false, false, NULL);
@@ -245,7 +246,7 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 		if (unlikely(!uvmm))
 			return -EINVAL;
 
-		resv = &uvmm->resv;
+		resv = drm_gpuvm_resv(&uvmm->base);
 	}
 
 	if (!(domain & (NOUVEAU_GEM_DOMAIN_VRAM | NOUVEAU_GEM_DOMAIN_GART)))
@@ -288,6 +289,11 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)
 		nvbo->valid_domains &= domain;
 
+	if (nvbo->no_share) {
+		nvbo->r_obj = drm_gpuvm_resv_obj(&uvmm->base);
+		drm_gem_object_get(nvbo->r_obj);
+	}
+
 	*pnvbo = nvbo;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 1e95b0a1b047..005bb9c77990 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1842,7 +1842,6 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 	int ret;
 
 	mutex_init(&uvmm->mutex);
-	dma_resv_init(&uvmm->resv);
 	mt_init_flags(&uvmm->region_mt, MT_FLAGS_LOCK_EXTERN);
 	mt_set_external_lock(&uvmm->region_mt, &uvmm->mutex);
 
@@ -1885,14 +1884,14 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 			    kernel_managed_addr, kernel_managed_size,
 			    NULL, 0, &cli->uvmm.vmm.vmm);
 	if (ret)
-		goto out_free_gpuva_mgr;
+		goto out_gpuvm_fini;
 
 	cli->uvmm.vmm.cli = cli;
 	mutex_unlock(&cli->mutex);
 
 	return 0;
 
-out_free_gpuva_mgr:
+out_gpuvm_fini:
 	drm_gpuvm_destroy(&uvmm->base);
 out_unlock:
 	mutex_unlock(&cli->mutex);
@@ -1950,6 +1949,4 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 	nouveau_vmm_fini(&uvmm->vmm);
 	drm_gpuvm_destroy(&uvmm->base);
 	mutex_unlock(&cli->mutex);
-
-	dma_resv_fini(&uvmm->resv);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index a308c59760a5..878cc7958483 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -12,7 +12,6 @@ struct nouveau_uvmm {
 	struct nouveau_vmm vmm;
 	struct maple_tree region_mt;
 	struct mutex mutex;
-	struct dma_resv resv;
 
 	u64 kernel_managed_addr;
 	u64 kernel_managed_size;
-- 
2.41.0

