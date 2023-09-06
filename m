Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BF0794557
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 23:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA9B10E20A;
	Wed,  6 Sep 2023 21:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4FB10E721
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 21:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694036865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gOYwJUtARBOFO+IhtMGCnrTn9nS2L4Us2OmhtN72cww=;
 b=HV2VHdRQKk4NRRul5+zP21MFJx6g2Ebu37ickIcolr1FpQTCt+1OefQvxwjf47AKLV1N9m
 pZlpFjzGrhFgRvOey/1tqoMTwojtWQaAXjxLoX+iaz9VcVIjafazvhIL2UeGtXWH85Ljgv
 6ixYuttDk5BBiBraa8f8J+9stgM+Yb4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-o7iobWUpPi65qA-Avx0P3w-1; Wed, 06 Sep 2023 17:47:43 -0400
X-MC-Unique: o7iobWUpPi65qA-Avx0P3w-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-501bf3722dfso210917e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 14:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694036862; x=1694641662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gOYwJUtARBOFO+IhtMGCnrTn9nS2L4Us2OmhtN72cww=;
 b=Zl4kFc3M5A64U67ok79BXlIiySuLjwA/4M0nUuRYhLV5Dlg93v8ys3uYdJ6IgJDl6S
 JN51lIyJX4JoSoFDxiOjJAlPPLlSUW9kyQQ/mSIoKXyIstdd5fNcuEtH2XMQAtA61UYq
 0/Hm0ihzvjk8hBsUqVpyjQbh/ISeNKDcWc+2DUICaEmmWRZxrh0Slh/Acs3euxxbBdN1
 NSVnPQVfG7d1DBu02QL348UHY/ZMZJ8oAtsLtDyp4nJRS1RpF7DrDRX+pwWK7wmVg29o
 Zfl7VcuwR56zbAWdZYEXLVDATivquF0Ua0xKt2Kl0TyBT5nbiYWY68efmmkz1qnNMQtW
 nDAg==
X-Gm-Message-State: AOJu0Ywrjvfq+Duph2SwRR/Zr7YuxLN/eJsHb+2NfFQFZTLZdiurYo+R
 xHgTPX4xf1GAY7y+iI8m8ciH9FHXa4R9gEtHqPnjyKqgrZNggQPs1V5/4PW08WCtnFXN1PN+VjO
 X8szsFY+9eISmXdCENYlbGfF/6bJE
X-Received: by 2002:a05:6512:282c:b0:500:c5df:1872 with SMTP id
 cf44-20020a056512282c00b00500c5df1872mr3719430lfb.44.1694036862496; 
 Wed, 06 Sep 2023 14:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9gfgEv9BjU8q6WhoWjT05KtviFb1ftdsssVn+ZTKx7Ur+135JyyGX0IGxaMvUPWby7AfAcA==
X-Received: by 2002:a05:6512:282c:b0:500:c5df:1872 with SMTP id
 cf44-20020a056512282c00b00500c5df1872mr3719410lfb.44.1694036862282; 
 Wed, 06 Sep 2023 14:47:42 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a056402515200b0052a3aa50d72sm8929983edd.40.2023.09.06.14.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 14:47:41 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Subject: [PATCH drm-misc-next v2 4/7] drm/gpuvm: common dma-resv per struct
 drm_gpuvm
Date: Wed,  6 Sep 2023 23:47:12 +0200
Message-ID: <20230906214723.4393-5-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906214723.4393-1-dakr@redhat.com>
References: <20230906214723.4393-1-dakr@redhat.com>
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
 drivers/gpu/drm/drm_gpuva_mgr.c        | 10 ++++++++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
 include/drm/drm_gpuva_mgr.h            | 15 ++++++++++++++-
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
index 0d9f15f50454..838277794990 100644
--- a/drivers/gpu/drm/drm_gpuva_mgr.c
+++ b/drivers/gpu/drm/drm_gpuva_mgr.c
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
index 4c47b2279674..21d5a06241ae 100644
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
diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
index 1aa99a4d5665..e09e3e3ac5b2 100644
--- a/include/drm/drm_gpuva_mgr.h
+++ b/include/drm/drm_gpuva_mgr.h
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

