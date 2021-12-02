Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744344660A9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 10:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4E16ECE3;
	Thu,  2 Dec 2021 09:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (ip-15.mailobj.net [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B776ECE2
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1638438591; bh=5AYNye91HG3KM5R+EMOmlge/sMVomiHjXI8zrmoDakw=;
 h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To;
 b=df6zoPRfzA+95fbx/z+lRIh9n4BuoagjWbsmbkF1JOC3gBfQCzzvFckyRTOk07isJ
 HSjx05D7kYqs1jUxqIoKFSQrub9uRs/AXWmXPFPhxFV8x7RiDg51yEPKQNf9zsWN4Y
 v6uO8BYnKAnhaCHmsQHfnkxN4oNtxk30SX7xj9TI=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Thu,  2 Dec 2021 10:49:51 +0100 (CET)
X-EA-Auth: c+1XOhLb9gcbnVkVmhvk2gODT2q6LK/aAjHWCbzvxWcluFkOqADERv6ewRzzTu+WZ3S1hOFFRhCWCuimNz452K4NTJ70jlpB
Date: Thu, 2 Dec 2021 10:49:49 +0100
From: Claudio Suarez <cssk@net-c.es>
To: dri-devel@lists.freedesktop.org, 0day robot <lkp@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
Subject: [PATCH] mock a drm_plane in igt_check_plane_state to make the test
 more robust
Message-ID: <YaiWvQESctDMipjh@gineta.localdomain>
References: <YaC7zXW119tlzfVh@gineta.localdomain>
 <20211128142015.GB5295@xsang-OptiPlex-9020>
 <YaUpsaP7hng6zpFh@gineta.localdomain>
 <YaXi803g7iv9MxWR@phenom.ffwll.local>
 <YaiVfZWNyMkG8uED@gineta.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YaiVfZWNyMkG8uED@gineta.localdomain>
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

igt_check_plane_state test crashes in drm_atomic_helper_check_plane_state
when trying to de-reference drm_plane_state->plane->dev
due to the lack of a struct drm_plane in the mock struct drm_plane_state.
Since drm_plane_state always should contain a plane, the mock also
needs a plane to be the test more robust and realistic. Add it.

Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/selftests/test-drm_plane_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/selftests/test-drm_plane_helper.c b/drivers/gpu/drm/selftests/test-drm_plane_helper.c
index 0a9553f51796..ceebeede55ea 100644
--- a/drivers/gpu/drm/selftests/test-drm_plane_helper.c
+++ b/drivers/gpu/drm/selftests/test-drm_plane_helper.c
@@ -87,11 +87,15 @@ int igt_check_plane_state(void *ignored)
 				DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC)
 		},
 	};
+	struct drm_plane plane = {
+		.dev = NULL
+	};
 	struct drm_framebuffer fb = {
 		.width = 2048,
 		.height = 2048
 	};
 	struct drm_plane_state plane_state = {
+		.plane = &plane,
 		.crtc = ZERO_SIZE_PTR,
 		.fb = &fb,
 		.rotation = DRM_MODE_ROTATE_0
-- 
2.33.0



