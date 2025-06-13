Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E02AD9747
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 23:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F3410EA4F;
	Fri, 13 Jun 2025 21:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZFP5eWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0AC10EA4F;
 Fri, 13 Jun 2025 21:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749849520; x=1781385520;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AQkkWRoLInwDkrCsz63hcBjTjWSwc0T28TMvklYYRac=;
 b=CZFP5eWTcPcg9LKuBMBZwCJlTsSYbDBKfcV18GMV59CRzehxI/++2p6c
 gGrgsfdmSkziBXSLMgwU+sGStZ4fHR/EwvBPKVoSPCdxScQlNW7aKBU6E
 Ee13pbNH8x5i4CrTD7u2TlQkZGziUEXl4mYm+pN0Qdjw0CwdtoetXNPEL
 HGU5BdYNedmTFTJg13CoHr2Hq/G452GqJvHotN4U1NfBLld84NGvRgFNk
 q8hFImh0Ni0FoT8sGpeJO74981cITQQ7f+2ZtmWeGiIcWoRZerBr8KXe5
 CeW/SW87geuPWKP0vdo4mHsC7FeV1i/HhsRVexmFKDPu+KiANALfmKKq/ g==;
X-CSE-ConnectionGUID: /dTgQG+/TTWR5VPfburpSw==
X-CSE-MsgGUID: o35iNtuMTT6kmG3Wzw6MSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="54693657"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="54693657"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 14:18:39 -0700
X-CSE-ConnectionGUID: lUU0g3+BShKfUgbp9pJOew==
X-CSE-MsgGUID: fF44QwTvRwaL9mgDYdKVCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="153211452"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 14:18:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org,
	christian.koenig@amd.com,
	pstanner@redhat.com
Subject: [PATCH] drm/sched: Increment job count before swapping tail spsc queue
Date: Fri, 13 Jun 2025 14:20:13 -0700
Message-Id: <20250613212013.719312-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

A small race exists between spsc_queue_push and the run-job worker, in
which spsc_queue_push may return not-first while the run-job worker has
already idled due to the job count being zero. If this race occurs, job
scheduling stops, leading to hangs while waiting on the job’s DMA
fences.

Seal this race by incrementing the job count before appending to the
SPSC queue.

This race was observed on a drm-tip 6.16-rc1 build with the Xe driver in
an SVM test case.

Fixes: 1b1f42d8fde4 ("drm: move amd_gpu_scheduler into common location")
Fixes: 27105db6c63a ("drm/amdgpu: Add SPSC queue to scheduler.")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm/spsc_queue.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/drm/spsc_queue.h b/include/drm/spsc_queue.h
index 125f096c88cb..ee9df8cc67b7 100644
--- a/include/drm/spsc_queue.h
+++ b/include/drm/spsc_queue.h
@@ -70,9 +70,11 @@ static inline bool spsc_queue_push(struct spsc_queue *queue, struct spsc_node *n
 
 	preempt_disable();
 
+	atomic_inc(&queue->job_count);
+	smp_mb__after_atomic();
+
 	tail = (struct spsc_node **)atomic_long_xchg(&queue->tail, (long)&node->next);
 	WRITE_ONCE(*tail, node);
-	atomic_inc(&queue->job_count);
 
 	/*
 	 * In case of first element verify new node will be visible to the consumer
-- 
2.34.1

