Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB5288E9F5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 16:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EDB10FDB7;
	Wed, 27 Mar 2024 15:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+9/qG5r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6EA10FA03;
 Wed, 27 Mar 2024 15:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711555023; x=1743091023;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CezWxV1ugvmeHdvtfKDNqDryeTvRwf2uaIO+AyEy+mw=;
 b=K+9/qG5rtl7zvQqOMekbw5UDDoz+mKBtzxNvuRbX3KffKnctBiOda4Lo
 AKPZ/Bty9cWjEqf0J6CVOYgMVTndGBwmrOMzzS85mWG7Ap1+b17PBCPrK
 ozFEut72rzJ23r0DpIBkGZUy7F0vPFTFXui8nDKCg7TgGvKwNSpCOAP15
 Pq0V6TX45HiHWKtRsAB2rXgI7m2c4cjxuPM8ZBiPnfJz9uMtm8ypUlRif
 OKgui5Wx8M2jKcFRqr7inMUXTCxzQc0QgVP4R22Cd28/T3ZSNs0ZAJyIe
 ReTm+EXWKiXCZ4yiljSXoBJGhnrH4IVn+5P5p+8hdIbKYLI9ggyA+Ynoq w==;
X-CSE-ConnectionGUID: vAcJ4sRETu+vXr/G45gOiA==
X-CSE-MsgGUID: srm9tbynQXOkFnvJJC4c+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17215709"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="17215709"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 08:57:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="47548021"
Received: from unknown (HELO intel.com) ([10.247.118.215])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 08:56:54 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Michal Mrozek <michal.mrozek@intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v7 0/3] Disable automatic load CCS load balancing
Date: Wed, 27 Mar 2024 16:56:16 +0100
Message-ID: <20240327155622.538140-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Hi,

this series does basically two things:

1. Disables automatic load balancing as adviced by the hardware
   workaround.

2. Assigns all the CCS slices to one single user engine. The user
   will then be able to query only one CCS engine

From v5 I have created a new file, gt/intel_gt_ccs_mode.c where
I added the intel_gt_apply_ccs_mode(). In the upcoming patches,
this file will contain the implementation for dynamic CCS mode
setting.

Thanks Tvrtko, Matt, John and Joonas for your reviews!

Andi

Changelog
=========
v6 -> v7
 - find a more appropriate place where to remove the CCS engines:
   remove them in init_engine_mask() instead of
   intel_engines_init_mmio(). (Thanks, Matt)
 - Add Michal's ACK, thanks Michal!

v5 -> v6 (thanks Matt for the suggestions in v6)
 - Remove the refactoring and the for_each_available_engine()
   macro and instead do not create the intel_engine_cs structure
   at all.
 - In patch 1 just a trivial reordering of the bit definitions.

v4 -> v5
 - Use the workaround framework to do all the CCS balancing
   settings in order to always apply the modes also when the
   engine resets. Put everything in its own specific function to
   be executed for the first CCS engine encountered. (Thanks
   Matt)
 - Calculate the CCS ID for the CCS mode as the first available
   CCS among all the engines (Thanks Matt)
 - create the intel_gt_ccs_mode.c function to host the CCS
   configuration. We will have it ready for the next series.
 - Fix a selftest that was failing because could not set CCS2.
 - Add the for_each_available_engine() macro to exclude CCS1+ and
   start using it in the hangcheck selftest.

v3 -> v4
 - Reword correctly the comment in the workaround
 - Fix a buffer overflow (Thanks Joonas)
 - Handle properly the fused engines when setting the CCS mode.

v2 -> v3
 - Simplified the algorithm for creating the list of the exported
   uabi engines. (Patch 1) (Thanks, Tvrtko)
 - Consider the fused engines when creating the uabi engine list
   (Patch 2) (Thanks, Matt)
 - Patch 4 now uses a the refactoring from patch 1, in a cleaner
   outcome.

v1 -> v2
 - In Patch 1 use the correct workaround number (thanks Matt).
 - In Patch 2 do not add the extra CCS engines to the exposed
   UABI engine list and adapt the engine counting accordingly
   (thanks Tvrtko).
 - Reword the commit of Patch 2 (thanks John).

Andi Shyti (3):
  drm/i915/gt: Disable HW load balancing for CCS
  drm/i915/gt: Do not generate the command streamer for all the CCS
  drm/i915/gt: Enable only one CCS for compute workload

 drivers/gpu/drm/i915/Makefile               |  1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 15 ++++++++
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 39 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h | 13 +++++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  6 ++++
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 30 ++++++++++++++--
 6 files changed, 102 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h

-- 
2.43.0

