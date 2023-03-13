Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6926B70F5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 09:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3958710E495;
	Mon, 13 Mar 2023 08:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 396 seconds by postgrey-1.36 at gabe;
 Mon, 13 Mar 2023 00:56:10 UTC
Received: from out-58.mta1.migadu.com (out-58.mta1.migadu.com [95.215.58.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4EF10E44F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 00:56:10 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bcheng.me; s=key1;
 t=1678668571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/Bkqs2R+3MEoIRL8QEDpEtBOS+h+4C4T2XbVTnOUNIg=;
 b=bxr9QXNhiSQos5uqKZu0GBVkMhrXbMkeSYPTWHLSDYX64KIRQoLKNv5Ut6uyzjKbGPKAWT
 X7zZNhER8iYEkHYzuph7+7ASoIJE2FxML52sj2C8lII5zDS0CN0Sh4b0bujUdVkIGFBw/L
 fmu5he+ud07XsUw6ZkQQLCsef8WWcdG/j1MHLslkeLn180cCHrnf1ZurtOA9hOKoosdmYo
 5MMg8yZdSNELkc+m/28uUYvz6fgxCeStHUfyTsiTFD0Wsc7RW/vl657oAgNcWPNiaatVNY
 LGTbsXLXOXjOg16gO+2dUFcCIFyD9DfFLd5gyeAEg8p/h/rj+4Z216MsT0h3dA==
From: Benjamin Cheng <ben@bcheng.me>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: [PATCH] drm/amd/display: Write to correct dirty_rect
Date: Sun, 12 Mar 2023 20:47:39 -0400
Message-Id: <20230313004739.3110719-1-ben@bcheng.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 13 Mar 2023 08:17:55 +0000
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
Cc: dri-devel@lists.freedesktop.org, Benjamin Cheng <ben@bcheng.me>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When FB_DAMAGE_CLIPS are provided in a non-MPO scenario, the loop does
not use the counter i. This causes the fill_dc_dity_rect() to always
fill dirty_rects[0], causing graphical artifacts when a damage clip
aware DRM client sends more than 1 damage clip.

Instead, use the flip_addrs->dirty_rect_count which is incremented by
fill_dc_dirty_rect() on a successful fill.

Fixes: 30ebe41582d1 ("drm/amd/display: add FB_DAMAGE_CLIPS support")
Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2453
Signed-off-by: Benjamin Cheng <ben@bcheng.me>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8af58bba503f..a89ec2cc4ffc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5130,9 +5130,9 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
 
 		for (; flip_addrs->dirty_rect_count < num_clips; clips++)
 			fill_dc_dirty_rect(new_plane_state->plane,
-					   &dirty_rects[i], clips->x1,
-					   clips->y1, clips->x2 - clips->x1,
-					   clips->y2 - clips->y1,
+					   &dirty_rects[flip_addrs->dirty_rect_count],
+					   clips->x1, clips->y1,
+					   clips->x2 - clips->x1, clips->y2 - clips->y1,
 					   &flip_addrs->dirty_rect_count,
 					   false);
 		return;
-- 
2.39.2

