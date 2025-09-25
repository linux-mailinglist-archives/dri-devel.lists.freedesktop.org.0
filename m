Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A416FB9F6E4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 15:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C0E10E918;
	Thu, 25 Sep 2025 13:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TWecgEPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE4A10E916;
 Thu, 25 Sep 2025 13:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758805753; x=1790341753;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GsKHdglgRH+vt2LpbLLhq32Pp1RworSWPVGYRz1tIHc=;
 b=TWecgEPG/jeIR71KhphK0H3b/53PuXG8/lfXTzGP397vAPSFdrHI8Y/B
 P4stF6QqovLKwkTtDAx07MieadYL+6YRleMFfGf3f8U6Okwu/tbY8s2Ot
 9Pf/PpDXth9jnTiCjSzuZIT+QfBNDAJDT6rlmBLVTv9n2lADfXTUlcRs/
 tEs7qQL0sSXvYodQMg/5JokOTFSCNbFHhKzd8V8I/HKGEqc3Tj/1L0tVE
 QDzbJSjw1Et6Yc9guoqScefV0VrgePyhHClwD1ySM6CdlFDlWbBQU1QcQ
 ImTO19sK/g15HctVTkkxmsyKBjc3DFM9ed8LPZbP3KVtMKajUdcJnncqS g==;
X-CSE-ConnectionGUID: FKGWlk/yTt6x9mx73vAFVA==
X-CSE-MsgGUID: rbjiMpApS8ym8sO1hYUPhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61035807"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61035807"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 06:09:12 -0700
X-CSE-ConnectionGUID: GCE5j6CSQCiyjIxpHj4hMg==
X-CSE-MsgGUID: 7A+rRfQJSPOeUNfL5Z913Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="201011361"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.244.100])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 06:09:09 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH 0/2] dma-buf private interconnect POC
Date: Thu, 25 Sep 2025 15:08:47 +0200
Message-ID: <20250925130849.12021-1-thomas.hellstrom@linux.intel.com>
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
local private interconnects.
The interconnect support is negotiated as part of an attachment and is
not a property of the dma-buf itself. Just like pcie p2p support.

The first patch adds members to the dma_buf_attach_ops and to the
dma_buf_attachment structure. These are needed for generic check of
interconnect support, typically when an interconnect is shared between
drivers. For truly driver-private interconnects they are not
strictly needed, but still could be convenient.

The second patch implements an interconnect negotiation for xe,
without actually changing the protocol itself from pcie_p2p.
Just as an example.

Thomas Hellström (2):
  dma-buf: Add support for private interconnects
  drm/xe/dma-buf: Add generic interconnect support framework

 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 12 +++---
 drivers/gpu/drm/xe/xe_dma_buf.c       | 54 +++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_dma_buf.h       |  1 -
 drivers/gpu/drm/xe/xe_interconnect.h  | 22 +++++++++++
 include/linux/dma-buf.h               | 15 ++++++++
 5 files changed, 90 insertions(+), 14 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_interconnect.h

-- 
2.51.0

