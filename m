Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B977DE8F4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 00:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3245910E7ED;
	Wed,  1 Nov 2023 23:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D68F10E7E1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 23:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698881511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RXgqRC5/5tCXBERwm7aEPSo0YVJhEAXXDD4zWhliPJ8=;
 b=dOvcuX5cAntE4iMcEee6QOhn1zn7mP9YI4dhs6iB6nBvx39wpBO1/7P0K4+0oYIe1NuSop
 3dR1MmGoBqI5HSHpV9nWWa4YxFjoqZkq2GPL9ogru1pIF8exWLxQg+OwaCVzAap4WRloC1
 I0b93k70LTWvJQXQNeRAnRMELCpYF5Q=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-jOuNeynAOzWxTxokKwFQPA-1; Wed, 01 Nov 2023 19:31:46 -0400
X-MC-Unique: jOuNeynAOzWxTxokKwFQPA-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-507cafb69e8so249570e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 16:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698881505; x=1699486305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RXgqRC5/5tCXBERwm7aEPSo0YVJhEAXXDD4zWhliPJ8=;
 b=k6Y3+k2tALmrF37froRrRLbasLz0RerxZKhib7jc7NS95ZIkIAjXCo00eOahhuGWRa
 CYPjMdvdcsaFkozQc0k7kUwgrBvCIdu8i9Ug0gkZo1tA6NVZDwcld7pnjo92t6z82l/0
 gpHOheZJJp7oFKWx7ob3ploOrA6YCidYrPEYlst0IH7mxyGVT8pmQrCEkm/oEJ6bgc+r
 YIJjUFiLfam52uP/Qnv7iytMcXoKEYqq69a04DGptsqHTGedqCBdww91iwTARRx6JDag
 /JEYiYBOapdVy3LJp0+xy7vgyO5BQrKpL77xrdeoBx7r+afrE7XfYa+dFatQTRRBcujD
 eQ0g==
X-Gm-Message-State: AOJu0YxqKJ0MqG9isOVB82aTKYft0wm3zjM4LVcsFmLBi3ZVWNpAINsU
 XNV0vw0UhVJICR5DKZQ/0jUhNtFebBeEjYYpeInTjGrQVEPbe9Zy6CyGkPb9oycsGeabUhT+LiD
 xG+K+kDy0Wr5m1zsI04HGu6Gb+TRH
X-Received: by 2002:ac2:5e85:0:b0:509:451f:72f with SMTP id
 b5-20020ac25e85000000b00509451f072fmr1051019lfq.48.1698881505346; 
 Wed, 01 Nov 2023 16:31:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZQnFzK4yiK/j0ulyfKXEQuNYco5ChZGRIZtqU1f5JUsGCSpUAFPknC105jHZDcS5M1tvK/w==
X-Received: by 2002:ac2:5e85:0:b0:509:451f:72f with SMTP id
 b5-20020ac25e85000000b00509451f072fmr1051000lfq.48.1698881505032; 
 Wed, 01 Nov 2023 16:31:45 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 fx3-20020a170906b74300b009d2526048acsm461007ejb.40.2023.11.01.16.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 16:31:44 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Subject: [PATCH drm-misc-next v8 07/12] drm/gpuvm: add drm_gpuvm_flags to
 drm_gpuvm
Date: Thu,  2 Nov 2023 00:30:59 +0100
Message-ID: <20231101233113.8059-8-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101233113.8059-1-dakr@redhat.com>
References: <20231101233113.8059-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce flags for struct drm_gpuvm, this required by subsequent
commits.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c            |  3 +++
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
 include/drm/drm_gpuvm.h                | 16 ++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index af5805e4d7c9..53e2c406fb04 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -720,6 +720,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_resv_object_alloc);
  * drm_gpuvm_init() - initialize a &drm_gpuvm
  * @gpuvm: pointer to the &drm_gpuvm to initialize
  * @name: the name of the GPU VA space
+ * @flags: the &drm_gpuvm_flags for this GPUVM
  * @drm: the &drm_device this VM resides in
  * @r_obj: the resv &drm_gem_object providing the GPUVM's common &dma_resv
  * @start_offset: the start offset of the GPU VA space
@@ -735,6 +736,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_resv_object_alloc);
  */
 void
 drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
+	       enum drm_gpuvm_flags flags,
 	       struct drm_device *drm,
 	       struct drm_gem_object *r_obj,
 	       u64 start_offset, u64 range,
@@ -745,6 +747,7 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	INIT_LIST_HEAD(&gpuvm->rb.list);
 
 	gpuvm->name = name ? name : "unknown";
+	gpuvm->flags = flags;
 	gpuvm->ops = ops;
 	gpuvm->drm = drm;
 	gpuvm->r_obj = r_obj;
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 8977a518de96..f765e3835306 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1828,7 +1828,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		goto out_unlock;
 	}
 
-	drm_gpuvm_init(&uvmm->base, cli->name, drm, r_obj,
+	drm_gpuvm_init(&uvmm->base, cli->name, 0, drm, r_obj,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
 		       kernel_managed_addr, kernel_managed_size,
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index ff3377cbfe52..0c2e24155a93 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -184,6 +184,16 @@ static inline bool drm_gpuva_invalidated(struct drm_gpuva *va)
 	return va->flags & DRM_GPUVA_INVALIDATED;
 }
 
+/**
+ * enum drm_gpuvm_flags - flags for struct drm_gpuvm
+ */
+enum drm_gpuvm_flags {
+	/**
+	 * @DRM_GPUVM_USERBITS: user defined bits
+	 */
+	DRM_GPUVM_USERBITS = BIT(0),
+};
+
 /**
  * struct drm_gpuvm - DRM GPU VA Manager
  *
@@ -202,6 +212,11 @@ struct drm_gpuvm {
 	 */
 	const char *name;
 
+	/**
+	 * @flags: the &drm_gpuvm_flags of this GPUVM
+	 */
+	enum drm_gpuvm_flags flags;
+
 	/**
 	 * @drm: the &drm_device this VM lives in
 	 */
@@ -252,6 +267,7 @@ struct drm_gpuvm {
 };
 
 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
+		    enum drm_gpuvm_flags flags,
 		    struct drm_device *drm,
 		    struct drm_gem_object *r_obj,
 		    u64 start_offset, u64 range,
-- 
2.41.0

