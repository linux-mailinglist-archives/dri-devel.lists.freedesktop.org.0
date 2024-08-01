Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA32944F7E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 17:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4078610E033;
	Thu,  1 Aug 2024 15:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lG1caEJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CEE10E033;
 Thu,  1 Aug 2024 15:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722526831; x=1754062831;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pHFG42LyKSRuBafIP8HqoYW1DbsSQ57JPAuadFIeowU=;
 b=lG1caEJicMAnFNz6883ZZFC3YLyevHd03Z5POa/UsdkME+Glsh4GPxog
 lauH/zJrVozFT3cjEP+WeVggeax8wYpoWl2SWOrHeIkQFsNSZ9SbCCueC
 5pkfvhJgNui/Rt6t+1vM01ar2zNqTFAZZaB9wHhDPbNYyl1bDc1olhZcC
 TNki5V1s5Ug+Gpt0kCdP9wwkzUm+1SgYtvo/kFcCqccPnTMEr6ewVQsJ8
 U81FZds4o/N91uZgghP5wh4u5uvfaKD5LWXdTmdGwLtjJsB7N654j/NT6
 X4fm6d0chXBiD0RqOunb5zSyUtb8eKE2j7YXxNtgu3I2yIJKX+cdV/8Ar g==;
X-CSE-ConnectionGUID: oK5CT7LURP6tAwhDdXt2lQ==
X-CSE-MsgGUID: EnMKTCvGSXqCJ3d5sczC3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="23407964"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="23407964"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 08:40:31 -0700
X-CSE-ConnectionGUID: +vFZ/WbgQG6o41d6ki+qYA==
X-CSE-MsgGUID: ejLFSmfiRs+kNmxYMr/Asg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55047748"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 08:40:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH v5 0/3] Faster devcoredump and fixes
Date: Thu,  1 Aug 2024 08:41:15 -0700
Message-Id: <20240801154118.2547543-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Combine [1] [2] for complete series to speedup devcoredump and fix it.

[1] https://patchwork.freedesktop.org/series/136541/
[2] https://patchwork.freedesktop.org/series/136545/

Matthew Brost (3):
  drm/xe: Take ref to VM in delayed snapshot
  drm/printer: Allow NULL data in devcoredump printer
  drm/xe: Faster devcoredump

 drivers/gpu/drm/drm_print.c               |  13 ++-
 drivers/gpu/drm/xe/xe_devcoredump.c       | 111 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   8 ++
 drivers/gpu/drm/xe/xe_lrc.c               |  15 ++-
 include/drm/drm_print.h                   |  54 ++++++++++-
 5 files changed, 163 insertions(+), 38 deletions(-)

-- 
2.34.1

