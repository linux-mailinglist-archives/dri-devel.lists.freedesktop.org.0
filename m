Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6148159D3
	for <lists+dri-devel@lfdr.de>; Sat, 16 Dec 2023 15:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6B510E09B;
	Sat, 16 Dec 2023 14:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6214A10E09B
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1702736135; x=1702995335;
 bh=qkm4oW8chhqp7puwB4Up80musVJRDBjN+QOaeITuDIc=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=SecN3ggVxeCfAcLy1y+NyNodr9TsWklOmTVnEAIWf6jMyVzZ65e/s3e3qFyu052og
 1j2/liuuWRfTKzSkS9R5Pc4mXNyyNY6blk9oc8z8f29jDAYBhVmkr2U1md9iTCr6AB
 sIiIi05VyZHWAXhSHr8IVRyYxy3pYc4FjjhmpQi7QtEu00ZrNHRvLRwbbQm8vN60rr
 mzqZF+XRBJGR2V9T9eP/NWY6nyBy6pBvmBIEFGByB7I1Ek2PmmEF05cxRqmqC+n3TZ
 u8YtoLhmQ9r4sU9eBpdyhRh+uv4UfDAMUGMqbHv2OoCuCnoqwTgPQWJU7RNndmarmP
 Xqpm0MsGA0inw==
Date: Sat, 16 Dec 2023 14:15:27 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/vc4: plane: check drm_gem_plane_helper_prepare_fb()
 return value
Message-ID: <20231216141518.242811-1-contact@emersion.fr>
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
Cc: Kees Cook <keescook@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bubble up any error to the caller.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plan=
e.c
index 00e713faecd5..b8184374332c 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1497,13 +1497,16 @@ static int vc4_prepare_fb(struct drm_plane *plane,
 =09=09=09  struct drm_plane_state *state)
 {
 =09struct vc4_bo *bo;
+=09int ret;
=20
 =09if (!state->fb)
 =09=09return 0;
=20
 =09bo =3D to_vc4_bo(&drm_fb_dma_get_gem_obj(state->fb, 0)->base);
=20
-=09drm_gem_plane_helper_prepare_fb(plane, state);
+=09ret =3D drm_gem_plane_helper_prepare_fb(plane, state);
+=09if (ret)
+=09=09return ret;
=20
 =09if (plane->state->fb =3D=3D state->fb)
 =09=09return 0;
--=20
2.43.0


