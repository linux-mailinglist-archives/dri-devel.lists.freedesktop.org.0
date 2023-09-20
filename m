Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 393557A8767
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 16:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75ABF10E509;
	Wed, 20 Sep 2023 14:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8070B10E508
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 14:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695221055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ghz5knkCxzrSi2vq7w57fAFMpmuxZabaEm5qht4/DxU=;
 b=ETnVn8JoUP0yh/+k0ueqpiyBRjUuwMq0p5nO6JmgnW4+ami3/EsorHQtJvndPiXQVTECW8
 r68hYmLXu2XfDduhW6EnQePTbX8c06JrOvaLfpc5TPmge2VY2hti7Wz6+WplVjZrgQVkYg
 utV7tjX7fDpfK0RJc4K9Rbbq+qpCIS4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-9WJ8Mb4yO3Wh7r19S0UX8A-1; Wed, 20 Sep 2023 10:44:14 -0400
X-MC-Unique: 9WJ8Mb4yO3Wh7r19S0UX8A-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2bbbaa6001dso87924561fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 07:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695221052; x=1695825852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ghz5knkCxzrSi2vq7w57fAFMpmuxZabaEm5qht4/DxU=;
 b=kP50vIL22jqJlIH3qcytnANb5JZMVQQbriEmZNcaTUMYlkQSLAvAgFask1+IgIgN4v
 GqlugnjpE3xroahqU7IZbcT2p+3nj3WAM8iCJN7Edqdiw/rAlAfQCroynGsf6eQvGVOC
 79D9ultcdTPXvW97L5wx8HiZSdeZ4yCg39qnGi40s+lPFmjIhmsNaJfNVpUvhd+DbiSY
 zBghh7RxiL3EVNOiXxrqQhXnKuGpxJdQ476HsK5nXv9hOnsskj5UeTvK/0isLjiUCZSI
 XJFn8UAEtMrQU5sHQL+G9A6tXFcEXXqSBNFGsTokQYiaVOBLIDurW2t+1Lmz8/iFN+/L
 8u9w==
X-Gm-Message-State: AOJu0YzIuf9gXYbLEtbtS/YB7H9+q23fpbUPA+NaXYXneFoZ4GC2MsbR
 kpgldnxqOE6DtK8Fmtulx6MVAY4AAhNXkHCKSafrfHXD80MwBUivHLxNbE2Oz97o3K+b2Oau2BR
 7r3pHYPjPg26irmPtFEG2B9ImtBfu
X-Received: by 2002:a2e:a404:0:b0:2b6:a827:164f with SMTP id
 p4-20020a2ea404000000b002b6a827164fmr2402870ljn.10.1695221052490; 
 Wed, 20 Sep 2023 07:44:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkDwQuz89itEzGqBwKPkWDW7JyrJRARiqBi2dVNs6J1tny5KDAWEvgM15hJfjA7rjqNjsHQw==
X-Received: by 2002:a2e:a404:0:b0:2b6:a827:164f with SMTP id
 p4-20020a2ea404000000b002b6a827164fmr2402846ljn.10.1695221052202; 
 Wed, 20 Sep 2023 07:44:12 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a170906165300b009ad75d318ffsm9680291ejd.17.2023.09.20.07.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 07:44:11 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Subject: [PATCH drm-misc-next v4 6/8] drm/gpuvm: add drm_gpuvm_flags to
 drm_gpuvm
Date: Wed, 20 Sep 2023 16:42:39 +0200
Message-ID: <20230920144343.64830-7-dakr@redhat.com>
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

Introduce flags for struct drm_gpuvm, this required by subsequent
commits.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c            |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
 include/drm/drm_gpuvm.h                | 17 ++++++++++++++++-
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 6ee224e1121e..6e9d2d478bb8 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -705,7 +705,7 @@ drm_gpuva_range_valid(struct drm_gpuvm *gpuvm,
  */
 void
 drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
-	       const char *name,
+	       const char *name, enum drm_gpuva_flags flags,
 	       u64 start_offset, u64 range,
 	       u64 reserve_offset, u64 reserve_range,
 	       const struct drm_gpuvm_ops *ops)
@@ -718,6 +718,7 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
 	gpuvm->mm_range = range;
 
 	gpuvm->name = name ? name : "unknown";
+	gpuvm->flags = flags;
 	gpuvm->ops = ops;
 
 	memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index cf709afd2ac7..3de8533841db 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1864,7 +1864,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 	uvmm->kernel_managed_addr = kernel_managed_addr;
 	uvmm->kernel_managed_size = kernel_managed_size;
 
-	drm_gpuvm_init(&uvmm->base, cli->drm->dev, cli->name,
+	drm_gpuvm_init(&uvmm->base, cli->drm->dev, cli->name, 0,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
 		       kernel_managed_addr, kernel_managed_size,
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2c9ad6eb9401..f57ad1f0f0d0 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -192,6 +192,16 @@ static inline bool drm_gpuva_invalidated(struct drm_gpuva *va)
 	return va->flags & DRM_GPUVA_INVALIDATED;
 }
 
+/**
+ * enum drm_gpuvm_flags - flags for struct drm_gpuvm
+ */
+enum drm_gpuvm_flags {
+	/**
+	 * @DRM_GPUVM_USERBITS: user defined bits
+	 */
+	DRM_GPUVM_USERBITS = (1 << 0),
+};
+
 /**
  * struct drm_gpuvm - DRM GPU VA Manager
  *
@@ -210,6 +220,11 @@ struct drm_gpuvm {
 	 */
 	const char *name;
 
+	/**
+	 * @flags: the &drm_gpuvm_flags of this GPUVM
+	 */
+	enum drm_gpuva_flags flags;
+
 	/**
 	 * @mm_start: start of the VA space
 	 */
@@ -256,7 +271,7 @@ struct drm_gpuvm {
 };
 
 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
-		    const char *name,
+		    const char *name, enum drm_gpuva_flags flags,
 		    u64 start_offset, u64 range,
 		    u64 reserve_offset, u64 reserve_range,
 		    const struct drm_gpuvm_ops *ops);
-- 
2.41.0

