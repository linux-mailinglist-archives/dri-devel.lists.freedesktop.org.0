Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7592C7887AA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3FB10E676;
	Fri, 25 Aug 2023 12:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CB310E677
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692967320; x=1724503320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RkM9FXbpxitLfEWm33Hbx3x4kDkzjJT2NnyihHaiN4E=;
 b=I7QgF2nxfpw2a3IFMgsjhmfH18s7iD5JrBx64GkzqOp/T1RaBhEQK5xu
 Mc39BddQ7UUgwsyW7PN3CayfF9ddQu1WUJrekhBIc4iLcrulazmqN4Y0V
 f69QLn4l7L5dpUcdFbOLFdzXEm4hEt8W46rcjDmpX4SPhfYFmmfAj7Yxr
 6JIp1BjeJUWo9nqgrbvUxUTFSypJaXDCdofRBA93VF+zpZh4SVC8AIy5v
 I39UTZijb/qGvhmrB0FVZyvwLtA7Kl3lvDMIby6vmBctvirYYIMC+ZuQs
 sec4OXgMpp3w/lQyb+81qqLqN1OdtsVZCJLfno2Qij8g0yZ1oU0/x1lrK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373573905"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="373573905"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 05:42:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="911272290"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="911272290"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 05:41:58 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] accel/ivpu: Move ivpu_fw_load() to ivpu_fw_init()
Date: Fri, 25 Aug 2023 14:41:31 +0200
Message-Id: <20230825124135.4086628-6-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230825124135.4086628-1-stanislaw.gruszka@linux.intel.com>
References: <20230825124135.4086628-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

ivpu_fw_load() doesn't have to be called separately in ivpu_dev_init().

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 4 ----
 drivers/accel/ivpu/ivpu_fw.c  | 6 +++---
 drivers/accel/ivpu/ivpu_fw.h  | 2 +-
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 5310b54f036d..fa0680ba9340 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -561,10 +561,6 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	if (ret)
 		goto err_ipc_fini;
 
-	ret = ivpu_fw_load(vdev);
-	if (ret)
-		goto err_job_done_thread_fini;
-
 	ret = ivpu_boot(vdev);
 	if (ret)
 		goto err_job_done_thread_fini;
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 9b6ecd3e9537..32a1ea322ca2 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -301,6 +301,8 @@ int ivpu_fw_init(struct ivpu_device *vdev)
 	if (ret)
 		goto err_fw_release;
 
+	ivpu_fw_load(vdev);
+
 	return 0;
 
 err_fw_release:
@@ -314,7 +316,7 @@ void ivpu_fw_fini(struct ivpu_device *vdev)
 	ivpu_fw_release(vdev);
 }
 
-int ivpu_fw_load(struct ivpu_device *vdev)
+void ivpu_fw_load(struct ivpu_device *vdev)
 {
 	struct ivpu_fw_info *fw = vdev->fw;
 	u64 image_end_offset = fw->image_load_offset + fw->image_size;
@@ -331,8 +333,6 @@ int ivpu_fw_load(struct ivpu_device *vdev)
 	}
 
 	wmb(); /* Flush WC buffers after writing fw->mem */
-
-	return 0;
 }
 
 static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_params *boot_params)
diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
index 8567fdf925fe..10ae2847f0ef 100644
--- a/drivers/accel/ivpu/ivpu_fw.h
+++ b/drivers/accel/ivpu/ivpu_fw.h
@@ -31,7 +31,7 @@ struct ivpu_fw_info {
 
 int ivpu_fw_init(struct ivpu_device *vdev);
 void ivpu_fw_fini(struct ivpu_device *vdev);
-int ivpu_fw_load(struct ivpu_device *vdev);
+void ivpu_fw_load(struct ivpu_device *vdev);
 void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *bp);
 
 static inline bool ivpu_fw_is_cold_boot(struct ivpu_device *vdev)
-- 
2.25.1

