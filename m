Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6D1C99021
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 21:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5612610E486;
	Mon,  1 Dec 2025 20:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E5B10E486
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 20:25:10 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-74-wOug5CvGOtmKMmg9a7ciUg-1; Mon,
 01 Dec 2025 15:25:08 -0500
X-MC-Unique: wOug5CvGOtmKMmg9a7ciUg-1
X-Mimecast-MFC-AGG-ID: wOug5CvGOtmKMmg9a7ciUg_1764620707
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2CBA81956053; Mon,  1 Dec 2025 20:25:07 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.7])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2490A19560A7; Mon,  1 Dec 2025 20:25:04 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau: don't inherit boot eDP
Date: Tue,  2 Dec 2025 06:25:02 +1000
Message-ID: <20251201202502.1591252-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kyE2slaCi3YrkRIffFGNX0ssN7vvXNtXk38b3MsQMWo_1764620707
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

At the moment when eDP gets inherited at startup, the first atomic
comment, turns off the CRTC then turns it back on. This for some
reasons end in a black screen and no display.

I've tried to investigate this and it might be link training,
but it also might be a problem with starting the stream.

For now just don't inherit eDP at all.

Cc: stable@vger.kernel.org
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouv=
eau/dispnv50/disp.c
index 12b1dba8e05d..72e7cad6ccff 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2748,6 +2748,13 @@ nv50_display_read_hw_or_state(struct drm_device *dev=
, struct nv50_disp *disp,
 =09if (drm_WARN_ON(dev, !found_conn))
 =09=09return;
=20
+=09/*
+=09 * Don't inherit eDP connections as it breaks the panel on
+=09 * a bunch of laptops. It seems link training related,
+=09 * but not inheriting just makes it work.
+=09 */
+=09if (nouveau_connector(conn)->type =3D=3D DCB_CONNECTOR_eDP)
+=09=09return;
 =09armh->state.encoder_mask =3D encoder_mask;
 =09armh->state.connector_mask =3D drm_connector_mask(conn);
 =09armh->state.active =3D true;
--=20
2.51.1

