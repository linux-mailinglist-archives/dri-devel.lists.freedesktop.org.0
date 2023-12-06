Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4966B80693E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 09:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8B010E69F;
	Wed,  6 Dec 2023 08:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C229010E68D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 08:15:50 +0000 (UTC)
X-UUID: a6de4e52940f11eea33bb35ae8d461a2-20231206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5hNl/ebhPBItzu4pN+YmmtZTsVFNCochFPrIS+vXnfY=; 
 b=gYtRdNvBnXmhjW2UzxGr6PEiYAfzK9e3J98h0WKmO/dZL+TiRaH+Wzx06KnriWqPpFZcOEZ92KUwFb3uzExjoGXOxCOh1ZnQDVM4off6EfXe2Q4EsK1q6OqLRwbLruflO+RmjgDcErhfkGErhS64cjR4BDgn8cOT0dCaBOuz2lg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34, REQID:eada1246-6692-4119-9f39-76b9732126cb, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:abefa75, CLOUDID:6d853596-10ce-4e4b-85c2-c9b5229ff92b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a6de4e52940f11eea33bb35ae8d461a2-20231206
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1271472418; Wed, 06 Dec 2023 16:15:44 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Dec 2023 16:15:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Dec 2023 16:15:41 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
Subject: [PATCH v3,02/21] v4l2: handle secure memory flags in queue setup
Date: Wed, 6 Dec 2023 16:15:19 +0800
Message-ID: <20231206081538.17056-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206081538.17056-1-yunfei.dong@mediatek.com>
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Steve Cho <stevecho@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Matthias Brugger <matthias.bgg@gmail.com>,
 John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-mediatek@lists.infradead.org, "T . J .
 Mercier" <tjmercier@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Yong Wu <yong.wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jeffrey Kardatzke <jkardatzke@google.com>

Validates the secure memory flags when setting up a queue and ensures
the queue has the proper capability.

Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 23 +++++++++++++
 .../media/common/videobuf2/videobuf2-v4l2.c   | 34 +++++++++++++------
 2 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 8c1df829745b..09dc030484be 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -813,6 +813,15 @@ static bool verify_coherency_flags(struct vb2_queue *q, bool non_coherent_mem)
 	return true;
 }
 
+static bool verify_secure_mem_flags(struct vb2_queue *q, bool secure_mem)
+{
+	if (secure_mem != q->secure_mem) {
+		dprintk(q, 1, "secure memory model mismatch\n");
+		return false;
+	}
+	return true;
+}
+
 int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 		     unsigned int flags, unsigned int *count)
 {
@@ -820,6 +829,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	unsigned int q_num_bufs = vb2_get_num_buffers(q);
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
 	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
+	bool secure_mem = flags & V4L2_MEMORY_FLAG_SECURE;
 	unsigned int i;
 	int ret = 0;
 
@@ -836,6 +846,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	if (*count == 0 || q_num_bufs != 0 ||
 	    (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory) ||
 	    !verify_coherency_flags(q, non_coherent_mem)) {
+		bool no_previous_buffers = !q->num_buffers;
+
 		/*
 		 * We already have buffers allocated, so first check if they
 		 * are not in use and can be freed.
@@ -854,6 +866,12 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 		__vb2_queue_free(q, q_num_bufs);
 		mutex_unlock(&q->mmap_lock);
 
+		/*
+		 * Do not allow switching secure buffer mode.
+		 */
+		if (!no_previous_buffers && !verify_secure_mem_flags(q, secure_mem))
+			return -EINVAL;
+
 		/*
 		 * In case of REQBUFS(0) return immediately without calling
 		 * driver's queue_setup() callback and allocating resources.
@@ -882,6 +900,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	if (ret)
 		return ret;
 	set_queue_coherency(q, non_coherent_mem);
+	q->secure_mem = secure_mem;
 
 	/*
 	 * Ask the driver how many buffers and planes per buffer it requires.
@@ -986,6 +1005,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
 	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
 	unsigned int q_num_bufs = vb2_get_num_buffers(q);
+	bool secure_mem = flags & V4L2_MEMORY_FLAG_SECURE;
 	bool no_previous_buffers = !q_num_bufs;
 	int ret = 0;
 
@@ -1015,6 +1035,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 			return ret;
 		q->waiting_for_buffers = !q->is_output;
 		set_queue_coherency(q, non_coherent_mem);
+		q->secure_mem = secure_mem;
 	} else {
 		if (q->memory != memory) {
 			dprintk(q, 1, "memory model mismatch\n");
@@ -1022,6 +1043,8 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 		}
 		if (!verify_coherency_flags(q, non_coherent_mem))
 			return -EINVAL;
+		if (!verify_secure_mem_flags(q, secure_mem))
+			return -EINVAL;
 	}
 
 	num_buffers = min(*count, q->max_num_buffers - q_num_bufs);
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 54d572c3b515..0a530830276c 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -686,22 +686,30 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
 	if (q->supports_requests)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
+	if (q->allow_secure_mem && q->io_modes & VB2_DMABUF)
+		*caps |= V4L2_BUF_CAP_SUPPORTS_SECURE_MEM;
 }
 
-static void validate_memory_flags(struct vb2_queue *q,
+static bool validate_memory_flags(struct vb2_queue *q,
 				  int memory,
 				  u32 *flags)
 {
+	if (*flags & V4L2_MEMORY_FLAG_SECURE &&
+	    (!q->allow_secure_mem || memory != V4L2_MEMORY_DMABUF)) {
+		return false;
+	}
+
 	if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP) {
 		/*
-		 * This needs to clear V4L2_MEMORY_FLAG_NON_COHERENT only,
-		 * but in order to avoid bugs we zero out all bits.
+		 * This needs to clear V4L2_MEMORY_FLAG_NON_COHERENT only.
 		 */
-		*flags = 0;
-	} else {
-		/* Clear all unknown flags. */
-		*flags &= V4L2_MEMORY_FLAG_NON_COHERENT;
+		*flags &= ~V4L2_MEMORY_FLAG_NON_COHERENT;
 	}
+
+	/* Clear all unknown flags. */
+	*flags &= V4L2_MEMORY_FLAG_NON_COHERENT | V4L2_MEMORY_FLAG_SECURE;
+
+	return true;
 }
 
 int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
@@ -710,7 +718,8 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 	u32 flags = req->flags;
 
 	fill_buf_caps(q, &req->capabilities);
-	validate_memory_flags(q, req->memory, &flags);
+	if (!validate_memory_flags(q, req->memory, &flags))
+		return -EINVAL;
 	req->flags = flags;
 	return ret ? ret : vb2_core_reqbufs(q, req->memory,
 					    req->flags, &req->count);
@@ -752,7 +761,8 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	unsigned i;
 
 	fill_buf_caps(q, &create->capabilities);
-	validate_memory_flags(q, create->memory, &create->flags);
+	if (!validate_memory_flags(q, create->memory, &create->flags))
+		return -EINVAL;
 	create->index = vb2_get_num_buffers(q);
 	create->max_num_buffers = q->max_num_buffers;
 	create->capabilities |= V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS;
@@ -1007,7 +1017,8 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
 	u32 flags = p->flags;
 
 	fill_buf_caps(vdev->queue, &p->capabilities);
-	validate_memory_flags(vdev->queue, p->memory, &flags);
+	if (!validate_memory_flags(vdev->queue, p->memory, &flags))
+		return -EINVAL;
 	p->flags = flags;
 	if (res)
 		return res;
@@ -1031,7 +1042,8 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
 
 	p->index = vdev->queue->num_buffers;
 	fill_buf_caps(vdev->queue, &p->capabilities);
-	validate_memory_flags(vdev->queue, p->memory, &p->flags);
+	if (!validate_memory_flags(vdev->queue, p->memory, &p->flags))
+		return -EINVAL;
 	/*
 	 * If count == 0, then just check if memory and type are valid.
 	 * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
-- 
2.18.0

