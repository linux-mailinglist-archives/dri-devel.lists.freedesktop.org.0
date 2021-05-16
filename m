Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E465381E9B
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 14:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41B789C8D;
	Sun, 16 May 2021 12:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C756789B0B;
 Sun, 16 May 2021 12:13:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 44806B11D;
 Sun, 16 May 2021 12:13:17 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com,
 sakari.ailus@linux.intel.com
Subject: [PATCH 1/4] drm/amdgpu: Use %p4cc to print 4CC format
Date: Sun, 16 May 2021 14:13:12 +0200
Message-Id: <20210516121315.30321-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210516121315.30321-1-tzimmermann@suse.de>
References: <20210516121315.30321-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace use of struct drm_format_name_buf with %p4cc for printing
4CC formats.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 8a1fb8b6606e..49f73b5b89b0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1077,12 +1077,9 @@ int amdgpu_display_gem_fb_verify_and_init(
 	/* Verify that the modifier is supported. */
 	if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
 				      mode_cmd->modifier[0])) {
-		struct drm_format_name_buf format_name;
 		drm_dbg_kms(dev,
-			    "unsupported pixel format %s / modifier 0x%llx\n",
-			    drm_get_format_name(mode_cmd->pixel_format,
-						&format_name),
-			    mode_cmd->modifier[0]);
+			    "unsupported pixel format %p4cc / modifier 0x%llx\n",
+			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
 
 		ret = -EINVAL;
 		goto err;
-- 
2.31.1

