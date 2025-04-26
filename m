Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD06A9D837
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 08:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D783C10E1FC;
	Sat, 26 Apr 2025 06:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nrsqxMkQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD78E10E1FC
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 06:14:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A999749B84;
 Sat, 26 Apr 2025 06:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAB9C4CEE2;
 Sat, 26 Apr 2025 06:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745648076;
 bh=2S6FazreNdjnfIYoLguCqFO9oh1E5RA+zvoSpthv3PA=;
 h=From:To:Cc:Subject:Date:From;
 b=nrsqxMkQLI8iHlTgxJHpUFqF41aD6CByanLOmURxG4Sr+qv7Zo1QEiHZFBJ6BNsEs
 yrN2NKnVJsipUJQTDYCXLMpDQfg5z5G+LknEnno/Dvtde19fQun8pK6LtaU74EerYM
 JV3a2+gFE5weDPL9t3nVvoR1Daxg/5RRodYvScqjaM8/w0QZi7buE+RBuq0Jdp6zBo
 VDx+d3t9Cge+DBP8A5FJdBqbKgWpc8zNiHbJLzpcrNjdWG4Dl3b+EeXGJqMwwtppgo
 oUgLB00eotL4RZllkuWEe3rho4rCHKQF18NWqOUtzZgbjB+qfdonyxwktbJiufbi/3
 Uc2piYQsKxiPw==
From: Kees Cook <kees@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Kees Cook <kees@kernel.org>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH] drm/vkms: Adjust vkms_state->active_planes allocation type
Date: Fri, 25 Apr 2025 23:14:32 -0700
Message-Id: <20250426061431.work.304-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1626; i=kees@kernel.org;
 h=from:subject:message-id; bh=2S6FazreNdjnfIYoLguCqFO9oh1E5RA+zvoSpthv3PA=;
 b=owGbwMvMwCVmps19z/KJym7G02pJDBk8lSfu6W4MtPbYf3hzwpalax4WLg559Ob6Wpb5E4rSV
 it9ik8u6yhlYRDjYpAVU2QJsnOPc/F42x7uPlcRZg4rE8gQBi5OAZjICxdGhvUb248ZT+JffLlV
 tVL/wudGWdXjX6eG8WRGs9qYxhYuZ2P4H5rlLi716ODxDhuv0LKL6nlh8sIdb3Z15xwtVuxSnSH
 FAgA=
X-Developer-Key: i=kees@kernel.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for making the kmalloc family of allocators type aware,
we need to make sure that the returned type from the allocation matches
the type of the variable being assigned. (Before, the allocator would
always return "void *", which can be implicitly cast to any pointer type.)

The assigned type is "struct vkms_plane_state **", but the returned type
will be "struct drm_plane **". These are the same size (pointer size), but
the types don't match. Adjust the allocation type to match the assignment.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 12034ec12029..8c9898b9055d 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -194,7 +194,7 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 		i++;
 	}
 
-	vkms_state->active_planes = kcalloc(i, sizeof(plane), GFP_KERNEL);
+	vkms_state->active_planes = kcalloc(i, sizeof(*vkms_state->active_planes), GFP_KERNEL);
 	if (!vkms_state->active_planes)
 		return -ENOMEM;
 	vkms_state->num_active_planes = i;
-- 
2.34.1

