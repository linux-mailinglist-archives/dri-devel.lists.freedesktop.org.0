Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F93ACB6F82
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 20:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0456410E878;
	Thu, 11 Dec 2025 19:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dbGNqYaS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD6D10E6C8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 19:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765479789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=NO16Pz5T0unAv8PTYT7vBeoyxcR41Tz/XOugEFsNnu0=;
 b=dbGNqYaS+CLu97vtK9wd0vOVC8ay+lcdUgBGuK5gACoYPbedafkbAajw20T9b7LUAXyekd
 uPIEbq7rrVgeVkuGGiu7yz2nHty6ryDP2ZPUipzbjYy5JUdt25KZRRKj/zE7OUa8qibtBD
 KWJplLeNMrUxYX4gnWvIIKCqWy+KVY4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-217-WyWzAiBHPBawrn08lhSS1A-1; Thu,
 11 Dec 2025 14:03:05 -0500
X-MC-Unique: WyWzAiBHPBawrn08lhSS1A-1
X-Mimecast-MFC-AGG-ID: WyWzAiBHPBawrn08lhSS1A_1765479783
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E86C61956095; Thu, 11 Dec 2025 19:03:02 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.81.78])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 56F24180049F; Thu, 11 Dec 2025 19:03:00 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, "Faith Ekstrand" <faith.ekstrand@collabora.com>,
 "Dave Airlie" <airlied@redhat.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Ben Skeggs" <bskeggs@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>,
 "David Airlie" <airlied@gmail.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Maxime Ripard" <mripard@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "James Jones" <jajones@nvidia.com>, "Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v2] drm/nouveau/dispnv50: Don't call
 drm_atomic_get_crtc_state() in prepare_fb
Date: Thu, 11 Dec 2025 14:02:54 -0500
Message-ID: <20251211190256.396742-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

---
V2:
* Don't call IS_ERR against the return value of
  drm_atomic_get_new_crtc_state(), it doesn't return pointer errors.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/atom.h | 13 +++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/atom.h b/drivers/gpu/drm/nouveau/dispnv50/atom.h
index 93f8f4f645784..b43c4f9bbcdf5 100644
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
+	if (!statec)
+		return NULL;
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
 

base-commit: c7685d11108acb387e44e3d81194d0d8959eaa44
-- 
2.52.0

