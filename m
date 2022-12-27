Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19039656804
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 08:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB61310E2E6;
	Tue, 27 Dec 2022 07:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987EB10E2E6;
 Tue, 27 Dec 2022 07:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1672127688; bh=giLygN6VCt7V445nQatslkp77AOYXtWjJUE7E0bEqc0=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=QCqXgq8OvC0nS2bvkqSJGiSC4vJEpFoCCALoQUcVCT4D3XEaiDtb1L8tJGJKo9bHo
 0wVRz/R+tSsQ6WUVRx4ievKOIoP4Lu5e6PBAYCTxWlJYcxB8v5UReEZRb0q8O5ro3G
 ZLqMs3FLEz9Cheb7v1fV9WXMRCBL5GQ8egm0c11k=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Tue, 27 Dec 2022 08:54:48 +0100 (CET)
X-EA-Auth: Y/txN7h7M1NSBRb/aAVjjQNqoV1iyiWxffr+VZOusP9tx6BTq8pNJEqpfWcIfiLuIBYbzBtgFVghFHIsVPbvkC8b7+YujL3P
Date: Tue, 27 Dec 2022 13:24:39 +0530
From: Deepak R Varma <drv@mailo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/display: Avoid full proxy f_ops for DRRS debug
 attributes
Message-ID: <Y6qkv/YVsUQ6kpYp@qemulion>
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
 Deepak R Varma <drv@mailo.com>, Saurabh Singh Sengar <ssengar@microsoft.com>
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

This Change is reported by the debugfs_simple_attr.cocci Coccinelle
semantic patch.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/gpu/drm/i915/display/intel_drrs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/i915/display/intel_drrs.c
index 5b9e44443814..84ba7379d6f8 100644
--- a/drivers/gpu/drm/i915/display/intel_drrs.c
+++ b/drivers/gpu/drm/i915/display/intel_drrs.c
@@ -374,16 +374,16 @@ static int intel_drrs_debugfs_ctl_set(void *data, u64 val)
 	return ret;
 }

-DEFINE_SIMPLE_ATTRIBUTE(intel_drrs_debugfs_ctl_fops,
-			NULL, intel_drrs_debugfs_ctl_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(intel_drrs_debugfs_ctl_fops,
+			 NULL, intel_drrs_debugfs_ctl_set, "%llu\n");

 void intel_drrs_crtc_debugfs_add(struct intel_crtc *crtc)
 {
 	debugfs_create_file("i915_drrs_status", 0444, crtc->base.debugfs_entry,
 			    crtc, &intel_drrs_debugfs_status_fops);

-	debugfs_create_file("i915_drrs_ctl", 0644, crtc->base.debugfs_entry,
-			    crtc, &intel_drrs_debugfs_ctl_fops);
+	debugfs_create_file_unsafe("i915_drrs_ctl", 0644, crtc->base.debugfs_entry,
+				    crtc, &intel_drrs_debugfs_ctl_fops);
 }

 static int intel_drrs_debugfs_type_show(struct seq_file *m, void *unused)
--
2.34.1



