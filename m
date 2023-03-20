Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76206C0711
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 01:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAF410E0D6;
	Mon, 20 Mar 2023 00:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E2710E0D6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 00:54:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 29E65B80D41;
 Mon, 20 Mar 2023 00:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992EAC433EF;
 Mon, 20 Mar 2023 00:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679273657;
 bh=sDkruBFyfQL22Bvsy8QT47HOFCYwklASkPBiGar2oVc=;
 h=From:To:Cc:Subject:Date:From;
 b=Bhd1zqjUyMXNL7ioQMLEGny2XENYp2upRHxgO7KqOIluFG8EAPqLTlqfUzK1Dyae9
 E350AKRkcX0bsScJzlwbTECRS7XR3Uc4AgFoLrgiGXlrUfcOiy99O5yaeRdc3Ok5hN
 fwEIWAX3NH4d+BnIdJOba5KdA7TYGObHLYbvlu1wLpJImlYtGazsX7kK+1ex6g71GL
 0Z1tCdG2sG2OPm1Rx+rJxG6uB6Oj5xLsS2PXVsVXARKe1P13617XmyIGcJ/9SiP7q/
 d4pL3zrOgUuXwoWOD1/a08kdJv2NUDlCojQIyHCyqLOjk+bif7NNt9OzEYS7rxakyv
 QQfhn/vio0rRA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 01/29] drm/cirrus: NULL-check
 pipe->plane.state->fb in cirrus_pipe_update()
Date: Sun, 19 Mar 2023 20:53:43 -0400
Message-Id: <20230320005413.1428452-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, jani.nikula@intel.com, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Alexandr Sapozhnikov <alsp705@gmail.com>, kraxel@redhat.com,
 Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexandr Sapozhnikov <alsp705@gmail.com>

[ Upstream commit 7245e629dcaaf308f1868aeffa218e9849c77893 ]

After having been compared to NULL value at cirrus.c:455, pointer
'pipe->plane.state->fb' is passed as 1st parameter in call to function
'cirrus_fb_blit_rect' at cirrus.c:461, where it is dereferenced at
cirrus.c:316.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

v2:
	* aligned commit message to line-length limits

Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20230215171549.16305-1-alsp705@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tiny/cirrus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 354d5e854a6f0..b27e469e90217 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -455,7 +455,7 @@ static void cirrus_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (state->fb && cirrus->cpp != cirrus_cpp(state->fb))
 		cirrus_mode_set(cirrus, &crtc->mode, state->fb);
 
-	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
+	if (state->fb && drm_atomic_helper_damage_merged(old_state, state, &rect))
 		cirrus_fb_blit_rect(state->fb, &shadow_plane_state->data[0], &rect);
 }
 
-- 
2.39.2

