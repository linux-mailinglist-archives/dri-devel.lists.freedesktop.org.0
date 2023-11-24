Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 846767F86C6
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 00:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B6410E21A;
	Fri, 24 Nov 2023 23:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D6E10E21A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 23:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700869028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PxcVKcnovZ3WmT6VXlVQva+pEVKvpiQ4FcmwXIH6X8E=;
 b=L0uX4FWDJ/rLTrxOThydMQ7SAdUcJRL9lMcxKXl9ZVD4vq+b9LnaIEmI4my9F6JLbqmW7X
 9FLfauWAufjxD6e+brmdyjymj3j+EolWu4t9ySItQUkoXN4KQrYVeDKFeHrv1MKjWR4V/e
 n/waO77EMWtak3nZrM5vLr+2EMi2msI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-ZOToJ3okNMWQm3tx9vcEJQ-1; Fri, 24 Nov 2023 18:37:05 -0500
X-MC-Unique: ZOToJ3okNMWQm3tx9vcEJQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a02b9c28a08so160750166b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 15:37:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700869024; x=1701473824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PxcVKcnovZ3WmT6VXlVQva+pEVKvpiQ4FcmwXIH6X8E=;
 b=qJ4fqWK9IzQNfhRAv8KPqARRXOlAgDFAP31JRTOD+SchjX0eeQ4jeRmbS8gt7WLVch
 ZAmLyeHGwT/EzzZGW/3BZlOeysbuc87mXZMafCJXq30gxlO33zMd4snyAE9uwdUrux4F
 eXwd1jFki9XLxMPl6sUbo8RtRU/qectEEqLRr+4QgFb4wTn49admUdhOJZAOmz+4vbMi
 9P1Ko+NvGSoA+uTo45fq0vfXNWpcY8WgHaoXJ05WqGYWnbqp1sWsY1EMfqAVdyzpQ3K/
 cB8KKfiy9MknU932j51ScBTmc5F3oJgBKjbbxQCvwez1o9ePGVcUqb32q3TyVm61BDQV
 vHkQ==
X-Gm-Message-State: AOJu0YxmmMLatoraOkNqjMXHc0lnubkSmBrH70cZGIKLspS46xJiQyXf
 ROLgHBm+FTlXSIsj31Xuiei5uFdBtgpvVNjJMfDJuFZJEfPXpLik+nqi0550cETVzl4ch7LZhfa
 uoJiPFQzzfgdKHBL7T+Fla5pK2nrh
X-Received: by 2002:a17:906:51c8:b0:a00:2947:409d with SMTP id
 v8-20020a17090651c800b00a002947409dmr3186799ejk.12.1700869024358; 
 Fri, 24 Nov 2023 15:37:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHi3IqHfjuue65RKfXtgnC8RUrgAB9/KKEn/ifKMbimZnKv4/th/PQwNIcKNEiUQH3jh7UVig==
X-Received: by 2002:a17:906:51c8:b0:a00:2947:409d with SMTP id
 v8-20020a17090651c800b00a002947409dmr3186782ejk.12.1700869023988; 
 Fri, 24 Nov 2023 15:37:03 -0800 (PST)
Received: from pollux.. ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a170906b18100b00a046a773175sm2636639ejy.122.2023.11.24.15.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 15:37:03 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 frank.binns@imgtec.com, donald.robson@imgtec.com, matt.coster@imgtec.com,
 sarah.walker@imgtec.com
Subject: [PATCH drm-misc-next 2/5] drm/imagination: vm: check for
 drm_gpuvm_range_valid()
Date: Sat, 25 Nov 2023 00:36:37 +0100
Message-ID: <20231124233650.152653-3-dakr@redhat.com>
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

Extend pvr_device_addr_and_size_are_valid() by the corresponding GPUVM
sanity checks. This includes a, previously missing, overflow check for
the base address and size of the requested mapping.

Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 9 ++++++---
 drivers/gpu/drm/imagination/pvr_vm.h | 3 ++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 09d481c575b0..1e89092c3dcc 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -239,7 +239,7 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 		return -EINVAL;
 	}
 
-	if (!pvr_device_addr_and_size_are_valid(device_addr, size) ||
+	if (!pvr_device_addr_and_size_are_valid(vm_ctx, device_addr, size) ||
 	    offset & ~PAGE_MASK || size & ~PAGE_MASK ||
 	    offset >= pvr_obj_size || offset_plus_size > pvr_obj_size)
 		return -EINVAL;
@@ -295,7 +295,7 @@ pvr_vm_bind_op_unmap_init(struct pvr_vm_bind_op *bind_op,
 {
 	int err;
 
-	if (!pvr_device_addr_and_size_are_valid(device_addr, size))
+	if (!pvr_device_addr_and_size_are_valid(vm_ctx, device_addr, size))
 		return -EINVAL;
 
 	bind_op->type = PVR_VM_BIND_TYPE_UNMAP;
@@ -505,6 +505,7 @@ pvr_device_addr_is_valid(u64 device_addr)
 /**
  * pvr_device_addr_and_size_are_valid() - Tests whether a device-virtual
  * address and associated size are both valid.
+ * @vm_ctx: Target VM context.
  * @device_addr: Virtual device address to test.
  * @size: Size of the range based at @device_addr to test.
  *
@@ -523,9 +524,11 @@ pvr_device_addr_is_valid(u64 device_addr)
  *  * %false otherwise.
  */
 bool
-pvr_device_addr_and_size_are_valid(u64 device_addr, u64 size)
+pvr_device_addr_and_size_are_valid(struct pvr_vm_context *vm_ctx,
+				   u64 device_addr, u64 size)
 {
 	return pvr_device_addr_is_valid(device_addr) &&
+	       drm_gpuvm_range_valid(&vm_ctx->gpuvm_mgr, device_addr, size) &&
 	       size != 0 && (size & ~PVR_DEVICE_PAGE_MASK) == 0 &&
 	       (device_addr + size <= PVR_PAGE_TABLE_ADDR_SPACE_SIZE);
 }
diff --git a/drivers/gpu/drm/imagination/pvr_vm.h b/drivers/gpu/drm/imagination/pvr_vm.h
index cf8b97553dc8..f2a6463f2b05 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.h
+++ b/drivers/gpu/drm/imagination/pvr_vm.h
@@ -29,7 +29,8 @@ struct drm_exec;
 /* Functions defined in pvr_vm.c */
 
 bool pvr_device_addr_is_valid(u64 device_addr);
-bool pvr_device_addr_and_size_are_valid(u64 device_addr, u64 size);
+bool pvr_device_addr_and_size_are_valid(struct pvr_vm_context *vm_ctx,
+					u64 device_addr, u64 size);
 
 struct pvr_vm_context *pvr_vm_create_context(struct pvr_device *pvr_dev,
 					     bool is_userspace_context);
-- 
2.42.0

