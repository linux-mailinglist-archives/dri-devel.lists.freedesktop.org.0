Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD1D672936
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 21:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1779910E829;
	Wed, 18 Jan 2023 20:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37B210E029;
 Wed, 18 Jan 2023 20:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1674073393; bh=Q7RlEaXnEqFwS+6rzjpHzGGEkndrB2oRtxww9YVShds=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=n4ZGttawAHvU+kKNEXJmVo4kpmwLy1iWS4BTcFlEPCl+hd0lPTOxGbbFKxrJQOhpa
 V2U8kWqW+c+Vc7u0MmR0RqwkXEvwQvr5iP6eAtGCuRELu8nLKOHGvfSI0kR7J7J0UD
 dPMSrwtWERQ72yGh6ET0fbHadmoYQtIrYrZcv714=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Wed, 18 Jan 2023 21:23:13 +0100 (CET)
X-EA-Auth: rt16gkipC8f0Y+X3/lLm2PRNoHDAozsEuaaEmgxjkK3S+royuqWHBe42Ov9MyTNsYUoydczrlMr84oArRF+WkOASpSQ3shXh
Date: Thu, 19 Jan 2023 01:53:07 +0530
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
Subject: [PATCH v2] drm/i915/gvt: Avoid full proxy f_ops for debugfs attributes
Message-ID: <Y8hVK6wuqm50iADP@ubun2204.myguest.virtualbox.org>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using DEFINE_SIMPLE_ATTRIBUTE macro with the debugfs_create_file()
function adds the overhead of introducing a proxy file operation
functions to wrap the original read/write inside file removal protection
functions. This adds significant overhead in terms of introducing and
managing the proxy factory file operations structure and function
wrapping at runtime.
As a replacement, a combination of DEFINE_DEBUGFS_ATTRIBUTE macro paired
with debugfs_create_file_unsafe() is suggested to be used instead.  The
DEFINE_DEBUGFS_ATTRIBUTE utilises debugfs_file_get() and
debugfs_file_put() wrappers to protect the original read and write
function calls for the debug attributes. There is no need for any
runtime proxy file operations to be managed by the debugfs core.
Following coccicheck make command helped identify this change:

make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci

Signed-off-by: Deepak R Varma <drv@mailo.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
Changes in v2:
   - Following changes as suggested by Rodrigo Vivi <rodrigo.vivi@intel.com>
      - Combine 2 patch series in a single patch 
      - Base the patch on the i915/gvt to avoid conflicts


 drivers/gpu/drm/i915/gvt/debugfs.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
index 0616b73175f3..baccbf1761b7 100644
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
 
 static int vgpu_status_get(void *data, u64 *val)
 {
@@ -165,7 +165,7 @@ static int vgpu_status_get(void *data, u64 *val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
+DEFINE_DEBUGFS_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
 
 /**
  * intel_gvt_debugfs_add_vgpu - register debugfs entries for a vGPU
@@ -180,10 +180,10 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
 
 	debugfs_create_file("mmio_diff", 0444, vgpu->debugfs, vgpu,
 			    &vgpu_mmio_diff_fops);
-	debugfs_create_file("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
-			    &vgpu_scan_nonprivbb_fops);
-	debugfs_create_file("status", 0644, vgpu->debugfs, vgpu,
-			    &vgpu_status_fops);
+	debugfs_create_file_unsafe("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
+				   &vgpu_scan_nonprivbb_fops);
+	debugfs_create_file_unsafe("status", 0644, vgpu->debugfs, vgpu,
+				   &vgpu_status_fops);
 }
 
 /**
-- 
2.34.1



