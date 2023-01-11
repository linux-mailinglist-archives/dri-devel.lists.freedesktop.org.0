Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475846665B6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 22:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A59B10E0E3;
	Wed, 11 Jan 2023 21:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C161910E0CA;
 Wed, 11 Jan 2023 21:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673473349; x=1705009349;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4QOO3Luc5cRyQy/a+58qgUTk3ob1UD7DPZYcsqtkTwU=;
 b=B/wAw6ypTj2JeBv++seFJ9hVoz5AYClnG7vLpasLc7JlbzP0pQawTi0v
 Icxt+OmFTCo/ZW1k5k5u3ZNF89NMoTAtdM6RbaJMplo6nlfcVRolpiCWR
 K6RCIkGffzKITKS3xoP4WBZKf8Vt6JxDEZ8FtaltTh1eIW+0u+0ZDNog+
 S6Q9LshHjRTvLbVLpzORVUWScCK53ypeTteoQ+ogf2Vb41Q0kRu7qRi5V
 CFt2i2GHRV4YCd426LKF4wqzECem9KeHL9ZzNHaGk7q+uEKwxGJ4Dw1ta
 bKX7Gz7D0aobYdw9noBYKmjN/N5WYFasa6FtIEBrPmMqhkUuTzlvp7Zzn Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="322244738"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="322244738"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 13:42:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607530409"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="607530409"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga003.jf.intel.com with ESMTP; 11 Jan 2023 13:42:28 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/9] drm/i915/pxp: Add MTL PXP Support
Date: Wed, 11 Jan 2023 13:42:17 -0800
Message-Id: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Juston Li <justonli@chromium.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series enables PXP on MTL. On ADL/TGL platforms, we rely on
the mei driver via the i915-mei PXP component interface to establish
a connection to the security firmware via the HECI device interface.
That interface is used to create and teardown the PXP ARB session.
PXP ARB session is created when protected contexts are created.

In this series, the front end behaviors and interfaces (uapi) remain
the same. We add backend support for MTL but with MTL we directly use
the GSC-CS engine on the MTL GPU device to send messages to the PXP
(a.k.a. GSC a.k.a graphics-security) firmware. With MTL, the format
of the message is slightly different with a 2-layer packetization
that is explained in detail in Patch #4. Also, the second layer
which is the actual PXP firmware packet is now rev'd to version 4.3
for MTL that is defined in Patch #6.

Changes from prior revs:
   v1 : - fixed when building with CONFIG_PXP disabled.
        - more alignment with gsc_mtl_header structure from the HDCP

Alan Previn (9):
  drm/i915/pxp: Add MTL PXP GSC-CS back-end skeleton
  drm/i915/pxp: Add GSC-CS back-end resource init and cleanup
  drm/i915/pxp: Add MTL hw-plumbing enabling for KCR operation
  drm/i915/pxp: Add MTL helpers to submit Heci-Cmd-Packet to GSC
  drm/i915/pxp: Add GSC-CS backend to send GSC fw messages
  drm/i915/pxp: Add ARB session creation with new PXP API Ver4.3
  drm/i915/pxp: MTL-KCR interrupt ctrl's are in GT-0
  drm/i915/pxp: On MTL, KCR enabling doesn't wait on tee component
  drm/i915/pxp: Enable PXP with MTL-GSC-CS

 drivers/gpu/drm/i915/Makefile                 |   2 +
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |   3 +-
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 107 +++++
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |  69 ++++
 drivers/gpu/drm/i915/i915_pci.c               |   1 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c          |  92 ++++-
 drivers/gpu/drm/i915/pxp/intel_pxp.h          |   4 +-
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |  27 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c  |   2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    | 380 ++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    |  30 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c      |  23 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h      |   8 +
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c       |  10 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h     |  26 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  37 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      |  13 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |  11 +
 19 files changed, 791 insertions(+), 56 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h


base-commit: bf7f7c53ac622a3f6d6738d062e59dd21ce28bd7
-- 
2.39.0

