Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C90B664D34
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 21:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E9E10E499;
	Tue, 10 Jan 2023 20:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D1E10E499
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 20:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673382219; bh=KZfzfJaCNSjj2cTY/A9poRlxwbx4f/9t6x9qIyEDr8E=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=CZoF55ErL81RjxfbxOv/AGJIcDveO43CgMfLfYnt8wwGG2dpb8hrAqnhdZldpeusl
 Z/21vZg3MBNIugKKDxs2twaRgtbDn2ldWvu/AySGUWgYak3YzYdw1chsIb3BkDE57x
 PmcM+ivZJdxPDDz38imrY69pYS8R3CLSgubKPJRI=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Tue, 10 Jan 2023 21:23:39 +0100 (CET)
X-EA-Auth: jYWb5T3M9TX6HZLgkCJh+aXe7wz+hgdymKalfl4XRaUsGWATnEes0XA+xMOkmZgIygg47pBLvZRa8Gb/Wq/ModSHcKL8W0Bd
Date: Wed, 11 Jan 2023 01:53:34 +0530
From: Deepak R Varma <drv@mailo.com>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megous@megous.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: st7703: Avoid full proxy f_ops for st7703 debug
 attributes
Message-ID: <Y73JRnLQ3RHSwLiO@ubun2204.myguest.virtualbox.org>
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
---
Note: Patch compile tested only.

 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 86a472b01360..22ed7e2b0e00 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -510,15 +510,14 @@ static int allpixelson_set(void *data, u64 val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(allpixelson_fops, NULL,
-			allpixelson_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(allpixelson_fops, NULL, allpixelson_set, "%llu\n");
 
 static void st7703_debugfs_init(struct st7703 *ctx)
 {
 	ctx->debugfs = debugfs_create_dir(DRV_NAME, NULL);
 
-	debugfs_create_file("allpixelson", 0600, ctx->debugfs, ctx,
-			    &allpixelson_fops);
+	debugfs_create_file_unsafe("allpixelson", 0600, ctx->debugfs, ctx,
+				   &allpixelson_fops);
 }
 
 static void st7703_debugfs_remove(struct st7703 *ctx)
-- 
2.34.1



