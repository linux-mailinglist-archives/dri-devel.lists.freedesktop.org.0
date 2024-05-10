Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57AA8C2046
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 11:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D864110E2BF;
	Fri, 10 May 2024 09:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aSSWfOID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F51410E2BF
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 09:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715332199; x=1746868199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=88YoMscr2dmPpOePBfuqIPHXgMNkQ/NKxY0BLVbDzh0=;
 b=aSSWfOIDKd5dIoSc6NgCFW7bVGehnK1SL0Cg6PbKhg55U4bGj5Ss/SE2
 prY/53pOMrDuQXVfDViM4YV06aDbIVwtFdK0mmZhevuICqOG2VW7Q9WmU
 HgIca3siF87U9f61tP8csnO+u8HsvyhdDafk+nS5i2lmKmeGNXb2OJH9E
 DVYBuH1+wD/sXBhnZ2a0NborWrus2Qgdq7/BDm/IMdpnEkEQIPOWGK0lB
 J3GW2rDnsjAZWJW8kVpInSlOh1WmidRRGUGyyaVBMo+b+O4UTmhRGteE7
 kKwbS5XBtFevoN0Mjj/FjqVrLSoO7/AN1Ov06sONwxPUt3sfCAIur6DFx Q==;
X-CSE-ConnectionGUID: MKvFdZy0QS6OEwc2nUQmZQ==
X-CSE-MsgGUID: zOwWLkAjTWCmHJq8gAQMLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11136560"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="11136560"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 02:09:58 -0700
X-CSE-ConnectionGUID: YdramUcgQQqkq5KdZ3LSjQ==
X-CSE-MsgGUID: VnT2Sy8vRp6eo3M0si7jHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="29656718"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 02:09:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Steven Price <steven.price@arm.com>
Subject: [PATCH] drm: use "0" instead of "" for deprecated driver date
Date: Fri, 10 May 2024 12:09:51 +0300
Message-Id: <20240510090951.3398882-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

libdrm does not like the empty string for driver date. Use "0" instead,
which has been used by virtio previously.

Reported-by: Steven Price <steven.price@arm.com>
Closes: https://lore.kernel.org/r/9d0cff47-308e-4b11-a9f3-4157dc26b6fa@arm.com
Fixes: 7fb8af6798e8 ("drm: deprecate driver date")
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_ioctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 89feb7306e47..51f39912866f 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -530,9 +530,9 @@ int drm_version(struct drm_device *dev, void *data,
 	err = drm_copy_field(version->name, &version->name_len,
 			dev->driver->name);
 
-	/* Driver date is deprecated. Return the empty string. */
+	/* Driver date is deprecated. Userspace expects a non-empty string. */
 	if (!err)
-		err = drm_copy_field(version->date, &version->date_len, "");
+		err = drm_copy_field(version->date, &version->date_len, "0");
 	if (!err)
 		err = drm_copy_field(version->desc, &version->desc_len,
 				dev->driver->desc);
-- 
2.39.2

