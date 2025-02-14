Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CE4A36705
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 21:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CB710ED3C;
	Fri, 14 Feb 2025 20:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdyhEp02";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AC010E033;
 Fri, 14 Feb 2025 20:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739565479; x=1771101479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yLkA63pWEuHIxVd+Aqxf5KHGaRG+CZFv2sjkIZXwuBY=;
 b=hdyhEp02Kk2zqpYnCYINjpRvpsxh78tbmmozANez9sp87dhuzvOMhF1R
 DcTMPkhpImBmQjwzL+tgesrE79DJOyZleLg/9zqSPpuG5ewy1mwW1019x
 sKkMkQQQQ8VwJgCIHlfdWufvbgLsf5Z/97QTt3eDiPIj581iE6cl3NZs7
 Rd3eOA/vC4edIiASh87j7dGwe/aaBC8GGzhsCfn4Jv/+sB2XA5dk1Qnfs
 HPjFLNGdsYUitD+9gBw1/BO8Yt2DnqYyMlx2K/j09hfVstAfM0+OQo7zd
 W/6Blf35XB8ZZThvi6NgRsN4aXyheN+jLLWyqJyK385jvJYilVOT9kTuy g==;
X-CSE-ConnectionGUID: IJUA01mwTFWN5Hd+LIUWKA==
X-CSE-MsgGUID: vIOOaLnfSPmGip5xqpyBDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39558861"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="39558861"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 12:37:59 -0800
X-CSE-ConnectionGUID: fEOZO7L7TkOaO6LSfJFosw==
X-CSE-MsgGUID: gQTWyc1KTPi26X0EbvqMxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118760807"
Received: from dut4066lnl.fm.intel.com ([10.105.8.61])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 12:37:58 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jonathan.cavitt@intel.com,
 saurabhg.gupta@intel.com, alex.zuo@intel.com, joonas.lahtinen@intel.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com
Subject: [PATCH 0/4] drm/xe/xe_drm_client: Add per drm client reset stats
Date: Fri, 14 Feb 2025 20:37:53 +0000
Message-ID: <20250214203757.27895-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add additional information to drm client so it can report the last 50
exec queues to have been banned on it, as well as the last pagefault
seen when said exec queues were banned. Since we cannot reasonably
associate a pagefault to a specific exec queue, we currently report the
last seen pagefault on the associated hw engine instead.

The last pagefault seen per exec queue is saved to the hw engine, and the
pagefault is updated during the pagefault handling process in
xe_gt_pagefault. The last seen pagefault is reset when the engine is
reset because any future exec queue bans likely were not caused by said
pagefault after the reset.

Also add a tracker that counts the number of times the drm client has
experienced an engine reset.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Jonathan Cavitt (4):
  drm/xe/xe_exec_queue: Add ID param to exec queue struct
  drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
  FIXME: drm/xe/xe_drm_client: Add per drm client pagefault info
  drm/xe/xe_drm_client: Add per drm client reset stats

 drivers/gpu/drm/xe/xe_drm_client.c       | 130 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h       |  38 +++++++
 drivers/gpu/drm/xe/xe_exec_queue.c       |   8 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c     |  46 ++++----
 drivers/gpu/drm/xe/xe_gt_pagefault.h     |  51 +++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       |  19 ++++
 drivers/gpu/drm/xe/xe_hw_engine.c        |   4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |   8 ++
 9 files changed, 279 insertions(+), 27 deletions(-)

-- 
2.43.0

