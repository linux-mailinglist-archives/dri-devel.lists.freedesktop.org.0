Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0E0586C32
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 15:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E121BFD25;
	Mon,  1 Aug 2022 13:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16306C0904
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 13:38:10 +0000 (UTC)
Date: Mon, 01 Aug 2022 13:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1659361087; x=1659620287;
 bh=5dRgEI3ZI9MIrO6XOaZjyo8varJXc/68IgRO/fG+g1k=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=hHMUBvG32Nll2z1sem8Crp33avFVl6gWMuCAyPFOoG4CB0MPqej0y5TtHbeAbej2N
 r43sMTC/aC/TRlrn3hp8h7p/JTTqEzqo8GkGNMhFT3S5DUyNc/PnYKCdtfoy6F56XH
 J0ekIR6lI1bqlAUW0sMSfQ0VaXqSUQMi/f8yhPiM7eVJFChye/qKBSHhJtiWrYISR3
 dEfSdYbmlnI0jXLu0LyUiqCRlK7V+548pbU9XNe3zPVaoONvnKL9fdKhe3rpnIWPIc
 Nm8UtAJQns4ZyNToj9lz/0SE10cuoVrnjl7KsaEyvEEYikoRCfvgCefUIANYkt0V3U
 yGhwEIaeyzUZw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [RFC PATCH] drm: hide unregistered connectors from GETCONNECTOR IOCTL
Message-ID: <20220801133754.461037-1-contact@emersion.fr>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When registering a connector, the kernel sends a hotplug uevent in
drm_connector_register(). When unregistering a connector, drivers
are expected to send a uevent as well. However, user-space has no way
to figure out that the connector isn't registered anymore: it'll still
be reported in GETCONNECTOR IOCTLs.

The documentation for DRM_CONNECTOR_UNREGISTERED states:

> The connector [=E2=80=A6] has since been unregistered and removed from
> userspace, or the connector was unregistered before it had a chance
> to be exposed to userspace

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_mode_config.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_c=
onfig.c
index 688c8afe0bf1..939d621c9ad4 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -151,6 +151,9 @@ int drm_mode_getresources(struct drm_device *dev, void =
*data,
 =09count =3D 0;
 =09connector_id =3D u64_to_user_ptr(card_res->connector_id_ptr);
 =09drm_for_each_connector_iter(connector, &conn_iter) {
+=09=09if (connector->registration_state !=3D DRM_CONNECTOR_REGISTERED)
+=09=09=09continue;
+
 =09=09/* only expose writeback connectors if userspace understands them */
 =09=09if (!file_priv->writeback_connectors &&
 =09=09    (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_WRITEBACK))
--=20
2.37.1


