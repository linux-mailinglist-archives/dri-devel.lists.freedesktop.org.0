Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9933D3F3EEB
	for <lists+dri-devel@lfdr.de>; Sun, 22 Aug 2021 12:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE536E027;
	Sun, 22 Aug 2021 10:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1350 seconds by postgrey-1.36 at gabe;
 Sun, 22 Aug 2021 10:00:17 UTC
Received: from out.smtpout.orange.fr (out02.smtpout.orange.fr [193.252.22.211])
 by gabe.freedesktop.org (Postfix) with ESMTP id EBA576E027
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 10:00:17 +0000 (UTC)
Received: from pop-os.home ([90.126.253.178]) by mwinf5d59 with ME
 id kZW9250013riaq203ZW9Et; Sun, 22 Aug 2021 11:30:14 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 22 Aug 2021 11:30:14 +0200
X-ME-IP: 90.126.253.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: hverkuil-cisco@xs4all.nl, mchehab@kernel.org, awalls@md.metrocast.net,
 yong.zhi@intel.com, sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
 djrscally@gmail.com, tian.shu.qiu@intel.com, serjk@netup.ru,
 aospan@netup.ru, tskd08@gmail.com, maintainers@bluecherrydvr.com,
 anton@corp.bluecherry.net, andrey.utkin@corp.bluecherry.net,
 sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: switch from 'pci_' to 'dma_' API
Date: Sun, 22 Aug 2021 11:30:08 +0200
Message-Id: <71a7e0029ce28ec748eb045c8381d354011cebe6.1629623093.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below.

It has been compile tested.


@@
@@
-    PCI_DMA_BIDIRECTIONAL
+    DMA_BIDIRECTIONAL

@@
@@
-    PCI_DMA_TODEVICE
+    DMA_TO_DEVICE

@@
@@
-    PCI_DMA_FROMDEVICE
+    DMA_FROM_DEVICE

@@
@@
-    PCI_DMA_NONE
+    DMA_NONE

@@
expression e1, e2, e3;
@@
-    pci_alloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3;
@@
-    pci_zalloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3, e4;
@@
-    pci_free_consistent(e1, e2, e3, e4)
+    dma_free_coherent(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_single(e1, e2, e3, e4)
+    dma_map_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_single(e1, e2, e3, e4)
+    dma_unmap_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4, e5;
@@
-    pci_map_page(e1, e2, e3, e4, e5)
+    dma_map_page(&e1->dev, e2, e3, e4, e5)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_page(e1, e2, e3, e4)
+    dma_unmap_page(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_sg(e1, e2, e3, e4)
+    dma_map_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_sg(e1, e2, e3, e4)
+    dma_unmap_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
+    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_device(e1, e2, e3, e4)
+    dma_sync_single_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
+    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
+    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2;
@@
-    pci_dma_mapping_error(e1, e2)
+    dma_mapping_error(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_dma_mask(e1, e2)
+    dma_set_mask(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_consistent_dma_mask(e1, e2)
+    dma_set_coherent_mask(&e1->dev, e2)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
If needed, see post from Christoph Hellwig on the kernel-janitors ML:
   https://marc.info/?l=kernel-janitors&m=158745678307186&w=4

This patch is purely mechanical and compile tested. I hope it is ok to
update the "drivers/media/pci/" directory all at once.
---
 drivers/media/pci/cobalt/cobalt-driver.c      |  4 ++--
 drivers/media/pci/cx18/cx18-driver.c          |  2 +-
 drivers/media/pci/cx18/cx18-queue.c           | 13 ++++++------
 drivers/media/pci/cx18/cx18-streams.c         | 16 +++++++--------
 drivers/media/pci/ddbridge/ddbridge-main.c    |  4 ++--
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  2 +-
 .../pci/netup_unidvb/netup_unidvb_core.c      |  2 +-
 drivers/media/pci/pluto2/pluto2.c             | 20 +++++++++----------
 drivers/media/pci/pt1/pt1.c                   |  2 +-
 drivers/media/pci/tw5864/tw5864-core.c        |  2 +-
 10 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
index 16af58f2f93c..74edcc76d12f 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.c
+++ b/drivers/media/pci/cobalt/cobalt-driver.c
@@ -332,8 +332,8 @@ static int cobalt_setup_pci(struct cobalt *cobalt, struct pci_dev *pci_dev,
 		}
 	}
 
-	if (pci_set_dma_mask(pci_dev, DMA_BIT_MASK(64))) {
-		ret = pci_set_dma_mask(pci_dev, DMA_BIT_MASK(32));
+	if (dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(64))) {
+		ret = dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(32));
 		if (ret) {
 			cobalt_err("no suitable DMA available\n");
 			goto err_disable;
diff --git a/drivers/media/pci/cx18/cx18-driver.c b/drivers/media/pci/cx18/cx18-driver.c
index f2440eb38820..59497ba6bf1f 100644
--- a/drivers/media/pci/cx18/cx18-driver.c
+++ b/drivers/media/pci/cx18/cx18-driver.c
@@ -804,7 +804,7 @@ static int cx18_setup_pci(struct cx18 *cx, struct pci_dev *pci_dev,
 		CX18_ERR("Can't enable device %d!\n", cx->instance);
 		return -EIO;
 	}
-	if (pci_set_dma_mask(pci_dev, DMA_BIT_MASK(32))) {
+	if (dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(32))) {
 		CX18_ERR("No suitable DMA available, card %d\n", cx->instance);
 		return -EIO;
 	}
diff --git a/drivers/media/pci/cx18/cx18-queue.c b/drivers/media/pci/cx18/cx18-queue.c
index 2f5df471dada..b9ae34a5e427 100644
--- a/drivers/media/pci/cx18/cx18-queue.c
+++ b/drivers/media/pci/cx18/cx18-queue.c
@@ -325,8 +325,8 @@ void _cx18_mdl_sync_for_device(struct cx18_stream *s, struct cx18_mdl *mdl)
 	struct cx18_buffer *buf;
 
 	list_for_each_entry(buf, &mdl->buf_list, list)
-		pci_dma_sync_single_for_device(pci_dev, buf->dma_handle,
-					       buf_size, dma);
+		dma_sync_single_for_device(&pci_dev->dev, buf->dma_handle,
+					   buf_size, dma);
 }
 
 int cx18_stream_alloc(struct cx18_stream *s)
@@ -385,8 +385,9 @@ int cx18_stream_alloc(struct cx18_stream *s)
 		cx18_enqueue(s, mdl, &s->q_idle);
 
 		INIT_LIST_HEAD(&buf->list);
-		buf->dma_handle = pci_map_single(s->cx->pci_dev,
-				buf->buf, s->buf_size, s->dma);
+		buf->dma_handle = dma_map_single(&s->cx->pci_dev->dev,
+						 buf->buf, s->buf_size,
+						 s->dma);
 		cx18_buf_sync_for_cpu(s, buf);
 		list_add_tail(&buf->list, &s->buf_pool);
 	}
@@ -419,8 +420,8 @@ void cx18_stream_free(struct cx18_stream *s)
 		buf = list_first_entry(&s->buf_pool, struct cx18_buffer, list);
 		list_del_init(&buf->list);
 
-		pci_unmap_single(s->cx->pci_dev, buf->dma_handle,
-				s->buf_size, s->dma);
+		dma_unmap_single(&s->cx->pci_dev->dev, buf->dma_handle,
+				 s->buf_size, s->dma);
 		kfree(buf->buf);
 		kfree(buf);
 	}
diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index 16d37ab48906..87ff554bb2d2 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -49,44 +49,44 @@ static struct {
 	{	/* CX18_ENC_STREAM_TYPE_MPG */
 		"encoder MPEG",
 		VFL_TYPE_VIDEO, 0,
-		PCI_DMA_FROMDEVICE,
+		DMA_FROM_DEVICE,
 		V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
 		V4L2_CAP_AUDIO | V4L2_CAP_TUNER
 	},
 	{	/* CX18_ENC_STREAM_TYPE_TS */
 		"TS",
 		VFL_TYPE_VIDEO, -1,
-		PCI_DMA_FROMDEVICE,
+		DMA_FROM_DEVICE,
 	},
 	{	/* CX18_ENC_STREAM_TYPE_YUV */
 		"encoder YUV",
 		VFL_TYPE_VIDEO, CX18_V4L2_ENC_YUV_OFFSET,
-		PCI_DMA_FROMDEVICE,
+		DMA_FROM_DEVICE,
 		V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
 		V4L2_CAP_STREAMING | V4L2_CAP_AUDIO | V4L2_CAP_TUNER
 	},
 	{	/* CX18_ENC_STREAM_TYPE_VBI */
 		"encoder VBI",
 		VFL_TYPE_VBI, 0,
-		PCI_DMA_FROMDEVICE,
+		DMA_FROM_DEVICE,
 		V4L2_CAP_VBI_CAPTURE | V4L2_CAP_SLICED_VBI_CAPTURE |
 		V4L2_CAP_READWRITE | V4L2_CAP_TUNER
 	},
 	{	/* CX18_ENC_STREAM_TYPE_PCM */
 		"encoder PCM audio",
 		VFL_TYPE_VIDEO, CX18_V4L2_ENC_PCM_OFFSET,
-		PCI_DMA_FROMDEVICE,
+		DMA_FROM_DEVICE,
 		V4L2_CAP_TUNER | V4L2_CAP_AUDIO | V4L2_CAP_READWRITE,
 	},
 	{	/* CX18_ENC_STREAM_TYPE_IDX */
 		"encoder IDX",
 		VFL_TYPE_VIDEO, -1,
-		PCI_DMA_FROMDEVICE,
+		DMA_FROM_DEVICE,
 	},
 	{	/* CX18_ENC_STREAM_TYPE_RAD */
 		"encoder radio",
 		VFL_TYPE_RADIO, 0,
-		PCI_DMA_NONE,
+		DMA_NONE,
 		V4L2_CAP_RADIO | V4L2_CAP_TUNER
 	},
 };
@@ -324,7 +324,7 @@ static int cx18_prep_dev(struct cx18 *cx, int type)
 
 	/* User explicitly selected 0 buffers for these streams, so don't
 	   create them. */
-	if (cx18_stream_info[type].dma != PCI_DMA_NONE &&
+	if (cx18_stream_info[type].dma != DMA_NONE &&
 	    cx->stream_buffers[type] == 0) {
 		CX18_INFO("Disabled %s device\n", cx18_stream_info[type].name);
 		return 0;
diff --git a/drivers/media/pci/ddbridge/ddbridge-main.c b/drivers/media/pci/ddbridge/ddbridge-main.c
index 03dc9924fa2c..25d0d6745b52 100644
--- a/drivers/media/pci/ddbridge/ddbridge-main.c
+++ b/drivers/media/pci/ddbridge/ddbridge-main.c
@@ -180,8 +180,8 @@ static int ddb_probe(struct pci_dev *pdev,
 
 	pci_set_master(pdev);
 
-	if (pci_set_dma_mask(pdev, DMA_BIT_MASK(64)))
-		if (pci_set_dma_mask(pdev, DMA_BIT_MASK(32)))
+	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(64)))
+		if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(32)))
 			return -ENODEV;
 
 	dev = vzalloc(sizeof(*dev));
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index e84b8faf76a2..f8c32e1294cf 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1763,7 +1763,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 
 	pci_set_master(pci_dev);
 
-	r = pci_set_dma_mask(pci_dev, CIO2_DMA_MASK);
+	r = dma_set_mask(&pci_dev->dev, CIO2_DMA_MASK);
 	if (r) {
 		dev_err(&pci_dev->dev, "failed to set DMA mask (%d)\n", r);
 		return -ENODEV;
diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
index 77bae1468551..8287851b5ffd 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
@@ -846,7 +846,7 @@ static int netup_unidvb_initdev(struct pci_dev *pci_dev,
 		"%s(): board vendor 0x%x, revision 0x%x\n",
 		__func__, board_vendor, board_revision);
 	pci_set_master(pci_dev);
-	if (pci_set_dma_mask(pci_dev, 0xffffffff) < 0) {
+	if (dma_set_mask(&pci_dev->dev, 0xffffffff) < 0) {
 		dev_err(&pci_dev->dev,
 			"%s(): 32bit PCI DMA is not supported\n", __func__);
 		goto pci_detect_err;
diff --git a/drivers/media/pci/pluto2/pluto2.c b/drivers/media/pci/pluto2/pluto2.c
index f1f4793a4452..6ac9b9bd7435 100644
--- a/drivers/media/pci/pluto2/pluto2.c
+++ b/drivers/media/pci/pluto2/pluto2.c
@@ -228,16 +228,16 @@ static void pluto_set_dma_addr(struct pluto *pluto)
 
 static int pluto_dma_map(struct pluto *pluto)
 {
-	pluto->dma_addr = pci_map_single(pluto->pdev, pluto->dma_buf,
-			TS_DMA_BYTES, PCI_DMA_FROMDEVICE);
+	pluto->dma_addr = dma_map_single(&pluto->pdev->dev, pluto->dma_buf,
+					 TS_DMA_BYTES, DMA_FROM_DEVICE);
 
-	return pci_dma_mapping_error(pluto->pdev, pluto->dma_addr);
+	return dma_mapping_error(&pluto->pdev->dev, pluto->dma_addr);
 }
 
 static void pluto_dma_unmap(struct pluto *pluto)
 {
-	pci_unmap_single(pluto->pdev, pluto->dma_addr,
-			TS_DMA_BYTES, PCI_DMA_FROMDEVICE);
+	dma_unmap_single(&pluto->pdev->dev, pluto->dma_addr, TS_DMA_BYTES,
+			 DMA_FROM_DEVICE);
 }
 
 static int pluto_start_feed(struct dvb_demux_feed *f)
@@ -276,8 +276,8 @@ static void pluto_dma_end(struct pluto *pluto, unsigned int nbpackets)
 {
 	/* synchronize the DMA transfer with the CPU
 	 * first so that we see updated contents. */
-	pci_dma_sync_single_for_cpu(pluto->pdev, pluto->dma_addr,
-			TS_DMA_BYTES, PCI_DMA_FROMDEVICE);
+	dma_sync_single_for_cpu(&pluto->pdev->dev, pluto->dma_addr,
+				TS_DMA_BYTES, DMA_FROM_DEVICE);
 
 	/* Workaround for broken hardware:
 	 * [1] On startup NBPACKETS seems to contain an uninitialized value,
@@ -310,8 +310,8 @@ static void pluto_dma_end(struct pluto *pluto, unsigned int nbpackets)
 	pluto_set_dma_addr(pluto);
 
 	/* sync the buffer and give it back to the card */
-	pci_dma_sync_single_for_device(pluto->pdev, pluto->dma_addr,
-			TS_DMA_BYTES, PCI_DMA_FROMDEVICE);
+	dma_sync_single_for_device(&pluto->pdev->dev, pluto->dma_addr,
+				   TS_DMA_BYTES, DMA_FROM_DEVICE);
 }
 
 static irqreturn_t pluto_irq(int irq, void *dev_id)
@@ -595,7 +595,7 @@ static int pluto2_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	/* enable interrupts */
 	pci_write_config_dword(pdev, 0x6c, 0x8000);
 
-	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret < 0)
 		goto err_pci_disable_device;
 
diff --git a/drivers/media/pci/pt1/pt1.c b/drivers/media/pci/pt1/pt1.c
index f2aa36814fba..121a4a92ea10 100644
--- a/drivers/media/pci/pt1/pt1.c
+++ b/drivers/media/pci/pt1/pt1.c
@@ -1340,7 +1340,7 @@ static int pt1_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret < 0)
 		goto err;
 
-	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret < 0)
 		goto err_pci_disable_device;
 
diff --git a/drivers/media/pci/tw5864/tw5864-core.c b/drivers/media/pci/tw5864/tw5864-core.c
index 282f7dfb7aaf..23d3cae54a5d 100644
--- a/drivers/media/pci/tw5864/tw5864-core.c
+++ b/drivers/media/pci/tw5864/tw5864-core.c
@@ -262,7 +262,7 @@ static int tw5864_initdev(struct pci_dev *pci_dev,
 
 	pci_set_master(pci_dev);
 
-	err = pci_set_dma_mask(pci_dev, DMA_BIT_MASK(32));
+	err = dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(32));
 	if (err) {
 		dev_err(&dev->pci->dev, "32 bit PCI DMA is not supported\n");
 		goto disable_pci;
-- 
2.30.2

