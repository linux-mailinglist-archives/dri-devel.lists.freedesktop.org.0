Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 495A42C6561
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906916ED1E;
	Fri, 27 Nov 2020 12:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4526ED16;
 Fri, 27 Nov 2020 12:11:47 +0000 (UTC)
IronPort-SDR: vLJLj/e1G4ljSgICJ7p35+oWHiOTZMqMKg4LJJD79Nyoonz/C+tZclNFEVlJRahvHOH404uTnl
 jnqQIE23w6IA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092944"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092944"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:46 -0800
IronPort-SDR: f6MynuVDGA4ek55kaN7SxzQRmPlsWHjr4JerdkVPMIMuXpSAbEwB75aVVvEqIFYjC53eF13Qsz
 qIR1T+tBHEAw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029879"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:45 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 133/162] drm/i915/dg1: Track swap in/out stats via debugfs
Date: Fri, 27 Nov 2020 12:06:49 +0000
Message-Id: <20201127120718.454037-134-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sudeep Dutt <sudeep.dutt@intel.com>

cat /sys/kernel/debug/dri/0/i915_gem_objects
num_bytes_swapped_out 94170000 num_bytes_swapped_in 56120000

Signed-off-by: Sudeep Dutt <sudeep.dutt@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_region.c | 6 ++++++
 drivers/gpu/drm/i915/i915_debugfs.c        | 3 +++
 drivers/gpu/drm/i915/i915_drv.h            | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index e1793c5f8d8c..ed108dbcb34e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -64,6 +64,9 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
 	else
 		i915_gem_object_put(dst);
 
+	if (!err)
+		atomic_long_add(sizes, &i915->num_bytes_swapped_out);
+
 	return err;
 }
 
@@ -118,6 +121,9 @@ i915_gem_object_swapin_pages(struct drm_i915_gem_object *obj,
 		i915_gem_object_put(src);
 	}
 
+	if (!err)
+		atomic_long_add(sizes, &i915->num_bytes_swapped_in);
+
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 6d1482c82694..1b7e9b6ab660 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -372,6 +372,9 @@ static int i915_gem_object_info(struct seq_file *m, void *data)
 	for_each_memory_region(mr, i915, id)
 		seq_printf(m, "%s: total:%pa, available:%pa bytes\n",
 			   mr->name, &mr->total, &mr->avail);
+	seq_printf(m, "num_bytes_swapped_out %ld num_bytes_swapped_in %ld\n",
+		   atomic_long_read(&i915->num_bytes_swapped_out),
+		   atomic_long_read(&i915->num_bytes_swapped_in));
 	seq_putc(m, '\n');
 
 	print_context_stats(m, i915);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 1366b53ac8c9..7b1e95d494e6 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1214,6 +1214,9 @@ struct drm_i915_private {
 	 * NOTE: This is the dri1/ums dungeon, don't add stuff here. Your patch
 	 * will be rejected. Instead look for a better place.
 	 */
+
+	atomic_long_t num_bytes_swapped_out;
+	atomic_long_t num_bytes_swapped_in;
 };
 
 static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
