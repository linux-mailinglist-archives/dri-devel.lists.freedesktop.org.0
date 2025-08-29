Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C54B3B7E7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 11:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCF310E200;
	Fri, 29 Aug 2025 09:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BTSidfGI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B4E10E12F;
 Fri, 29 Aug 2025 09:58:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B7CD143CFD;
 Fri, 29 Aug 2025 09:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2367C4CEF4;
 Fri, 29 Aug 2025 09:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756461508;
 bh=KDoth+kAYRavO4Qft6ekvmhD5j99ml0dSojmfq8vU8E=;
 h=Date:From:To:Cc:Subject:From;
 b=BTSidfGIfGEaKs845+2g1h/e9KQwEYEK4MCB9j9nLwkIiRXFkrPIAjdxvDE3gpAG1
 AM8v7XeOg+dwMb/oYM4edixNCUdRXv86BVnGy7QKFdJPW75tdeQqxd79mRUdVSsVM+
 Xn+AJalHJKqPaHCKLF4A8pY7vigaoMs8aqK4nCJFSGK4R5llkIU6uCOYyMGCpNouHY
 PUOrgGVS/3Lqoti7i5ah9Ftut27MqyL+k4wQxnSUjW9dhlcKvvFc8i18V/7fKZJUSG
 YOklE++ycqz4qQ5c2+pzyWaIe+j1Ukcubmae8bvdiWSJLIdaCD1Xgz6TZ+qp0tfpan
 V0ATO8b+2N0AQ==
Date: Fri, 29 Aug 2025 11:58:21 +0200
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH][next] drm/amdgpu/amdkfd: Avoid a couple hundred
 -Wflex-array-member-not-at-end warnings
Message-ID: <aLF5vQv9P_vp0R6_@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Move the conflicting declarations to the end of the corresponding
structures. Notice that `struct dev_pagemap` is a flexible structure,
this is a structure that contains a flexible-array member.

Fix 283 of the following type of warnings:
    283 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h:111:28: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 8 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index ddd472e56f69..24f3e5cfbe5d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1155,9 +1155,6 @@ struct amdgpu_device {
 	/* for userq and VM fences */
 	struct amdgpu_seq64		seq64;
 
-	/* KFD */
-	struct amdgpu_kfd_dev		kfd;
-
 	/* UMC */
 	struct amdgpu_umc		umc;
 
@@ -1320,6 +1317,11 @@ struct amdgpu_device {
 	struct mutex                    userq_mutex;
 	bool                            userq_halt_for_enforce_isolation;
 	struct amdgpu_uid *uid_info;
+
+	/* KFD
+	 * Must be last --ends in a flexible-array member.
+	 */
+	struct amdgpu_kfd_dev		kfd;
 };
 
 static inline uint32_t amdgpu_ip_version(const struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 33eb4826b58b..127927b16ee2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -107,11 +107,13 @@ struct amdgpu_kfd_dev {
 	bool init_complete;
 	struct work_struct reset_work;
 
-	/* HMM page migration MEMORY_DEVICE_PRIVATE mapping */
-	struct dev_pagemap pgmap;
-
 	/* Client for KFD BO GEM handle allocations */
 	struct drm_client_dev client;
+
+	/* HMM page migration MEMORY_DEVICE_PRIVATE mapping
+	 * Must be last --ends in a flexible-array member.
+	 */
+	struct dev_pagemap pgmap;
 };
 
 enum kgd_engine_type {
-- 
2.43.0

