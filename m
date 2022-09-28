Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB4F5EE549
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 21:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB2B10E862;
	Wed, 28 Sep 2022 19:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3569B10E7F8;
 Wed, 28 Sep 2022 19:18:16 +0000 (UTC)
Received: from dimapc.. (unknown [109.252.125.248])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0D6C966022AE;
 Wed, 28 Sep 2022 20:18:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664392695;
 bh=Bf/HM+6R+hiu7OrkL+h6UvuRWVQ1N5WVmEFUBuTKYS4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h1ezi4Qy+bck4xc2QeB3GL4WiAo1UpcmFtEHaShQxGwBYPF2Zxi0vKJprL5hB/cRC
 BCxm28Os3pusZm6F5MbChiWfUhHwMV3N7v+aHfzrN21sNgNw0Quml8a4WUIig31yDa
 TPUC9bps9dyhqRIQQmsZlvUr8Pf6o+5EQHrMuxDnW/ZFW4G//idlXM666mxy5309d2
 tTbCwbJNO9Hgc+oL+5RCx/lkj9/OUs/OST1zTPU00tSxlrM0wItqZno5ZYQdsF6h77
 mnlivTC6qp1mAHFxl2WElZwFdo16HOu5rEcppvjxGiVXs3Ygr4XAT/8TFy504cLLDG
 gL63zJ20vU+vw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tomi Valkeinen <tomba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Ruhl Michael J <michael.j.ruhl@intel.com>
Subject: [PATCH v6 16/21] dma-buf: Move dma_buf_attach() to dynamic locking
 specification
Date: Wed, 28 Sep 2022 22:15:55 +0300
Message-Id: <20220928191600.5874-17-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928191600.5874-1-dmitry.osipenko@collabora.com>
References: <20220928191600.5874-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move dma-buf attachment API functions to the dynamic locking specification
by taking the reservation lock around the mapping operations. The strict
locking convention prevents deadlock situations for dma-buf importers and
exporters.

Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 23656f334735..d60585bbb529 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -859,8 +859,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	    dma_buf_is_dynamic(dmabuf)) {
 		struct sg_table *sgt;
 
+		dma_resv_lock(attach->dmabuf->resv, NULL);
 		if (dma_buf_is_dynamic(attach->dmabuf)) {
-			dma_resv_lock(attach->dmabuf->resv, NULL);
 			ret = dmabuf->ops->pin(attach);
 			if (ret)
 				goto err_unlock;
@@ -873,8 +873,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 			ret = PTR_ERR(sgt);
 			goto err_unpin;
 		}
-		if (dma_buf_is_dynamic(attach->dmabuf))
-			dma_resv_unlock(attach->dmabuf->resv);
+		dma_resv_unlock(attach->dmabuf->resv);
 		attach->sgt = sgt;
 		attach->dir = DMA_BIDIRECTIONAL;
 	}
@@ -890,8 +889,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 		dmabuf->ops->unpin(attach);
 
 err_unlock:
-	if (dma_buf_is_dynamic(attach->dmabuf))
-		dma_resv_unlock(attach->dmabuf->resv);
+	dma_resv_unlock(attach->dmabuf->resv);
 
 	dma_buf_detach(dmabuf, attach);
 	return ERR_PTR(ret);
@@ -937,21 +935,19 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 	if (WARN_ON(!dmabuf || !attach))
 		return;
 
+	dma_resv_lock(attach->dmabuf->resv, NULL);
+
 	if (attach->sgt) {
-		if (dma_buf_is_dynamic(attach->dmabuf))
-			dma_resv_lock(attach->dmabuf->resv, NULL);
 
 		__unmap_dma_buf(attach, attach->sgt, attach->dir);
 
-		if (dma_buf_is_dynamic(attach->dmabuf)) {
+		if (dma_buf_is_dynamic(attach->dmabuf))
 			dmabuf->ops->unpin(attach);
-			dma_resv_unlock(attach->dmabuf->resv);
-		}
 	}
-
-	dma_resv_lock(dmabuf->resv, NULL);
 	list_del(&attach->node);
+
 	dma_resv_unlock(dmabuf->resv);
+
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
 
-- 
2.37.3

