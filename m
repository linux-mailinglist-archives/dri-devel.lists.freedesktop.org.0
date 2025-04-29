Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66176AA113F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 18:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CE410E4FF;
	Tue, 29 Apr 2025 16:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bSsLoDY9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9D910E517;
 Tue, 29 Apr 2025 16:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745942896; x=1777478896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JGE2d/h4hssdD4B5UVkUEp106DPIMiCFzB2ZD65yiQo=;
 b=bSsLoDY9NlLmJnKfP//h/NkQLALZa3xyX+SlVvoUwd0f38j3i6CNeAde
 g8g45ezl6O02HkE45aywzbwNSEa9vrDS0ablkRctgawA85Am14JhGjtd3
 BJu9Pfkj4ZMj+psaJwJCgZgB1gK22XrGGRvzJzFO+5SLvTnSwHs1M28Ph
 DM9/1eOH2LToMhLI7Q9tKbtSFk2fXeRklkDVTY73mQq99W5xrpzRVQtrE
 eJLkkVKXKxLvG8WNvj+JpyJtLdtOSyaPEfITgDsTYUjiRzxkTGklZqV8Y
 3LakvChx+mvl4gZQbFKcspgON2EAO0P5ZD6nSSkxx8xt/prVl9th7yt9Z A==;
X-CSE-ConnectionGUID: PKrqh16cSx+dxrML1ddzOw==
X-CSE-MsgGUID: sRCeQKWrR4epC1tsE1l9Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47585507"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="47585507"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 09:08:16 -0700
X-CSE-ConnectionGUID: nUvf9suETHyAlEJk8saGtA==
X-CSE-MsgGUID: dIDQv4YrRkyhPxd00CwJug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="139055952"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 09:08:14 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [RFC 8/9] drm/xe/xe_late_bind_fw: Introduce debug fs node to disable
 late binding
Date: Tue, 29 Apr 2025 21:39:55 +0530
Message-Id: <20250429160956.1014376-9-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429160956.1014376-1-badal.nilawar@intel.com>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
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

Introduce a debug filesystem node to disable late binding fw reload
during the system or runtime resume. This is intended for situations
where the late binding fw needs to be loaded from user mode.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c            | 42 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.c       |  3 ++
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  2 ++
 3 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d0503959a8ed..7f238a9e1a49 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -185,12 +185,51 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	return size;
 }
 
+static ssize_t disable_late_binding_show(struct file *f, char __user *ubuf,
+					 size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	struct xe_late_bind *late_bind = &xe->late_bind;
+	char buf[32];
+	int len;
+
+	len = scnprintf(buf, sizeof(buf), "%d\n", late_bind->disable);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t disable_late_binding_set(struct file *f, const char __user *ubuf,
+					size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	struct xe_late_bind *late_bind = &xe->late_bind;
+	u32 uval;
+	ssize_t ret;
+
+	ret = kstrtouint_from_user(ubuf, size, sizeof(uval), &uval);
+	if (ret)
+		return ret;
+
+	if (uval > 1)
+		return -EINVAL;
+
+	late_bind->disable = (uval == 1) ? true : false;
+
+	return size;
+}
+
 static const struct file_operations wedged_mode_fops = {
 	.owner = THIS_MODULE,
 	.read = wedged_mode_show,
 	.write = wedged_mode_set,
 };
 
+static const struct file_operations disable_late_binding_fops = {
+	.owner = THIS_MODULE,
+	.read = disable_late_binding_show,
+	.write = disable_late_binding_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -211,6 +250,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("wedged_mode", 0600, root, xe,
 			    &wedged_mode_fops);
 
+	debugfs_create_file("disable_late_binding", 0600, root, xe,
+			    &disable_late_binding_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 7d2bc959027d..1626cf793b23 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -111,6 +111,9 @@ int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
 	if (!late_bind->component_added)
 		return -EINVAL;
 
+	if (late_bind->disable)
+		return 0;
+
 	for (id = 0; id < MAX_ID; id++) {
 		lbfw = &late_bind->late_bind_fw[id];
 		if (lbfw->valid) {
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index ea11061ce556..ccd482e67f91 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -90,6 +90,8 @@ struct xe_late_bind {
 	/** @late_bind.late_bind_fw: late binding firmwares */
 	struct xe_late_bind_fw late_bind_fw[MAX_ID];
 
+	/** @late_bind.disable to block late binding reload during pm resume flow*/
+	bool disable;
 };
 
 #endif
-- 
2.34.1

