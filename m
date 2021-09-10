Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C36E24066D0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 07:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226906E96C;
	Fri, 10 Sep 2021 05:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1046E964;
 Fri, 10 Sep 2021 05:33:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="217832057"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="217832057"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 22:33:31 -0700
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="480012415"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 22:33:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 0/6] i915: Simplify mmio handling & add new DG2 shadow table
Date: Thu,  9 Sep 2021 22:33:11 -0700
Message-Id: <20210910053317.3379249-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
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

Our uncore MMIO functions for reading/writing registers have become very
complicated over time.  There's significant macro magic used to generate
several nearly-identical functions that only really differ in terms of
which platform-specific shadow register table they should check on write
operations.  We can significantly simplify our MMIO handlers by storing
a reference to the current platform's shadow table within the 'struct
intel_uncore' the same way we already do for forcewake; this allows us
to consolidate the multiple variants of each 'write' function down to
just a single 'fwtable' version that gets the shadow table out of the
uncore struct rather than hardcoding the name of a specific platform's
table.  We can do similar consolidation on the MMIO read side by
creating a single-entry forcewake table to replace the open-coded range
check they had been using previously.

The final patch of the series adds a new shadow table for DG2; this
becomes quite clean and simple now, given the refactoring in the first
five patches.

Matt Roper (6):
  drm/i915/uncore: Convert gen6/gen7 read operations to fwtable
  drm/i915/uncore: Associate shadow table with uncore
  drm/i915/uncore: Replace gen8 write functions with general fwtable
  drm/i915/uncore: Drop gen11/gen12 mmio write handlers
  drm/i915/uncore: Drop gen11 mmio read handlers
  drm/i915/dg2: Add DG2-specific shadow register table

 drivers/gpu/drm/i915/intel_uncore.c           | 190 ++++++++++--------
 drivers/gpu/drm/i915/intel_uncore.h           |   7 +
 drivers/gpu/drm/i915/selftests/intel_uncore.c |   1 +
 3 files changed, 110 insertions(+), 88 deletions(-)

-- 
2.25.4

