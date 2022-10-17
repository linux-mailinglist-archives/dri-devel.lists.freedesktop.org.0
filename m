Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8ED360150A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 19:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F174610EDDC;
	Mon, 17 Oct 2022 17:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8CB10EDC5;
 Mon, 17 Oct 2022 17:25:03 +0000 (UTC)
Received: from dimapc.. (109-252-119-114.nat.spd-mgts.ru [109.252.119.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A8AD9660238B;
 Mon, 17 Oct 2022 18:24:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666027502;
 bh=rursgbmP7QEQ6FtIuHaTGEHDv1XGwQXcoPlxwDcrJ6M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mR3pBAnsTTsC2o5rwzo7UMXYaggyUIyp32bjFE5T+q0znkvf9RzmwbCdqQeq/DdoO
 j/zRnXyDaxRU0Ur8kCgU6JFoY2ZCM+9ZuBgzO1mRN8LezU0C6qLttQlmN1yU4NiZCA
 UMOPyj6yCWLZF8RB4JulBJxWGFL/HvxUK003P2LnoMDtNw5IUcs2ihGqpEYlorTdrM
 dsSrLPjl8lrzfUcjp82RUnx7/Dp/hPvANuNTE6X9GLCcrX8+sZ53B9CG3J8KNc2Erz
 X/3ZXKMSfz9fBW0m4YNZvxCFMZ9QKrGXz/5aNhM1KIBcNviG1umajO6s62Ata/gwA7
 Dw+bwnrE9CQCA==
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
Subject: [PATCH v7 13/21] media: videobuf2: Prepare to dynamic dma-buf locking
 specification
Date: Mon, 17 Oct 2022 20:22:21 +0300
Message-Id: <20221017172229.42269-14-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017172229.42269-1-dmitry.osipenko@collabora.com>
References: <20221017172229.42269-1-dmitry.osipenko@collabora.com>
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

Prepare V4L2 memory allocators to the common dynamic dma-buf locking
convention by starting to use the unlocked versions of dma-buf API
functions.

Acked-by: Tomasz Figa <tfiga@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 11 ++++++-----
 drivers/media/common/videobuf2/videobuf2-dma-sg.c     |  8 ++++----
 drivers/media/common/videobuf2/videobuf2-vmalloc.c    |  6 +++---
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 678b359717c4..79f4d8301fbb 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -101,7 +101,7 @@ static void *vb2_dc_vaddr(struct vb2_buffer *vb, void *buf_priv)
 	if (buf->db_attach) {
 		struct iosys_map map;
 
-		if (!dma_buf_vmap(buf->db_attach->dmabuf, &map))
+		if (!dma_buf_vmap_unlocked(buf->db_attach->dmabuf, &map))
 			buf->vaddr = map.vaddr;
 
 		return buf->vaddr;
@@ -711,7 +711,7 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
 	}
 
 	/* get the associated scatterlist for this buffer */
-	sgt = dma_buf_map_attachment(buf->db_attach, buf->dma_dir);
+	sgt = dma_buf_map_attachment_unlocked(buf->db_attach, buf->dma_dir);
 	if (IS_ERR(sgt)) {
 		pr_err("Error getting dmabuf scatterlist\n");
 		return -EINVAL;
@@ -722,7 +722,8 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
 	if (contig_size < buf->size) {
 		pr_err("contiguous chunk is too small %lu/%lu\n",
 		       contig_size, buf->size);
-		dma_buf_unmap_attachment(buf->db_attach, sgt, buf->dma_dir);
+		dma_buf_unmap_attachment_unlocked(buf->db_attach, sgt,
+						  buf->dma_dir);
 		return -EFAULT;
 	}
 
@@ -750,10 +751,10 @@ static void vb2_dc_unmap_dmabuf(void *mem_priv)
 	}
 
 	if (buf->vaddr) {
-		dma_buf_vunmap(buf->db_attach->dmabuf, &map);
+		dma_buf_vunmap_unlocked(buf->db_attach->dmabuf, &map);
 		buf->vaddr = NULL;
 	}
-	dma_buf_unmap_attachment(buf->db_attach, sgt, buf->dma_dir);
+	dma_buf_unmap_attachment_unlocked(buf->db_attach, sgt, buf->dma_dir);
 
 	buf->dma_addr = 0;
 	buf->dma_sgt = NULL;
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index fa69158a65b1..36ecdea8d707 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -309,7 +309,7 @@ static void *vb2_dma_sg_vaddr(struct vb2_buffer *vb, void *buf_priv)
 
 	if (!buf->vaddr) {
 		if (buf->db_attach) {
-			ret = dma_buf_vmap(buf->db_attach->dmabuf, &map);
+			ret = dma_buf_vmap_unlocked(buf->db_attach->dmabuf, &map);
 			buf->vaddr = ret ? NULL : map.vaddr;
 		} else {
 			buf->vaddr = vm_map_ram(buf->pages, buf->num_pages, -1);
@@ -565,7 +565,7 @@ static int vb2_dma_sg_map_dmabuf(void *mem_priv)
 	}
 
 	/* get the associated scatterlist for this buffer */
-	sgt = dma_buf_map_attachment(buf->db_attach, buf->dma_dir);
+	sgt = dma_buf_map_attachment_unlocked(buf->db_attach, buf->dma_dir);
 	if (IS_ERR(sgt)) {
 		pr_err("Error getting dmabuf scatterlist\n");
 		return -EINVAL;
@@ -594,10 +594,10 @@ static void vb2_dma_sg_unmap_dmabuf(void *mem_priv)
 	}
 
 	if (buf->vaddr) {
-		dma_buf_vunmap(buf->db_attach->dmabuf, &map);
+		dma_buf_vunmap_unlocked(buf->db_attach->dmabuf, &map);
 		buf->vaddr = NULL;
 	}
-	dma_buf_unmap_attachment(buf->db_attach, sgt, buf->dma_dir);
+	dma_buf_unmap_attachment_unlocked(buf->db_attach, sgt, buf->dma_dir);
 
 	buf->dma_sgt = NULL;
 }
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
index 948152f1596b..7831bf545874 100644
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
@@ -376,7 +376,7 @@ static int vb2_vmalloc_map_dmabuf(void *mem_priv)
 	struct iosys_map map;
 	int ret;
 
-	ret = dma_buf_vmap(buf->dbuf, &map);
+	ret = dma_buf_vmap_unlocked(buf->dbuf, &map);
 	if (ret)
 		return -EFAULT;
 	buf->vaddr = map.vaddr;
@@ -389,7 +389,7 @@ static void vb2_vmalloc_unmap_dmabuf(void *mem_priv)
 	struct vb2_vmalloc_buf *buf = mem_priv;
 	struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
 
-	dma_buf_vunmap(buf->dbuf, &map);
+	dma_buf_vunmap_unlocked(buf->dbuf, &map);
 	buf->vaddr = NULL;
 }
 
@@ -399,7 +399,7 @@ static void vb2_vmalloc_detach_dmabuf(void *mem_priv)
 	struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
 
 	if (buf->vaddr)
-		dma_buf_vunmap(buf->dbuf, &map);
+		dma_buf_vunmap_unlocked(buf->dbuf, &map);
 
 	kfree(buf);
 }
-- 
2.37.3

