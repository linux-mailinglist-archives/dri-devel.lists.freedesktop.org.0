Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B89CD14B1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103B010F063;
	Fri, 19 Dec 2025 18:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l60y6I/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6AB10E023;
 Fri, 19 Dec 2025 18:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766167690; x=1797703690;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jht2MjY/VFdXOdPGuP5Fi2zO/mBfd6eoUOR+8HhJ/2c=;
 b=l60y6I/AsYujMywfNV80fANIQ5Yvfs4s1QY/1FnhLMcb72zfxldXhqmc
 Zp3Sk3w9HOekqA5sF99f/4l6lm+izQRoTMleBUPTPic8ycdG0zK+2Iz4b
 Liaca//sdLu6JCOlKP/6DMXQ8rrFsPGMpUgstiVc3A9f9+3Cvy8SIkGH8
 8GzK+8pEoFi4fXuIXg7cx3Pw8w+RkLVUyftWMoDDoiTDy/w1nsPHsz+IL
 Vk0z4W08jrDuKcilaZOB7Rtld5ZrY5FnZfxHkgQvE5K4ahYSB9glCwGOl
 xpQ0eNnOPo59pIYK97YkD1MRGcnYy/SBV65hFzuZIPQi7CY5COhNByh8P Q==;
X-CSE-ConnectionGUID: dOfZNZIGSEiz/5cnYQ9iOg==
X-CSE-MsgGUID: 2haKirV8Q32lKtn3jCqp+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="71990671"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="71990671"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 10:08:09 -0800
X-CSE-ConnectionGUID: cezyj8qiSXSmlBali5BqlA==
X-CSE-MsgGUID: Rk97ZkTeTVqd11Z3T3M69w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="199403509"
Received: from osgcshtiger.sh.intel.com ([10.239.70.161])
 by fmviesa009.fm.intel.com with ESMTP; 19 Dec 2025 10:08:08 -0800
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Xin Wang <x.wang@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/buddy: Free free_trees array in drm_buddy_fini()
Date: Fri, 19 Dec 2025 18:08:04 +0000
Message-Id: <20251219180804.162756-1-jia.yao@intel.com>
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

drm_buddy_fini() currently frees each element of mm->free_trees but
does not release the free_trees array itself, causing a memory leak.

Signed-off-by: Jia Yao <jia.yao@intel.com>
Cc: Xin Wang <x.wang@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/drm_buddy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 2f279b46bd2c..8308116058cc 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -420,6 +420,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
 
 	for_each_free_tree(i)
 		kfree(mm->free_trees[i]);
+	kfree(mm->free_trees);
 	kfree(mm->roots);
 }
 EXPORT_SYMBOL(drm_buddy_fini);
-- 
2.34.1

