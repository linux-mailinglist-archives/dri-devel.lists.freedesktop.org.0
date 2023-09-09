Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BF0799954
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 17:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E71C10E1D4;
	Sat,  9 Sep 2023 15:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B04010E29D
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 15:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694273508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lcLGdhd1gdzk9cnxcEhjgrQ+ULRUicBk9enQZP7W2K4=;
 b=Ml8qqyAHZwDzqbkCnhdsNfhhxRDKXAsXAhDBuzghvRKHeJQ9kCop9cGyChK8NM0kRgnv05
 2hxcFn6gBM1E7P4VPoK/IwtPh5lvv9bb4ersM2/CYxaBLxRfnQ4d3z4+8eltCIrQ0SpPZ8
 Dj04vcPLYJlzQeBg2ZioW/IJjVsiCfI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-FRXB7dPBPT2h5AL_vI5AAw-1; Sat, 09 Sep 2023 11:31:46 -0400
X-MC-Unique: FRXB7dPBPT2h5AL_vI5AAw-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2be370ff948so34551501fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Sep 2023 08:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694273505; x=1694878305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lcLGdhd1gdzk9cnxcEhjgrQ+ULRUicBk9enQZP7W2K4=;
 b=SVMQDRiTFEFldk08DR1CO8hpC3b2WkQ345SRK111D7oAKp0xL6O+FtuneWMAKKg+U9
 XyuZWy2Hs+unO/DgPnJWZVi8ztn0YgedHqg0VueGrq98eZ7jpS48yJUrCoya/Ycg05GB
 oNXYvTToYdSlgToJ11mY98DtLQRmR/HTAizMQqkyH1nBDymIKGkrjYpy026rNxWu0+hc
 LE2PNfxZProTziq/PRLzRQj/WHHBc99kiGEAnt8IMlKTFR+E7Bci/MbX1p6zUijIkaGT
 KFE9atAHMydOBcfIB5doubaAZo6wpimQsJQkIUZpGf1DZge1dmvMlMyfkY+qFuFbUKYv
 bTXg==
X-Gm-Message-State: AOJu0YyxnHbl7i8cL4xWKGUDGGHdbt6l5bkQnt1X2/T8BRMTPFAaYz0E
 Vn3NZMwekDUGIo46dfdeuaEb+6XII2Sg72p0X7Hh3sQ6hY9+2gs0/Y/ReP5CEChjNwqiiql9a34
 irdGeqzmw093A9dSGp7si8ZDp7xpW
X-Received: by 2002:a2e:b618:0:b0:2b5:9778:7ce2 with SMTP id
 r24-20020a2eb618000000b002b597787ce2mr4294637ljn.15.1694273505497; 
 Sat, 09 Sep 2023 08:31:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhdiyIVm14+bZHVtBPRERQGrjKwaboTL06AF5QqEEldIS7O+3UJWf4r/vgP/p3jNKAx4pzQg==
X-Received: by 2002:a2e:b618:0:b0:2b5:9778:7ce2 with SMTP id
 r24-20020a2eb618000000b002b597787ce2mr4294612ljn.15.1694273505026; 
 Sat, 09 Sep 2023 08:31:45 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a170906528f00b00992b2c55c67sm2469439ejm.156.2023.09.09.08.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 08:31:44 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Subject: [PATCH drm-misc-next v3 4/7] drm/gpuvm: common dma-resv per struct
 drm_gpuvm
Date: Sat,  9 Sep 2023 17:31:11 +0200
Message-ID: <20230909153125.30032-5-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230909153125.30032-1-dakr@redhat.com>
References: <20230909153125.30032-1-dakr@redhat.com>
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

Provide a common dma-resv for GEM objects not being used outside of this
GPU-VM. This is used in a subsequent patch to generalize dma-resv,
external and evicted object handling and GEM validation.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 10 ++++++++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
 include/drm/drm_gpuvm.h                | 15 ++++++++++++++-
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index aae086deaa2b..218204fe5068 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -655,6 +655,7 @@ drm_gpuva_range_valid(struct drm_gpuvm *gpuvm,
 /**
  * drm_gpuvm_init() - initialize a &drm_gpuvm
  * @gpuvm: pointer to the &drm_gpuvm to initialize
+ * @drm: the drivers &drm_device
  * @name: the name of the GPU VA space
  * @start_offset: the start offset of the GPU VA space
  * @range: the size of the GPU VA space
@@ -668,7 +669,7 @@ drm_gpuva_range_valid(struct drm_gpuvm *gpuvm,
  * &name is expected to be managed by the surrounding driver structures.
  */
 void
-drm_gpuvm_init(struct drm_gpuvm *gpuvm,
+drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
 	       const char *name,
 	       u64 start_offset, u64 range,
 	       u64 reserve_offset, u64 reserve_range,
@@ -694,6 +695,9 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
 						     reserve_range)))
 			__drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
 	}
+
+	drm_gem_private_object_init(drm, &gpuvm->d_obj, 0);
+	gpuvm->resv = gpuvm->d_obj.resv;
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_init);
 
@@ -713,7 +717,9 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
 		__drm_gpuva_remove(&gpuvm->kernel_alloc_node);
 
 	WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
-	     "GPUVA tree is not empty, potentially leaking memory.");
+	     "GPUVA tree is not empty, potentially leaking memory.\n");
+
+	drm_gem_private_object_fini(&gpuvm->d_obj);
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 6c86b64273c3..a80ac8767843 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1836,7 +1836,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 	uvmm->kernel_managed_addr = kernel_managed_addr;
 	uvmm->kernel_managed_size = kernel_managed_size;
 
-	drm_gpuvm_init(&uvmm->base, cli->name,
+	drm_gpuvm_init(&uvmm->base, cli->drm->dev, cli->name,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
 		       kernel_managed_addr, kernel_managed_size,
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 0e802676e0a9..4abc753c01eb 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -240,9 +240,22 @@ struct drm_gpuvm {
 	 * @ops: &drm_gpuvm_ops providing the split/merge steps to drivers
 	 */
 	const struct drm_gpuvm_ops *ops;
+
+	/**
+	 * @d_obj: Dummy GEM object; used internally to pass the GPU VMs
+	 * dma-resv to &drm_exec.
+	 */
+	struct drm_gem_object d_obj;
+
+	/**
+	 * @resv: the &dma_resv for &drm_gem_objects mapped in this GPU VA
+	 * space
+	 */
+	struct dma_resv *resv;
 };
 
-void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
+void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
+		    const char *name,
 		    u64 start_offset, u64 range,
 		    u64 reserve_offset, u64 reserve_range,
 		    const struct drm_gpuvm_ops *ops);
-- 
2.41.0

