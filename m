Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43418BD9D0
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 05:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BBB10E2E8;
	Tue,  7 May 2024 03:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EC810E2E8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 03:43:10 +0000 (UTC)
X-UUID: 2f3460e40c2311ef9305a59a3cc225df-20240507
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:8d3dde92-39c0-42cf-be35-07d152472bb0, IP:10,
 URL:0,TC:0,Content:0,EDM:25,RT:0,SF:-11,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:24
X-CID-INFO: VERSION:1.1.37, REQID:8d3dde92-39c0-42cf-be35-07d152472bb0, IP:10,
 UR
 L:0,TC:0,Content:0,EDM:25,RT:0,SF:-11,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:24
X-CID-META: VersionHash:6f543d0, CLOUDID:a7f1be296293f0ea6ea28dab44b48c3f,
 BulkI
 D:240429110502VVCX1UY7,BulkQuantity:1,Recheck:0,SF:19|44|66|38|25|17|102,T
 C:nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,C
 OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B,
 HR_CTT_MISS
 HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_LANG
 HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN
 HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, DN_TRUSTED
 SRC_TRUSTED, SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
 DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
 GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI
 AMN_C_BU, ABX_MISS_RDNS
X-UUID: 2f3460e40c2311ef9305a59a3cc225df-20240507
X-User: liweishi@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw.kylinos.cn
 (envelope-from <liweishi@kylinos.cn>) (Generic MTA)
 with ESMTP id 953568615; Tue, 07 May 2024 11:37:52 +0800
From: Weishi Li <liweishi@kylinos.cn>
To: airlied@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, liweishi@kylinos.cn
Subject: [PATCH] [PATCH RESEND] drm/virtio: fix memory leak of vbuf
Date: Tue,  7 May 2024 11:38:14 +0800
Message-Id: <20240507033814.57906-1-liweishi@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

Both virtio_gpu_queue_ctrl_buffer and virtio_gpu_queue_cursor use
virtqueue_add_sgs to upload the structure virtio_gpu_vbuffer * vbuf
to virtqueue. However, when the vbuf fails to upload and virtqueue_add_sgs
returns -EIO or -ENOMEM, the vbuf will not be able to be free by
virtio_gpu_dequeue_*_func, resulting in a continuous increase
in memory allocated to vgdev ->vbufs.

Therefore, make virtio_gpu_queue_ctrl_sgs and virtio_gpu_queue_cursor
free vbuf directly after virtqueue_add_sgs returns -EIO or -ENOMEM.

Signed-off-by: Weishi Li <liweishi@kylinos.cn>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index b1a00c0c25a7..e90751cc97f2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -356,12 +356,14 @@ static int virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 
 	ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
 	WARN_ON(ret);
+	if (ret < 0 && ret != -ENOSPC) {
+		free_vbuf(vgdev, vbuf);
+	} else {
+		vbuf->seqno = ++vgdev->ctrlq.seqno;
+		trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf), vbuf->seqno);
 
-	vbuf->seqno = ++vgdev->ctrlq.seqno;
-	trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf), vbuf->seqno);
-
-	atomic_inc(&vgdev->pending_commands);
-
+		atomic_inc(&vgdev->pending_commands);
+	}
 	spin_unlock(&vgdev->ctrlq.qlock);
 
 	drm_dev_exit(idx);
@@ -469,6 +471,8 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
 		wait_event(vgdev->cursorq.ack_queue, vq->num_free >= outcnt);
 		spin_lock(&vgdev->cursorq.qlock);
 		goto retry;
+	} else if (ret < 0) {
+		free_vbuf(vgdev, vbuf);
 	} else {
 		vbuf->seqno = ++vgdev->cursorq.seqno;
 		trace_virtio_gpu_cmd_queue(vq,
-- 
2.25.1

