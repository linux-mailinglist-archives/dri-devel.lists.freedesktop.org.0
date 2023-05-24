Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5353970EFDE
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 09:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFDE10E58E;
	Wed, 24 May 2023 07:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5651410E58D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 07:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684914610; x=1716450610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S3RUV3y2rQeDCchkY8N1Dx+bCle0f0MBaGDGKXOy8cU=;
 b=AlrsS9zUnNWFyVtXEVKcdxEaMcytxmg1/To8CB1X0wMy+CoOWbB55+Et
 bbOTgX8kQSVQB/rBpB8Qs3GNNMKNE2AIxH1zmbkVd8a29QjdYgKpNzpXc
 VzTBzDx+MCwlgvIJDVKIxwXkF4v4AN+hiRC/FGqyaPPa3dYGlL4VEI+W7
 wLgdKUkCCsYUptXDBGBLuxLhJyqR/ZYyMMsDKmBpBbIjEGGw0guMLVTFk
 +wlIM8zLtGSX8DRv4Sr9pBvwQ82EgjDFarI9I8ZzAuq1icM6qwnEh8kuL
 4+VjQFccj1fQx2IHv0hX7uFhrHAXOPQMPQ2y7iAxvS6pKKSR64QKZS5tj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="419200857"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="419200857"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 00:49:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="681767758"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="681767758"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 00:49:55 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] accel/ivpu: Add fw_name file to debugfs
Date: Wed, 24 May 2023 09:48:47 +0200
Message-Id: <20230524074847.866711-6-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230524074847.866711-1-stanislaw.gruszka@linux.intel.com>
References: <20230524074847.866711-1-stanislaw.gruszka@linux.intel.com>
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
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>

Add information about currently used firmware, makes test
automation of different firmware images easier.

Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index e2502d2b53c0..5e5996fd4f9f 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -27,6 +27,15 @@ static int bo_list_show(struct seq_file *s, void *v)
 	return 0;
 }
 
+static int fw_name_show(struct seq_file *s, void *v)
+{
+	struct drm_info_node *node = (struct drm_info_node *)s->private;
+	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
+
+	seq_printf(s, "%s\n", vdev->fw->name);
+	return 0;
+}
+
 static int fw_trace_capability_show(struct seq_file *s, void *v)
 {
 	struct drm_info_node *node = (struct drm_info_node *)s->private;
@@ -97,6 +106,7 @@ static int reset_pending_show(struct seq_file *s, void *v)
 
 static const struct drm_info_list vdev_debugfs_list[] = {
 	{"bo_list", bo_list_show, 0},
+	{"fw_name", fw_name_show, 0},
 	{"fw_trace_capability", fw_trace_capability_show, 0},
 	{"fw_trace_config", fw_trace_config_show, 0},
 	{"last_bootmode", last_bootmode_show, 0},
-- 
2.25.1

