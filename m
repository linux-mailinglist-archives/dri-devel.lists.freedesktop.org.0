Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A542B7F86CA
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 00:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409DF10E387;
	Fri, 24 Nov 2023 23:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A4810E37C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 23:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700869038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RTwNQN1v75eY2Dvgc8MjegaphCjYwXgyBTZJw1w/hwE=;
 b=Q97PneDatilpnco8YrHiPtEiDVxdsVvSLRYJrvJig0rZTk1YdGCB7AaUyZbW2ehiwdhjDq
 sGmAGZKl050qR8VuQRbJt8L2amdPhm791UikrH4BhQKwR2U7G10KfAVrAK36MHnV0LpVvd
 BTNfDniV7ZAbwLtXer1gLHWiJRoqaG0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-h-yQ2WeGPBaY9OxKYB51Tg-1; Fri, 24 Nov 2023 18:37:16 -0500
X-MC-Unique: h-yQ2WeGPBaY9OxKYB51Tg-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9fffa4c4f28so156402066b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 15:37:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700869035; x=1701473835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RTwNQN1v75eY2Dvgc8MjegaphCjYwXgyBTZJw1w/hwE=;
 b=MCiogIaXL8mzGU/v7RYbVuVg1thFYCfFJbJBrI/+Uq3GpSvgPbhTVh3Zq/gEcKx6Ht
 eWK0jCijaAoQyvxenMQufup271d11DAyhGOWd1w6tmlW1j6FUA3WjeSRsv6pSTWORW33
 KnToU07OQdGbwdaOYtcd3U2XtpNgoU7ZdTuSKeOHdsE5nLnQBqSeer8Um+4Y0qtKLsZW
 U17LwP8Zbzvot70T+wanPSk31226Oz43K5698u5PnAwG1xMRKIg9UgUmg7ogd49Auonj
 i3MVUZdiikze4yAnLtrBBjyVvmULVYSE7uo6Bq+kzJU9/6gezTwBt1wWBYkaB5sdFTZX
 j0BA==
X-Gm-Message-State: AOJu0YwvTvvlK07KBXLPVDoCkujqXxE6w5KRCL61sYGHC02+8Q8PpGVC
 CkUR7IYoSCjLZrOn+28J9Gd1Zlri0DrjN6s9ZRwOvZThxm0tpxXeG4vOzkBm+LADCojWAbxmnqj
 wFRlUvoRq5j5FhTJdHmybHkaIJO4L
X-Received: by 2002:a17:906:74ca:b0:9dd:87ec:9455 with SMTP id
 z10-20020a17090674ca00b009dd87ec9455mr3754025ejl.48.1700869035416; 
 Fri, 24 Nov 2023 15:37:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPpFhYhbOjtcDOebmW6OKpEMEhuiIuahmko3GKgrpRAjDGHm36lGmiO0pqGG9IYw4PVtIdjw==
X-Received: by 2002:a17:906:74ca:b0:9dd:87ec:9455 with SMTP id
 z10-20020a17090674ca00b009dd87ec9455mr3754014ejl.48.1700869035224; 
 Fri, 24 Nov 2023 15:37:15 -0800 (PST)
Received: from pollux.. ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a170906481800b009920e9a3a73sm2651101ejq.115.2023.11.24.15.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 15:37:14 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 frank.binns@imgtec.com, donald.robson@imgtec.com, matt.coster@imgtec.com,
 sarah.walker@imgtec.com
Subject: [PATCH drm-misc-next 5/5] drm/imagination: vm: make use of GPUVM's
 drm_exec helper
Date: Sat, 25 Nov 2023 00:36:40 +0100
Message-ID: <20231124233650.152653-6-dakr@redhat.com>
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

Make use of GPUVM's drm_exec helper functions preventing direct access
to GPUVM internal data structures, such as the external object list.

This is especially important to ensure following the locking rules
around the GPUVM external object list.

Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index e0d74d9a6190..3f7888f5cc53 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -337,27 +337,21 @@ static int
 pvr_vm_bind_op_lock_resvs(struct drm_exec *exec, struct pvr_vm_bind_op *bind_op)
 {
 	drm_exec_until_all_locked(exec) {
-		struct drm_gem_object *r_obj = &bind_op->vm_ctx->dummy_gem;
 		struct drm_gpuvm *gpuvm = &bind_op->vm_ctx->gpuvm_mgr;
 		struct pvr_gem_object *pvr_obj = bind_op->pvr_obj;
-		struct drm_gpuvm_bo *gpuvm_bo;
 
 		/* Acquire lock on the vm_context's reserve object. */
-		int err = drm_exec_lock_obj(exec, r_obj);
+		int err = drm_gpuvm_prepare_vm(gpuvm, exec, 0);
 
 		drm_exec_retry_on_contention(exec);
 		if (err)
 			return err;
 
 		/* Acquire lock on all BOs in the context. */
-		list_for_each_entry(gpuvm_bo, &gpuvm->extobj.list,
-				    list.entry.extobj) {
-			err = drm_exec_lock_obj(exec, gpuvm_bo->obj);
-
-			drm_exec_retry_on_contention(exec);
-			if (err)
-				return err;
-		}
+		err = drm_gpuvm_prepare_objects(gpuvm, exec, 0);
+		drm_exec_retry_on_contention(exec);
+		if (err)
+			return err;
 
 		/* Unmap operations don't have an object to lock. */
 		if (!pvr_obj)
-- 
2.42.0

