Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F0D8C406A
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 14:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C0710E721;
	Mon, 13 May 2024 12:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ddMK0yt2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA99710E720
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715601891; x=1747137891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=knL7VQTw2101HDFMC3b28DO9zwRyaPIgNR00TWrKla8=;
 b=ddMK0yt2PQreS3HCf5FzTaEvc0tY4uqfQmE+wJfXaS3fkYXbK47b3BrG
 O1C+jj5j/nycidSpjZD+VCL2UOTcDK28sVCaxTiaJQgFCM5Lre4jjsYwF
 IktFUjCp0HaolCZyLfMRzpegWUqe6+oyIvG6kRFB9ZBrIzn7sXbjQOy90
 teJefeVa+VkGTeUTBsBXz9DuATNYTLdQHusXWbQKyJNN/d7R9tknAwhgs
 Lh18gdCaygbpFevBjaDumwnQKLKhlJcOp+iz84Gq96JIpczzY7F2CwrWM
 GXxqoggG15LShC9HwbUe63ilmUKuzItRisyWqr42oiBssGjGUrx46q7KK g==;
X-CSE-ConnectionGUID: IXjP4jXNSvGGVCn2am7p/Q==
X-CSE-MsgGUID: 4FKYvGIURlWS7mao9hnSaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22131761"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22131761"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:50 -0700
X-CSE-ConnectionGUID: JTxaLjaERmSZTnYXOR3IxQ==
X-CSE-MsgGUID: 1X5Rb9MqRVC/UfJ8xWL9AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30341102"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:49 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 10/12] accel/ivpu: Configure fw logging using debugfs
Date: Mon, 13 May 2024 14:04:29 +0200
Message-ID: <20240513120431.3187212-11-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
References: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
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

