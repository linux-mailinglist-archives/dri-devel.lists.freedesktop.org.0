Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FE4D07EAB
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C47010E845;
	Fri,  9 Jan 2026 08:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ImwJMwKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309CA10E843;
 Fri,  9 Jan 2026 08:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767948228; x=1799484228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rq41zfSP03MhNq6GQpEBd5WlriLTY60hfX6Y1D+jPds=;
 b=ImwJMwKgbOn5kqXN+sr4WthhjNvp4eSawFmWqZTJQGttZOzZWJUGMnuC
 zdOLzaixCfTenSbDwppGxzTY55Iw0hAPxPrERZbC6Ww7YRFVn6S3+puUC
 ZKN2Vjcom+PlZtLegxRa9XFtaMT5udznUKqLxUGepPM+RFzZgHg5WRzA4
 ERg9IO9qM7UFZ5h3igX7V1Q2NIGnrVxrIcbUKQBHik1gImV86TChpFdZz
 XfqJDeQS2nd/JZ2MF3zxb43MvCuLnMtZgtviVOQuM4YL4AZcaj9bYQoIL
 ijuWtoxRapBEYlWXPs5YyoMVvfZA0c2nWtPf/lxyKOGvRn9s+VLu+VGUc g==;
X-CSE-ConnectionGUID: 9oO+DdDVR6K8Cf7xb114Yg==
X-CSE-MsgGUID: eC//ofS4QmmrAcnOIYNgDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69241470"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="69241470"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:43:48 -0800
X-CSE-ConnectionGUID: hcSOVQDETVCwoq1bOaXYaQ==
X-CSE-MsgGUID: 8zW62x/nQcGlB8dNS9KepA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="240924613"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa001.jf.intel.com with ESMTP; 09 Jan 2026 00:43:44 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH v2 11/13] drm/vkms: Remove drm_colorop_pipeline_destroy() from
 vkms_destroy()
Date: Fri,  9 Jan 2026 13:47:26 +0530
Message-Id: <20260109081728.478844-12-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
References: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
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
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 434c295f44ba..95020765c4c2 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -259,7 +259,6 @@ void vkms_destroy(struct vkms_config *config)
 
 	fdev = config->dev->faux_dev;
 
-	drm_colorop_pipeline_destroy(&config->dev->drm);
 	drm_dev_unregister(&config->dev->drm);
 	drm_atomic_helper_shutdown(&config->dev->drm);
 	devres_release_group(&fdev->dev, NULL);
-- 
2.25.1

