Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP/MOeJvjGlmngAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 13:02:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80D01240D1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 13:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C7510E1D4;
	Wed, 11 Feb 2026 12:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2ZUVoWW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCECF10E149;
 Wed, 11 Feb 2026 12:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770811352; x=1802347352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=abP47NeL1UWcSwSKRtAl8LxUFchpEAPMPpfK/wQrQO8=;
 b=l2ZUVoWWMmFn7HaFF7FwUM1LXbIElBtc8KFcPeKDmbXbGskzx9QiPLxO
 sgFLe0gvZeUEWPRxTYwy/LDtZg08HqiM3PHOfcl4R34AO7b122jjkrdIW
 hLCjQkneRFhVaufAlKdFvlUO8wVotXK27gfFmTSLUQJEPuEF2uLCeH8YT
 pj8p1oo9p3fzbp9tB82r1RhFEbEIIDr0KfyAN+gs5y0F90mymb34BemFi
 ChxcuzWZLLeCc7WIlHaldNvABlhakCWQa9cc3KctHXxgTyGNVl2KZ6ePt
 r+u8NpmSPXkLNl2/nBTWkTyYPzCGLflsCaZUFNJG/FiwCfGwHWRjhVNwu Q==;
X-CSE-ConnectionGUID: EFGSOZwdRgeVv3w06Pe1kg==
X-CSE-MsgGUID: e6MYuLgJQna/BoZVayWWdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71854657"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71854657"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:02:02 -0800
X-CSE-ConnectionGUID: utsLtf/ATjulE+MRDpH+Dg==
X-CSE-MsgGUID: L7heYfEGQ0iOxfmAzrRZ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="235210796"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2026 04:01:57 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Cc: andrealmeid@igalia.com, christian.koenig@amd.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, mripard@kernel.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 4/4] drm/xe/debugfs: Add interface to trigger critical error
 handler
Date: Wed, 11 Feb 2026 17:29:51 +0530
Message-ID: <20260211115946.2014051-10-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211115946.2014051-6-mallesh.koujalagi@intel.com>
References: <20260211115946.2014051-6-mallesh.koujalagi@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[igalia.com,amd.com,gmail.com,ffwll.ch,kernel.org,intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mallesh.koujalagi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A80D01240D1
X-Rspamd-Action: no action

Add a debugfs interface to manually trigger the critical error handler
for testing cold reset recovery paths. This is useful for validating
the error recovery mechanism.

The new debugfs entry 'trigger_critical_error' is located at:
  /sys/kernel/debug/dri/N/trigger_critical_error

Reading the file displays usage instructions. Writing '1' invokes
xe_critical_error_handler(), which marks the device as wedged with
DRM_WEDGE_RECOVERY_COLD_RESET method and sends a uevent to userspace
indicating that a complete device power cycle is required for recovery.

Writing '0' or any other false value has no effect.

This interface is intended for development, testing, and validation
of critical error recovery code.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 38 +++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 844cfafe1ec7..61c76e5e617e 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -18,6 +18,7 @@
 #include "xe_gt_debugfs.h"
 #include "xe_gt_printk.h"
 #include "xe_guc_ads.h"
+#include "xe_hw_error.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_psmi.h"
@@ -509,6 +510,40 @@ static const struct file_operations disable_late_binding_fops = {
 	.write = disable_late_binding_set,
 };
 
+static ssize_t trigger_critical_error_show(struct file *f, char __user *ubuf,
+					   size_t size, loff_t *pos)
+{
+	const char *msg = "Write 1 to trigger critical error handler\n";
+
+	return simple_read_from_buffer(ubuf, size, pos, msg, strlen(msg));
+}
+
+static ssize_t trigger_critical_error_set(struct file *f,
+					  const char __user *ubuf,
+					  size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	bool trigger;
+	ssize_t ret;
+
+	ret = kstrtobool_from_user(ubuf, size, &trigger);
+	if (ret)
+		return ret;
+
+	if (trigger) {
+		xe_critical_error_handler(xe);
+		drm_info(&xe->drm, "Critical error handler triggered via debugfs\n");
+	}
+
+	return size;
+}
+
+static const struct file_operations trigger_critical_error_fops = {
+	.owner = THIS_MODULE,
+	.read = trigger_critical_error_show,
+	.write = trigger_critical_error_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -550,6 +585,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("disable_late_binding", 0600, root, xe,
 			    &disable_late_binding_fops);
 
+	debugfs_create_file("trigger_critical_error", 0600, root, xe,
+			    &trigger_critical_error_fops);
+
 	/*
 	 * Don't expose page reclaim configuration file if not supported by the
 	 * hardware initially.
-- 
2.34.1

