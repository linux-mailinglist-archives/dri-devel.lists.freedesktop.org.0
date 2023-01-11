Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B479B665FBD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBFB10E771;
	Wed, 11 Jan 2023 15:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016BA10E76E;
 Wed, 11 Jan 2023 15:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673452324; bh=QHeZldMKVWp9Cp9mxOeha2QFBOXYtsTVP8kjQEfSrZw=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=dhQ76Q5qWbdwieoX7S8a3HflKBaJR5R0TTGJXGnzA32tstm4XcijZEOvFS62J5qM5
 VaQJIcf8JLwEM0aMQYeS8QIdcD7CJm5uN1jgkn/WSHLOy0PbnPvxXEKQzPhgzUzccW
 a0baxbbbXs7geGagVcVdV/18+jQTMvgzKA4nmfMc=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Wed, 11 Jan 2023 16:52:03 +0100 (CET)
X-EA-Auth: u5jvOLR5x9//Zkc8IMR5oNVJAAF0lJRlVIyLovRtl5gS15Vj30kxR2eXf+WDRR0PXE7lTP9chqyCJpfbE+S9CoqnkWNXnn/t
Date: Wed, 11 Jan 2023 21:21:59 +0530
From: Deepak R Varma <drv@mailo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] drm/i915/fbc: Avoid full proxy f_ops for FBC debug
 attributes
Message-ID: <5d26e924ec8dea21925c77fa79a2bf2a34cef705.1673451705.git.drv@mailo.com>
References: <cover.1673451705.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1673451705.git.drv@mailo.com>
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
---
Changes in v3:
   - None

Changes in v2:
   - Include coccicheck make command in the patch log message for clarity.
     Suggested by Rodrigo Vivi <rodrigo.vivi@intel.com>


 drivers/gpu/drm/i915/display/intel_fbc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 5e69d3c11d21..c508dcf415b4 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1807,10 +1807,10 @@ static int intel_fbc_debugfs_false_color_set(void *data, u64 val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(intel_fbc_debugfs_false_color_fops,
-			intel_fbc_debugfs_false_color_get,
-			intel_fbc_debugfs_false_color_set,
-			"%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(intel_fbc_debugfs_false_color_fops,
+			 intel_fbc_debugfs_false_color_get,
+			 intel_fbc_debugfs_false_color_set,
+			 "%llu\n");
 
 static void intel_fbc_debugfs_add(struct intel_fbc *fbc,
 				  struct dentry *parent)
@@ -1819,8 +1819,8 @@ static void intel_fbc_debugfs_add(struct intel_fbc *fbc,
 			    fbc, &intel_fbc_debugfs_status_fops);
 
 	if (fbc->funcs->set_false_color)
-		debugfs_create_file("i915_fbc_false_color", 0644, parent,
-				    fbc, &intel_fbc_debugfs_false_color_fops);
+		debugfs_create_file_unsafe("i915_fbc_false_color", 0644, parent,
+					   fbc, &intel_fbc_debugfs_false_color_fops);
 }
 
 void intel_fbc_crtc_debugfs_add(struct intel_crtc *crtc)
-- 
2.34.1



