Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04C464EE98
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 17:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22B310E5F5;
	Fri, 16 Dec 2022 16:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA61E10E5E8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 16:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1671206874; bh=pbGpvULOholZvb5olInn+Fl6NBfMf3MM3SbvamW2d28=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=XnU/moSq/6f6jqdAYoQ9DRaqqQH5af54Tv3y/qlQdHoPi6U1UYeZghrG8suLor2r/
 kM6KA4s30gVkYVklrcIQidIbtgMPYiGXBubJEv9i2Cvk8cHqkJB3sryrxHnq2zA9Mo
 UH5BollB15U0L3WPyrYTezQnpeKueuegGMMOlNNw=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Fri, 16 Dec 2022 17:07:54 +0100 (CET)
X-EA-Auth: r6MeKYUR9fyZA/V6ZIIId1y+j07mHDm4LIWLgWKlymZezNqlTBjuWAOPObWQ9e34wUQtjuxU6yiuhxCu1INPd50jxqFtKREG
Date: Fri, 16 Dec 2022 21:37:47 +0530
From: Deepak R Varma <drv@mailo.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/gvt: Replace DEFINE_SIMPLE_ATTRIBUTE by
 DEFINE_DEBUGFS_ATTRIBUTE
Message-ID: <Y5yX01RC4B22j5w8@qemulion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>, drv@mailo.com,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DEFINE_DEBUGFS_ATTRIBUTE macro has implementation for protecting the
read/write file operations from removal race conditions. This further
enables using debugfs_create_file_unsafe() function since there is no need
for a proxy file operations struct for protection. Hence replace the
DEFINE_SIMPLE_ATTRIBUTE macro by DEFINE_DEBUGFS_ATTRIBUTE and the
debugfs_create_file() by the lightweight debugfs_create_file_unsafe()
versions.

This issue was identified using the coccinelle debugfs_simple_attr.cocci
semantic patch.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
Please note: The changes are compile tested only.

 drivers/gpu/drm/i915/gvt/debugfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
index 9f1c209d9251..a45a43c35a6b 100644
--- a/drivers/gpu/drm/i915/gvt/debugfs.c
+++ b/drivers/gpu/drm/i915/gvt/debugfs.c
@@ -147,9 +147,9 @@ vgpu_scan_nonprivbb_set(void *data, u64 val)
 	return 0;
 }

-DEFINE_SIMPLE_ATTRIBUTE(vgpu_scan_nonprivbb_fops,
-			vgpu_scan_nonprivbb_get, vgpu_scan_nonprivbb_set,
-			"0x%llx\n");
+DEFINE_DEBUGFS_ATTRIBUTE(vgpu_scan_nonprivbb_fops,
+			 vgpu_scan_nonprivbb_get, vgpu_scan_nonprivbb_set,
+			 "0x%llx\n");

 /**
  * intel_gvt_debugfs_add_vgpu - register debugfs entries for a vGPU
@@ -165,8 +165,8 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
 	debugfs_create_bool("active", 0444, vgpu->debugfs, &vgpu->active);
 	debugfs_create_file("mmio_diff", 0444, vgpu->debugfs, vgpu,
 			    &vgpu_mmio_diff_fops);
-	debugfs_create_file("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
-			    &vgpu_scan_nonprivbb_fops);
+	debugfs_create_file_unsafe("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
+				   &vgpu_scan_nonprivbb_fops);
 }

 /**
--
2.34.1



