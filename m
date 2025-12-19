Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59894CCEC25
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 08:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DB210EEC0;
	Fri, 19 Dec 2025 07:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mF+ZoXfm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2F710EEB9;
 Fri, 19 Dec 2025 07:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766128427; x=1797664427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=89OG130V5ci9MsUtVHkYlQ4lGqtgEtLjCcehycZjxr4=;
 b=mF+ZoXfmzT65DrTb/pemnsllZDIirZ7kLPec29h0ltPb6qC6WGNV7OLO
 cTO1bhjH3neyHFJ6sSb0Hc35eMC0FT6qHgMyLiTS1CvIj43ddzvKzrVJb
 V+jwG92OzaYIaKcnd9k7zJrchf//iyfk07ytKbolBdU3lis+eGu7aqWbX
 4izlOAA+Q5By5oxGuF95l5eeVAvRcE4f9uz3TV0rWOJh0kU0FZItwBY4d
 KZPxi+FeURTrwaNQX4oOi6k4NG5Kpa/hQEqr8WzTENxBH60JUl+nCMwaG
 z1a/CFU1RssjR1Zn3IZ4OtI3W33EKX1GEplA5g0frS5QGKDh+6/qM2oFu w==;
X-CSE-ConnectionGUID: yP0dyDuCRpi4HKA2mjWE7w==
X-CSE-MsgGUID: 8OjYHGrcRs64lNC3Ucbouw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93562406"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="93562406"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 23:13:47 -0800
X-CSE-ConnectionGUID: 35hMMhnRSOSNxGxxGr+CXA==
X-CSE-MsgGUID: Jlj26QYcSUCS0g0KW8X+wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="222209572"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 18 Dec 2025 23:13:43 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH 11/13] drm/vkms: Remove drm_colorop_pipeline_destroy() from
 vkms_destroy()
Date: Fri, 19 Dec 2025 12:26:12 +0530
Message-Id: <20251219065614.190834-12-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
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

Now that colorops are cleaned from drm_mode_config_cleanup(), remove
drm_colorop_pipeline_destroy() from  vkms_destroy().

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index dd1402f43773..351e17b5885c 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -258,7 +258,6 @@ void vkms_destroy(struct vkms_config *config)
 
 	fdev = config->dev->faux_dev;
 
-	drm_colorop_pipeline_destroy(&config->dev->drm);
 	drm_dev_unregister(&config->dev->drm);
 	drm_atomic_helper_shutdown(&config->dev->drm);
 	devres_release_group(&fdev->dev, NULL);
-- 
2.25.1

