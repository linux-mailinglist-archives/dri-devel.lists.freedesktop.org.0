Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4E02FAE6C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 02:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4B66E7D9;
	Tue, 19 Jan 2021 01:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D9D6E7D9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 01:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611021025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xm4VaWlgX93IkYu6cOVbQUmUWgu6MaGKFDLqY8C57ic=;
 b=OmwNIKTUv2eNGr1EUtH83Xnio00YY7uH5wsuSPA2fMJdVlD2YDv7YLnNWDoBOuFQ1u40Pb
 NAo1NFfeHSUl33FtxJxGlqfZI4TDsea4hzzBSFhCPuay+Br3rNEWzDEqQhrndn9JUAzmRK
 4+sYg6wtsVC8lihMIraWNxNS1f5MKFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-0MMP7VLpMmScxflnKCD5TA-1; Mon, 18 Jan 2021 20:50:23 -0500
X-MC-Unique: 0MMP7VLpMmScxflnKCD5TA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F112C18C8C00;
 Tue, 19 Jan 2021 01:50:21 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-113-206.rdu2.redhat.com
 [10.10.113.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E1831F471;
 Tue, 19 Jan 2021 01:50:20 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 2/5] drm/nouveau/kms/nv50-: Check vbl count after CRC context
 flip
Date: Mon, 18 Jan 2021 20:48:46 -0500
Message-Id: <20210119014849.2509965-3-lyude@redhat.com>
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

While I haven't seen us take too long in nv50_crc_ctx_flip_work() outside of
users with kernel logging on a serial port, it probably would be a good idea to
check how long we take just in case we need to go faster in the future.

Cc: Martin Peres <martin.peres@free.fr>
Cc: Jeremy Cline <jcline@redhat.com>
Cc: Simon Ser <contact@emersion.fr>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/crc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index 3c50b29a37ff..ef942248345c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -86,6 +86,8 @@ static void nv50_crc_ctx_flip_work(struct kthread_work *base)
 	struct drm_crtc *crtc = &head->base.base;
 	struct drm_device *dev = crtc->dev;
 	struct nv50_disp *disp = nv50_disp(dev);
+	const uint64_t start_vbl = drm_crtc_vblank_count(crtc);
+	uint64_t end_vbl;
 	u8 new_idx = crc->ctx_idx ^ 1;
 
 	/*
@@ -94,9 +96,7 @@ static void nv50_crc_ctx_flip_work(struct kthread_work *base)
 	 */
 	if (!mutex_trylock(&disp->mutex)) {
 		drm_dbg_kms(dev, "Lock contended, delaying CRC ctx flip for %s\n", crtc->name);
-		drm_vblank_work_schedule(work,
-					 drm_crtc_vblank_count(crtc) + 1,
-					 true);
+		drm_vblank_work_schedule(work, start_vbl + 1, true);
 		return;
 	}
 
@@ -107,6 +107,12 @@ static void nv50_crc_ctx_flip_work(struct kthread_work *base)
 	nv50_crc_program_ctx(head, &crc->ctx[new_idx]);
 	mutex_unlock(&disp->mutex);
 
+	end_vbl = drm_crtc_vblank_count(crtc);
+	if (unlikely(end_vbl != start_vbl))
+		NV_ERROR(nouveau_drm(dev),
+			 "Failed to flip CRC context on %s on time (%llu > %llu)\n",
+			 crtc->name, end_vbl, start_vbl);
+
 	spin_lock_irq(&crc->lock);
 	crc->ctx_changed = true;
 	spin_unlock_irq(&crc->lock);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
