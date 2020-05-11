Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3511CE855
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523E26E5CA;
	Mon, 11 May 2020 22:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0EF6E5CA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 22:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589236963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=epEYmcBn92xG4SxCsxcKOrCOQQyl4rw+y+9iUjYuTBY=;
 b=N0OOZ9ReWoky6tG3RBnvs9us0ZlCbOmA0iXLBaI7ayiswLKl1DxtHRKiVh8NDc+6tiTUgn
 9UF9+9UwDTQ817gn59ALwStauAZXPh8rbp/ZjMPa4QYCMj3k9XBmaVOhO7QSKAs1E0GsgX
 vfVnz7q8bwNGIL1UeD6xUYvQMzJQBts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-xxsv2v9RMUWlMB2fBB3itg-1; Mon, 11 May 2020 18:42:38 -0400
X-MC-Unique: xxsv2v9RMUWlMB2fBB3itg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8549D460;
 Mon, 11 May 2020 22:42:37 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-117-238.rdu2.redhat.com
 [10.10.117.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A01877F2E;
 Mon, 11 May 2020 22:42:36 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH v3 3/5] drm/nouveau/kms/gv100-: Add support for interlaced
 modes
Date: Mon, 11 May 2020 18:41:25 -0400
Message-Id: <20200511224148.598468-4-lyude@redhat.com>
In-Reply-To: <20200511224148.598468-1-lyude@redhat.com>
References: <20200511224148.598468-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We advertise being able to set interlaced modes, so let's actually make
sure to do that. Otherwise, we'll end up hanging the display engine due
to trying to set a mode with timings adjusted for interlacing without
telling the hardware it's actually an interlaced mode.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c | 5 +++--
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c | 5 +++--
 drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
index 00011ce109a6..4a9a32b89f74 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
@@ -168,14 +168,15 @@ headc37d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 	struct nv50_dmac *core = &nv50_disp(head->base.base.dev)->core->chan;
 	struct nv50_head_mode *m = &asyh->mode;
 	u32 *push;
-	if ((push = evo_wait(core, 12))) {
+	if ((push = evo_wait(core, 13))) {
 		evo_mthd(push, 0x2064 + (head->base.index * 0x400), 5);
 		evo_data(push, (m->v.active  << 16) | m->h.active );
 		evo_data(push, (m->v.synce   << 16) | m->h.synce  );
 		evo_data(push, (m->v.blanke  << 16) | m->h.blanke );
 		evo_data(push, (m->v.blanks  << 16) | m->h.blanks );
 		evo_data(push, (m->v.blank2e << 16) | m->v.blank2s);
-		evo_mthd(push, 0x200c + (head->base.index * 0x400), 1);
+		evo_mthd(push, 0x2008 + (head->base.index * 0x400), 2);
+		evo_data(push, m->interlace);
 		evo_data(push, m->clock * 1000);
 		evo_mthd(push, 0x2028 + (head->base.index * 0x400), 1);
 		evo_data(push, m->clock * 1000);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
index 938d910a1b1e..859131a8bc3c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -173,14 +173,15 @@ headc57d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 	struct nv50_dmac *core = &nv50_disp(head->base.base.dev)->core->chan;
 	struct nv50_head_mode *m = &asyh->mode;
 	u32 *push;
-	if ((push = evo_wait(core, 12))) {
+	if ((push = evo_wait(core, 13))) {
 		evo_mthd(push, 0x2064 + (head->base.index * 0x400), 5);
 		evo_data(push, (m->v.active  << 16) | m->h.active );
 		evo_data(push, (m->v.synce   << 16) | m->h.synce  );
 		evo_data(push, (m->v.blanke  << 16) | m->h.blanke );
 		evo_data(push, (m->v.blanks  << 16) | m->h.blanks );
 		evo_data(push, (m->v.blank2e << 16) | m->v.blank2s);
-		evo_mthd(push, 0x200c + (head->base.index * 0x400), 1);
+		evo_mthd(push, 0x2008 + (head->base.index * 0x400), 2);
+		evo_data(push, m->interlace);
 		evo_data(push, m->clock * 1000);
 		evo_mthd(push, 0x2028 + (head->base.index * 0x400), 1);
 		evo_data(push, m->clock * 1000);
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 43bcbb6d73c4..6dae00da5d7e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1065,7 +1065,7 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
 		return get_slave_funcs(encoder)->mode_valid(encoder, mode);
 	case DCB_OUTPUT_DP:
 		if (mode->flags & DRM_MODE_FLAG_INTERLACE &&
-		    !nv_encoder->dp.caps.interlace)
+		    !nv_encoder->caps.dp_interlace)
 			return MODE_NO_INTERLACE;
 
 		max_clock  = nv_encoder->dp.link_nr;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
