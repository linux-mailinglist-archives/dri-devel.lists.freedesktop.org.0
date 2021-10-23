Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 874DC43849E
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 20:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C93089FAD;
	Sat, 23 Oct 2021 18:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2DA89E9E;
 Sat, 23 Oct 2021 18:09:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10146"; a="209566137"
X-IronPort-AV: E=Sophos;i="5.87,175,1631602800"; d="scan'208";a="209566137"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2021 11:09:51 -0700
X-IronPort-AV: E=Sophos;i="5.87,175,1631602800"; d="scan'208";a="528262356"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2021 11:09:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniele.ceraolospurio@intel.com>,
	<john.c.harrison@intel.com>
Subject: [PATCH 0/3] Do error capture async, flush G2H processing on reset
Date: Sat, 23 Oct 2021 11:05:07 -0700
Message-Id: <20211023180510.35152-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
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

Rather allocating an error capture in nowait context to break a lockdep
splat [1], do the error capture async compared to the G2H processing.

v2: Fix Docs warning
v3: Rebase, resend for CI
v4: Resend for CI
v5: Fix CI splat: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21428/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/patch/451415/?series=93704&rev=5

John Harrison (1):
  drm/i915/guc: Refcount context during error capture

Matthew Brost (2):
  drm/i915/guc: Do error capture asynchronously
  drm/i915/guc: Flush G2H work queue during reset

 drivers/gpu/drm/i915/gt/intel_context.c       |   2 +
 drivers/gpu/drm/i915/gt/intel_context_types.h |   7 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  10 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 107 ++++++++++++++----
 4 files changed, 101 insertions(+), 25 deletions(-)

-- 
2.32.0

