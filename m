Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D4E3BCCCF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D02B6E28B;
	Tue,  6 Jul 2021 11:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051506E288
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:19:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B84861D1F;
 Tue,  6 Jul 2021 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570339;
 bh=dwjCJhT1HGXtnEmZtAYdiTk+mnxlKa0LmxCkHY4vptI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cIAOKdpJhn0p31lG395JJCDhVR77+I+epE9cKyrvHlPShN1e98Gxe1LPchz7tTT9j
 FB59th4BhBam+bMLMDsSWiM/UoZLN07Q4b3AGsjbXV0Ms/V9jixlq/crstNj//Uspm
 /jJ8uXY1DuEhj+8/nRWi/fh8cwgd+y+GZOT+EJWHTo1Of8ZQpsRqo7Z08llklAOUev
 lx9sVtAYA26VqpqMJGx0PRktdY2s9NediRHSyWh634ll+cQUZ5EI82fK0BGV9ex0vH
 xAbA6cNAdHqFqIE2/hkIFGXtYc7y7qwXo9JUZdLmFfUa0wEym5ti+I+sfpnr+nAGR4
 +qkuKxML9sdjw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 024/160] drm/virtio: Fixes a potential NULL
 pointer dereference on probe failure
Date: Tue,  6 Jul 2021 07:16:10 -0400
Message-Id: <20210706111827.2060499-24-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111827.2060499-1-sashal@kernel.org>
References: <20210706111827.2060499-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Xie Yongji <xieyongji@bytedance.com>,
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xie Yongji <xieyongji@bytedance.com>

[ Upstream commit 17f46f488a5d82c5568e6e786cd760bba1c2ee09 ]

The dev->dev_private might not be allocated if virtio_gpu_pci_quirk()
or virtio_gpu_init() failed. In this case, we should avoid the cleanup
in virtio_gpu_release().

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20210517084913.403-1-xieyongji@bytedance.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index b375394193be..aa532ad31a23 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -264,6 +264,9 @@ void virtio_gpu_release(struct drm_device *dev)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 
+	if (!vgdev)
+		return;
+
 	virtio_gpu_modeset_fini(vgdev);
 	virtio_gpu_free_vbufs(vgdev);
 	virtio_gpu_cleanup_cap_cache(vgdev);
-- 
2.30.2

