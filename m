Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943127F86C1
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 00:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF8410E0EC;
	Fri, 24 Nov 2023 23:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9C210E0EC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 23:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700869023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=auqPkghBUASB9YQ336TJ1HIAZATGxqMLyF8qUrxjjf4=;
 b=gFfkzFnd9iFoSR2C9QOqNYjj0UGHKHjWm2pnbD0t78sbc8M6J+hFXPk/PxASE5nhnwrQMM
 hHagAqDic/spNkpMIW4KioQKSJMD21eEm8IBQxesmefLR45bunciZ6aCzZNXv+xcSe5zAk
 jbqc7tICr9fX9gSo+aMLrvfCXqnVxcU=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-QSdxVnbsNYSWNsnbYhHjmw-1; Fri, 24 Nov 2023 18:37:02 -0500
X-MC-Unique: QSdxVnbsNYSWNsnbYhHjmw-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2c53ea92642so21217581fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 15:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700869020; x=1701473820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=auqPkghBUASB9YQ336TJ1HIAZATGxqMLyF8qUrxjjf4=;
 b=UAsOU7mPji7dbO2VENhgQcICD1cCLgePNRhoCaOYrkkSpiGfFHWr5PGVpp9I9u5Ql5
 0tpb0pKhX77OI9ruiXcOcZUqbj7DhzdOOcqzsjB1Lz9Jn8NLYyR/FBWQPXQxG3ikc8Lr
 kRpHglQP4asuJ2LWeYm5gxrd9Y0ualLcTHCpBv0sSz7dliaX+m1aRsml7i8+4NQBVwaN
 wKOpcL9ZytGUE9nulf7y7euKYhhPgj+HXdHh3bTaNVIa7Qao/avgcLFe0cqgcOayt11F
 7JoG/5REBIK0UbG7+3ItzAdvy0bVqp858yWlXN49HchQ1f/PtiC0ywjFx95wr+T7Y4eM
 ZJAA==
X-Gm-Message-State: AOJu0YxNzKT8zPy2Tofk81gA+AjM93gWkylWWOd/gXKblEaoIEL9gzhb
 aK2T3MQFhIutdHDsge8dRCYl1xcOCG3GRiR69ssw/KOi3mbhUqASBPJRJErDNqdVPhY4tBEPKD5
 dtjwElk+9hivxaJbFhp09hZADlDKZ
X-Received: by 2002:a2e:9dd9:0:b0:2c5:183d:42bf with SMTP id
 x25-20020a2e9dd9000000b002c5183d42bfmr3147722ljj.45.1700869020659; 
 Fri, 24 Nov 2023 15:37:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEylly0/xjh3bd979MfjJPHjqJh2nTHcO1bCjYpiXsPXTwaA+GMEpL5vvLU6l2RLJIGMPK6VA==
X-Received: by 2002:a2e:9dd9:0:b0:2c5:183d:42bf with SMTP id
 x25-20020a2e9dd9000000b002c5183d42bfmr3147720ljj.45.1700869020366; 
 Fri, 24 Nov 2023 15:37:00 -0800 (PST)
Received: from pollux.. ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a1709064c9600b009ae69c303aasm2631313eju.137.2023.11.24.15.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 15:36:59 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 frank.binns@imgtec.com, donald.robson@imgtec.com, matt.coster@imgtec.com,
 sarah.walker@imgtec.com
Subject: [PATCH drm-misc-next 1/5] drm/imagination: vm: prevent duplicate
 drm_gpuvm_bo instances
Date: Sat, 25 Nov 2023 00:36:36 +0100
Message-ID: <20231124233650.152653-2-dakr@redhat.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231124233650.152653-1-dakr@redhat.com>
References: <20231124233650.152653-1-dakr@redhat.com>
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

Use drm_gpuvm_bo_obtain() instead of drm_gpuvm_bo_create(). The latter
should only be used in conjunction with drm_gpuvm_bo_obtain_prealloc().

drm_gpuvm_bo_obtain() re-uses existing instances of a given VM and BO
combination, whereas drm_gpuvm_bo_create() would always create a new
instance of struct drm_gpuvm_bo and hence leave us with duplicates.

Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 3ad1366294b9..09d481c575b0 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -224,6 +224,7 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 			struct pvr_gem_object *pvr_obj, u64 offset,
 			u64 device_addr, u64 size)
 {
+	struct drm_gem_object *obj = gem_from_pvr_gem(pvr_obj);
 	const bool is_user = vm_ctx == vm_ctx->pvr_dev->kernel_vm_ctx;
 	const u64 pvr_obj_size = pvr_gem_object_size(pvr_obj);
 	struct sg_table *sgt;
@@ -245,10 +246,11 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 
 	bind_op->type = PVR_VM_BIND_TYPE_MAP;
 
-	bind_op->gpuvm_bo = drm_gpuvm_bo_create(&vm_ctx->gpuvm_mgr,
-						gem_from_pvr_gem(pvr_obj));
-	if (!bind_op->gpuvm_bo)
-		return -ENOMEM;
+	dma_resv_lock(obj->resv, NULL);
+	bind_op->gpuvm_bo = drm_gpuvm_bo_obtain(&vm_ctx->gpuvm_mgr, obj);
+	dma_resv_unlock(obj->resv);
+	if (IS_ERR(bind_op->gpuvm_bo))
+		return PTR_ERR(bind_op->gpuvm_bo);
 
 	bind_op->new_va = kzalloc(sizeof(*bind_op->new_va), GFP_KERNEL);
 	bind_op->prev_va = kzalloc(sizeof(*bind_op->prev_va), GFP_KERNEL);
-- 
2.42.0

