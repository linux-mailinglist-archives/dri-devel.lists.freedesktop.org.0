Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8697D40F9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 22:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3327110E251;
	Mon, 23 Oct 2023 20:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47DD10E251
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 20:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1698093428; x=1698352628;
 bh=6R+cYz/+24V5uIpS0LWCGlyrH2ctZC35+YakAciBjaA=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=dZQ9a4Ya/0cxfIE23chpRkZH4CUAbE1EKOoyajuQr5z6iJNK5S4lPaEjzQvZv9txk
 AKgbG2vY7qzXEfSeT08+papynAS8rR4nPTeBVA3qicLxq4FnIiXsEMp0BTV4YFqjh2
 c8YeBRDsnzpqDxnlHD8ffZ5n1wG8JZOa+AFCma2z6fE76e4WRfSAGq5VZqxhomuf60
 RRnjKwRjlFqHUDTC1FR8HWevLnniQoAryFT87iXltee76LkL96bfwHof74rfzATeDt
 dx8kJaBjegU28jHeZ6lwoB5KvW3VnABiVIkD+jSzbgxb2wMl3GWvGmpO/8SKNKu2Ft
 2yJrSWVamNoDA==
Date: Mon, 23 Oct 2023 20:36:39 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/doc: describe PATH format for DP MST
Message-ID: <20231023203629.198109-1-contact@emersion.fr>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is already uAPI, xserver parses it. It's useful to document
since user-space might want to lookup the parent connector.

Additionally, people (me included) have misunderstood the PATH
property for being stable across reboots, but since a KMS object
ID is baked in there that's not the case. So PATH shouldn't be
used as-is in config files and such.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_connector.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index c3725086f413..392bec1355a3 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1198,6 +1198,11 @@ static const u32 dp_colorspaces =3D
  * =09drm_connector_set_path_property(), in the case of DP MST with the
  * =09path property the MST manager created. Userspace cannot change this
  * =09property.
+ *
+ * =09In the case of DP MST, the property has the format
+ * =09``mst:<parent>-<ports>`` where ``<parent>`` is the KMS object ID of =
the
+ * =09parent connector and ``<ports>`` is a hyphen-separated list of DP MS=
T
+ * =09port numbers. Note, KMS object IDs are not stable across reboots.
  * TILE:
  * =09Connector tile group property to indicate how a set of DRM connector
  * =09compose together into one logical screen. This is used by both high-=
res
--=20
2.42.0


