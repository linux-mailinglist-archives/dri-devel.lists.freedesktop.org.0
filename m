Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CBF756328
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 14:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB4F10E235;
	Mon, 17 Jul 2023 12:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDD210E234;
 Mon, 17 Jul 2023 12:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689598317; x=1721134317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tXmIuWi2HHbHOpmPHFaBoSDJmGNEDxYgiH7Gyud8+/Y=;
 b=fdVv689zc3O0IudUaJzWBxoGu6T3YW73LpHC5IEAsuot54x3KLrD4Y/a
 sWonRoiWL9SDgcqJkAarpW49qgfupFyhZRH21/Rd3UNY0Iu1XpZc79+hX
 87A1tBb1/u1yzsDo4mEjuoVCgGt7yuP6lKh4pd89JpI4cw88pJdC1/VXi
 BbnscQGqVBI812sCxWlapPlvVn5LHPYqQSOkdOZtE3s/VbBALN/9KV250
 YiZPcxugxZpQIdCUSQbOf0RlJv+EI4whVl1q/APN3quRWhuosexHhqZGy
 JqTgiN4WGzgWuK6xo+k3Z2TOiXPQDlGVpOXtshabmKElqRn9TdVD/FbMZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="452294483"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="452294483"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 05:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="752885864"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="752885864"
Received: from jplazoni-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.169])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 05:51:53 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v3 0/5] Update AUX invalidation sequence
Date: Mon, 17 Jul 2023 14:51:29 +0200
Message-Id: <20230717125134.399115-1-andi.shyti@linux.intel.com>
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
v2 -> v3
 - added r-b from Nirmoy in patch 1 and 4.
 - added patch 3 which enables the ccs_flush in the control pipe for mtl+
   compute and render engines.
 - added redundant checks in patch 2 for enabling the EMIT_FLUSH flag.

v1 -> v2
 - add a clean up preliminary patch for the existing registers
 - add support for more engines
 - add the Fixes tag

Andi Shyti (3):
  drm/i915/gt: Cleanup aux invalidation registers
  drm/i915/gt: Enable the CCS_FLUSH bit in the pipe control
  drm/i915/gt: Support aux invalidation on all engines

Jonathan Cavitt (2):
  drm/i915/gt: Ensure memory quiesced before invalidation
  drm/i915/gt: Poll aux invalidation register bit on invalidation

 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 95 ++++++++++++++------
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h     |  3 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h |  1 +
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  2 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h      | 14 ++-
 drivers/gpu/drm/i915/gt/intel_lrc.c          | 17 +---
 6 files changed, 82 insertions(+), 50 deletions(-)

-- 
2.40.1

