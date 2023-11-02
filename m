Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726707DF0B0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 11:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8263110E84A;
	Thu,  2 Nov 2023 10:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CCD10E849
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 10:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698922561; x=1730458561;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XfCX1HyZh1hglNFxerjf1Dt1usrXtndS1EjjiYAdzHY=;
 b=WgRzOdiqYMua/+KEs4gGoQZBcxtRNmC2AcsK2EcbfxuHdAgqY/MYQeOZ
 tE4VoiWF3fK5QgMubEwO5xcrWmfXpR1sVjeZiUP8Vf76NBFSPdns05bUL
 eK2o6pCG7NS2rdCtv15dqEGCSXbxdJj7ZCmTY9+3ms9a5YaR2rDDfXXbd
 BeWUhIThc9STbJYMlS/v8q7spDjzdYUXAQ6VJONdNyP13nPN1b6Wc8zFg
 eSCi4htFFWR69qrGXbyZjJBFLOAMPMhogysa7Une/UqVAumiEig/BMLvN
 kSGz9tSupDwiB82J3m7wqXAC8xllP3S9CKJPk4iJlBKEsmjIe1/gT9zSf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452988659"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="452988659"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 03:55:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="764875938"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="764875938"
Received: from stevenwo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.233.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 03:55:43 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] Some drm scheduler internal renames
Date: Thu,  2 Nov 2023 10:55:33 +0000
Message-Id: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

I found some of the naming a bit incosistent and unclear so just a small
attempt to clarify and tidy some of them. See what people think if my first
stab improves things or not.

Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>

Tvrtko Ursulin (5):
  drm/sched: Rename drm_sched_get_cleanup_job to be more descriptive
  drm/sched: Move free worker re-queuing out of the if block
  drm/sched: Rename drm_sched_free_job_queue to be more descriptive
  drm/sched: Rename drm_sched_run_job_queue_if_ready and clarify
    kerneldoc
  drm/sched: Drop suffix from drm_sched_wakeup_if_can_queue

 drivers/gpu/drm/scheduler/sched_entity.c |  4 +-
 drivers/gpu/drm/scheduler/sched_main.c   | 53 ++++++++++++------------
 include/drm/gpu_scheduler.h              |  2 +-
 3 files changed, 29 insertions(+), 30 deletions(-)

-- 
2.39.2

