Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93A52FAE6B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 02:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E24B6E7D5;
	Tue, 19 Jan 2021 01:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E366E7D4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 01:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611021021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+UAgEF7q3tVgarE49rL6lz5qDhc929cOctxQXBBYdNI=;
 b=ZNFKSulYssNxUSJxQZmxj/Rd/WrmUOwaC2F40stYF9ttgWUBruZHiOnIvi/Jwc4Fbul+Wd
 H4hnOgeBNixQoaVpqfWlZPqr3yiSO77AwEu3S6Vdcd6+4lWJCfiufOtcCWgL8nNC9W0unc
 yd89TkPlimD/jh60MO7PZH1kpV+xBh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-D5ZLNPQhPSy8QmHC89Ymtg-1; Mon, 18 Jan 2021 20:50:16 -0500
X-MC-Unique: D5ZLNPQhPSy8QmHC89Ymtg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AF0A801817;
 Tue, 19 Jan 2021 01:50:15 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-113-206.rdu2.redhat.com
 [10.10.113.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 422591F471;
 Tue, 19 Jan 2021 01:50:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 1/5] drm/nouveau/kms/nv50-: Use drm_dbg_kms() in crc.c
Date: Mon, 18 Jan 2021 20:48:45 -0500
Message-Id: <20210119014849.2509965-2-lyude@redhat.com>
In-Reply-To: <20210119014849.2509965-1-lyude@redhat.com>
References: <20210119014849.2509965-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Jeremy Cline <jcline@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cc: Martin Peres <martin.peres@free.fr>
Cc: Jeremy Cline <jcline@redhat.com>
Cc: Simon Ser <contact@emersion.fr>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/crc.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index b8c31b697797..3c50b29a37ff 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -84,7 +84,8 @@ static void nv50_crc_ctx_flip_work(struct kthread_work *base)
 	struct nv50_crc *crc = container_of(work, struct nv50_crc, flip_work);
 	struct nv50_head *head = container_of(crc, struct nv50_head, crc);
 	struct drm_crtc *crtc = &head->base.base;
-	struct nv50_disp *disp = nv50_disp(crtc->dev);
+	struct drm_device *dev = crtc->dev;
+	struct nv50_disp *disp = nv50_disp(dev);
 	u8 new_idx = crc->ctx_idx ^ 1;
 
 	/*
@@ -92,18 +93,15 @@ static void nv50_crc_ctx_flip_work(struct kthread_work *base)
 	 * try again for the next vblank if we don't grab the lock
 	 */
 	if (!mutex_trylock(&disp->mutex)) {
-		DRM_DEV_DEBUG_KMS(crtc->dev->dev,
-				  "Lock contended, delaying CRC ctx flip for head-%d\n",
-				  head->base.index);
+		drm_dbg_kms(dev, "Lock contended, delaying CRC ctx flip for %s\n", crtc->name);
 		drm_vblank_work_schedule(work,
 					 drm_crtc_vblank_count(crtc) + 1,
 					 true);
 		return;
 	}
 
-	DRM_DEV_DEBUG_KMS(crtc->dev->dev,
-			  "Flipping notifier ctx for head %d (%d -> %d)\n",
-			  drm_crtc_index(crtc), crc->ctx_idx, new_idx);
+	drm_dbg_kms(dev, "Flipping notifier ctx for %s (%d -> %d)\n",
+		    crtc->name, crc->ctx_idx, new_idx);
 
 	nv50_crc_program_ctx(head, NULL);
 	nv50_crc_program_ctx(head, &crc->ctx[new_idx]);
@@ -189,9 +187,9 @@ void nv50_crc_handle_vblank(struct nv50_head *head)
 		 * updates back-to-back without waiting, we'll just be
 		 * optimistic and assume we always miss exactly one frame.
 		 */
-		DRM_DEV_DEBUG_KMS(head->base.base.dev->dev,
-				  "Notifier ctx flip for head-%d finished, lost CRC for frame %llu\n",
-				  head->base.index, crc->frame);
+		drm_dbg_kms(head->base.base.dev,
+			    "Notifier ctx flip for head-%d finished, lost CRC for frame %llu\n",
+			    head->base.index, crc->frame);
 		crc->frame++;
 
 		nv50_crc_reset_ctx(ctx);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
