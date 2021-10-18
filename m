Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5E0431270
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C57F6E99C;
	Mon, 18 Oct 2021 08:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E976E863
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 08:47:38 +0000 (UTC)
Date: Mon, 18 Oct 2021 08:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634546857;
 bh=Jx0zqIs5J+6c24AqW5pjPuGzBZVQzXp/EKgdk/kIofA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=ULbcMOroDHSJJ+13v4bZUf+sAUWy7AAzcI5wtlYtrZrH6c42tuzV2I+BR5wwLlrW2
 CGJvPX9Z79dtIIJW4dic1UQn0EnGZoI6D0TUtpT5lOVAGOaScll455qKSBBj5HXfyG
 9IBZtrmwv4vdMn63UcZ/ado9GMXazK+GefD5sTeeFWuq8pwIc8/ERrymKCf5F0oq08
 BIhELUWtwgWW51xbidMyNPePX3VyU2Hb7jLYzDhM5/ewwZIITVpTbC3v96ceeaGpjy
 9X5JGnMthtbS5SUCIE4zrZzj8QMNsOLloaseHeyxu23h0i/kmnOs7MnvdwaDdxzXH5
 7TtmD0WlPiSfQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Sam Ravnborg <sam@ravnborg.org>, Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v4 3/6] drm/connector: use drm_sysfs_connector_hotplug_event
Message-ID: <20211018084707.32253-4-contact@emersion.fr>
In-Reply-To: <20211018084707.32253-1-contact@emersion.fr>
References: <20211018084707.32253-1-contact@emersion.fr>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In drm_connector_register, use drm_sysfs_connector_hotplug_event
instead of drm_sysfs_hotplug_event, because the hotplug event
only updates a single connector.

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index ec3973e8963c..a50c82bc2b2f 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -547,7 +547,7 @@ int drm_connector_register(struct drm_connector *connec=
tor)
 =09connector->registration_state =3D DRM_CONNECTOR_REGISTERED;
=20
 =09/* Let userspace know we have a new connector */
-=09drm_sysfs_hotplug_event(connector->dev);
+=09drm_sysfs_connector_hotplug_event(connector);
=20
 =09if (connector->privacy_screen)
 =09=09drm_privacy_screen_register_notifier(connector->privacy_screen,
--=20
2.33.1


