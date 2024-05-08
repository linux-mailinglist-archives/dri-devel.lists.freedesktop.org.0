Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D3F8BFEB4
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 15:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB45010FE23;
	Wed,  8 May 2024 13:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UemxrhEK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DDB10FE23
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 13:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715174762; x=1746710762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=knL7VQTw2101HDFMC3b28DO9zwRyaPIgNR00TWrKla8=;
 b=UemxrhEKepuwmsgnES6H0uz/4xRQcv9euRTWDwurW8WHvqFn6o5SwxtP
 p+a26HHpNogDxTVGH62QI8s6ZiMlIs++gpyLXmo4L61kMHK24D4nUqweJ
 umcra9zHYHesTH8wJiTvy34hduTZYTEBWxDjxcqdiV4Ui4iibs3D1kIZv
 5WJo1kwAm2CQg6+1p6TcMfEDE6FuzcbqukP0hbOtva8Jd0cdbK4ZFtfBp
 CdxxCripmphZ2Lz0TiYbU6UtY/Vgw7ebGQj43ELklQFl3M5Z0khf4VrGa
 XcsypPT/TE1MLaz/RLOpqpvmCXLMUT74X2ETzSEwwfZHUQRkt5oTdZD5B w==;
X-CSE-ConnectionGUID: W16MEkWZRLyZsaAwHCe04A==
X-CSE-MsgGUID: SaJ2SHe2TqmGFq/m8yHduQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11188700"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="11188700"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:26:01 -0700
X-CSE-ConnectionGUID: htmad5saS8q4qBtARrsjow==
X-CSE-MsgGUID: WpYx0ho3TuKG/SNNNKQdng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33721386"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:26:00 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 10/12] accel/ivpu: Configure fw logging using debugfs
Date: Wed,  8 May 2024 15:25:57 +0200
Message-ID: <20240508132557.2388267-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

Add fw_dyndbg file that can be used to control FW logging.

Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index 6ff967e595cf..b6c7d6a53c79 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -145,6 +145,30 @@ static const struct file_operations dvfs_mode_fops = {
 	.write = dvfs_mode_fops_write,
 };
 
+static ssize_t
+fw_dyndbg_fops_write(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
+{
+	struct ivpu_device *vdev = file->private_data;
+	char buffer[VPU_DYNDBG_CMD_MAX_LEN] = {};
+	int ret;
+
+	if (size >= VPU_DYNDBG_CMD_MAX_LEN)
+		return -EINVAL;
+
+	ret = strncpy_from_user(buffer, user_buf, size);
+	if (ret < 0)
+		return ret;
+
+	ivpu_jsm_dyndbg_control(vdev, buffer, size);
+	return size;
+}
+
+static const struct file_operations fw_dyndbg_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.write = fw_dyndbg_fops_write,
+};
+
 static int fw_log_show(struct seq_file *s, void *v)
 {
 	struct ivpu_device *vdev = s->private;
@@ -369,6 +393,8 @@ void ivpu_debugfs_init(struct ivpu_device *vdev)
 	debugfs_create_file("dvfs_mode", 0200, debugfs_root, vdev,
 			    &dvfs_mode_fops);
 
+	debugfs_create_file("fw_dyndbg", 0200, debugfs_root, vdev,
+			    &fw_dyndbg_fops);
 	debugfs_create_file("fw_log", 0644, debugfs_root, vdev,
 			    &fw_log_fops);
 	debugfs_create_file("fw_trace_destination_mask", 0200, debugfs_root, vdev,
-- 
2.43.2

