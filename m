Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBF57A8761
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 16:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4B510E4FD;
	Wed, 20 Sep 2023 14:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC2E10E4FD
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695221047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9eTx7HM45+6Pndiur+37neaFohvyw8ajRFJVeD0uENU=;
 b=JQ6Rp8pddAooQND7XUKASBu4U07e+ZuTgcsu6fminqyCcDgLRPmNAvjObE0BY5R+Hk/s3I
 gTsmbd8+GtluHtyyy/RvpD4p5rFAsk662BXjHuTHI5bY8PbSFE+zG7lUXm7ou/UVV9Y9MH
 oNmp8CwWgTVY6EMhI7FuFcCt1NmInNw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-zUsn1x19Mb6xnfE591-mgQ-1; Wed, 20 Sep 2023 10:44:05 -0400
X-MC-Unique: zUsn1x19Mb6xnfE591-mgQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9a62adedadbso500101166b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 07:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695221045; x=1695825845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9eTx7HM45+6Pndiur+37neaFohvyw8ajRFJVeD0uENU=;
 b=rKhhwFmHCDggmrGcxabXyGNHivg/SSGnY7hGzXUFowzR1fM5+NrWVps4/Ds61QDsbg
 z8dFYEKiB0kaCDIKxzWvtOWAY2xHhxtYyAfiQwua/Z08pY3R9V54MKGL+WEt84KbS4ys
 fTFwcoAl/QK6NilKZmAdKtKgafbmQeDpghdfyvCXlqy4NlIUaEEBHAp6nFnDciWR2Gpv
 k0CQVSb/ce+eDXUP7PG+Dwbaz/YYKCQogpciwTC6SfH5hYGgDGt4e1mc7ECpzUxKs9xt
 ZVWtp+/N9jRrGqaZlJyjCQEyVwZJgExrM02xnMN8b4qwJgt+mgL5Gu0RPbncbek+jOA/
 QOKg==
X-Gm-Message-State: AOJu0YzJqKn0FpTgietKMyILfH/EAsfyRf71hl6zfkx7yfgg9F1Cs1Kd
 zMTDOUp6WkLK85TlQ5/YlvYEyxINleWYk2wJQ17u0LSguoDg11Hf+3MpeKJ/Emp6yGcCXAagYPD
 MP7sUrpA2wWPjBp6MqUmyPBBM1xpf
X-Received: by 2002:a17:906:300d:b0:9a1:ff2f:28f1 with SMTP id
 13-20020a170906300d00b009a1ff2f28f1mr2315698ejz.40.1695221044746; 
 Wed, 20 Sep 2023 07:44:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu+X3h60Ij8ZdpGoQdTiL5OCNr42he77iCpL16WasqxFnck4t/mnx+fu77K1gZLbEXon1z3Q==
X-Received: by 2002:a17:906:300d:b0:9a1:ff2f:28f1 with SMTP id
 13-20020a170906300d00b009a1ff2f28f1mr2315677ejz.40.1695221044370; 
 Wed, 20 Sep 2023 07:44:04 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 uz3-20020a170907118300b009ad8acac02asm9644504ejb.172.2023.09.20.07.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 07:44:03 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Subject: [PATCH drm-misc-next v4 4/8] drm/gpuvm: add common dma-resv per
 struct drm_gpuvm
Date: Wed, 20 Sep 2023 16:42:37 +0200
Message-ID: <20230920144343.64830-5-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920144343.64830-1-dakr@redhat.com>
References: <20230920144343.64830-1-dakr@redhat.com>
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
 drivers/gpu/drm/drm_gpuvm.c            |  9 +++++++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
 include/drm/drm_gpuvm.h                | 17 ++++++++++++++++-
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bfea4a8a19ec..cbf4b738a16c 100644
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
@@ -694,6 +695,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
 						     reserve_range)))
 			__drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
 	}
+
+	drm_gem_private_object_init(drm, &gpuvm->d_obj, 0);
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_init);
 
@@ -713,7 +716,9 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
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
index 0e802676e0a9..6666c07d7c3e 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -240,14 +240,29 @@ struct drm_gpuvm {
 	 * @ops: &drm_gpuvm_ops providing the split/merge steps to drivers
 	 */
 	const struct drm_gpuvm_ops *ops;
+
+	/**
+	 * @d_obj: Dummy GEM object; used internally to pass the GPU VMs
+	 * dma-resv to &drm_exec. Provides the GPUVM's &dma-resv.
+	 */
+	struct drm_gem_object d_obj;
 };
 
-void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
+void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
+		    const char *name,
 		    u64 start_offset, u64 range,
 		    u64 reserve_offset, u64 reserve_range,
 		    const struct drm_gpuvm_ops *ops);
 void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
 
+/**
+ * drm_gpuvm_resv() - returns the &drm_gpuvm's &dma_resv
+ * @gpuvm__: the &drm_gpuvm
+ *
+ * Returns: a pointer to the &drm_gpuvm's &dma_resv
+ */
+#define drm_gpuvm_resv(gpuvm__) (&(gpuvm__)->d_obj._resv)
+
 static inline struct drm_gpuva *
 __drm_gpuva_next(struct drm_gpuva *va)
 {
-- 
2.41.0

