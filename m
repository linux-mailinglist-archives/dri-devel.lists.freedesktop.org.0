Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNjWJTTvc2lIzwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 22:59:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9067B03A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 22:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC4210EBF1;
	Fri, 23 Jan 2026 21:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyCz+TFn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929D810EBEB;
 Fri, 23 Jan 2026 21:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769205552; x=1800741552;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9/HC6W+QC+mVWd1nKZUfby+4a3GhEyf+ICyAnUtCjB0=;
 b=nyCz+TFnJA7iJonxuhcErkkh0Sp/hmeNgfU82TFS5cz5lMo5pSDu5LAH
 iNgmzeRDEV1q6+YqqHFsvSPp01Ko2HiHiFnKN/VDA0B1m1s69IvYiJlLr
 oXQ4S6f6y5ddK3Oe18k+0eMemTMnYte5Ayd+LI5ReDB+I+eMe241+ttvS
 ILGSw/wol6zNjTwVExW+OnMJHNZrQ90N63V2hXPNR5QetkjQliesyIOwc
 i5V/tvpMGPKQXqMN/dLY7bkMGMHd8boQ7T/qNFWkvwjd0QqNqZc34tgBe
 bhRBJQbqfLiQBGD9p5lEHfYt2SkRqwoObtJdlffxqSAgZvGY2pzXD9/pN g==;
X-CSE-ConnectionGUID: PQyWdrxoQJSo9JYIIsiciQ==
X-CSE-MsgGUID: KDwm3CTAQ/2ciIRYXwccig==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81091905"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="81091905"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 13:59:11 -0800
X-CSE-ConnectionGUID: 4fxu/bR9TqedvGPZNhNnmA==
X-CSE-MsgGUID: Lcxz2ey+RpK+MnKBhdxQCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="206935361"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 13:59:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 jgg@ziepe.ca
Subject: [RFC PATCH v2 0/3] Use new dma-map IOVA alloc, link,
 and sync API in GPU SVM and DRM pagemap
Date: Fri, 23 Jan 2026 13:59:04 -0800
Message-Id: <20260123215907.1643088-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 1B9067B03A
X-Rspamd-Action: no action

The dma-map IOVA alloc, link, and sync APIs perform significantly better
than dma-map / dma-unmap, as they avoid costly IOMMU synchronizations.
This difference is especially noticeable when mapping a 2MB region in
4KB pages.

Use dma-map IOVA alloc, link, and sync APIs for GPU SVM and DRM page,
which mappings between the CPU and GPU.

Initial results are promising.

Baseline CPU time during 2M / 64K fault with a migration:
Average migrate 2M cpu time (us, percentage): 552.36049107142857142857, .71943789893868318799
Average migrate 64K cpu time (us, percentage): 24.97767857142857142857, .34789908128526791960

After this series CPU time during 2M / 64K fault with a migration:
Average migrate 2M cpu time (us, percentage): 224.81808035714285714286, .51412827364772602557
Average migrate 64K cpu time (us, percentage): 14.65625000000000000000, .25659463050529524405

Sending as an RFC as there appears to be intermittent memory corruptions
when running xe_exec_system_allocator that need to be tracked down.

Matt

v2:
 - Include missing basline patch for CI

Francois Dugast (1):
  drm/pagemap: Add helper to access zone_device_data

Matthew Brost (2):
  drm/gpusvm: Use new dma-map IOVA alloc, link, and sync API in GPU SVM
  drm/pagemap: Use new dma-map IOVA alloc, link, and sync API for DRM
    pagemap

 drivers/gpu/drm/drm_gpusvm.c  |  70 ++++++++++-----
 drivers/gpu/drm/drm_pagemap.c | 156 +++++++++++++++++++++++++---------
 include/drm/drm_gpusvm.h      |   3 +
 include/drm/drm_pagemap.h     |  14 +++
 4 files changed, 183 insertions(+), 60 deletions(-)

-- 
2.34.1

