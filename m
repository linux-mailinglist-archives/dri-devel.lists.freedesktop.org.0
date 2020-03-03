Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 713FF176B05
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 03:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50066E957;
	Tue,  3 Mar 2020 02:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5D86E93D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 02:47:57 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C90FD24681;
 Tue,  3 Mar 2020 02:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583203677;
 bh=Y4Smq8YFSQBMaSqUWzR1a0AhnVnNhOje69/N4JfaKis=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dVyKa4sRPOo9tSzf5u9rgXBQtirGnQNnUKyHjPFyDTp328HSchtTA6EfOgOAmVBfO
 ALSTd11/4qQqpo7Y0qTwT+9XB3LL3vamj0VYefx9O+fz0CC4BKqYigrHzLe76SmCM/
 U20byTAM2bFoQIXXKwf12RlhH6EFvC7ZypM3BUmI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 14/58] drm/modes: Allow DRM_MODE_ROTATE_0 when
 applying video mode parameters
Date: Mon,  2 Mar 2020 21:46:56 -0500
Message-Id: <20200303024740.9511-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303024740.9511-1-sashal@kernel.org>
References: <20200303024740.9511-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stephan Gerhold <stephan@gerhold.net>

[ Upstream commit 5c320b6ce7510653bce68cecf80cf5b2d67e907f ]

At the moment, only DRM_MODE_ROTATE_180 is allowed when we try to apply
the rotation from the video mode parameters. It is also useful to allow
DRM_MODE_ROTATE_0 in case there is only a reflect option in the video mode
parameter (e.g. video=540x960,reflect_x).

DRM_MODE_ROTATE_0 means "no rotation" and should therefore not require
any special handling, so we can just add it to the if condition.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Link: https://patchwork.freedesktop.org/patch/msgid/20200117153429.54700-3-stephan@gerhold.net
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_client_modeset.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 12e748b202d6f..18cb88b9105e4 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -952,7 +952,8 @@ bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation)
 	 * depending on the hardware this may require the framebuffer
 	 * to be in a specific tiling format.
 	 */
-	if ((*rotation & DRM_MODE_ROTATE_MASK) != DRM_MODE_ROTATE_180 ||
+	if (((*rotation & DRM_MODE_ROTATE_MASK) != DRM_MODE_ROTATE_0 &&
+	     (*rotation & DRM_MODE_ROTATE_MASK) != DRM_MODE_ROTATE_180) ||
 	    !plane->rotation_property)
 		return false;
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
