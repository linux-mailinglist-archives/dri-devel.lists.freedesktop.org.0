Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C95E4D56E3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 01:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDA210E028;
	Fri, 11 Mar 2022 00:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1183F10E00D;
 Fri, 11 Mar 2022 00:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646959299; x=1678495299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o9DipBBCSxtOCK6jQnqoVd4fFshA4gbttOlB0153F/I=;
 b=W7rcZVpxAVl9xlE40jQ/auQEXC6NHqRWJ1BVcdW2XEiHL6A/unMdOJOA
 /LJc9nvvRMMBNo3F29ct0biZMbExVg4bYpS0EPSNH43aqFuZwKlrlT9hj
 2UOEm7XhUzsBTOKGE58tZItN22P2NSz4Uh7sy3vmMgxoqLwe9ukdjUtuQ
 2WSMykdkP6iN/DYi01fYuBLNx/1JQWLSXy+ZB4Wz5qHuKnS+h250x4QLv
 IlRend3VLuxNWNx8dcM6mgQVF+wh4eEJYLtAbsiZr5i8gOfu8PKuYh1eW
 2/+Up4S0fIjZztXlHqi6UTczfMZGHAeWitGC4aS06zzyIgU6mm/KDq3hK A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="254272294"
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="254272294"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 16:29:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="596892282"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga008.fm.intel.com with ESMTP; 10 Mar 2022 16:29:16 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/1] Fix i915 error_state_read ptr use
Date: Thu, 10 Mar 2022 16:31:39 -0800
Message-Id: <20220311003140.508371-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix pointer offset usage in error_state_read
when there is no i915_gpu_coredump but buf offset
is non-zero.

This is the 2nd rev of this series.

Changes from prior revs:
  v3: - Add a fixme comment about handling partial inconsistent
        sysfs reads as per review comment from John Harrison.
  v2: - Fix build issue: uninitialized var
        Reported-by: kernel test robot <lkp@intel.com>

Alan Previn (1):
  drm/i915/reset: Fix error_state_read ptr + offset use

 drivers/gpu/drm/i915/i915_sysfs.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.25.1

