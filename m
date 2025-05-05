Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 989C8AA9F72
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DEE10E46A;
	Mon,  5 May 2025 22:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q4o9Y3Ci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07B010E46A;
 Mon,  5 May 2025 22:23:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4FD59A4BAF6;
 Mon,  5 May 2025 22:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F094C4CEE4;
 Mon,  5 May 2025 22:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746483817;
 bh=cYgAGWyxk03GJQKmaNwFChbrqq9o9Ns3i/Fj53+ylZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q4o9Y3Ci3CdmaWLKRFmugQs5E0aqx0SBK/tJUn0NtRZPzTCSH04stlpYqOAMKR0iF
 jT1wraMAJOBTtXnBesCCq3tb3/Oh4pGRYYOTDmU0o1KlpiH37raMXALsgsZxDthzt7
 4Di49mN43Eb2tuRHzox78IGV9/nTCxin06IijR13vKsiZ+ZtaxGdzeRFkpW2zdhRvx
 66WhaX8PS4wjTHFgNk1mOQ9UK9s7n5VRQ43qC7Zf5/mgmIUhquzSYBqkZbyofMdbow
 tQXbwfIqOKPPE8trsy4klpzPfcQMSrCpDpEkz4K00prL0PWojZBjtsPEMtyUWHcbFS
 8va9m0jU6jIKA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Stuart Summers <stuart.summers@intel.com>, Sasha Levin <sashal@kernel.org>,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 232/642] drm/xe: Retry BO allocation
Date: Mon,  5 May 2025 18:07:28 -0400
Message-Id: <20250505221419.2672473-232-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Matthew Brost <matthew.brost@intel.com>

[ Upstream commit 1d724a2f1b2c3f0cba4975784a808482e0631adf ]

TTM doesn't support fair eviction via WW locking, this mitigated in by
using retry loops in exec and preempt rebind worker. Extend this retry
loop to BO allocation. Once TTM supports fair eviction this patch can be
reverted.

v4:
 - Keep line break (Stuart)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250306012657.3505757-2-matthew.brost@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_bo.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3f5391d416d46..d1eb87cb178bd 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2142,6 +2142,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_gem_create *args = data;
 	struct xe_vm *vm = NULL;
+	ktime_t end = 0;
 	struct xe_bo *bo;
 	unsigned int bo_flags;
 	u32 handle;
@@ -2214,6 +2215,10 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		vm = xe_vm_lookup(xef, args->vm_id);
 		if (XE_IOCTL_DBG(xe, !vm))
 			return -ENOENT;
+	}
+
+retry:
+	if (vm) {
 		err = xe_vm_lock(vm, true);
 		if (err)
 			goto out_vm;
@@ -2227,6 +2232,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
+		if (xe_vm_validate_should_retry(NULL, err, &end))
+			goto retry;
 		goto out_vm;
 	}
 
-- 
2.39.5

