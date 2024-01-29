Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917FA83FE62
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 07:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0D61121BE;
	Mon, 29 Jan 2024 06:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB8710FC77
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 06:30:43 +0000 (UTC)
X-UUID: eb034a62be6f11ee9e680517dc993faa-20240129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ks8HEFFM+Bita0r2YqnY0e2OF7bLuHGY/XucvXvt/5M=; 
 b=rC7CSzJzNC1ArM4nYD97m29F0aGXFq92DQ5DDdJtbho6hQRKy81VEhadHZiknB02IiEJhoc381lZDT4qLHDpOEaYVWnuuSAlwEokwK8HdXy/H+y+0WNdvccoQl723F5g2I7xLxcO1c+TgxH3bGLcawUfAbxcMuPwLtXWTdhSYGA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36, REQID:7f957b61-6f8a-4168-ab5d-a99195d6723e, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:6e16cf4, CLOUDID:4cb5c38e-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: eb034a62be6f11ee9e680517dc993faa-20240129
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 757566817; Mon, 29 Jan 2024 14:30:38 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 29 Jan 2024 14:30:37 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 29 Jan 2024 14:30:36 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
Subject: [PATCH v4,01/22] v4l2: add restricted memory flags
Date: Mon, 29 Jan 2024 14:30:04 +0800
Message-ID: <20240129063025.29251-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240129063025.29251-1-yunfei.dong@mediatek.com>
References: <20240129063025.29251-1-yunfei.dong@mediatek.com>
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
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, linux-mediatek@lists.infradead.org,
 "T . J .
 Mercier" <tjmercier@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Yong Wu <yong.wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jeffrey Kardatzke <jkardatzke@google.com>

Adds a V4L2 flag which indicates that a queue is using restricted
dmabufs and the corresponding capability flag.

Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 include/media/videobuf2-core.h | 8 +++++++-
 include/uapi/linux/videodev2.h | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 56719a26a46c..047d4798e423 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -518,6 +518,9 @@ struct vb2_buf_ops {
  *		->finish().
  * @non_coherent_mem: when set queue will attempt to allocate buffers using
  *		non-coherent memory.
+ * @allow_restricted_mem: when set user-space can pass the %V4L2_MEMORY_FLAG_RESTRICTED
+ *		flag to indicate the dma bufs are restricted.
+ * @restricted_mem: when set queue will verify that the dma bufs are restricted.
  * @lock:	pointer to a mutex that protects the &struct vb2_queue. The
  *		driver can set this to a mutex to let the v4l2 core serialize
  *		the queuing ioctls. If the driver wants to handle locking
@@ -604,6 +607,8 @@ struct vb2_queue {
 	unsigned int			uses_requests:1;
 	unsigned int			allow_cache_hints:1;
 	unsigned int			non_coherent_mem:1;
+	unsigned int			allow_restricted_mem:1;
+	unsigned int			restricted_mem:1;
 
 	struct mutex			*lock;
 	void				*owner;
@@ -773,7 +778,8 @@ void vb2_core_querybuf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb);
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.
  * @memory:	memory type, as defined by &enum vb2_memory.
  * @flags:	auxiliary queue/buffer management flags. Currently, the only
- *		used flag is %V4L2_MEMORY_FLAG_NON_COHERENT.
+ *		used flags are %V4L2_MEMORY_FLAG_NON_COHERENT and
+ *		%V4L2_MEMORY_FLAG_RESTRICTED.
  * @count:	requested buffer count.
  *
  * Videobuf2 core helper to implement VIDIOC_REQBUF() operation. It is called
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 68e7ac178cc2..3e3f8d4b7c81 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1026,6 +1026,7 @@ struct v4l2_requestbuffers {
 };
 
 #define V4L2_MEMORY_FLAG_NON_COHERENT			(1 << 0)
+#define V4L2_MEMORY_FLAG_RESTRICTED			(1 << 1)
 
 /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
 #define V4L2_BUF_CAP_SUPPORTS_MMAP			(1 << 0)
@@ -1036,6 +1037,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
 #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
 #define V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS		(1 << 7)
+#define V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM		(1 << 8)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
-- 
2.18.0

