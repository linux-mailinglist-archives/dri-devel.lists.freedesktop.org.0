Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AB9CFDB78
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 13:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDE910E5B0;
	Wed,  7 Jan 2026 12:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="G9PVtx5R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0133110E5AD;
 Wed,  7 Jan 2026 12:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FEoFT6NaL16goNZiI6DErHeAXmSdDSFZGrwVhqr8gIA=; b=G9PVtx5RklVlkN6AIZWSE3SKA2
 OMPIHGO28ttYKUGuAPHhYeBzlDFwXQ070VPIWU1AJuz/5qeXPqg89JCqr/BzsPYC+NP+OQ4kFRtXV
 O3rGIemH1Bzn+OLYQ+KHIJ0qbQVcg2OGP28ILYxB2v/ZY21swDKjQlqPGWRBSxuDchoxdXgTvuKyr
 nLIf6XPwVT7s+4ttenPQN6fy/VSJBtZloVHGxKvH1P1ekqyu/eedVmWP46pprZP1QYsbMP15ZGZPa
 RqSPp3uRvUiLpnI9WeamUh3JqHR795avVFTYxFX0OwwIKCbVa49T4Ke9Njf2dWDIMT8YQDjHoKx4a
 8TnWUTFA==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vdStK-002Yt0-2M; Wed, 07 Jan 2026 13:43:58 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC 1/3] drm/amdgpu: Reject impossible entities early
Date: Wed,  7 Jan 2026 12:43:49 +0000
Message-ID: <20260107124351.94738-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107124351.94738-1-tvrtko.ursulin@igalia.com>
References: <20260107124351.94738-1-tvrtko.ursulin@igalia.com>
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

Currently there are two different behaviour modes when userspace tries to
operate on not present HW IP blocks. On a machine without UVD, VCE and VPE
blocks, this can be observed for example like this:

$ sudo ./amd_fuzzing --r cs-wait-fuzzing
...
amd_cs_wait_fuzzing DRM_IOCTL_AMDGPU_CTX r 0
amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_GFX r 0
amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_COMPUTE r 0
amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_DMA r 0
amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_UVD r -1
amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_VCE r 0
amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_UVD_ENC r -1
amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_VCN_DEC r 0
amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_VCN_ENC r 0
amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_VCN_JPEG r 0
amd_cs_wait_fuzzing AMDGPU_WAIT_CS AMD_IP_VPE r 0

We can see that UVD returns an errno (-EINVAL) from the CS_WAIT ioctl,
while VCE and VPE return unexpected successes.

The difference stems from the fact the UVD is a load balancing engine
which retains the context, so with a workaround implemented in
amdgpu_ctx_init_entity(), but which does not account for the fact hardware
block may not be present.

This causes a single NULL scheduler to be passed to
drm_sched_entity_init(), which immediately rejects this with -EINVAL.

The not present VCE and VPE cases on the other hand pass zero schedulers
to drm_sched_entity_init(), which is explicitly allowed and results in
unusable entities.

As the UVD case however shows, call paths can handle the errors, so we can
consolidate this into a single path which will always return -EINVAL if
the HW IP block is not present.

We do this by rejecting it early and not calling drm_sched_entity_init()
when there is no backing hardware.

This also removes the need for the drm_sched_entity_init() to handle the
zero schedulers and NULL scheduler cases, which means that we can follow
up by removing the special casing from the DRM scheduler.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: f34e8bb7d6c6 ("drm/sched: fix null-ptr-deref in init entity")
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index afedea02188d..a5f85ea9fbb6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -239,6 +239,11 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
 			goto error_free_entity;
 	}
 
+	if (num_scheds == 0) {
+		r = -EINVAL;
+		goto error_free_entity;
+	}
+
 	/* disable load balance if the hw engine retains context among dependent jobs */
 	if (hw_ip == AMDGPU_HW_IP_VCN_ENC ||
 	    hw_ip == AMDGPU_HW_IP_VCN_DEC ||
-- 
2.52.0

