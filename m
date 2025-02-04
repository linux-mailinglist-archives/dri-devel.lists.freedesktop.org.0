Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADBBA26D83
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB67C10E5B0;
	Tue,  4 Feb 2025 08:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FhTnDGWf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895D310E5B0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 08:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738658788; x=1770194788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ARJfzb8gTwFBFIZrt7q1tm5aE7TS7P4MEWcvWlYfMmQ=;
 b=FhTnDGWfsIH8bER+QM1R4n2aro3lyLjQONnnkmzp01cBBG4rEaKT9wfL
 J7b9bSzFnxMoXRsXc42DzWtFiHlSKQ/9HZNpdpSYw9RoGGXCd3pQWfm02
 HQRQe8NgfZPiKFywkqG+CkKpxnZH64Q5QzFNDEFUysg/4HfLf3REvgS5/
 dlYB2OIpy0abWf/47g3GE6a7HYV+3RsyF/UQYyB34svz07MLvNk++Exin
 SXUKDTb7HV8COBZmJY9XFYJtCxVrG9ne3wVJ4q3YikB7Mbgcut+8TAA8Z
 XcU4C3Atz9wkpXe+wm3Y9KEwuq6Blaomshq7YcIzkscpx5GiWBuoOxw2K Q==;
X-CSE-ConnectionGUID: OhnF1289Q+iJykxogFrHwA==
X-CSE-MsgGUID: x29L6hyPSy6ez3mQRx1dIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39434713"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39434713"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:46:28 -0800
X-CSE-ConnectionGUID: qYhhbbyITmWgy2zwDYdO8g==
X-CSE-MsgGUID: xEzImW8FTQijQQVei4pK5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="115531570"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:46:26 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 1/6] accel/ivpu: Add missing locks around mmu queues
Date: Tue,  4 Feb 2025 09:46:17 +0100
Message-ID: <20250204084622.2422544-2-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
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

From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>

Multiple threads were accessing mmu cmd queue simultaneously
causing sporadic failures in ivpu_mmu_cmdq_sync() function.
Protect critical code with mmu mutex.

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_mmu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index b80bdded9fd79..5ea010568faa4 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -895,6 +895,9 @@ static int ivpu_mmu_evtq_disable(struct ivpu_device *vdev)
 
 void ivpu_mmu_discard_events(struct ivpu_device *vdev)
 {
+	struct ivpu_mmu_info *mmu = vdev->mmu;
+
+	mutex_lock(&mmu->lock);
 	/*
 	 * Disable event queue (stop MMU from updating the producer)
 	 * to allow synchronization of consumer and producer indexes
@@ -908,6 +911,8 @@ void ivpu_mmu_discard_events(struct ivpu_device *vdev)
 	ivpu_mmu_evtq_enable(vdev);
 
 	drm_WARN_ON_ONCE(&vdev->drm, vdev->mmu->evtq.cons != vdev->mmu->evtq.prod);
+
+	mutex_unlock(&mmu->lock);
 }
 
 int ivpu_mmu_disable_ssid_events(struct ivpu_device *vdev, u32 ssid)
@@ -920,6 +925,8 @@ int ivpu_mmu_disable_ssid_events(struct ivpu_device *vdev, u32 ssid)
 	if (ssid > IVPU_MMU_CDTAB_ENT_COUNT)
 		return -EINVAL;
 
+	mutex_lock(&mmu->lock);
+
 	entry = cdtab->base + (ssid * IVPU_MMU_CDTAB_ENT_SIZE);
 
 	val = READ_ONCE(entry[0]);
@@ -932,6 +939,8 @@ int ivpu_mmu_disable_ssid_events(struct ivpu_device *vdev, u32 ssid)
 	ivpu_mmu_cmdq_write_cfgi_all(vdev);
 	ivpu_mmu_cmdq_sync(vdev);
 
+	mutex_unlock(&mmu->lock);
+
 	return 0;
 }
 
-- 
2.45.1

