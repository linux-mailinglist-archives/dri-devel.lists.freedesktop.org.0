Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF58E737351
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 19:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B1410E30B;
	Tue, 20 Jun 2023 17:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE2210E30B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 17:55:24 +0000 (UTC)
Date: Tue, 20 Jun 2023 17:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1687283723; x=1687542923;
 bh=SYr2T+wPlDH7zDq0ASpXcCiKr1175gRR8TtKy5AAWiA=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=AA8Ic+h9BFQrC7WXpPqUCzHNf6fyCcsB5SY24LOu/iMk6wLj7Hp79tKL2BD6KdIIW
 q1geij7IH+IHu53G89AMa8jRg+GkWXDM9GFLD6wJcnSl+oI8hNesYCC1T8mEbnIb+Z
 ErY9/E19dqAzvROt3fa8zQ2ufkA3QjQ+FWEsUJLCHb3fGkDBVGtuDIHbyUi4bVXhLJ
 ssmoSJLVZjJM5B87QoPIwU+g7yarNYAgtEECE9cbIwudeDxnn3v1JBEEmMgs7N1kbn
 2cXiRec6XS7cML9h9i29LCWQ0cEuufGr6IxsSZ5Re/Q5wS4iZKfFMPY+zj0yNmExIl
 DkAHnXjTcsdOw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/bridge_connector: use
 drm_kms_helper_connector_hotplug_event()
Message-ID: <20230620175506.263109-1-contact@emersion.fr>
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
 Paul Cercueil <paul@crapouillou.net>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds more information to the hotplug uevent and lets user-space
know that it's about a particular connector only.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_b=
ridge_connector.c
index 19ae4a177ac3..fc6f16e14f36 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -125,7 +125,7 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
=20
 =09drm_bridge_connector_hpd_notify(connector, status);
=20
-=09drm_kms_helper_hotplug_event(dev);
+=09drm_kms_helper_connector_hotplug_event(connector);
 }
=20
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connecto=
r)
--=20
2.41.0


