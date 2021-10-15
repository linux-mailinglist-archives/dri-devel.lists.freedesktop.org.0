Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AA442F849
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 18:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0635A6ED85;
	Fri, 15 Oct 2021 16:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466636EDA3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 16:33:53 +0000 (UTC)
Date: Fri, 15 Oct 2021 16:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634315631;
 bh=XLIJ55ALy/8LCOy7rJgXHOmSSFsu4ET0domvXc9V4Dg=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
 b=zBy5gvoudi+M4pgSf0t+jx4GL1Yw9q2Q0+BYvo91gPYlKPTYKjVsWTcgAu7L24fPA
 0iWlSKoAAsakpghGNuOyD/Nbr1J5+w+UWgvu80o8e4jxXustongN6jd42l8bivpihO
 xbvIdvhzL0WR5rduZllwcFltDcMskbc9a7HfrnDcIgw803IIsj14uxmo0yoDQrGzzq
 eDjcdsZc7lwKXmwiY5u2mIfWCsY1xpO6qkweTYkus7RwRlbvODh7WAoT2Bgkr2ID6g
 ttGgzvF5JK1KvWED4F/S6Cb3ZvFq5RR3Nw5CR3LxAJmP5p74VM3XYpuX5LCtqRa4YF
 8nOJgOpnnmVcA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3 3/6] drm/connector: use drm_sysfs_connector_hotplug_event
Message-ID: <20211015163336.95188-4-contact@emersion.fr>
In-Reply-To: <20211015163336.95188-1-contact@emersion.fr>
References: <20211015163336.95188-1-contact@emersion.fr>
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


