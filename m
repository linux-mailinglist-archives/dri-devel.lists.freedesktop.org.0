Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AF63C16D5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 18:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194776E903;
	Thu,  8 Jul 2021 16:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D086E913;
 Thu,  8 Jul 2021 16:04:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="231293784"
X-IronPort-AV: E=Sophos;i="5.84,224,1620716400"; d="scan'208";a="231293784"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 09:03:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,224,1620716400"; d="scan'208";a="492164239"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 09:03:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/7] CT changes required for GuC submission
Date: Thu,  8 Jul 2021 09:20:48 -0700
Message-Id: <20210708162055.129996-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As part of enabling GuC submission discussed in [1], [2], and [3] we
need optimize and update the CT code as this is now in the critical
path of submission. This series includes the patches to do that which is
the first 7 patches from [3]. The patches should have addressed all the
feedback in [3] and should be ready to merge once CI returns a we get a
few more RBs.

v2: Fix checkpatch warning, address a couple of Michal's comments
v3: Address John Harrison's comments
v4: Address remaining comments, resend for patchworks to merge

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/89844/
[2] https://patchwork.freedesktop.org/series/91417/
[3] https://patchwork.freedesktop.org/series/91840/

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

John Harrison (1):
  drm/i915/guc: Module load failure test for CT buffer creation

Matthew Brost (6):
  drm/i915/guc: Relax CTB response timeout
  drm/i915/guc: Improve error message for unsolicited CT response
  drm/i915/guc: Increase size of CTB buffers
  drm/i915/guc: Add non blocking CTB send function
  drm/i915/guc: Add stall timer to non blocking CTB send function
  drm/i915/guc: Optimize CTB writes and reads

 .../gt/uc/abi/guc_communication_ctb_abi.h     |   3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  11 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 256 +++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  14 +-
 4 files changed, 234 insertions(+), 50 deletions(-)

-- 
2.28.0

