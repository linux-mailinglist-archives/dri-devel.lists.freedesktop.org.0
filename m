Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACD28C042E
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 20:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B339113176;
	Wed,  8 May 2024 18:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JeT7aU1h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B8F113150;
 Wed,  8 May 2024 18:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gstb7IKxyTUGUKuFQPyHvYGT22H8pEDLlJ8umQs0x5o=; b=JeT7aU1hERBazt5k+mz9uhWF7p
 SQsRigfbHaR6jpXuRd4pP8H4L6z0TWCY42nMbbmoDp1VAyfkBAUfz9uahfGnjAzI+KRTJTqqq5rq1
 uWF7BCS7n/yBK5oRar25C0UGm/fVhS0Uv1e3iUfqURE8vHMnV4wpkn90wy6fliOQlOgZ5JupMDP02
 ysTWiMvJBG3HLCJ4WpSwlFHKW2PlLDOQSX+vc0RZFTbMu0yyh6n0mFiauMGLL6pUkkbknCqiWFEK1
 nBpuPi6EcZluEu4dUSD3fa6mxb/coreraNzc5enTn+4c6F7f/fEzkYPW7xP6wzBCgpsaCOjP9ZtSq
 m9zW4AMA==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s4ljo-002zRE-A1; Wed, 08 May 2024 20:09:56 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
Subject: [RFC 1/5] drm/amdgpu: Fix migration rate limiting accounting
Date: Wed,  8 May 2024 19:09:41 +0100
Message-ID: <20240508180946.96863-2-tursulin@igalia.com>
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

The logic assumed any migration attempt worked and therefore would over-
account the amount of data migrated during buffer re-validation. As a
consequence client can be unfairly penalised by incorrectly considering
its migration budget spent.

Fix it by looking at the before and after buffer object backing store and
only account if there was a change.

FIXME:
I think this needs a better solution to account for migrations between
VRAM visible and non-visible portions.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Friedrich Vock <friedrich.vock@gmx.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index ec888fc6ead8..22708954ae68 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -784,12 +784,15 @@ static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
 		.no_wait_gpu = false,
 		.resv = bo->tbo.base.resv
 	};
+	struct ttm_resource *old_res;
 	uint32_t domain;
 	int r;
 
 	if (bo->tbo.pin_count)
 		return 0;
 
+	old_res = bo->tbo.resource;
+
 	/* Don't move this buffer if we have depleted our allowance
 	 * to move it. Don't move anything if the threshold is zero.
 	 */
@@ -817,16 +820,29 @@ static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
 	amdgpu_bo_placement_from_domain(bo, domain);
 	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
 
-	p->bytes_moved += ctx.bytes_moved;
-	if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
-	    amdgpu_res_cpu_visible(adev, bo->tbo.resource))
-		p->bytes_moved_vis += ctx.bytes_moved;
-
 	if (unlikely(r == -ENOMEM) && domain != bo->allowed_domains) {
 		domain = bo->allowed_domains;
 		goto retry;
 	}
 
+	if (!r) {
+		struct ttm_resource *new_res = bo->tbo.resource;
+		bool moved = true;
+
+		if (old_res == new_res)
+			moved = false;
+		else if (old_res && new_res &&
+			 old_res->mem_type == new_res->mem_type)
+			moved = false;
+
+		if (moved) {
+			p->bytes_moved += ctx.bytes_moved;
+			if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
+			    amdgpu_res_cpu_visible(adev, bo->tbo.resource))
+				p->bytes_moved_vis += ctx.bytes_moved;
+		}
+	}
+
 	return r;
 }
 
-- 
2.44.0

