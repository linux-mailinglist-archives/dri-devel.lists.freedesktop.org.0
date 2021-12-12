Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F6E472323
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 09:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E444D10E6B2;
	Mon, 13 Dec 2021 08:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A9A10F12F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 12:05:48 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4JBjyf5P1hz4x0Tr
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 12:05:46 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=acoro.eu header.i=@acoro.eu
 header.b="YHaddwk5"
Date: Sun, 12 Dec 2021 12:05:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acoro.eu;
 s=protonmail3; t=1639310741;
 bh=58J3xn/bCtRIZhmEH6XTE/KJPyH/4XpTgvWYSnoD75Y=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:From:To:Cc;
 b=YHaddwk5k8n8rWsrA3+dfhL3zs/X9A1fvOH7hkmaQE95Xbu9r+vUyVPN9eiEGQL/m
 lwBQj/7klm5WTyXWS98xrE4OwMiFQxxHenjOn++ObQ9bbdITlbX3DO8Nu7x6bvJ+YP
 say+lQ66WUetM7uZsQ0+jgl0mlA3c1HueghRQcWkkgZauUvNDoJqukTxs1ng+W8c4o
 Jzkfqg6QOXTFKoGMZwQZUkmvX8hZ0CYzOzIfGWs4ATzlhdWEHVMKDoJVbyFB46hmE2
 kdqavvgGMAGNgkrgBiJDo8uROs7o5oPsKTNUD3sOicbtxaCV+2psrCOp2bJthScqpy
 ewT4+f/+WSn7g==
To: tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch, maxime@cerno.tech
From: Alejandro Concepcion-Rodriguez <asconcepcion@acoro.eu>
Subject: [PATCH] drm: simpledrm: fix wrong unit with pixel clock
Message-ID: <3c4ed29d-1cc7-8346-03e8-1cdc05fe2e9b@acoro.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Mon, 13 Dec 2021 08:43:56 +0000
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
Reply-To: Alejandro Concepcion-Rodriguez <asconcepcion@acoro.eu>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pixel clock has to be set in kHz.

Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")

Signed-off-by: Alejandro Concepcion-Rodriguez <asconcepcion@acoro.eu>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simple=
drm.c
index 2f999915b9aa..562bf09f9140 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -459,7 +459,7 @@ static struct drm_display_mode simpledrm_mode(unsigned =
int width,
 {
 =09struct drm_display_mode mode =3D { SIMPLEDRM_MODE(width, height) };

-=09mode.clock =3D 60 /* Hz */ * mode.hdisplay * mode.vdisplay;
+=09mode.clock =3D mode.hdisplay * mode.vdisplay * 60 / 1000 /* kHz */;
 =09drm_mode_set_name(&mode);

 =09return mode;
--
2.25.1

