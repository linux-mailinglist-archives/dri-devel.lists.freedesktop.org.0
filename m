Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0153C7FDD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 10:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4013F6E19B;
	Wed, 14 Jul 2021 08:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 531 seconds by postgrey-1.36 at gabe;
 Wed, 14 Jul 2021 08:15:46 UTC
Received: from smtp.dudau.co.uk (dliviu.plus.com [80.229.23.120])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF3E46E19B;
 Wed, 14 Jul 2021 08:15:46 +0000 (UTC)
Received: from mail.dudau.co.uk (bart.dudau.co.uk [192.168.14.2])
 by smtp.dudau.co.uk (Postfix) with SMTP id E18A64111345;
 Wed, 14 Jul 2021 09:06:53 +0100 (BST)
Received: by mail.dudau.co.uk (sSMTP sendmail emulation);
 Wed, 14 Jul 2021 09:06:53 +0100
From: Liviu Dudau <liviu@dudau.co.uk>
To: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH] drm/amd/display: Fix 10bit 4K display on CIK GPUs
Date: Wed, 14 Jul 2021 09:06:52 +0100
Message-Id: <20210714080652.113381-1-liviu@dudau.co.uk>
X-Mailer: git-send-email 2.32.0
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 72a7cf0aec0c ("drm/amd/display: Keep linebuffer pixel depth at
30bpp for DCE-11.0.") doesn't seems to have fixed 10bit 4K rendering over
DisplayPort for CIK GPUs. On my machine with a HAWAII GPU I get a broken
image that looks like it has an effective resolution of 1920x1080 but
scaled up in an irregular way. Reverting the commit or applying this
patch fixes the problem on v5.14-rc1.

Fixes: 72a7cf0aec0c ("drm/amd/display: Keep linebuffer pixel depth at 30bpp for DCE-11.0.")
Signed-off-by: Liviu Dudau <liviu@dudau.co.uk>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index a6a67244a322e..1596f6b7fed7c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -1062,7 +1062,7 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
 	 * so use only 30 bpp on DCE_VERSION_11_0. Testing with DCE 11.2 and 8.3
 	 * did not show such problems, so this seems to be the exception.
 	 */
-	if (plane_state->ctx->dce_version != DCE_VERSION_11_0)
+	if (plane_state->ctx->dce_version > DCE_VERSION_11_0)
 		pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_36BPP;
 	else
 		pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_30BPP;
-- 
2.32.0

