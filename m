Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 789788C0427
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 20:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A820112975;
	Wed,  8 May 2024 18:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YQbevDGp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CF611316E;
 Wed,  8 May 2024 18:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gF5mI2d807cA6j5Qq7UIRyqf0ELyiAJcrHBqRj0nLr8=; b=YQbevDGpR2ugXon2eE1sXdIfki
 A6nfhlDsZWh0TLHldjsHPXDxNh3kUVixGy2I1qxWtZvF9+z+Q2a4OW4/dqJZPi1iSjRMAioX5wvtX
 mxCsfITsWWwweF+RbmplprNVtZtMvy0V2m9eVP6EI2a7eqzreHxGlb/ysHC3q2ixr0rNXk1VWN8uy
 JNWBOzA95WXr5ujVKHcFimvc9SevRG6RUvz4FYE5ixur0vSpJ3Kntz9XuRI7DHeMB9xVV/s4U65eL
 GBAxgyUkliKN2UELSCcssYzLAWrcUX2OjnJqfxePr+ZgPzNOUnx4d1WjsiiI+ktzu9FLXaZKnZaFe
 ifB0WcSw==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s4ljr-002zS0-0j; Wed, 08 May 2024 20:09:59 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
Subject: [RFC 5/5] drm/amdgpu: Re-validate evicted buffers
Date: Wed,  8 May 2024 19:09:45 +0100
Message-ID: <20240508180946.96863-6-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240508180946.96863-1-tursulin@igalia.com>
References: <20240508180946.96863-1-tursulin@igalia.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Currently the driver appears to be thinking that it will be attempting to
re-validate the evicted buffers on the next submission if they are not in
their preferred placement.

That however appears not to be true for the very common case of buffers
with allowed placements of VRAM+GTT. Simply because the check can only
detect if the current placement is *none* of the preferred ones, happily
leaving VRAM+GTT buffers in the GTT placement "forever".

Fix it by extending the VRAM+GTT special case to the re-validation logic.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Friedrich Vock <friedrich.vock@gmx.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 6bddd43604bc..e53ff914b62e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1248,10 +1248,25 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
 	 * next command submission.
 	 */
 	if (amdgpu_vm_is_bo_always_valid(vm, bo)) {
-		uint32_t mem_type = bo->tbo.resource->mem_type;
+		unsigned current_domain =
+			amdgpu_mem_type_to_domain(bo->tbo.resource->mem_type);
+		bool move_to_evict = false;
 
-		if (!(bo->preferred_domains &
-		      amdgpu_mem_type_to_domain(mem_type)))
+		if (!(bo->preferred_domains & current_domain)) {
+			move_to_evict = true;
+		} else if ((bo->preferred_domains & AMDGPU_GEM_DOMAIN_MASK) ==
+			   (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_DOMAIN_GTT) &&
+			   current_domain != AMDGPU_GEM_DOMAIN_VRAM) {
+			/*
+			 * If userspace has provided a list of possible
+			 * placements equal to VRAM+GTT, we assume VRAM is *the*
+			 * preferred placement and so try to move it back there
+			 * on the next submission.
+			 */
+			move_to_evict = true;
+		}
+
+		if (move_to_evict)
 			amdgpu_vm_bo_evicted(&bo_va->base);
 		else
 			amdgpu_vm_bo_idle(&bo_va->base);
-- 
2.44.0

