Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA658A919C6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 12:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA6110EAA7;
	Thu, 17 Apr 2025 10:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CPk/Iuvw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DCA10EAA5;
 Thu, 17 Apr 2025 10:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744887097; x=1776423097;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4EIiz/wJSy9Y/SgtfA9OqX0tKMjfWMn2fNT06iXYcVQ=;
 b=CPk/Iuvw1JZ1urVFB4LP6cN1pIshUAuuKI8/p0koOb3hupoebfzor+NU
 /WlGWNHQdP2QnfXR0mw0c2wnbLlSC3kDArpJlt3UPHU54I8AjdB2inSkv
 1tc5EAIVoPab3vqmCfS+hUdj/ySoo6Ki6yurmjEptSAC4nMls1hk/0WJR
 LOzieCS2pnzcLr38WT/1DJvy/TYeIgVXdFbLMNWrNjO8HTW0I/44oFe93
 Nis6AnMPK53eO0bLR6qfXe3z0q3ehoGAyvqVBNQ54CUDc0sPZUkUqUNJM
 +zGNA1yFzOoPvcVLSX7RFSID1Unfcmo84N6B2c9FuKNgmSGEbcBpRVMcI w==;
X-CSE-ConnectionGUID: JqVUqNU5RvGU6gSA58i7lg==
X-CSE-MsgGUID: 7jYbTjqISC6W0cXhJsYKmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="68959759"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="68959759"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 03:51:35 -0700
X-CSE-ConnectionGUID: W4H6o3sETxS5oPqIkN1+RA==
X-CSE-MsgGUID: Jnzi6IUERP+2eZfNq3jgTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="130729631"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.168])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 03:51:32 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 0/3] drm/gpusvm, drm/pagemap,
 drm/xe: Restructure migration in preparation for multi-device
Date: Thu, 17 Apr 2025 12:51:10 +0200
Message-ID: <20250417105113.48831-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

This patchset modifies the migration part of drm_gpusvm to drm_pagemap and
adds a populate_mm() op to drm_pagemap.

The idea is that the device that receives a pagefault determines if it wants to
migrate content and to where. It then calls the populate_mm() method of relevant
drm_pagemap.

This functionality was mostly already in place, but hard-coded for xe only without
going through a pagemap op. Since we might be dealing with separate devices moving
forward, it also now becomes the responsibilit of the populate_mm() op to
grab any necessary local device runtime pm references and keep them held while
its pages are present in an mm (struct mm_struct).

On thing to decide here is whether the populate_mm() callback should sit on a
struct drm_pagemap for now while we sort multi-device usability out or whether
we should add it (or something equivalent) to struct dev_pagemap.

Matthew Brost (1):
  drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap

Thomas Hellström (2):
  drm/pagemap: Add a populate_mm op
  drm/xe: Implement and use the drm_pagemap populate_mm op

 Documentation/gpu/rfc/gpusvm.rst     |  12 +-
 drivers/gpu/drm/Makefile             |   6 +-
 drivers/gpu/drm/drm_gpusvm.c         | 751 +-----------------------
 drivers/gpu/drm/drm_pagemap.c        | 818 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/Kconfig           |  10 +-
 drivers/gpu/drm/xe/xe_bo_types.h     |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c      |   2 +-
 drivers/gpu/drm/xe/xe_svm.c          | 100 ++--
 drivers/gpu/drm/xe/xe_tile.h         |  11 +
 include/drm/drm_gpusvm.h             |  95 +---
 include/drm/drm_pagemap.h            | 130 +++++
 12 files changed, 1049 insertions(+), 890 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_pagemap.c

-- 
2.49.0

