Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057B7604970
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 16:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A77D10EAFC;
	Wed, 19 Oct 2022 14:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BF110F247
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 14:38:22 +0000 (UTC)
Date: Wed, 19 Oct 2022 14:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1666190300; x=1666449500;
 bh=I9tuRnrzizTW31WbnBmd5nJoUIiN4Xr2GQvfI4Kvrzw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=Hmb0S/6b9Z4pJPhktzQpCxG7Plv3Qdsc9X50CnToTmeM+ZE6Qp+31KRsRU11YwTEA
 rHoQRftUm/I1iq5qNUVNm1mS4wFqs49X2MrGayNhd27B6sZKLlstO44V0OXzagcSmQ
 TYdj5Q/j9BYjgPAWnygqUDeJ+Zw6QoOVN27f4Grqw1GLepmxhWEVLFMnn8ZkWdj1lC
 VTmik/ybSVCgyezyWr4/n8x7BZaKqsgK/eB/2T4FsBRibEpmqM8BB2khglxNZyLY7u
 9BsUS/2Ioiy4zGwf2hbHt1mxMptjIFaKUmhbznh3jF8uo4yvYuXcB+NkwhEi9nDkBB
 644VyaQk/Esgw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 5/7] drm/atomic: log on attempt to set legacy DPMS property
Message-ID: <20221019143736.267324-5-contact@emersion.fr>
In-Reply-To: <20221019143736.267324-1-contact@emersion.fr>
References: <20221019143736.267324-1-contact@emersion.fr>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c
index 5aa2ecd1af3d..3df3f7ba0af3 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -711,6 +711,9 @@ static int drm_atomic_connector_set_property(struct drm=
_connector *connector,
 =09=09 * is done in legacy setprop path for us.  Disallow (for
 =09=09 * now?) atomic writes to DPMS property:
 =09=09 */
+=09=09drm_dbg_atomic(dev,
+=09=09=09       "legacy [PROP:%d:%s] can only be set via legacy uAPI\n",
+=09=09=09       property->base.id, property->name);
 =09=09return -EINVAL;
 =09} else if (property =3D=3D config->tv_select_subconnector_property) {
 =09=09state->tv.select_subconnector =3D val;
--=20
2.38.0


