Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978A2341099
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 00:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356DA6E1BA;
	Thu, 18 Mar 2021 23:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7646E1BA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 23:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616108640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=YZlE2SpcI6Z5P+uMCGU6V1+SijPPA2J1aeZ5CJSQ25s=;
 b=e8Oyxj06xPVHW6tlOkl8BcARhy5zpzafzg/Iil50RVbiSpBJfgbuNsIvaDV/wuWKPZEMMx
 m2PDkYte35rAElDayOJpIj8rsCO2/ozgcE2wCxyBa8BbHEfH5C7Rlt89cAnbdjY7DJt0ji
 cOjftT4o5Ajd8jyNSuZIF/amzrVlb/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-ONeMpnShPq2-b4QsQDZxGw-1; Thu, 18 Mar 2021 19:03:57 -0400
X-MC-Unique: ONeMpnShPq2-b4QsQDZxGw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EDD58189C8;
 Thu, 18 Mar 2021 23:03:56 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-113-18.rdu2.redhat.com [10.10.113.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4EF96A8FC;
 Thu, 18 Mar 2021 23:03:53 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH v2] drm/nouveau/kms/nv50-: Correct size checks for cursors
Date: Thu, 18 Mar 2021 19:03:49 -0400
Message-Id: <20210318230351.982064-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 Ben Skeggs <bskeggs@redhat.com>, Martin Peres <martin.peres@mupuf.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Found this while trying to make some changes to the kms_cursor_crc test.
curs507a_acquire checks that the width and height of the cursor framebuffer
are equal (asyw->image.{w,h}). This isn't entirely correct though, as the
height of the cursor can be larger than the size of the cursor, as long as
the width is the same as the cursor size and there's no framebuffer offset.

Note that I'm not entirely sure why this wasn't previously breaking
kms_cursor_crc tests - they all set up cursors with the height being one
pixel larger than the actual size of the cursor. But this seems to fix
things, and the code before was definitely incorrect - so it's not really
worth looking into further imho.

Changes since v1:
* Don't use crtc_w everywhere for determining cursor layout, just use fb
  size again
* Change check so that we only check that the w/h of the cursor plane is
  the same, the width of the scanout surface is the same as the framebuffer
  width, and that there's no offset being used for the cursor surface.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@mupuf.org>
Cc: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
index 54fbd6fe751d..00e19fd959ea 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
@@ -98,6 +98,7 @@ static int
 curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
 		 struct nv50_head_atom *asyh)
 {
+	struct nouveau_drm *drm = nouveau_drm(wndw->plane.dev);
 	struct nv50_head *head = nv50_head(asyw->state.crtc);
 	int ret;
 
@@ -109,8 +110,20 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
 	if (ret || !asyh->curs.visible)
 		return ret;
 
-	if (asyw->image.w != asyw->image.h)
+	if (asyw->state.crtc_w != asyw->state.crtc_h) {
+		NV_ATOMIC(drm, "Plane width/height must be equal for cursors\n");
 		return -EINVAL;
+	}
+
+	if (asyw->image.w != asyw->state.crtc_w) {
+		NV_ATOMIC(drm, "Plane width must be equal to fb width for cursors (height can be larger though)\n");
+		return -EINVAL;
+	}
+
+	if (asyw->state.src_x || asyw->state.src_y) {
+		NV_ATOMIC(drm, "Cursor planes do not support framebuffer offsets\n");
+		return -EINVAL;
+	}
 
 	ret = head->func->curs_layout(head, asyw, asyh);
 	if (ret)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
