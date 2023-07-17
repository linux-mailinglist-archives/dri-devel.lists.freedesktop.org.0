Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11865756A93
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 19:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B292010E290;
	Mon, 17 Jul 2023 17:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4A210E288;
 Mon, 17 Jul 2023 17:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689615091; x=1721151091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R4KIr5olazxTaWqwH/NtEITHJw/cTrDOjWDDTZ6KD48=;
 b=mTIsemSecvvyNytwOi2jXSxoO88Xsdw15pyP+8XZybF+ntjWfT1lNDB/
 P/qvk4CuP199obwoc3ZbfhHZNUq57mrcbJGVWjIlPofx7k7nJ29jGfeAC
 wf1lR1IRCKILN9z6pSuguYvpD6fYzK3eb8Afex+oNZ8zRDNn7CYsW6YAT
 OGELpZ5JOPdohXApTGLf4GBtD5z9718LQz+uc+RyImwsWfkzKI8/l2ZYC
 ZTEe9MAsNiSgJA0+nrxG4FcA/SJJBtbJeUrxsGR+mUSIlXNlGYOa31FtW
 tLBPynE5fLNm7f0lVACByLkm+tKn3T6MOG6SIznCIhtndoAVMTqufdLEg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="350855451"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="350855451"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 10:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="813427490"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="813427490"
Received: from jplazoni-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.169])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 10:31:12 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v4 0/6] Update AUX invalidation sequence
Date: Mon, 17 Jul 2023 19:30:53 +0200
Message-Id: <20230717173059.422892-1-andi.shyti@linux.intel.com>
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

Thanks a lot Nirmoy for your review and for the fruitful discussions!

Thanks,
Andi

Changelog:
=========
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

Andi Shyti (4):
  drm/i915/gt: Cleanup aux invalidation registers
  drm/i915/gt: Rename flags with bit_group_X according to the datasheet
  drm/i915/gt: Enable the CCS_FLUSH bit in the pipe control
  drm/i915/gt: Support aux invalidation on all engines

Jonathan Cavitt (2):
  drm/i915/gt: Ensure memory quiesced before invalidation
  drm/i915/gt: Poll aux invalidation register bit on invalidation

 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 127 +++++++++++++------
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h     |   3 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h |   1 +
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h      |  14 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c          |  17 +--
 6 files changed, 98 insertions(+), 66 deletions(-)

-- 
2.40.1

