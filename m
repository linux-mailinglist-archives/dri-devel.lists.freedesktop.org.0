Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D1A13EA20
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 18:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280B96EE67;
	Thu, 16 Jan 2020 17:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C506EE67
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 17:42:53 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C14020728;
 Thu, 16 Jan 2020 17:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579196573;
 bh=SjvVj+je/HMlB1NOEWTRrKGFRifaS0pbyWGdTMOoztQ=;
 h=From:To:Cc:Subject:Date:From;
 b=B2B8Az3+sDeZ9fW1Jnz/IhYHzHvoqrauzA27Wrma3JznGfVnBFEPuGMLJAltD0166
 qPAcU2XtFF8vI++qoZZcy9bRKgzW1/tLob+4cPCpHz5sNGLFR/Z8RYcozgt+MCFD4N
 Jt+wpTTKe/11r7Woqa/T2YgOtSrE8zs/9JhS76I8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 001/174] drm/virtio: fix bounds check in
 virtio_gpu_cmd_get_capset()
Date: Thu, 16 Jan 2020 12:39:58 -0500
Message-Id: <20200116174251.24326-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
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
 Gerd Hoffmann <kraxel@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit 09c4b49457434fa74749ad6194ef28464d9f5df9 ]

This doesn't affect runtime because in the current code "idx" is always
valid.

First, we read from "vgdev->capsets[idx].max_size" before checking
whether "idx" is within bounds.  And secondly the bounds check is off by
one so we could end up reading one element beyond the end of the
vgdev->capsets[] array.

Fixes: 62fb7a5e1096 ("virtio-gpu: add 3d/virgl support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20180704094250.m7sgvvzg3dhcvv3h@kili.mountain
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index a1b3ea1ccb65..772a5a3b0ce1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -681,11 +681,11 @@ int virtio_gpu_cmd_get_capset(struct virtio_gpu_device *vgdev,
 {
 	struct virtio_gpu_get_capset *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
-	int max_size = vgdev->capsets[idx].max_size;
+	int max_size;
 	struct virtio_gpu_drv_cap_cache *cache_ent;
 	void *resp_buf;
 
-	if (idx > vgdev->num_capsets)
+	if (idx >= vgdev->num_capsets)
 		return -EINVAL;
 
 	if (version > vgdev->capsets[idx].max_version)
@@ -695,6 +695,7 @@ int virtio_gpu_cmd_get_capset(struct virtio_gpu_device *vgdev,
 	if (!cache_ent)
 		return -ENOMEM;
 
+	max_size = vgdev->capsets[idx].max_size;
 	cache_ent->caps_cache = kmalloc(max_size, GFP_KERNEL);
 	if (!cache_ent->caps_cache) {
 		kfree(cache_ent);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
