Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A279BB8C88
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 13:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F07C10E224;
	Sat,  4 Oct 2025 11:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J5Sd0ygK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B8510E224
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 11:01:03 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-33082aed31dso3570758a91.3
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Oct 2025 04:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759575663; x=1760180463; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vCTDlQEGUynoAVbLn6xjoRk5lU8FKtAz6xcB6i4LhPk=;
 b=J5Sd0ygKUUy1kqbMbuir/kj3GcmHJpKqofPQSSiOVcqlVeIIfwrn1vCooCPBjLVNzE
 H9/tNO5LouCaX7ZwkZlOVBuFDsZ/+TpjNTGMlr4JrGKe7XWJJ9QWbkC/pG7T6xq5jyIn
 G5NDXnafbWuBoaqac5DBuzXIrZD8EFolcBfxYfRO9jO9JjFOrV5NrNxeCtJyIFAsmTR9
 ZEJ1ikcCjuY4J6rVjeOaGPxRZdxFLu71lqS2D+YSUmM9ggsGxYbgR/vZn50yRt4Wq+Tv
 vSnYpNzPw++5o8+mbwn0fieuJrCCmaOA1FA4qPPKROKotiLfk8U9A1tSg/mSEPdttcZr
 kZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759575663; x=1760180463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vCTDlQEGUynoAVbLn6xjoRk5lU8FKtAz6xcB6i4LhPk=;
 b=T2l5P2gNur4Ra+Gsp3+l3E9vatWX5J1SwFzuhQf2Ginh5lfNwdJe13kigkdj815hGu
 FXHk1SoDpY9WxNqYhv/zt0MvqaLfoE0s9B5FGz9LX/qvcSaOdKOz2ZzvzuEFrafZHmU4
 l/dgO2QGuKFZjzmOTb3W/jsGmWk/7o1LKhTD9is9ut54ZIi4u/6e+7f2dHuY2Qksh8TK
 1v3ccP4AoeF6cq0ivRKW18sqvYJJSi/9ix6b5+hPVYhgBsMTmNnmoDPjPf12me8t4XsD
 P42q+CE0hFn5ccKY+hwWsN2I7ZqY45z4Lx8suOrL0skWpHkW5CMrC/gFOaFa1m7OhsIu
 4rKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVBiUybej9GAz4F5MRu9Fl81Adc4nvZ9AJ29b8Kvei0D2p6mneGXdNrv5ngCGY2w+X2JGNsU0aJKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxgt1ZMDzKidq+dqwzjKU7K/2VzXC0h8DUCP/CWVdiz+DdUR9TR
 oX9uD8lLEB/9FT70TlpGe48LZ062UxDFzoIZMeD7YS7Aj+VtS6G1M+zh
X-Gm-Gg: ASbGnctTE3CH9P+e313O12rDK6nvpDts67f913XYsq3ic1yWEfburZQ+4ZIbJCGmtZP
 azqhJ394+30W9etFRRUayVzfll0lm9J4p5iKEgkyTkh6R+aF7nt+ZiRbAb2V2dUnOSvzu8Qq0d/
 Kc3uEaDznaXwiv55gmtEY6i1M93oAGIFyZMTFXh3XbTv2QSN8mzcxlbdUHd6yjmDJ3HrqWtNg/y
 vn/YeRQeD3TuZoeoPu4aCrOhWTCBWRmnp3RbKpiSLnjdXURvKxVMrTIA8gBI04iiP/8iCvHI5Ti
 KANm/aWuLYw8E/s2M2DiUDBeAdcimml7rzFVWlfWjd7x+CAQmpwYPH5qTGnMIDmooQ8Ht6zXelJ
 HOVwXORwvf4XZnW+kCj756NOwjEPlIlih8TVUJaTenCfneWQEA0V2Czl8G6vufdHYfb4eXHj7HM
 owVau976+0VBY=
X-Google-Smtp-Source: AGHT+IF6KW+o3hALRSt3TlfMffAw7CjzidHyGOok+NoPUVDP1KnNL8mme1hIyP6Bkou2nnamx1XkdQ==
X-Received: by 2002:a17:90b:4f4c:b0:32e:a54a:be53 with SMTP id
 98e67ed59e1d1-339c27348f6mr7738086a91.16.1759575662886; 
 Sat, 04 Oct 2025 04:01:02 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6099b1cf08sm7046135a12.22.2025.10.04.04.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Oct 2025 04:01:02 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: [PATCH RFT] drm/msm: Add NULL check in vm_op_enqueue()
Date: Sat,  4 Oct 2025 16:30:04 +0530
Message-ID: <20251004110044.204269-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917184616.85797-1-krishnagopi487@gmail.com>
References: <20250917184616.85797-1-krishnagopi487@gmail.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vm_op_enqueue() allocates an msm_vm_op struct with kmalloc,
but the return value is not checked for NULL value which
can be returned by kmalloc under low-memory conditions.
This can result in NULL pointer dereference when the pointer
is dereferenced.

Add NULL check after the allocation and propagate -ENOMEM back
to the caller in case of a failure.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---

This patch is marked as RFT since the changes haven't been tested. 

 drivers/gpu/drm/msm/msm_gem_vma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 00d0f3b7ba32..639425849d86 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -455,15 +455,20 @@ struct op_arg {
 	bool kept;
 };
 
-static void
+static int
 vm_op_enqueue(struct op_arg *arg, struct msm_vm_op _op)
 {
 	struct msm_vm_op *op = kmalloc(sizeof(*op), GFP_KERNEL);
+	if (!op)
+		return -ENOMEM;
+
 	*op = _op;
 	list_add_tail(&op->node, &arg->job->vm_ops);
 
 	if (op->obj)
 		drm_gem_object_get(op->obj);
+
+	return 0;
 }
 
 static struct drm_gpuva *
@@ -482,6 +487,7 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 	struct drm_gpuva *vma;
 	struct sg_table *sgt;
 	unsigned prot;
+	int ret;
 
 	if (arg->kept)
 		return 0;
@@ -493,8 +499,6 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 	vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
 	       vma->va.addr, vma->va.range);
 
-	vma->flags = ((struct op_arg *)arg)->flags;
-
 	if (obj) {
 		sgt = to_msm_bo(obj)->sgt;
 		prot = msm_gem_prot(obj);
@@ -503,7 +507,7 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 		prot = IOMMU_READ | IOMMU_WRITE;
 	}
 
-	vm_op_enqueue(arg, (struct msm_vm_op){
+	ret = vm_op_enqueue(arg, (struct msm_vm_op){
 		.op = MSM_VM_OP_MAP,
 		.map = {
 			.sgt = sgt,
@@ -516,6 +520,10 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 		.obj = vma->gem.obj,
 	});
 
+	if (ret)
+		return ret;
+
+	vma->flags = ((struct op_arg *)arg)->flags;
 	to_msm_vma(vma)->mapped = true;
 
 	return 0;
@@ -531,6 +539,7 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 	struct drm_gpuvm_bo *vm_bo = orig_vma->vm_bo;
 	bool mapped = to_msm_vma(orig_vma)->mapped;
 	unsigned flags;
+	int ret;
 
 	vm_dbg("orig_vma: %p:%p:%p: %016llx %016llx", vm, orig_vma,
 	       orig_vma->gem.obj, orig_vma->va.addr, orig_vma->va.range);
@@ -540,7 +549,7 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 
 		drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
 
-		vm_op_enqueue(arg, (struct msm_vm_op){
+		ret = vm_op_enqueue(arg, (struct msm_vm_op){
 			.op = MSM_VM_OP_UNMAP,
 			.unmap = {
 				.iova = unmap_start,
@@ -550,6 +559,9 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 			.obj = orig_vma->gem.obj,
 		});
 
+		if (ret)
+			return ret;
+
 		/*
 		 * Part of this GEM obj is still mapped, but we're going to kill the
 		 * existing VMA and replace it with one or two new ones (ie. two if
@@ -611,6 +623,7 @@ msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
 	struct msm_vm_bind_job *job = arg->job;
 	struct drm_gpuva *vma = op->unmap.va;
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
+	int ret;
 
 	vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
 	       vma->va.addr, vma->va.range);
@@ -643,7 +656,7 @@ msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
 	if (!msm_vma->mapped)
 		goto out_close;
 
-	vm_op_enqueue(arg, (struct msm_vm_op){
+	ret = vm_op_enqueue(arg, (struct msm_vm_op){
 		.op = MSM_VM_OP_UNMAP,
 		.unmap = {
 			.iova = vma->va.addr,
@@ -653,6 +666,9 @@ msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
 		.obj = vma->gem.obj,
 	});
 
+	if (ret)
+		return ret;
+
 	msm_vma->mapped = false;
 
 out_close:
-- 
2.43.0

