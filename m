Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB3E3BCB97
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57516E02C;
	Tue,  6 Jul 2021 11:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9ED76E02C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:14:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F4D0619C5;
 Tue,  6 Jul 2021 11:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570092;
 bh=dwjCJhT1HGXtnEmZtAYdiTk+mnxlKa0LmxCkHY4vptI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nxd2X5zRQdnKZDDHW5OsfAqFvohZ2gu+2+i5NbhFVc2tD2699Q3IzA5Q9FDxcqHQT
 rB1+K4nfF7NSIGEQIaj+lLFScAdG86m7611ZY3jbHEW/XdNUc+tzgTWAGE5LgaJSej
 xA3JeOmUdCK6K+ZKaSPLyZSHn0waULASzLEvwQXBWNgT32GkPOLnRlWp/vSNAH4krL
 jvsVMXjlQ1XODoOqI77aosXohNTL74KtXFUuhPf/FzpYSKH9NUYCONbGQ9ZkMuIVNC
 fmMRT8tyCYXEcjzDLbHCMbHVG+oyGeBKaqtAkstRfWZH7N6P0I9XCwbMyieTdYgH3R
 WEgmEf92GujIw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 030/189] drm/virtio: Fixes a potential NULL
 pointer dereference on probe failure
Date: Tue,  6 Jul 2021 07:11:30 -0400
Message-Id: <20210706111409.2058071-30-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
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

