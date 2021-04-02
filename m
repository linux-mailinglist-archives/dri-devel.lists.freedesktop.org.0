Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7A83527A1
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 10:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E3B6EE37;
	Fri,  2 Apr 2021 08:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17635.qiye.163.com (mail-m17635.qiye.163.com
 [59.111.176.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B833F6EE37
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 08:55:53 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id A3C5F40010F;
 Fri,  2 Apr 2021 16:55:51 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: fix potential abnormal lock/unlock
Date: Fri,  2 Apr 2021 01:55:47 -0700
Message-Id: <20210402085549.77050-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTkpITUkYTh1DSB5MVkpNSkxITkhMTkpCTk9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS09ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRQ6PRw*ST8UCipKDTgCCQ81
 ThwaCQ5VSlVKTUpMSE5ITE5JSUxDVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFJSEJNNwY+
X-HM-Tid: 0a7891cbbd49d991kuwsa3c5f40010f
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
Cc: Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix coccicheck warning:
drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c:115:3-9: preceding lock on line 109
drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c:98:2-8: preceding lock on line 95

As we see, function nvkm_fifo_chan_inst & nvkm_fifo_chan_chid both
use spin_lock_irqsave, but no spin_unlock_irqrestore in if/return
branch, seems like a potential bug?

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
index 2ed4ff05d207..e3f624d97644 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
@@ -95,6 +95,7 @@ nvkm_fifo_chan_inst(struct nvkm_fifo *fifo, u64 inst, unsigned long *rflags)
 	spin_lock_irqsave(&fifo->lock, flags);
 	if ((chan = nvkm_fifo_chan_inst_locked(fifo, inst))) {
 		*rflags = flags;
+		spin_unlock_irqrestore(&fifo->lock, flags);
 		return chan;
 	}
 	spin_unlock_irqrestore(&fifo->lock, flags);
@@ -112,6 +113,7 @@ nvkm_fifo_chan_chid(struct nvkm_fifo *fifo, int chid, unsigned long *rflags)
 			list_del(&chan->head);
 			list_add(&chan->head, &fifo->chan);
 			*rflags = flags;
+			spin_unlock_irqrestore(&fifo->lock, flags);
 			return chan;
 		}
 	}
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
