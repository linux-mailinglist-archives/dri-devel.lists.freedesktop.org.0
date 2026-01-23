Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKQ5BkLsc2mkzgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 22:46:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08C27AF7B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 22:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337F010EBEA;
	Fri, 23 Jan 2026 21:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hL9Xr+Io";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427B410EBDE;
 Fri, 23 Jan 2026 21:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769204794; x=1800740794;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bQ7XBAz9El5KyoThCXzV6soqsHlWszTZlAcSyflTR+I=;
 b=hL9Xr+IoHQCiEWsuHwLE4xHLAzna+CF43QzslOFQ8FWRvhTyjgY6Q1iz
 Y6lDOEPgOspO/GOa802NdUJDmlCe3FfZqQoBW009ltvNEv2WFOGVh6Dbd
 ii82Cd0qaERCedbDro+wyKKJTUzo/4kRp5HoJXAYHgYBsmSC+/CCJi7YJ
 dioocSN6DPqvw1d2+xhH4yeJU7qZob8Jn/qZPhrY2ZiYiS4w4ET7XI3vl
 y6UJEgoa/cNWDBbZv4W5VE4LU0I9LW0nAyMRLwYY40orHou+DfvK5qOSB
 KyqqHS6cPmfS9pg5lY9yOIS3z4OlgKSKnLVv7Z0imrouwouZFAUG03L8w g==;
X-CSE-ConnectionGUID: 6w7sUch+R4uXuAa4k6zTsQ==
X-CSE-MsgGUID: zjhn2cJDS4+6RnTK1HpSBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74323568"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="74323568"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 13:46:31 -0800
X-CSE-ConnectionGUID: b0vcMqJYTk+00mezL9Kkeg==
X-CSE-MsgGUID: lYxv4+beROSbjqZB+AVYzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="207169222"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 13:46:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 jgg@ziepe.ca
Subject: [RFC PATCH 0/2] Use new dma-map IOVA alloc, link,
 and sync API in GPU SVM and DRM pagemap
Date: Fri, 23 Jan 2026 13:46:23 -0800
Message-Id: <20260123214625.1612365-1-matthew.brost@intel.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: E08C27AF7B
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

Matthew Brost (2):
  drm/gpusvm: Use new dma-map IOVA alloc, link, and sync API in GPU SVM
  drm/pagemap: Use new dma-map IOVA alloc, link, and sync API for DRM
    pagemap

 drivers/gpu/drm/drm_gpusvm.c  |  63 +++++++++++-----
 drivers/gpu/drm/drm_pagemap.c | 135 ++++++++++++++++++++++++++--------
 include/drm/drm_gpusvm.h      |   3 +
 3 files changed, 152 insertions(+), 49 deletions(-)

-- 
2.34.1

