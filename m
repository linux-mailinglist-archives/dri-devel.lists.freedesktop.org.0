Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 971A53D0937
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 08:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0020B6E90B;
	Wed, 21 Jul 2021 06:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B429B6E90B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 06:51:34 +0000 (UTC)
Date: Wed, 21 Jul 2021 06:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1626850292;
 bh=m2PgNR52df5Yd1K7twzSsBTrTi3xw38D+5dfWv7WFU4=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=J8UhF7eGAJrvkRJ5zjG3Pi8LA6erIt9z063gWCxp3UYWsM1m8Ncb7mnkwP/B4ugp9
 R9zLDjXMbiz+VVBlxmUQXBXc5KLr/gTDVi5Gsz/IbfXMD9vwbbaYFxDQgxGIB1EsOt
 gRgydjX15Yn3+ajrMcpDjSC9n5hQbSywO8eZ1D/MpzDRLtjDdEDKg2gknR9Km2lnZ0
 68AHzmcc+MDYNTueCzcAVJkpFoV54Px/FK+uYU1gwGUmdHahTFK+e94YT3B/VA/rNy
 dJ37c8zDjO3XJlt/HDgphwAnhTXChDIHpgnJvyC+q63iIiPtlM3weOUB6k3rQWsZO3
 GVB/jbpt/exbA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: document drm_property_enum.value for bitfields
Message-ID: <NUZTPTKKZtAlDhxIXFB1qrUqWBYKapkBxCnb1S1bc3g@cp3-web-033.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a property has the type DRM_MODE_PROP_BITMASK, the value field
stores a bitshift, not a bitmask, which can be surprising.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Leandro Ribeiro <leandro.ribeiro@collabora.com>
---
 include/drm/drm_property.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
index bbf5c1fdd7b0..f3ea7f97f372 100644
--- a/include/drm/drm_property.h
+++ b/include/drm/drm_property.h
@@ -37,6 +37,11 @@
  *
  * For enumeration and bitmask properties this structure stores the symbol=
ic
  * decoding for each value. This is used for example for the rotation prop=
erty.
+ *
+ * If the property has the type &DRM_MODE_PROP_BITMASK, @value stores a
+ * bitshift, not a bitmask. In other words, the enum entry is enabled if t=
he
+ * bit number @value is set in the property's value. This enum entry has t=
he
+ * bitmask ``1 << value``.
  */
 struct drm_property_enum {
 =09uint64_t value;
--=20
2.32.0


