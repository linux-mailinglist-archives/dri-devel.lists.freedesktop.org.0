Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 662701CB940
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 22:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E006EB79;
	Fri,  8 May 2020 20:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F176EB7C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 20:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588970941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cFwaMvdxoBWGROIY8hv5qGelj+u9xuR+YN/i4obkeXk=;
 b=OfgfyVeCc8KbktD/K0PBO47ZdcPw9JXl6HC3oN97D8376sqHdcpj2nhJpeprNa54WpNIpl
 r71Uv+Mlk581+8LaEetV5F0PRRs1gsXUbwRGkqoq8DHbKVvaZmRoxBLWzjKy36CCXHuLwm
 +X0yIC8BHCh0imEdUiJHyC162xHMYbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-tojuCxiNOBW3wlF6_SpUOA-1; Fri, 08 May 2020 16:48:57 -0400
X-MC-Unique: tojuCxiNOBW3wlF6_SpUOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19419835B42;
 Fri,  8 May 2020 20:48:56 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-118-29.rdu2.redhat.com [10.10.118.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0B745D9CA;
 Fri,  8 May 2020 20:48:54 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC v4 09/12] drm/nouveau/kms/nv140-: Track wndw mappings in
 nv50_head_atom
Date: Fri,  8 May 2020 16:46:59 -0400
Message-Id: <20200508204751.155488-10-lyude@redhat.com>
In-Reply-To: <20200508204751.155488-1-lyude@redhat.com>
References: <20200508204751.155488-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While we're not quite ready yet to add support for flexible wndw
mappings, we are going to need to at least keep track of the static wndw
mappings we're currently using in each head's atomic state. We'll likely
use this in the future to implement real flexible window mapping, but
the primary reason we'll need this is for CRC support.

See: on nvidia hardware, each CRC entry in the CRC notifier dma context
has a "tag". This tag corresponds to the nth update on a specific
EVO/NvDisplay channel, which itself is referred to as the "controlling
channel". For gf119+ this can be the core channel, ovly channel, or base
channel. Since we don't expose CRC entry tags to userspace, we simply
ignore this feature and always use the core channel as the controlling
channel. Simple.

Things get a little bit more complicated on gv100+ though. GV100+ only
lets us set the controlling channel to a specific wndw channel, and that
wndw must be owned by the head that we're grabbing CRCs when we enable
CRC generation. Thus, we always need to make sure that each atomic head
state has at least one wndw that is mapped to the head, which will be
used as the controlling channel.

Note that since we don't have flexible wndw mappings yet, we don't
expect to run into any scenarios yet where we'd have a head with no
mapped wndws. When we do add support for flexible wndw mappings however,
we'll need to make sure that we handle reprogramming CRC capture if our
controlling wndw is moved to another head (and potentially reject the
new head state entirely if we can't find another available wndw to
replace it).

With that being said, nouveau currently tracks wndw visibility on heads.
It does not keep track of the actual ownership mappings, which are
(currently) statically programmed. To fix this, we introduce another
bitmask into nv50_head_atom.wndw to keep track of ownership separately
from visibility. We then introduce a nv50_head callback to handle
populating the wndw ownership map, and call it during the atomic check
phase when core->assign_windows is set to true.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/atom.h     |  1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 16 ++++++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/head.h     |  2 ++
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c | 10 ++++++++++
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c |  2 ++
 5 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/atom.h b/drivers/gpu/drm/nouveau/dispnv50/atom.h
index 24f7700768da..62faaf60f47a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/atom.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/atom.h
@@ -18,6 +18,7 @@ struct nv50_head_atom {
 
 	struct {
 		u32 mask;
+		u32 owned;
 		u32 olut;
 	} wndw;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 6be9df1820c5..5be036b3b533 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2254,12 +2254,28 @@ static int
 nv50_disp_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct nv50_atom *atom = nv50_atom(state);
+	struct nv50_core *core = nv50_disp(dev)->core;
 	struct drm_connector_state *old_connector_state, *new_connector_state;
 	struct drm_connector *connector;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_crtc *crtc;
+	struct nv50_head *head;
+	struct nv50_head_atom *asyh;
 	int ret, i;
 
+	if (core->assign_windows && core->func->head->static_wndw_map) {
+		drm_for_each_crtc(crtc, dev) {
+			new_crtc_state = drm_atomic_get_crtc_state(state,
+								   crtc);
+			if (IS_ERR(new_crtc_state))
+				return PTR_ERR(new_crtc_state);
+
+			head = nv50_head(crtc);
+			asyh = nv50_head_atom(new_crtc_state);
+			core->func->head->static_wndw_map(head, asyh);
+		}
+	}
+
 	/* We need to handle colour management on a per-plane basis. */
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 		if (new_crtc_state->color_mgmt_changed) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.h b/drivers/gpu/drm/nouveau/dispnv50/head.h
index c32b27cdaefc..c05bbba9e247 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.h
@@ -40,6 +40,7 @@ struct nv50_head_func {
 	void (*dither)(struct nv50_head *, struct nv50_head_atom *);
 	void (*procamp)(struct nv50_head *, struct nv50_head_atom *);
 	void (*or)(struct nv50_head *, struct nv50_head_atom *);
+	void (*static_wndw_map)(struct nv50_head *, struct nv50_head_atom *);
 };
 
 extern const struct nv50_head_func head507d;
@@ -86,6 +87,7 @@ int headc37d_curs_format(struct nv50_head *, struct nv50_wndw_atom *,
 void headc37d_curs_set(struct nv50_head *, struct nv50_head_atom *);
 void headc37d_curs_clr(struct nv50_head *);
 void headc37d_dither(struct nv50_head *, struct nv50_head_atom *);
+void headc37d_static_wndw_map(struct nv50_head *, struct nv50_head_atom *);
 
 extern const struct nv50_head_func headc57d;
 #endif
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
index 68920f8d9c79..cf5a68f4021a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
@@ -203,6 +203,15 @@ headc37d_view(struct nv50_head *head, struct nv50_head_atom *asyh)
 	}
 }
 
+void
+headc37d_static_wndw_map(struct nv50_head *head, struct nv50_head_atom *asyh)
+{
+	int i, end;
+
+	for (i = head->base.index * 2, end = i + 2; i < end; i++)
+		asyh->wndw.owned |= BIT(i);
+}
+
 const struct nv50_head_func
 headc37d = {
 	.view = headc37d_view,
@@ -218,4 +227,5 @@ headc37d = {
 	.dither = headc37d_dither,
 	.procamp = headc37d_procamp,
 	.or = headc37d_or,
+	.static_wndw_map = headc37d_static_wndw_map,
 };
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
index 0296cd1d761f..65e3b60804c6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -210,4 +210,6 @@ headc57d = {
 	.dither = headc37d_dither,
 	.procamp = headc57d_procamp,
 	.or = headc57d_or,
+	/* TODO: flexible window mappings */
+	.static_wndw_map = headc37d_static_wndw_map,
 };
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
