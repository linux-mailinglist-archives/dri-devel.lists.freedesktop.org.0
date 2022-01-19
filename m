Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE814941E4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 21:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962D810E1B4;
	Wed, 19 Jan 2022 20:35:44 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C809C10E177;
 Wed, 19 Jan 2022 20:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642624542; x=1674160542;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UF9yAX42tg1nrhEU9onAxfuRO6sv1k85eL8CU6KKcZE=;
 b=mbRK4FnV43FlmTZwueJo4nxhvg0AwOR6MKCZ8vf2eGRm6OdOBhWPU4TM
 8taXkE4RlPLEnXYgIxui0JRMZFAMw1fDvDXL6fxH8Rf7seeJzse3T34IP
 Cd/I+HKodFQIU6HQd63sdE6KxbaRzWgtaDeqc0kr1kk7/sDepNHQXSSJB
 rc34Edo26L9+RPpoQsz/zXhu7ukp/f/KN6iEES6snmIrkQx7Ivp+wRABw
 h4OAY8roV89kld8w0gwKjht4kEFXhEcf5CmmbQxfvxQ2q/mpvC/vc7oat
 alcFyA7d/c++ZVZ0lQ1moKhVI+PHEGF2gStEIuQyCyXE248TnnZAPiy3O Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="245385330"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="245385330"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 12:35:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="561188542"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga001.jf.intel.com with ESMTP; 19 Jan 2022 12:35:41 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 0/2] Add support for querying hw info that UMDs need
Date: Wed, 19 Jan 2022 12:35:39 -0800
Message-Id: <20220119203541.2410082-1-John.C.Harrison@Intel.com>
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
Cc: Tony Ye <tony.ye@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Katarzyna Cencelewska <katarzyna.cencelewska@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org, Jason Ekstrand <jason.ekstrand@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Various UMDs require hardware configuration information about the
current platform. A bunch of static information is available in a
fixed table that can be retrieved from the GuC.

v2: Rebased to newer baseline and added a kerneldoc comment.
v3: Rebased to newer baseline and newer GuC interface.

Test-with: 20220119200137.2364940-2-John.C.Harrison@Intel.com
UMD: https://github.com/intel/compute-runtime/pull/432/files
UMD: https://github.com/intel/media-driver/pull/1239/files

CC: Katarzyna Cencelewska <katarzyna.cencelewska@intel.com>
CC: Tony Ye <tony.ye@intel.com>
CC: Jason Ekstrand <jason.ekstrand@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>


John Harrison (1):
  drm/i915/guc: Add fetch of hwconfig table

Rodrigo Vivi (1):
  drm/i915/uapi: Add query for hwconfig table

 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   3 +
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 151 ++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.h   |  19 +++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   6 +
 drivers/gpu/drm/i915/i915_query.c             |  23 +++
 include/uapi/drm/i915_drm.h                   |   1 +
 9 files changed, 209 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h

-- 
2.25.1

