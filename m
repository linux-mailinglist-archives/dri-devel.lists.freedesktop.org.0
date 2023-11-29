Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B6A7FE2B3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 23:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F13C10E68E;
	Wed, 29 Nov 2023 22:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB1510E68E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 22:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701295730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZsbNG0hXjCmfhlzaR1Ertu6cdbyq3FJ35PdLNAoDWc=;
 b=dxY/1+rPSkiuNcJnitT9QOW3xs2wJF2VrQdvWNY/s0QqFYIMaPmpC6N+WiwHCt1Hlk+T5A
 kQX866tN4HX625SYWMhFTfA0byYfiBQ9n6cqL2JaaQc4OHu09GIAY0kjhEQjTkhAg1QkRZ
 UgMXPFjKqGqDl0PxUsydFhx8Nsi62oQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-D96SPKA3N0Glm9KHWly3zA-1; Wed, 29 Nov 2023 17:08:47 -0500
X-MC-Unique: D96SPKA3N0Glm9KHWly3zA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a047f347c1cso216461266b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 14:08:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701295726; x=1701900526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sZsbNG0hXjCmfhlzaR1Ertu6cdbyq3FJ35PdLNAoDWc=;
 b=ph0KBNp4aODWI8AS7jdhNyRn4doNyMyTR+1+yZsQ9aIcW5Z4Zpk2y5T9pNunzMJ7QT
 vV6zzsxtA2zovDqPdl+JbpCiFnNaqqeBQqDMS2v9vE2W6d/Awpf6SziQJxicl1yttY5U
 +SLBWLzFWyoQOBTPJi9mTVMfBeJeTgyBvBs8iiYC64XAGDik9S/6B2Kpk7fbbzrMZ84A
 Qwa7rTME0MWmFmhYBVVuPA0DWx7sxt7aRvJRIziLxg30aX7OwJ2Et87bxtzCvX5dIarW
 tgcsfoqRfZBWfChwf7g0cW8M7q9fO3eG6h5L0lwYGvb4HoppAjfZ3BR9VmZUedJtrWWv
 lnCg==
X-Gm-Message-State: AOJu0Yys+7Il7+bkwf/TVOVGpfd9lK6rqQGFIuwIoIToDFDakS6921Et
 eydEy72E4xaAjO9x5LaAFy8fssEa5NaYZuscmUqg5FJL3FnrexSXK04lvWExsoeKJyZFxka7pmV
 YG2Xi8svVQwtPQfAB2F6gRRIebvjC
X-Received: by 2002:a17:906:74dc:b0:a17:89f4:72b2 with SMTP id
 z28-20020a17090674dc00b00a1789f472b2mr2674188ejl.25.1701295726685; 
 Wed, 29 Nov 2023 14:08:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErZMEl95C/mObJREtgYANzyUW/rQCMPiswfAw+zx+W2F/ECoZf/nZrFQmDsXvJlSBqiqwHfA==
X-Received: by 2002:a17:906:74dc:b0:a17:89f4:72b2 with SMTP id
 z28-20020a17090674dc00b00a1789f472b2mr2674178ejl.25.1701295726518; 
 Wed, 29 Nov 2023 14:08:46 -0800 (PST)
Received: from pollux.. ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 r22-20020a170906351600b00a0c01560bdfsm5514821eja.139.2023.11.29.14.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 14:08:46 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 frank.binns@imgtec.com, donald.robson@imgtec.com, matt.coster@imgtec.com,
 sarah.walker@imgtec.com
Subject: [PATCH drm-misc-next v2 2/2] drm/imagination: vm: make use of GPUVM's
 drm_exec helper
Date: Wed, 29 Nov 2023 23:08:01 +0100
Message-ID: <20231129220835.297885-3-dakr@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129220835.297885-1-dakr@redhat.com>
References: <20231129220835.297885-1-dakr@redhat.com>
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make use of GPUVM's drm_exec helper functions preventing direct access
to GPUVM internal data structures, such as the external object list.

This is especially important to ensure following the locking rules
around the GPUVM external object list.

Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 91 +++++++++++-----------------
 1 file changed, 36 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index e0d74d9a6190..c6ab1581d509 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -333,48 +333,6 @@ pvr_vm_bind_op_unmap_init(struct pvr_vm_bind_op *bind_op,
 	return err;
 }
 
-static int
-pvr_vm_bind_op_lock_resvs(struct drm_exec *exec, struct pvr_vm_bind_op *bind_op)
-{
-	drm_exec_until_all_locked(exec) {
-		struct drm_gem_object *r_obj = &bind_op->vm_ctx->dummy_gem;
-		struct drm_gpuvm *gpuvm = &bind_op->vm_ctx->gpuvm_mgr;
-		struct pvr_gem_object *pvr_obj = bind_op->pvr_obj;
-		struct drm_gpuvm_bo *gpuvm_bo;
-
-		/* Acquire lock on the vm_context's reserve object. */
-		int err = drm_exec_lock_obj(exec, r_obj);
-
-		drm_exec_retry_on_contention(exec);
-		if (err)
-			return err;
-
-		/* Acquire lock on all BOs in the context. */
-		list_for_each_entry(gpuvm_bo, &gpuvm->extobj.list,
-				    list.entry.extobj) {
-			err = drm_exec_lock_obj(exec, gpuvm_bo->obj);
-
-			drm_exec_retry_on_contention(exec);
-			if (err)
-				return err;
-		}
-
-		/* Unmap operations don't have an object to lock. */
-		if (!pvr_obj)
-			break;
-
-		/* Acquire lock on the GEM being mapped. */
-		err = drm_exec_lock_obj(exec,
-					gem_from_pvr_gem(bind_op->pvr_obj));
-
-		drm_exec_retry_on_contention(exec);
-		if (err)
-			return err;
-	}
-
-	return 0;
-}
-
 /**
  * pvr_vm_gpuva_map() - Insert a mapping into a memory context.
  * @op: gpuva op containing the remap details.
@@ -731,6 +689,20 @@ void pvr_destroy_vm_contexts_for_file(struct pvr_file *pvr_file)
 	}
 }
 
+static int
+pvr_vm_lock_extra(struct drm_gpuvm_exec *vm_exec)
+{
+	struct pvr_vm_bind_op *bind_op = vm_exec->extra.priv;
+	struct pvr_gem_object *pvr_obj = bind_op->pvr_obj;
+
+	/* Unmap operations don't have an object to lock. */
+	if (!pvr_obj)
+		return 0;
+
+	/* Acquire lock on the GEM being mapped. */
+	return drm_exec_lock_obj(&vm_exec->exec, gem_from_pvr_gem(pvr_obj));
+}
+
 /**
  * pvr_vm_map() - Map a section of physical memory into a section of
  * device-virtual memory.
@@ -758,7 +730,15 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 	   u64 pvr_obj_offset, u64 device_addr, u64 size)
 {
 	struct pvr_vm_bind_op bind_op = {0};
-	struct drm_exec exec;
+	struct drm_gpuvm_exec vm_exec = {
+		.vm = &vm_ctx->gpuvm_mgr,
+		.flags = DRM_EXEC_INTERRUPTIBLE_WAIT |
+			 DRM_EXEC_IGNORE_DUPLICATES,
+		.extra = {
+			.fn = pvr_vm_lock_extra,
+			.priv = &bind_op,
+		},
+	};
 
 	int err = pvr_vm_bind_op_map_init(&bind_op, vm_ctx, pvr_obj,
 					  pvr_obj_offset, device_addr,
@@ -767,18 +747,15 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 	if (err)
 		return err;
 
-	drm_exec_init(&exec,
-		      DRM_EXEC_INTERRUPTIBLE_WAIT | DRM_EXEC_IGNORE_DUPLICATES);
-
 	pvr_gem_object_get(pvr_obj);
 
-	err = pvr_vm_bind_op_lock_resvs(&exec, &bind_op);
+	err = drm_gpuvm_exec_lock(&vm_exec);
 	if (err)
 		goto err_cleanup;
 
 	err = pvr_vm_bind_op_exec(&bind_op);
 
-	drm_exec_fini(&exec);
+	drm_gpuvm_exec_unlock(&vm_exec);
 
 err_cleanup:
 	pvr_vm_bind_op_fini(&bind_op);
@@ -804,24 +781,28 @@ int
 pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size)
 {
 	struct pvr_vm_bind_op bind_op = {0};
-	struct drm_exec exec;
+	struct drm_gpuvm_exec vm_exec = {
+		.vm = &vm_ctx->gpuvm_mgr,
+		.flags = DRM_EXEC_INTERRUPTIBLE_WAIT |
+			 DRM_EXEC_IGNORE_DUPLICATES,
+		.extra = {
+			.fn = pvr_vm_lock_extra,
+			.priv = &bind_op,
+		},
+	};
 
 	int err = pvr_vm_bind_op_unmap_init(&bind_op, vm_ctx, device_addr,
 					    size);
-
 	if (err)
 		return err;
 
-	drm_exec_init(&exec,
-		      DRM_EXEC_INTERRUPTIBLE_WAIT | DRM_EXEC_IGNORE_DUPLICATES);
-
-	err = pvr_vm_bind_op_lock_resvs(&exec, &bind_op);
+	err = drm_gpuvm_exec_lock(&vm_exec);
 	if (err)
 		goto err_cleanup;
 
 	err = pvr_vm_bind_op_exec(&bind_op);
 
-	drm_exec_fini(&exec);
+	drm_gpuvm_exec_unlock(&vm_exec);
 
 err_cleanup:
 	pvr_vm_bind_op_fini(&bind_op);
-- 
2.43.0

