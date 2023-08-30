Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DCE78D581
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 13:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC58B10E4F8;
	Wed, 30 Aug 2023 11:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-245.mta0.migadu.com (out-245.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::f5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE0210E4FA
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 11:24:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693394151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pgG068lwbSrL85NgvUHE0qbc19Xz9h3Wp1jv9CrKb5c=;
 b=BKbMYeKuNn9w8yBXx4KLlXqnPUTn8v0BW6xul9d3yqsah7BbL6O/ml1fXOw1/5XOVj3U3O
 qWMzRKfVm8NU8K/LEsd0wKIobhbEriwxUla5mUczR2uSAalvqYFba+ZXVu7C8kfPwBF4co
 kiTbzT5nv73FUV61tfctQ3srW3fnE6c=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [-next 4/5] drm/virgpu: Switch to pci_is_vga()
Date: Wed, 30 Aug 2023 19:15:31 +0800
Message-Id: <20230830111532.444535-5-sui.jingfeng@linux.dev>
In-Reply-To: <20230830111532.444535-1-sui.jingfeng@linux.dev>
References: <20230830111532.444535-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Should be no functional change, just for cleanup purpose.

Cc: David Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index add075681e18..3a368304475a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -51,7 +51,7 @@ static int virtio_gpu_pci_quirk(struct drm_device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	const char *pname = dev_name(&pdev->dev);
-	bool vga = (pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA;
+	bool vga = pci_is_vga(pdev);
 	int ret;
 
 	DRM_INFO("pci: %s detected at %s\n",
-- 
2.34.1

