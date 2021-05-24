Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5315538E9E7
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 16:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665616E872;
	Mon, 24 May 2021 14:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062486E86A;
 Mon, 24 May 2021 14:50:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C11E61476;
 Mon, 24 May 2021 14:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621867804;
 bh=TTnz5OriA+p5HLPpRS8J0Z2C4CzA/KCLw6QSdGxXHc8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ndOlsglaSWEJowZnPcQDoOJQIViE4tupPTve0ILwC54H1/ZLh76uKec5EzMwAKm9i
 4PxgRIuCrJyoPwJcDE7h+JjJ05ah5w58F1i/z0dFYMShXlZmYaWR+ooPzuNmItyO39
 1gNUtOkecB6nfQnHEoF2XGVdjX1U3Kvs7dnaPypzutiy0TmtNsnmKthkX/yeYcAI/B
 MUdxetWYtFeotmQIdCqFQElY32W/62e3kuyUxGEdskGrHUgGZGRWm6/jF8IFLB/IMl
 VvS1rjUPLkBSQZiLRZA3iLIvAo51WW+ENYf3pJkEBWwAcyIRF86R4+OFzGW9ZIIGqP
 R5KpZvchD0ayw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 50/52] drm/amd/amdgpu: fix refcount leak
Date: Mon, 24 May 2021 10:49:00 -0400
Message-Id: <20210524144903.2498518-50-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524144903.2498518-1-sashal@kernel.org>
References: <20210524144903.2498518-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, Jingwen Chen <Jingwen.Chen2@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jingwen Chen <Jingwen.Chen2@amd.com>

[ Upstream commit fa7e6abc75f3d491bc561734312d065dc9dc2a77 ]

[Why]
the gem object rfb->base.obj[0] is get according to num_planes
in amdgpufb_create, but is not put according to num_planes

[How]
put rfb->base.obj[0] in amdgpu_fbdev_destroy according to num_planes

Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
index fd94a17fb2c6..46522804c7d8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
@@ -289,10 +289,13 @@ static int amdgpufb_create(struct drm_fb_helper *helper,
 static int amdgpu_fbdev_destroy(struct drm_device *dev, struct amdgpu_fbdev *rfbdev)
 {
 	struct amdgpu_framebuffer *rfb = &rfbdev->rfb;
+	int i;
 
 	drm_fb_helper_unregister_fbi(&rfbdev->helper);
 
 	if (rfb->base.obj[0]) {
+		for (i = 0; i < rfb->base.format->num_planes; i++)
+			drm_gem_object_put(rfb->base.obj[0]);
 		amdgpufb_destroy_pinned_object(rfb->base.obj[0]);
 		rfb->base.obj[0] = NULL;
 		drm_framebuffer_unregister_private(&rfb->base);
-- 
2.30.2

