Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 905E9984022
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015B910E650;
	Tue, 24 Sep 2024 08:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BybGNyyu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB6510E643
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165891; x=1758701891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7qSMR6VjTTnJgMsdFRYlyM95rHGrwazC3gefX1R/+Mw=;
 b=BybGNyyuWxawOLyFp3r60WoWTojPIpE5PRnvoJ8/f77nNDKTPQ4r2xm9
 0rfxt7nM8nhE8jKeIDa1hif7mmG553OnajgxcJI67qEuppobEXDkU9MOc
 3rQu83nQ2asOI7CkUlkARmiiOo6GUOkxhTlQBxYpcMGkS6+/hkDaQpBuP
 y3Msb9PRxJHfGWhdJxVWvYu7MZeEKoXRVNXQYPqeyYxYpTlmmS/6MObos
 4FzXobHRoCXpwrkb0jHiEKsztNKJ+sp2ZjVJHFJUL55b8luFkII0lRdwa
 /GtFXhIcniIhG8EKEmbjpiUhcZ9Q8UCpVRT0CAOTohv+23uepDmtYPaUm g==;
X-CSE-ConnectionGUID: oe7fIPsbRAWs04GhMNZAmg==
X-CSE-MsgGUID: q0+eutRtT3Oq27D2l9brig==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506888"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506888"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:10 -0700
X-CSE-ConnectionGUID: uUYvzYFfS1a4S55scUJIog==
X-CSE-MsgGUID: jbWaUTP1T7aSQ5CBT2iwqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170598"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:09 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 03/29] accel/ivpu: Reset fw log on cold boot
Date: Tue, 24 Sep 2024 10:17:28 +0200
Message-ID: <20240924081754.209728-4-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>

Add ivpu_fw_log_reset() that resets the read_index of all FW logs
on cold boot so logs are properly read.

Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw_log.c | 14 ++++++++++++++
 drivers/accel/ivpu/ivpu_fw_log.h |  1 +
 drivers/accel/ivpu/ivpu_pm.c     |  1 +
 3 files changed, 16 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_fw_log.c b/drivers/accel/ivpu/ivpu_fw_log.c
index 2f2d3242f21be..817210e35f70e 100644
--- a/drivers/accel/ivpu/ivpu_fw_log.c
+++ b/drivers/accel/ivpu/ivpu_fw_log.c
@@ -140,3 +140,17 @@ void ivpu_fw_log_clear(struct ivpu_device *vdev)
 	while (fw_log_ptr(vdev, vdev->fw->mem_log_verb, &next, &log_header) == 0)
 		log_header->read_index = log_header->write_index;
 }
+
+void ivpu_fw_log_reset(struct ivpu_device *vdev)
+{
+	struct vpu_tracing_buffer_header *log_header;
+	u32 next;
+
+	next = 0;
+	while (fw_log_ptr(vdev, vdev->fw->mem_log_crit, &next, &log_header) == 0)
+		log_header->read_index = 0;
+
+	next = 0;
+	while (fw_log_ptr(vdev, vdev->fw->mem_log_verb, &next, &log_header) == 0)
+		log_header->read_index = 0;
+}
diff --git a/drivers/accel/ivpu/ivpu_fw_log.h b/drivers/accel/ivpu/ivpu_fw_log.h
index ccef4298e45b5..a033ce2d642f6 100644
--- a/drivers/accel/ivpu/ivpu_fw_log.h
+++ b/drivers/accel/ivpu/ivpu_fw_log.h
@@ -27,6 +27,7 @@ extern unsigned int ivpu_fw_log_level;
 
 void ivpu_fw_log_print(struct ivpu_device *vdev, bool only_new_msgs, struct drm_printer *p);
 void ivpu_fw_log_clear(struct ivpu_device *vdev);
+void ivpu_fw_log_reset(struct ivpu_device *vdev);
 
 static inline void ivpu_fw_log_dump(struct ivpu_device *vdev)
 {
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 59d3170f5e354..3c36b55c01d51 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -37,6 +37,7 @@ static void ivpu_pm_prepare_cold_boot(struct ivpu_device *vdev)
 
 	ivpu_cmdq_reset_all_contexts(vdev);
 	ivpu_ipc_reset(vdev);
+	ivpu_fw_log_reset(vdev);
 	ivpu_fw_load(vdev);
 	fw->entry_point = fw->cold_boot_entry_point;
 }
-- 
2.45.1

