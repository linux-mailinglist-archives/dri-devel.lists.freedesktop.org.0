Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B1CA33068
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 21:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E80C10E984;
	Wed, 12 Feb 2025 20:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVAA95x4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B783F10E97E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 20:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739390768; x=1770926768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XTmQJPQ5vx5r/L8CDAB6q56EodWAZR1tsyiCvS/EAl4=;
 b=eVAA95x4DxcEHjLmU6I42W5YCzufCkAZYw4lEH18OcF6WOpt98fNMVW2
 mHGMznI3K/H+cfVnmifKSseJWIVQrP2MojgAgkFnEiRf+gAdx3unGhd9Y
 3kYXB+sUqZqCRb93DPSRYihvrqiiocNftpdOvX7KeHtfoC/NxRSdC3mLI
 xjlTfVDH+9rNRcvI3yJrg+wxMINojfKZFW7XR09dNyJcJtQVXrKH7etVF
 47QytfWVs/FGcn2rXtINmmAn019mCxJuec4uMzx74kpZGb+cz3CQEITk8
 U48Yb7npIWVrSgmty2sNTPR+jkQkc8z1+jq+gJpkjrfKBx0kWPiywa3Vy A==;
X-CSE-ConnectionGUID: G9/UqOYkSuCi3aYvSoiGNA==
X-CSE-MsgGUID: RhJgSP0HSreOterY/zKBfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="50718503"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="50718503"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:06:08 -0800
X-CSE-ConnectionGUID: COHXL0iVRKaHteebi5GiEA==
X-CSE-MsgGUID: yztDUGpISz2+Sf8zHaaz4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="118010764"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:06:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 4/6] drm/xe: Stop setting drvdata to NULL
Date: Wed, 12 Feb 2025 12:05:40 -0800
Message-ID: <20250212200542.515493-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212200542.515493-1-lucas.demarchi@intel.com>
References: <20250212200542.515493-1-lucas.demarchi@intel.com>
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

PCI subsystem is not supposed to call the remove() function when probe
fails and doesn't need a protection for that. The only places checking
for NULL drvdata, is on 2 sysfs files and they shouldn't be needed since
the files are removed and reads on open fds just return an error.

Remove the setting to NULL so it's possible to obtain the xe pointer
from callbacks like the component unbind from device_unbind_cleanup(),
i.e. after xe_pci_remove() already finished.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 6 ------
 drivers/gpu/drm/xe/xe_pci.c          | 7 +------
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 7375937934fae..7efbd4c52791c 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -32,9 +32,6 @@ vram_d3cold_threshold_show(struct device *dev,
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	int ret;
 
-	if (!xe)
-		return -EINVAL;
-
 	xe_pm_runtime_get(xe);
 	ret = sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
 	xe_pm_runtime_put(xe);
@@ -51,9 +48,6 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
 	u32 vram_d3cold_threshold;
 	int ret;
 
-	if (!xe)
-		return -EINVAL;
-
 	ret = kstrtou32(buff, 0, &vram_d3cold_threshold);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 70b697fde5b96..41ec6825b9bcc 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -770,11 +770,7 @@ static int xe_info_init(struct xe_device *xe,
 
 static void xe_pci_remove(struct pci_dev *pdev)
 {
-	struct xe_device *xe;
-
-	xe = pdev_to_xe_device(pdev);
-	if (!xe) /* driver load aborted, nothing to cleanup */
-		return;
+	struct xe_device *xe = pdev_to_xe_device(pdev);
 
 	if (IS_SRIOV_PF(xe))
 		xe_pci_sriov_configure(pdev, 0);
@@ -784,7 +780,6 @@ static void xe_pci_remove(struct pci_dev *pdev)
 
 	xe_device_remove(xe);
 	xe_pm_runtime_fini(xe);
-	pci_set_drvdata(pdev, NULL);
 }
 
 /*
-- 
2.48.1

