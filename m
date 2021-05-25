Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E63738FA1E
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 07:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560156E3DF;
	Tue, 25 May 2021 05:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2639D6E09C;
 Tue, 25 May 2021 05:48:11 +0000 (UTC)
IronPort-SDR: +d1ns6j7Puk+MooSxgrlZkXYZXr7bhV8d2r7LVdTP9QlYPgZZZ3A60ZFFKogWbbKmrENbAUmZU
 +dDMbQtGgG8w==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="266005367"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="266005367"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 22:48:10 -0700
IronPort-SDR: 6H3onrr6oK0x2dbNkBx/DnlBsy/Ds6BZiRPS6AJnUz1mGgsRoFi609WWa0Uk9aQDrI9n30/Fe4
 vbV4ZkDcQJTQ==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="397231635"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 22:48:10 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 00/17] drm/i915: Introduce Intel PXP
Date: Mon, 24 May 2021 22:47:46 -0700
Message-Id: <20210525054803.7387-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.29.2
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Gaurav Kumar <kumar.gaurav@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Juston Li <juston.li@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PXP (Protected Xe Path) is an i915 component, available on
GEN12+, that helps to establish the hardware protected session
and manage the status of the alive software session, as well
as its life cycle.

Several minor changes and fixes, but the main changes in v4 are:

- Rebased to new create_ext ioctl implementation

- Default kconfig option is now N.

- The default session is now only started when protected objects are
  submitted via execbuf.

Tested with: https://patchwork.freedesktop.org/series/87570/

Cc: Gaurav Kumar <kumar.gaurav@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Juston Li <juston.li@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel.vetter@intel.com>

Anshuman Gupta (2):
  drm/i915/pxp: Add plane decryption support
  drm/i915/pxp: black pixels on pxp disabled

Bommu Krishnaiah (1):
  drm/i915/pxp: User interface for Protected buffer

Chris Wilson (1):
  drm/i915/gt: Export the pinned context constructor and destructor

Daniele Ceraolo Spurio (7):
  drm/i915/pxp: Define PXP component interface
  drm/i915/pxp: define PXP device flag and kconfig
  drm/i915/pxp: allocate a vcs context for pxp usage
  drm/i915/pxp: set KCR reg init
  drm/i915/pxp: interface for marking contexts as using protected
    content
  drm/i915/pxp: start the arb session on demand
  drm/i915/pxp: enable PXP for integrated Gen12

Huang, Sean Z (5):
  drm/i915/pxp: Implement funcs to create the TEE channel
  drm/i915/pxp: Create the arbitrary session after boot
  drm/i915/pxp: Implement arb session teardown
  drm/i915/pxp: Implement PXP irq handler
  drm/i915/pxp: Enable PXP power management

Vitaly Lubart (1):
  mei: pxp: export pavp client to me client bus

 drivers/gpu/drm/i915/Kconfig                  |  11 +
 drivers/gpu/drm/i915/Makefile                 |   9 +
 .../gpu/drm/i915/display/intel_atomic_plane.c |  25 ++
 drivers/gpu/drm/i915/display/intel_display.c  |   4 +
 .../drm/i915/display/intel_display_types.h    |   6 +
 .../drm/i915/display/skl_universal_plane.c    |  49 +++-
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  59 +++-
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |  18 ++
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |  26 ++
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  35 +++
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   6 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  12 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  13 +
 drivers/gpu/drm/i915/gt/intel_engine.h        |  12 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  29 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |  22 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |   5 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |   7 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  15 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   3 +
 drivers/gpu/drm/i915/i915_drv.c               |   2 +
 drivers/gpu/drm/i915/i915_drv.h               |   4 +
 drivers/gpu/drm/i915/i915_pci.c               |   2 +
 drivers/gpu/drm/i915/i915_reg.h               |  48 ++++
 drivers/gpu/drm/i915/intel_device_info.h      |   1 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c          | 266 ++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp.h          |  65 +++++
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c      | 140 +++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.h      |  15 +
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c      | 100 +++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h      |  32 +++
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c       |  40 +++
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.h       |  23 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  | 172 +++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.h  |  15 +
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      | 161 +++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.h      |  17 ++
 .../drm/i915/pxp/intel_pxp_tee_interface.h    |  37 +++
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |  53 ++++
 drivers/misc/mei/Kconfig                      |   2 +
 drivers/misc/mei/Makefile                     |   1 +
 drivers/misc/mei/pxp/Kconfig                  |  13 +
 drivers/misc/mei/pxp/Makefile                 |   7 +
 drivers/misc/mei/pxp/mei_pxp.c                | 233 +++++++++++++++
 drivers/misc/mei/pxp/mei_pxp.h                |  18 ++
 include/drm/i915_component.h                  |   1 +
 include/drm/i915_pxp_tee_interface.h          |  45 +++
 include/uapi/drm/i915_drm.h                   |  62 +++-
 49 files changed, 1922 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_session.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_session.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_tee.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_types.h
 create mode 100644 drivers/misc/mei/pxp/Kconfig
 create mode 100644 drivers/misc/mei/pxp/Makefile
 create mode 100644 drivers/misc/mei/pxp/mei_pxp.c
 create mode 100644 drivers/misc/mei/pxp/mei_pxp.h
 create mode 100644 include/drm/i915_pxp_tee_interface.h

-- 
2.29.2

