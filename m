Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DEA3D9A04
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C4B6E243;
	Thu, 29 Jul 2021 00:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38726E231;
 Thu, 29 Jul 2021 00:16:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="212500655"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="212500655"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 17:16:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="456666795"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 17:16:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/1] Fix gem_ctx_persistence failures with GuC submission 
Date: Wed, 28 Jul 2021 17:33:59 -0700
Message-Id: <20210729003400.151864-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
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

Should fix below failures with GuC submission for the following tests:
gem_exec_balancer --r noheartbeat
gem_ctx_persistence --r heartbeat-close

Not going to fix:
gem_ctx_persistence --r heartbeat-many
gem_ctx_persistence --r heartbeat-stop

As the above tests change the heartbeat value to 0 (off) after the
context is closed and we have no way to detect that with GuC submission
unless we keep a list of closed but running contexts which seems like
overkill for a non-real world use case. We likely should just skip these
tests with GuC submission.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (1):
  drm/i915: Check if engine has heartbeat when closing a context

 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  5 +++--
 drivers/gpu/drm/i915/gt/intel_context_types.h |  2 ++
 drivers/gpu/drm/i915/gt/intel_engine.h        | 21 ++-----------------
 .../drm/i915/gt/intel_execlists_submission.c  | 14 +++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 +++++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 --
 6 files changed, 26 insertions(+), 24 deletions(-)

-- 
2.28.0

