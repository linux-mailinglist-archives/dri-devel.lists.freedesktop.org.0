Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B437C954FA
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 22:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931C210E06D;
	Sun, 30 Nov 2025 21:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C0110E06D
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 21:42:16 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-636-qIuYSjSaO5ivavKeDRpPNw-1; Sun,
 30 Nov 2025 16:42:12 -0500
X-MC-Unique: qIuYSjSaO5ivavKeDRpPNw-1
X-Mimecast-MFC-AGG-ID: qIuYSjSaO5ivavKeDRpPNw_1764538932
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F2746180049F; Sun, 30 Nov 2025 21:42:11 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.7])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 11B3B1800451; Sun, 30 Nov 2025 21:42:08 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau: use proper atomic accessor to get crtc state
Date: Mon,  1 Dec 2025 07:42:06 +1000
Message-ID: <20251130214206.1469934-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E5sBVISY9fPf7k8tOQ6Afavgo8eWc5H7QfRKjiMV_AU_1764538932
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
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

From: Dave Airlie <airlied@redhat.com>

This gets the crtc state from the current state, instead of
trying to lookup or create a state.

atomic core started warning about this recently.

Fixes: 0a0e79a2d9ed ("drm/atomic: WARN about invalid drm_foo_get_state() us=
age")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/atom.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/atom.h b/drivers/gpu/drm/nouv=
eau/dispnv50/atom.h
index 93f8f4f64578..ada8fb6f1a9a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/atom.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/atom.h
@@ -151,7 +151,7 @@ struct nv50_head_atom {
 static inline struct nv50_head_atom *
 nv50_head_atom_get(struct drm_atomic_state *state, struct drm_crtc *crtc)
 {
-=09struct drm_crtc_state *statec =3D drm_atomic_get_crtc_state(state, crtc=
);
+=09struct drm_crtc_state *statec =3D drm_atomic_get_new_crtc_state(state, =
crtc);
 =09if (IS_ERR(statec))
 =09=09return (void *)statec;
 =09return nv50_head_atom(statec);
--=20
2.51.1

