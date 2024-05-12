Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC7F8C3720
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 17:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E61310E2F1;
	Sun, 12 May 2024 15:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOq9uKUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB0A10E2CF;
 Sun, 12 May 2024 15:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715528197; x=1747064197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bgkLgGVBN1X+G4AcO3iprTd4Lp+rZcXDf1rU9vl2ShI=;
 b=WOq9uKUyZXvtjWT64wdjR40QgtLyvoRTyKH9b9FxJd4I/PHBNVtYHpkH
 skePHVCmcpB5v/1XZPwcYTl953F3UyHABpcuFY8OIHA+jnAfHG5/g8JK2
 CTIjUypTwK4kWz7SoBSPdItmgvWESyl9TtS3mfDpl7/2uINqDifESJA3B
 BXEo2eemDv+AVKDYgjtDud5aoVv91Imaqq0pkAeagShiyBSlofMm/aJ3B
 aBCruVHDPI5e7AXqwBsZwQlLjuPYhXHQQAGMCU7KGNMuhkplVfL3cuJ4i
 PIAa3o+9zTUlU9TSWakN9SRTrpzBR2R3ZPXfPbFnPgh8wuoIO9miub5Ld g==;
X-CSE-ConnectionGUID: 17lLujIeQPmXFY7Oyl3mqw==
X-CSE-MsgGUID: OZSm+fk0SliXb5uOxeKMpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11403316"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="11403316"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:36:37 -0700
X-CSE-ConnectionGUID: m3n46GydTXuj/s+gNmxweg==
X-CSE-MsgGUID: /j/BC61GQnKijWeCcPqVRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="34976587"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:36:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, linux-fsdevel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/xe/guc: Expose raw access to GuC log over debugfs
Date: Sun, 12 May 2024 17:36:06 +0200
Message-Id: <20240512153606.1996-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240512153606.1996-1-michal.wajdeczko@intel.com>
References: <20240512153606.1996-1-michal.wajdeczko@intel.com>
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

We already provide the content of the GuC log in debugsfs, but it
is in a text format where each log dword is printed as hexadecimal
number, which does not scale well with large GuC log buffers.

To allow more efficient access to the GuC log, which could benefit
our CI systems, expose raw binary log data.  In addition to less
overhead in preparing text based GuC log file, the new GuC log file
in binary format is also almost 3x smaller.

Any existing script that expects the GuC log buffer in text format
can use command like below to convert from new binary format:

	hexdump -e '4/4 "0x%08x " "\n"'

but this shouldn't be the case as most decoders expect GuC log data
in binary format.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
Cc: linux-fsdevel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index d3822cbea273..53fea952344d 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -8,6 +8,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
 
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
@@ -52,6 +53,29 @@ static const struct drm_info_list debugfs_list[] = {
 	{"guc_log", guc_log, 0},
 };
 
+static ssize_t guc_log_read(struct file *file, char __user *buf, size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file);
+	struct dentry *uc_dent = dent->d_parent;
+	struct dentry *gt_dent = uc_dent->d_parent;
+	struct xe_gt *gt = gt_dent->d_inode->i_private;
+	struct xe_guc_log *log = &gt->uc.guc.log;
+	struct xe_device *xe = gt_to_xe(gt);
+	ssize_t ret;
+
+	xe_pm_runtime_get(xe);
+	ret = xe_map_read_from(xe, buf, count, pos, &log->bo->vmap, log->bo->size);
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
+static const struct file_operations guc_log_ops = {
+	.owner		= THIS_MODULE,
+	.read		= guc_log_read,
+	.llseek		= default_llseek,
+};
+
 void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
 {
 	struct drm_minor *minor = guc_to_xe(guc)->drm.primary;
@@ -72,4 +96,6 @@ void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
 	drm_debugfs_create_files(local,
 				 ARRAY_SIZE(debugfs_list),
 				 parent, minor);
+
+	debugfs_create_file("guc_log_raw", 0600, parent, NULL, &guc_log_ops);
 }
-- 
2.43.0

