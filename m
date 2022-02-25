Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB154C4FC8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 21:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B89D10E932;
	Fri, 25 Feb 2022 20:41:52 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87BF10E935;
 Fri, 25 Feb 2022 20:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645821711; x=1677357711;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QjFtXA7bfNHPYdiNqPFkVkDuiueUj4uPriiqnct4+Pg=;
 b=Im4vzB+q/zhIbsP3XYsxXKnTL/fEvVUaSrsV1xlRZjgkqpBvwMi6hoQT
 sWBnuVf7AjJyG9Iqj5AfM0omH6frS5TJl831dFvSSKFx5RoMKj6pPbtNd
 vfbhRLeei12QAS6VvxHH8ERkFDs2Js9yGAL71w5Tq8NjJLICFsHPBAYm9
 qReXksSzoKc5QBJSn74tFdSnFgocCS5hrCAf2kD+/94mvFqpv21MUwE9d
 +WE5k8z3Z84plXox+31Fr7w1Mq7OMt00Y19UhUwiNss9doE1NCqZkyI3R
 dZdl5VJiTfDpejGtHFHfWXn+sZwAp8zvfYNpLaIpxEWRzNisrzi6LN8jC w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="315791545"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="315791545"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:41:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="549414293"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga008.jf.intel.com with ESMTP; 25 Feb 2022 12:41:51 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 0/3] Improve anti-pre-emption w/a for compute workloads
Date: Fri, 25 Feb 2022 12:41:48 -0800
Message-Id: <20220225204151.2248027-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Compute workloads are inherently not pre-emptible on current hardware.
Thus the pre-emption timeout was disabled as a workaround to prevent
unwanted resets. Instead, the hang detection was left to the heartbeat
and its (longer) timeout. This is undesirable with GuC submission as
the heartbeat is a full GT reset rather than a per engine reset and so
is much more destructive. Instead, just bump the pre-emption timeout
to a big value. Also, update the heartbeat to allow such a long
pre-emption delay in the final heartbeat period.

v2: Add clamping helpers.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (3):
  drm/i915/guc: Limit scheduling properties to avoid overflow
  drm/i915/gt: Make the heartbeat play nice with long pre-emption
    timeouts
  drm/i915: Improve long running OCL w/a for GuC submission

 drivers/gpu/drm/i915/gt/intel_engine.h        |  6 ++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 91 ++++++++++++++++++-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 16 ++++
 drivers/gpu/drm/i915/gt/sysfs_engines.c       | 25 +++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  9 ++
 5 files changed, 134 insertions(+), 13 deletions(-)

-- 
2.25.1

