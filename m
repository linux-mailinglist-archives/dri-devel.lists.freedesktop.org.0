Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E08A602070
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 03:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D6210E0CC;
	Tue, 18 Oct 2022 01:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9598710E0CC;
 Tue, 18 Oct 2022 01:28:02 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id n83so14081209oif.11;
 Mon, 17 Oct 2022 18:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ilkmjMRXsx5bN+cKLCPs5nKC2+ATqDeP4QnxRLsugMY=;
 b=ZzjlLZ4Wx4yqm5zbY/vF/fUjc8wYRue8JEToCLc7+q9CnNI4Ar2AkEJTT4HLh5dNmO
 CWnN6eKNOFibZWC0diT/gstz/2zarzciwMhRp1t1ewMlVYYA1EpWBBaK01JnhJ9hYzSA
 DBD3wzUx4+rIC98poEzR8BQTscvrSybtaxL27f+XOPEPryo6RevogBRh3nNt7EuFoIas
 LYeIAgLijpKEH8j0wyQgsIeHe3X6y5/aFVcGYA7Pm8uy8OJ15VEG/t6VeSgEAYmySHm1
 b9y35LIzAitN3379gakovwvJTyNILG1MwYgD05ZSKxdVZGfjOVk0oLznGWMJkKt3sptN
 J1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ilkmjMRXsx5bN+cKLCPs5nKC2+ATqDeP4QnxRLsugMY=;
 b=Ir4w6RO12PaQUpO7pP+ZKJawtBsPvXomzrKAWjmjtC1DWDkFvEoizA+4353cxE0xu2
 OUALBoVIPwF5R6T2GDHkfGwNfkhsuR7WPdDEfOMIuZ967bHABPZORXjdtDaUqAfavDIj
 Ckc/NxmYTPnQc8M8jbByT8uEFK3B1W/VB/HMSbGv2F6xF19Ugqn2X+LWxwrLvJPlhrIy
 SqKtfAX88al2YViOe59rzbBven9jlo7uIzKGb/KuvKk4skkOKqZAZWUlIj3CTno4YuMv
 o2aWrTmqP2aiFqtaK5suZ8mh5WNGXCXttatFQykBESekMO9bwtt3S6p0/hsE1NHQCJw4
 SpIQ==
X-Gm-Message-State: ACrzQf1ELTixHzQToWyD8bxNBe0Lb534eXgcxJCEFXceFh/xKuLs9+zF
 KuKyVwzzNhe1OHOzFJ1qQkw=
X-Google-Smtp-Source: AMsMyM41az2Sl9WsDrici9XR23w8mdjfxyfa/Rp7Rod/2DwGKLBHzGwsPH3B5yuRtEt5m1Wlqxd6ag==
X-Received: by 2002:a05:6808:11cb:b0:353:f841:e390 with SMTP id
 p11-20020a05680811cb00b00353f841e390mr318449oiv.149.1666056481769; 
 Mon, 17 Oct 2022 18:28:01 -0700 (PDT)
Received: from macondo.. ([2804:431:e7cc:1855:b6d2:d55:b2d8:b57d])
 by smtp.gmail.com with ESMTPSA id
 cj7-20020a056830640700b006619533d1ddsm5329572otb.76.2022.10.17.18.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 18:28:01 -0700 (PDT)
From: Rafael Mendonca <rafaelmendsr@gmail.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ramesh Errabolu <Ramesh.Errabolu@amd.com>,
 Oak Zeng <Oak.Zeng@amd.com>
Subject: [PATCH] drm/amdkfd: Fix memory leak in kfd_mem_dmamap_userptr()
Date: Mon, 17 Oct 2022 22:27:50 -0300
Message-Id: <20221018012751.887460-1-rafaelmendsr@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: dri-devel@lists.freedesktop.org, Rafael Mendonca <rafaelmendsr@gmail.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the number of pages from the userptr BO differs from the SG BO then the
allocated memory for the SG table doesn't get freed before returning
-EINVAL, which may lead to a memory leak in some error paths. Fix this by
checking the number of pages before allocating memory for the SG table.

Fixes: 264fb4d332f5 ("drm/amdgpu: Add multi-GPU DMA mapping helpers")
Signed-off-by: Rafael Mendonca <rafaelmendsr@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 978d3970b5cc..84f44f7e4111 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -510,13 +510,13 @@ kfd_mem_dmamap_userptr(struct kgd_mem *mem,
 	struct ttm_tt *ttm = bo->tbo.ttm;
 	int ret;
 
+	if (WARN_ON(ttm->num_pages != src_ttm->num_pages))
+		return -EINVAL;
+
 	ttm->sg = kmalloc(sizeof(*ttm->sg), GFP_KERNEL);
 	if (unlikely(!ttm->sg))
 		return -ENOMEM;
 
-	if (WARN_ON(ttm->num_pages != src_ttm->num_pages))
-		return -EINVAL;
-
 	/* Same sequence as in amdgpu_ttm_tt_pin_userptr */
 	ret = sg_alloc_table_from_pages(ttm->sg, src_ttm->pages,
 					ttm->num_pages, 0,
-- 
2.34.1

