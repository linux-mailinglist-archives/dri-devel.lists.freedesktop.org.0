Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FA8913148
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 03:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7899010EC5E;
	Sat, 22 Jun 2024 01:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVx5BRhP";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E544510E176;
 Sat, 22 Jun 2024 01:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719018337; x=1750554337;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zhho/GLWTYUbJrup7fxKqdxHeQ58Ks+gePeMIENpzkI=;
 b=IVx5BRhP4/FC5ddDilfcmSnvnsgxmMzaV3LGbc4ik/8l4ssmxy4ENqaM
 9vR7fDn3R8bvnZk4chX4ghxK/Y/5Rru49BU4XHN+76GxVLl9Ow1GroepU
 czj5HGzIrSLYq+IrG7RnS5vEvy64GGmojuQ+YfyhEcvmNPT5RV45KyGt5
 u23n5TL7Xh7IUEXYNxMaopLZL1IDZqNouufP+r8j5t0zIPpZd4vOeOShV
 z+jkyKH6GHoKTR6/mJgmK0cr5ySGyJbRck0LsYbX2LO4wo/WrQjgO7O7X
 bhszNX+6mTgoLH8mQ0uaHsQD8HWmlC9sFxcymed9hmu+hXbyBqqw69Gsi Q==;
X-CSE-ConnectionGUID: 2tHkDWQSTcuNRx9sN03WrA==
X-CSE-MsgGUID: GEUdC/4jQ7mL6wlHPcaEfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15828210"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="15828210"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 18:05:36 -0700
X-CSE-ConnectionGUID: Dxj4qgRtSO6e45r9YAdCGQ==
X-CSE-MsgGUID: IPTaqB2YTR+qrWxQ7jC8DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="47692094"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa005.jf.intel.com with ESMTP; 21 Jun 2024 18:05:35 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/3] [CI] Extend Wa14019159160 and enable for ARL and DG2
Date: Fri, 21 Jun 2024 18:05:31 -0700
Message-ID: <20240622010534.665008-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The context switch out workaround requires an extra piece on top.
Also, it applies to more platforms.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (3):
  drm/i915/arl: Enable Wa_14019159160 for ARL
  drm/i915/guc: Extend w/a 14019159160
  drm/i915/dg2: Enable Wa_14019159160 for DG2

 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  3 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 19 ++++++++++---------
 3 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.43.2

