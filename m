Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6054E8B4FA6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 05:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52A810F8BE;
	Mon, 29 Apr 2024 03:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6862D10F8BE
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 03:05:10 +0000 (UTC)
X-UUID: 44d8254c05d511ef9305a59a3cc225df-20240429
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:e55886f0-59a4-4474-9cc4-478929e21d55, IP:10,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:7
X-CID-INFO: VERSION:1.1.37, REQID:e55886f0-59a4-4474-9cc4-478929e21d55, IP:10,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:7
X-CID-META: VersionHash:6f543d0, CLOUDID:7313eae06029394b1295c53706b3a94b,
 BulkI
 D:240429110502VVCX1UY7,BulkQuantity:0,Recheck:0,SF:66|25|100|17|19|43|101|
 74|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil
 ,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B,
 HR_CTT_TXT
 HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_LANG
 HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN
 HR_SJ_WS, HR_TO_AS_FROM, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
 DN_TRUSTED, SRC_TRUSTED, SA_UNTRUSTED, SA_LOWREP, SA_EXISTED
 SN_UNTRUSTED, SN_LOWREP, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
 DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
 GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI
 AMN_C_BU, ABX_MISS_RDNS
X-UUID: 44d8254c05d511ef9305a59a3cc225df-20240429
X-User: liweishi@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw.kylinos.cn
 (envelope-from <liweishi@kylinos.cn>) (Generic MTA)
 with ESMTP id 277750069; Mon, 29 Apr 2024 11:05:01 +0800
From: Weishi Li <liweishi@kylinos.cn>
To: liweishi@kylinos.cn
Cc: airlied@redhat.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 gurchetansingh@chromium.org, kraxel@redhat.com,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, olvaffe@gmail.com, tzimmermann@suse.de,
 virtualization@lists.linux.dev
Subject: [PATCH] [PATCH RESEND] drm/virtio: fix memory leak of vbuf
Date: Mon, 29 Apr 2024 11:05:41 +0800
Message-Id: <20240429030541.56702-1-liweishi@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240402093922.268368-1-liweishi@kylinos.cn>
References: <20240402093922.268368-1-liweishi@kylinos.cn>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both virtio_gpu_queue_ctrl_buffer and virtio_gpu_queue_cursor use
virtqueue_add_sgs to upload the structure virtio_gpu_vbuffer * vbuf
to virtqueue. However, when virtqueue_add_sgs returns -EIO or -ENOMEM,
it means vbuf upload failed, and vbuf will not be able to be
free by virtio_gpu_dequeue_*_func, resulting in a continuous increase
in memory allocated to vgdev ->vbufs.

Therefore, when upload fails，vbuf needs to be free directly.

Signed-off-by: Weishi Li <liweishi@kylinos.cn>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index b1a00c0c25a7..26f2e45635c1 100644
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
+	else if (ret < 0) {
+		free_vbuf(vgdev, vbuf);
 	} else {
 		vbuf->seqno = ++vgdev->cursorq.seqno;
 		trace_virtio_gpu_cmd_queue(vq,
-- 
2.25.1

