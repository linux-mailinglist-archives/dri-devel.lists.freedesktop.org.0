Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A7F341013
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 22:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7BD6E19B;
	Thu, 18 Mar 2021 21:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123226E199
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 21:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616104556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+F9WBdvna1lLwOxbPDF5YvSCuQnZUcRY6D1ed3m7rV0=;
 b=TtxOTKPq4yOgZZxU35XkdWKHUTjqj8IBPSAZkUvawalDSA3/0DA1SiPNZBFwXBnrXxaU4V
 90LVy+XwLrNJlALJLenltX95B6MxNZgp0g8RDGtNcNSXaEve+pl3ATn27o1UZOqDpCRBjS
 9gv5o07CXtvvwokslYNU9MqvCVhV+t8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-3wuonlc2PaWuoZRdCBN9wA-1; Thu, 18 Mar 2021 17:55:52 -0400
X-MC-Unique: 3wuonlc2PaWuoZRdCBN9wA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE5B38143F2;
 Thu, 18 Mar 2021 21:55:50 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-113-18.rdu2.redhat.com [10.10.113.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32D4C1F070;
 Thu, 18 Mar 2021 21:55:49 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/kms/nv50-: Check plane size for cursors,
 not fb size
Date: Thu, 18 Mar 2021 17:55:40 -0400
Message-Id: <20210318215545.901756-1-lyude@redhat.com>
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
 Ben Skeggs <bskeggs@redhat.com>, Martin Peres <martin.peres@mupuf.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Found this while trying to make some changes to the kms_cursor_crc test.
curs507a_acquire checks that the width and height of the cursor framebuffer
are equal (asyw->image.{w,h}). This is actually wrong though, as we only
want to be concerned that the actual width/height of the plane are the
same. It's fine if we scan out from an fb that's slightly larger than the
cursor plane (in fact, some igt tests actually do this).

Note that I'm not entirely sure why this wasn't previously breaking
kms_cursor_crc tests - they all set up cursors with the height being one
pixel larger than the actual size of the cursor. But this seems to fix
things, and the code before was definitely incorrect - so it's not really
worth looking into further imho.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@mupuf.org>
Cc: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/head507d.c | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/head917d.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
index 54fbd6fe751d..7a7f80e51ec0 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
@@ -109,7 +109,7 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
 	if (ret || !asyh->curs.visible)
 		return ret;
 
-	if (asyw->image.w != asyw->image.h)
+	if (asyw->state.crtc_w != asyw->state.crtc_h)
 		return -EINVAL;
 
 	ret = head->func->curs_layout(head, asyw, asyh);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head507d.c b/drivers/gpu/drm/nouveau/dispnv50/head507d.c
index 09b89983864b..3d230ca488c9 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head507d.c
@@ -176,7 +176,7 @@ int
 head507d_curs_layout(struct nv50_head *head, struct nv50_wndw_atom *asyw,
 		     struct nv50_head_atom *asyh)
 {
-	switch (asyw->image.w) {
+	switch (asyw->state.crtc_w) {
 	case 32: asyh->curs.layout = NV507D_HEAD_SET_CONTROL_CURSOR_SIZE_W32_H32; break;
 	case 64: asyh->curs.layout = NV507D_HEAD_SET_CONTROL_CURSOR_SIZE_W64_H64; break;
 	default:
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head917d.c b/drivers/gpu/drm/nouveau/dispnv50/head917d.c
index 4ce47b55f72c..caa7d633691b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head917d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head917d.c
@@ -103,7 +103,7 @@ int
 head917d_curs_layout(struct nv50_head *head, struct nv50_wndw_atom *asyw,
 		     struct nv50_head_atom *asyh)
 {
-	switch (asyw->state.fb->width) {
+	switch (asyw->state.crtc_w) {
 	case  32: asyh->curs.layout = NV917D_HEAD_SET_CONTROL_CURSOR_SIZE_W32_H32; break;
 	case  64: asyh->curs.layout = NV917D_HEAD_SET_CONTROL_CURSOR_SIZE_W64_H64; break;
 	case 128: asyh->curs.layout = NV917D_HEAD_SET_CONTROL_CURSOR_SIZE_W128_H128; break;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
