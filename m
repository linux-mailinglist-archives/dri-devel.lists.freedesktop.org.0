Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BAA445175
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 11:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4211F6E47E;
	Thu,  4 Nov 2021 10:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237B76E45C;
 Thu,  4 Nov 2021 10:14:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="218871409"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="218871409"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 03:14:45 -0700
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="729980119"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.164])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 03:14:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/2] drm/i915: Failsafe migration blits
Date: Thu,  4 Nov 2021 11:14:27 +0100
Message-Id: <20211104101429.680166-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series introduces failsafe migration blits.
The reason for this seemingly strange concept is that if the initial
clearing or readback of LMEM fails for some reason[1], and we then set up
either GPU- or CPU ptes to the allocated LMEM, we can expose old
contents from other clients.

So after each migration blit to LMEM, attach a dma-fence callback that
checks the migration fence error value and if it's an error,
performs a memcpy blit, instead.

Patch 1 splits out the TTM move code into separate files
Patch 2 implements the failsafe blits and related self-tests

[1] There are at least two ways we could trigger exposure of uninitialized
LMEM assuming the migration blits themselves never trigger a gpu hang.

a) A gpu operation preceding a pipelined eviction blit resets and sets the
error fence to -EIO, and the error is propagated across the TTM manager to
the clear / swapin blit of a newly allocated TTM resource. It aborts and
leaves the memory uninitialized.

b) Something wedges the GT while a migration blit is submitted. It ends up
never executed and TTM can fault user-space cpu-ptes into uninitialized
memory.

v3:
- Style fixes in second patch (Matthew Auld)
v4:
- More style fixes in second patch (Matthew Auld)
v5:
- Fix an issue where we might end up waiting for a fence that would
  never signal.

Thomas Hellström (2):
  drm/i915/ttm: Reorganize the ttm move code
  drm/i915/ttm: Failsafe migration blits

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 328 ++---------
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |  35 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 522 ++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h  |  43 ++
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  24 +-
 6 files changed, 672 insertions(+), 281 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h

-- 
2.31.1

