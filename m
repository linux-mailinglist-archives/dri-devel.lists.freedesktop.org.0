Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E299A5A4FF8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 17:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D694710F392;
	Mon, 29 Aug 2022 15:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7D210F391
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 15:15:13 +0000 (UTC)
Date: Mon, 29 Aug 2022 15:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661786112; x=1662045312;
 bh=EEkAXvkmbHxeai88mh9TxAx4tKP8/BdSF8aQZBkGoLg=;
 h=Date:To:From:Reply-To:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=LhLEH+X7btfZOwGdoaB0VhYsaVuMkYxGrPvKeegTyB+bTGGnFqGgTLPq24YhCNBZw
 67fuKeQjGGHC85rgoVH/RdFsG/uPSAPX9LEqIIZXa5AWtE2YcwOMaGCXJZsmrdPTnI
 hGFSLK/xYFwcWmJ4M4D2Awl9nS1co704wFQfHac5XY2yXsNb9zxf1ABJ5qcmwBo+DO
 svhBsoOGX/wf9+XmvqAgzwEAltqS5bF/FwHXIxk1qC4xAtKsxKk0dhADB9PWch9veR
 F8T1juDC8enyXWNtQw6SFtPSdd+QtAhndAU6ClFXEoLVAeaaUDi97Zb9kUXjszZ4Eb
 FyoL0s+YW4Jyg==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 3/3] drm/bridge: log message on atomic_check() and
 mode_fixup() failure
Message-ID: <20220829151451.152114-3-contact@emersion.fr>
In-Reply-To: <20220829151451.152114-1-contact@emersion.fr>
References: <20220829151451.152114-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This helps user-space understand why an atomic commit fails.

v2: new patch

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/drm_bridge.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 1545c50fd1c8..c41c728b0c28 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -830,12 +830,26 @@ static int drm_atomic_bridge_check(struct drm_bridge =
*bridge,
=20
 =09=09ret =3D bridge->funcs->atomic_check(bridge, bridge_state,
 =09=09=09=09=09=09  crtc_state, conn_state);
-=09=09if (ret)
+=09=09if (ret) {
+=09=09=09drm_dbg_atomic(bridge->dev,
+=09=09=09=09       "bridge driver check failed for [CRTC:%d:%s] and [CONNE=
CTOR:%d:%s]\n",
+=09=09=09=09       crtc_state->crtc->base.id,
+=09=09=09=09       crtc_state->crtc->name,
+=09=09=09=09       conn_state->connector->base.id,
+=09=09=09=09       conn_state->connector->name);
 =09=09=09return ret;
+=09=09}
 =09} else if (bridge->funcs->mode_fixup) {
 =09=09if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
-=09=09=09=09=09       &crtc_state->adjusted_mode))
+=09=09=09=09=09       &crtc_state->adjusted_mode)) {
+=09=09=09drm_dbg_atomic(bridge->dev,
+=09=09=09=09       "bridge mode fixup failed for [CRTC:%d:%s] and [CONNECT=
OR:%d:%s]\n",
+=09=09=09=09       crtc_state->crtc->base.id,
+=09=09=09=09       crtc_state->crtc->name,
+=09=09=09=09       conn_state->connector->base.id,
+=09=09=09=09       conn_state->connector->name);
 =09=09=09return -EINVAL;
+=09=09}
 =09}
=20
 =09return 0;
--=20
2.37.2


