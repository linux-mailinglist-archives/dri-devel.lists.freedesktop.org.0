Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0207F86C8
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 00:37:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D38710E37C;
	Fri, 24 Nov 2023 23:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91F910E380
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 23:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700869035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o9d7VDWKIT6kRskPMwA56/YhEUxpKcUgE6jJTCtxE4g=;
 b=NdamtGkI+DxIDL1kCI3u/HbdAlrXKgDlgB/iPLITKNBMFG1DYQgrwXCxrFdNBbU6s5vsFl
 rvX/x8GLnrT/iX6hiJ2SzN8QsqNAC3/8vo5tyufri4ksCaDHxMIzESn+GqO/ZpHucX9aH3
 Ddv7GRzsOOJilYp6TPDjOTDBcHy8K8I=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-Wb_AfZR4MxiUz6L1sHjUhQ-1; Fri, 24 Nov 2023 18:37:09 -0500
X-MC-Unique: Wb_AfZR4MxiUz6L1sHjUhQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-50aa822cb33so2277781e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 15:37:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700869028; x=1701473828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o9d7VDWKIT6kRskPMwA56/YhEUxpKcUgE6jJTCtxE4g=;
 b=eBkAKepbgBmkLP9qCqBkCIRJKWIgIijLzbS0++Ybt4CLKEIGwv7OxUBMjGa6K/0Eh7
 faEnGu9HYh0Iee4/2FZagGrO9cM4n5JmZDF9KjSSdQmrjgWvWM7CbASiDy93fxoijyC+
 3348XKMtEOyeN2LCMXrdAQ89oZjFLyXMu4yqS6RYwDxul+dW2481LUAold4npnFh5wcm
 Uc/6jbxILuR4hrjNFsfvt64S5VZYRYAHCZ2OQM8ohU5adrJHvCF5hL6snBGzxE3vRJXV
 +J9OLbDDhFEe1MQ3FlrJMFIxyBcVcTqcaOT8NtaqYEFMKKDPLgWWo8Un4JlHL4CW7G8U
 wVXQ==
X-Gm-Message-State: AOJu0YxEM9oGF06iUWRtRoTstQeH2hjx7SKwB0HhQ5r0WHZOhFufPBAW
 QScnS7hW1OKK1Max9ls5Ay4u1skrHCNpm8Lqknkv5GUOOZC1TzhwXrhMb9+K+NAP3U6cVRFh0rH
 dUGHsCwg87Ada6AltJLL0tzbYkk3Z
X-Received: by 2002:a05:6512:a92:b0:500:99a9:bc40 with SMTP id
 m18-20020a0565120a9200b0050099a9bc40mr3990401lfu.69.1700869027863; 
 Fri, 24 Nov 2023 15:37:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHASf51P/stzy6MO1wClOrbLB0m2h5TDmbZM6s6hMIvpjkKqyVWebotr5L22G9Z2BXEHBKA2A==
X-Received: by 2002:a05:6512:a92:b0:500:99a9:bc40 with SMTP id
 m18-20020a0565120a9200b0050099a9bc40mr3990385lfu.69.1700869027648; 
 Fri, 24 Nov 2023 15:37:07 -0800 (PST)
Received: from pollux.. ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a17090625d200b009fe1d575365sm2664262ejb.55.2023.11.24.15.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 15:37:07 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 frank.binns@imgtec.com, donald.robson@imgtec.com, matt.coster@imgtec.com,
 sarah.walker@imgtec.com
Subject: [PATCH drm-misc-next 3/5] drm/imagination: vm: fix drm_gpuvm
 reference count
Date: Sat, 25 Nov 2023 00:36:38 +0100
Message-ID: <20231124233650.152653-4-dakr@redhat.com>
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

The driver specific reference count indicates whether the VM should be
teared down, whereas GPUVM's reference count indicates whether the VM
structure can finally be freed.

Hence, free the VM structure in pvr_gpuvm_free() and drop the last
GPUVM reference after tearing down the VM. Generally, this prevents
lifetime issues such as the VM being freed as long as drm_gpuvm_bo
structures still hold references to the VM.

Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 1e89092c3dcc..e0d74d9a6190 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -64,6 +64,12 @@ struct pvr_vm_context {
 	struct drm_gem_object dummy_gem;
 };
 
+static inline
+struct pvr_vm_context *to_pvr_vm_context(struct drm_gpuvm *gpuvm)
+{
+	return container_of(gpuvm, struct pvr_vm_context, gpuvm_mgr);
+}
+
 struct pvr_vm_context *pvr_vm_context_get(struct pvr_vm_context *vm_ctx)
 {
 	if (vm_ctx)
@@ -535,7 +541,7 @@ pvr_device_addr_and_size_are_valid(struct pvr_vm_context *vm_ctx,
 
 void pvr_gpuvm_free(struct drm_gpuvm *gpuvm)
 {
-
+	kfree(to_pvr_vm_context(gpuvm));
 }
 
 static const struct drm_gpuvm_ops pvr_vm_gpuva_ops = {
@@ -655,12 +661,11 @@ pvr_vm_context_release(struct kref *ref_count)
 	WARN_ON(pvr_vm_unmap(vm_ctx, vm_ctx->gpuvm_mgr.mm_start,
 			     vm_ctx->gpuvm_mgr.mm_range));
 
-	drm_gpuvm_put(&vm_ctx->gpuvm_mgr);
 	pvr_mmu_context_destroy(vm_ctx->mmu_ctx);
 	drm_gem_private_object_fini(&vm_ctx->dummy_gem);
 	mutex_destroy(&vm_ctx->lock);
 
-	kfree(vm_ctx);
+	drm_gpuvm_put(&vm_ctx->gpuvm_mgr);
 }
 
 /**
-- 
2.42.0

