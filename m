Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C4F9D1BFE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2976D10E29D;
	Mon, 18 Nov 2024 23:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PEOAep6O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E295410E58F;
 Mon, 18 Nov 2024 23:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973051; x=1763509051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qor/rz+zhJl8ucNnVdsiBtpFdqatd8c7wJgJh3n3K7A=;
 b=PEOAep6OxJKRv6vrD1HmJ6fdZVqGCiUs7DQAlp5xESug4t58EVhD0tNw
 AU82wvg530ndAhy7iSTqMTq3xy1BhEbAXjrfsKnkn/HvGjU13yFnW/HLt
 pFAJvySD4ZwWhvTG6W2RN9UYnXSgILJUPO9DjnD8ZFpVkzPV6P1hW9ffX
 V1rdki/EpUTwK9lNAO1z5WnAOPALiCL1ELBs6o7Fe24gpKuAvQeAkoLAS
 z3/FxpLVVhjhvu5E2KNJpzcAz1lWykwnhY10rgWNvUi1W1G+GBO87IK0C
 LJ3g9xP1as0TCMNkR18dg+WPthgmUXIrlwssIx/niJO0Pb9F68RxSJt6u g==;
X-CSE-ConnectionGUID: l7TRPBVDQMKUcurHPTAh0A==
X-CSE-MsgGUID: W/G8w5etT9Wlo48+QjGwUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31879020"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31879020"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:30 -0800
X-CSE-ConnectionGUID: mv8Ar+PbS8qB3xQ3cSvYhQ==
X-CSE-MsgGUID: wetTYL7dT2ic7HmwkopKZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521771"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:30 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 26/29] drm/xe: Always wait on preempt fences in
 vma_check_userptr
Date: Mon, 18 Nov 2024 15:37:54 -0800
Message-Id: <20241118233757.2374041-27-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
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

The assumption only a VM in preempt fence mode has preempt fences
attached is not true, preempt fences can be attached to a dma-resv VM if
user queues are open.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index a75667346ab3..1efe17b0b1f8 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1231,7 +1231,7 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 			       &vm->userptr.invalidated);
 		spin_unlock(&vm->userptr.invalidated_lock);
 
-		if (xe_vm_in_preempt_fence_mode(vm)) {
+		if (vm->preempt.num_exec_queues) {
 			struct dma_resv_iter cursor;
 			struct dma_fence *fence;
 			long err;
-- 
2.34.1

