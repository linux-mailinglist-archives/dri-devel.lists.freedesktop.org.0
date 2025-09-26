Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEBBBA3002
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 10:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B499910EA24;
	Fri, 26 Sep 2025 08:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ccqq1CAb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD5010EA11;
 Fri, 26 Sep 2025 08:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758876407; x=1790412407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RWW210PDr2oUkOjX/ILOMWhF7nSjRu9ntBzl0do/OF8=;
 b=ccqq1CAbIPhXGRmrNh/74XkDvJOJTrKHWqH7inITKgmvS5R25l+A0TRt
 FwKGS6C/CXn1+MFBl57l2piTrfiLThZIEGqKKefeTeNEfMUnr4S/d+HpD
 3D/+3rSgtyhxIOdFzMKLoW+qIdG0fH0pJ0MRQ5p07tNK7TjNFIq1E5f0m
 xZS5ahFoGlVbxuYIiKbqNVedyqwRFGnJtUKJzsfbAXMsZ/cZ5Pga3l0/Y
 hVmfBCFRhczAsWDQ0V6IGhNheiKpBtMJ+SGCGwGwUTaMymniyLuGJrbeG
 xpb93pz3ic78xtyKfm/C3SSv5cnQbe0yZ0Xhd358maS8Mfm+MUy1nZreW g==;
X-CSE-ConnectionGUID: zeac80UUTIWRngCwR42PJw==
X-CSE-MsgGUID: b2aMbR1WSiOlH+CL6mOYFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="65054052"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="65054052"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 01:46:47 -0700
X-CSE-ConnectionGUID: rylidwQnTzigjQ8gzic4eA==
X-CSE-MsgGUID: w5377SOpT7masOIv5dh0Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="182839717"
Received: from opintica-mobl1 (HELO fedora) ([10.245.244.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 01:46:44 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Jason Gunthorpe <jgg@nvidia.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH v2 0/2] dma-buf private interconnect POC
Date: Fri, 26 Sep 2025 10:46:22 +0200
Message-ID: <20250926084624.2288-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

Two patches to implement a generic framework for dma-buf to support
local private interconnects, in particular interconnects that are not
driver-private.

The interconnect support is negotiated as part of an attachment and is
not a property of the dma-buf itself. Just like pcie p2p support.

The first patch adds members to the dma_buf_attach_ops and to the
dma_buf_attachment structure. These are needed for generic check of
interconnect support, typically when an interconnect is shared between
drivers. For truly driver-private interconnects they are not
strictly needed, but still could be convenient.

The second patch implements an interconnect negotiation for xe,
without actually changing the protocol itself from pcie_p2p.
Just as an example. This patch is not intended to be merged.

Note: This RFC only deals with interconnect negotiation. The
attachment state and what data-structure to use to convey the mapping
information is not dealt with in this RFC.

v2:
- Get rid of void pointers and instead provide generic structures
  that are intended to be embedded / subclassed for each interconnect
  implementation.

Thomas Hellström (2):
  dma-buf: Add support for private interconnects
  drm/xe/dma-buf: Add generic interconnect support framework

 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 12 ++---
 drivers/gpu/drm/xe/xe_dma_buf.c       | 73 ++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_dma_buf.h       |  1 -
 drivers/gpu/drm/xe/xe_interconnect.h  | 31 ++++++++++++
 include/linux/dma-buf.h               | 51 +++++++++++++++++++
 5 files changed, 155 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_interconnect.h

-- 
2.51.0

