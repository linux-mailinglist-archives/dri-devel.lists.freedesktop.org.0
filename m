Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896A1CA963C
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 22:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6560A10E03B;
	Fri,  5 Dec 2025 21:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XKazOrxz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81D810EBBA
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 21:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764970347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=kxmueX5biLhJ2TR2gDtyWx7oPUcxnAg7QJk2s9ppvBo=;
 b=XKazOrxzUJIDZkHtOJS62dKfFLbAAU/Rl6sD+4y4gvHt9lmEtFwLfb+kpleCpVT45bE+6t
 2pqhdIHT/9voBZCfVwZ6h1WfzSUkL7/HCPFI43OWoQe7Ol4OEcGGnQQBzCxraOpoos7cAm
 3o3tgNcedxGysQIewTIpfk6eG7sYluk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-148-XHl9Sl5aOy2ePqdoMvtIvw-1; Fri,
 05 Dec 2025 16:32:22 -0500
X-MC-Unique: XHl9Sl5aOy2ePqdoMvtIvw-1
X-Mimecast-MFC-AGG-ID: XHl9Sl5aOy2ePqdoMvtIvw_1764970340
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BC2E119560B3; Fri,  5 Dec 2025 21:32:19 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.64.189])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 565F51953986; Fri,  5 Dec 2025 21:32:15 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 nouveau@lists.freedesktop.org,
 "Faith Ekstrand" <faith.ekstrand@collabora.com>,
 "Dave Airlie" <airlied@redhat.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Ben Skeggs" <bskeggs@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>,
 "David Airlie" <airlied@gmail.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Maxime Ripard" <mripard@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "James Jones" <jajones@nvidia.com>, "Lyude Paul" <lyude@redhat.com>
Subject: [PATCH] drm/nouveau/dispnv50: Don't call drm_atomic_get_crtc_state()
 in prepare_fb
Date: Fri,  5 Dec 2025 16:31:53 -0500
Message-ID: <20251205213156.2847867-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

Since we recently started warning about uses of this function after the
atomic check phase completes, we've started getting warnings about this in
nouveau. It appears a misplaced drm_atomic_get_crtc_state() call has been
hiding in our .prepare_fb callback for a while.

So, fix this by adding a new nv50_head_atom_get_new() function and use that
in our .prepare_fb callback instead.

Signed-off-by: Lyude Paul <lyude@redhat.com>

Fixes: 1590700d94ac ("drm/nouveau/kms/nv50-: split each resource type into their own source files")
Cc: <stable@vger.kernel.org> # v4.18+
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/atom.h | 13 +++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/atom.h b/drivers/gpu/drm/nouveau/dispnv50/atom.h
index 93f8f4f645784..85b7cf70d13c4 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/atom.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/atom.h
@@ -152,8 +152,21 @@ static inline struct nv50_head_atom *
 nv50_head_atom_get(struct drm_atomic_state *state, struct drm_crtc *crtc)
 {
 	struct drm_crtc_state *statec = drm_atomic_get_crtc_state(state, crtc);
+
 	if (IS_ERR(statec))
 		return (void *)statec;
+
+	return nv50_head_atom(statec);
+}
+
+static inline struct nv50_head_atom *
+nv50_head_atom_get_new(struct drm_atomic_state *state, struct drm_crtc *crtc)
+{
+	struct drm_crtc_state *statec = drm_atomic_get_new_crtc_state(state, crtc);
+
+	if (IS_ERR(statec))
+		return (void*)statec;
+
 	return nv50_head_atom(statec);
 }
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index ef9e410babbfb..9a2c20fce0f3e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -583,7 +583,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	asyw->image.offset[0] = nvbo->offset;
 
 	if (wndw->func->prepare) {
-		asyh = nv50_head_atom_get(asyw->state.state, asyw->state.crtc);
+		asyh = nv50_head_atom_get_new(asyw->state.state, asyw->state.crtc);
 		if (IS_ERR(asyh))
 			return PTR_ERR(asyh);
 
-- 
2.52.0

