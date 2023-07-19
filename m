Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E745A7593D6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 13:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE0A10E08E;
	Wed, 19 Jul 2023 11:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A66010E08E;
 Wed, 19 Jul 2023 11:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689764869; x=1721300869;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=caC3Fh3jAI5QG+8EgG0KKMyJyuCyVey77wtXQjQkTxk=;
 b=lqIkqLVSdHp6dlnYnyVtMCpnmERsSEhhPyOcimxU11lAITOw+aSLSHNm
 C9Byy+4Vp7poMN0mRZPpdWE5PkVC4Uhb3vmLFFhIvEPyskAXEGQtsaDxG
 IQx6xR3Y2rQhUvrJCeoflu7zzMQRO9leHkgXLuyMlu2y4j+7YZQCiIfV5
 Ir3bS2cBUYqkJ6MG8u1y1IYG4+M6C52owNA1aQVLsPlcmDXMRSGunP7r2
 dTZUqBCJk68rrlPmVmnSIzSIycU1PoYuZbbQRlfzTSgqGY31B1L0A4P0t
 cBN+0oSXnlJvRmdzTfALVjwqXnrx6n+sDfl89a77EYAtBySZ2CvQI5XjQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="366474534"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="366474534"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 04:07:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="753671198"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="753671198"
Received: from schoorlx-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.155])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 04:07:44 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v6 0/9] Update AUX invalidation sequence
Date: Wed, 19 Jul 2023 13:07:20 +0200
Message-Id: <20230719110729.618733-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

as there are new hardware directives, we need a little adaptation
for the AUX invalidation sequence.

In this version we support all the engines affected by this
change.

The stable backport has some challenges because the original
patch that this series fixes has had more changes in between.

This patch is slowly exploding with code refactorings and
features added and fixed.

Thanks a lot Nirmoy, Andrzej and Matt for your review and for the
fruitful discussions!

Thanks,
Andi

Changelog:
=========
v5 -> v6
 - Fixed ccs flush in the engines VE and BCS. They are sent as a
   separate command instead of added in the pipe control.
 - Separated the CCS flusing in the pipe control patch with the
   quiescing of the memory. They were meant to be on separate
   patch already in the previous verision, but apparently I
   squashed them by mistake.

v4 -> v5
 - The AUX CCS is added as a device property instead of checking
   against FLAT CCS. This adds the new HAS_AUX_CCS check
   (Patch 2, new).
 - little and trivial refactoring here and there.
 - extended the flags{0,1}/bit_group_{0,1} renaming to other
   functions.
 - Created an intel_emit_pipe_control_cs() wrapper for submitting
   the pipe control.
 - Quiesce memory for all the engines, not just RCS (Patch 6,
   new).
 - The PIPE_CONTROL_CCS_FLUSH is added to all the engines.
 - Remove redundant EMIT_FLUSH_CCS mode flag.
 - Remove unnecessary NOOPs from the command streamer for
   invalidating the CCS table.
 - Use INVALID_MMIO_REG and gen12_get_aux_inv_reg() instad of
   __MMIO(0) and reg.reg.
 - Remove useless wrapper and just use gen12_get_aux_inv_reg().

v3 -> v4
 - A trivial patch 3 is added to rename the flags with
   bit_group_{0,1} to align with the datasheet naming.
 - Patch 4 fixes a confusion I made where the CCS flag was
   applied to the wrong bit group.

v2 -> v3
 - added r-b from Nirmoy in patch 1 and 4.
 - added patch 3 which enables the ccs_flush in the control pipe
   for mtl+ compute and render engines.
 - added redundant checks in patch 2 for enabling the EMIT_FLUSH
   flag.

v1 -> v2
 - add a clean up preliminary patch for the existing registers
 - add support for more engines
 - add the Fixes tag

Andi Shyti (7):
  drm/i915/gt: Cleanup aux invalidation registers
  drm/i915: Add the has_aux_ccs device property
  drm/i915/gt: Rename flags with bit_group_X according to the datasheet
  drm/i915/gt: Refactor intel_emit_pipe_control_cs() in a single
    function
  drm/i915/gt: Ensure memory quiesced before invalidation for all
    engines
  drm/i915/gt: Enable the CCS_FLUSH bit in the pipe control
  drm/i915/gt: Support aux invalidation on all engines

Jonathan Cavitt (2):
  drm/i915/gt: Ensure memory quiesced before invalidation
  drm/i915/gt: Poll aux invalidation register bit on invalidation

 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 222 +++++++++++++------
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h     |  21 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h      |  16 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c          |  17 +-
 drivers/gpu/drm/i915/i915_drv.h              |   1 +
 drivers/gpu/drm/i915/i915_pci.c              |   5 +-
 drivers/gpu/drm/i915/intel_device_info.h     |   1 +
 8 files changed, 186 insertions(+), 99 deletions(-)

-- 
2.40.1

