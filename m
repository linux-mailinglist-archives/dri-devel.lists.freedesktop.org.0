Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DF56A590E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E26610E1F9;
	Tue, 28 Feb 2023 12:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811FE10E1F9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:32:09 +0000 (UTC)
Date: Tue, 28 Feb 2023 12:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1677587527; x=1677846727;
 bh=DTLVtJSoFye2hWPJysWIBXFP4OmOyDMN752/zyYO7QM=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=wolN+blt17QjALM6CVnAs70E2YNVv8XWw2EM2waGoVVAjgyqdoVJU5oLNZIrUDK4c
 ep9vLz5JTW3lNxYOI7tcq3+JMfT3gTGA2rR5CUGO057Nya4wUklM5KBQqszoaSKPuo
 HsL9iQNC5c35LDUaabWXvl8NJqomiPkILF6L1YmaEdsoiVGQt5wkGOly7dbWk6V4YE
 jmbFsIKBy9Tcg6FGpwSp7lvS81NHB7dnz1Qxa7RgsDKIFttIs7sODSVq1XdHklEKMx
 6A3jXvC9rjtQ6V4k7iConr1ZMVtT1E5Dyb2Cs6dWmvbEdih4PWWdyoYVf0U6nSKVk+
 t9bDnGNm24QfA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2] drm: document connector margin properties
Message-ID: <20230228123156.175973-1-contact@emersion.fr>
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
Cc: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add docs for "{left,right,top,bottom} margin" properties.

v2:
- Mention the purpose: mitigate underscan on TVs
- Move out of analog TV section into standard props (Pekka)
- Mention HDMI AVI InfoFrames (Pekka, Ville)

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
Cc: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_connector.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index ffd65eddce42..a180f541736a 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1446,6 +1446,20 @@ static const struct drm_prop_enum_list dp_colorspace=
s[] =3D {
  *=09a firmware handled hotkey. Therefor userspace must not include the
  *=09privacy-screen sw-state in an atomic commit unless it wants to change
  *=09its value.
+ *
+ * left margin, right margin, top margin, bottom margin:
+ *=09Add margins to the connector's viewport. This is typically used to
+ *=09mitigate underscan on TVs.
+ *
+ *=09The value is the size in pixels of the black border which will be
+ *=09added. The attached CRTC's content will be scaled to fill the whole
+ *=09area inside the margin.
+ *
+ *=09The margins configuration might be sent to the sink, e.g. via HDMI AV=
I
+ *=09InfoFrames.
+ *
+ *=09Drivers can set up these properties by calling
+ *=09drm_mode_create_tv_margin_properties().
  */
=20
 int drm_connector_create_standard_properties(struct drm_device *dev)
@@ -1590,10 +1604,6 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_p=
roperty);
=20
 /*
  * TODO: Document the properties:
- *   - left margin
- *   - right margin
- *   - top margin
- *   - bottom margin
  *   - brightness
  *   - contrast
  *   - flicker reduction
--=20
2.39.2


