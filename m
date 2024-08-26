Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DE595F74A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 19:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E323810E252;
	Mon, 26 Aug 2024 17:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRDZ/nE0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF5E10E132;
 Mon, 26 Aug 2024 17:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724691650; x=1756227650;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2m7gLVc40hKZK9gXAV0BKvSP+20Bds0cGQ5HurMwdd8=;
 b=LRDZ/nE0TQo8R7K8xGTLMz27rmLc9J8/5NynDasAR3vw6jeCGtYT9NNr
 dcvoA52AE3k79cvfjnDS9vhIkZXRBOEoLR+5WS60EZ/s3+C47AavERssw
 E5SrcgOh9Aqou0uPPZUk+YVhRpqRnIJbdQZeIr+pY6bhKFu/BVncYlxjf
 GWvjbeL9vMGsWDbrUZo2Tz4mL0y7kw1ONcUB4D5Wb5zor/qWmS5tQCT5m
 ozYUXYsHPwTn89GgCwchD2uQoWjpEknva1kQ3+YjpEW8ZYRRWmCK4L2JX
 jEbj2+GJwyeBUqy5jeczUnEgfSnpbocZ2PwoDprBr6NwuuFKU7vYfOkL0 Q==;
X-CSE-ConnectionGUID: q8/Q45a3TJmXbb8W2TDLBg==
X-CSE-MsgGUID: wr4+E89pRU++X5BZsiYaew==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22997988"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="22997988"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 10:00:50 -0700
X-CSE-ConnectionGUID: UNkgGQhJQGSon3ON/q/2PA==
X-CSE-MsgGUID: yVOB4ODqQWmFPaCCRi2Pvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="62247116"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 10:00:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v2 0/2] Split out dma fence array and invalidate media_gt TLBs
 in PT code
Date: Mon, 26 Aug 2024 10:01:42 -0700
Message-Id: <20240826170144.2492062-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Respin of [1] [2] based on CI and review feedback.

v2:
 - Send correct code

Matt

Matthew Brost (2):
  dma-buf: Split out dma fence array create into alloc and arm functions
  drm/xe: Invalidate media_gt TLBs in PT code

 drivers/dma-buf/dma-fence-array.c |  78 ++++++++++++++------
 drivers/gpu/drm/xe/xe_pt.c        | 117 ++++++++++++++++++++++++------
 include/linux/dma-fence-array.h   |   6 ++
 3 files changed, 159 insertions(+), 42 deletions(-)

-- 
2.34.1

