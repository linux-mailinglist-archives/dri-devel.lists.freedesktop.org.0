Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E462E2A25D1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 09:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54006E424;
	Mon,  2 Nov 2020 08:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4044D6E284
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 03:14:33 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [58.213.83.157])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id 4A8E148293A;
 Mon,  2 Nov 2020 11:14:30 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Evan Quan <evan.quan@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>, Changfeng <Changfeng.Zhu@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: move DRM_ERROR log out of the mutex protect area
Date: Sun,  1 Nov 2020 19:14:17 -0800
Message-Id: <20201102031423.4033-1-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZT0seQx4aGEJOTUhKVkpNS09JQ01DTEtNQk9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nz46Pio6PD8vSiFRShgiD04Z
 AxJPCR9VSlVKTUtPSUNNQ0xKSk5OVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlOQ1VJ
 SkhVQ0hVSk5MWVdZCAFZQUlOQkw3Bg++
X-HM-Tid: 0a7586f2f45893bakuws4a8e148293a
X-Mailman-Approved-At: Mon, 02 Nov 2020 08:08:52 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function amdgpu_register_gpu_instance, there is no need to
protect DRM_ERROR in mutex mgpu_info.mutex.
This change is to make the code to run a bit fast.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index efda38349a03..cc61b0a5b8d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -104,8 +104,8 @@ void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
 	mutex_lock(&mgpu_info.mutex);
 
 	if (mgpu_info.num_gpu >= MAX_GPU_INSTANCE) {
-		DRM_ERROR("Cannot register more gpu instance\n");
 		mutex_unlock(&mgpu_info.mutex);
+		DRM_ERROR("Cannot register more gpu instance\n");
 		return;
 	}
 
-- 
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
