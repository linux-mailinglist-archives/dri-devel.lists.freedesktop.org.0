Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 823F76012C8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 17:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B8610ED96;
	Mon, 17 Oct 2022 15:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C758A10ED96
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 15:32:14 +0000 (UTC)
Date: Mon, 17 Oct 2022 15:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1666020732; x=1666279932;
 bh=IKMEh+TcgfoRlr9HJfKGhPSu4b8tesTclKkh0S1exQY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=XWeCzDaGJEO3QxbkmlTVdiuImyt82NQtjmkKO9KUZKr5gQjfyJSFvSJmVZESd8GOb
 XihvZ6IWWPrb1XHJZtDnK4fGZqO01/x0k4biBR6HbZuKPW5KqKUMk2Px+J5IGFbmJH
 oriw9gNudRBogbStisETZV3GvO7h4YyJJzcSC7b87Ng7UivxwaTciU4WhRv9rAOkRU
 ISnDCK7VvNEQiDvdTYBUU6or7V9ty4LNZyktGKUScXhautXSNFjYcyiNJnuJLi6ZF7
 aDYKI54bvmcBBvD7gl26ZS8zRRxMPqClXMIDqeedklPjKYipX7S1weVjGCe4Qq2fSw
 VvJ11fgwW38CA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 2/2] drm/connector: send hotplug uevent on connector cleanup
Message-ID: <20221017153150.60675-2-contact@emersion.fr>
In-Reply-To: <20221017153150.60675-1-contact@emersion.fr>
References: <20221017153150.60675-1-contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A typical DP-MST unplug removes a KMS connector. However care must
be taken to properly synchronize with user-space. The expected
sequence of events is the following:

1. The kernel notices that the DP-MST port is gone.
2. The kernel marks the connector as disconnected, then sends a
   uevent to make user-space re-scan the connector list.
3. User-space notices the connector goes from connected to disconnected,
   disables it.
4. Kernel handles the the IOCTL disabling the connector. On success,
   the very last reference to the struct drm_connector is dropped and
   drm_connector_cleanup() is called.
5. The connector is removed from the list, and a uevent is sent to tell
   user-space that the connector disappeared.

The very last step was missing. As a result, user-space thought the
connector still existed and could try to disable it again. Since the
kernel no longer knows about the connector, that would end up with
EINVAL and confused user-space.

Fix this by sending a hotplug uevent from drm_connector_cleanup().

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: stable@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Jonas =C3=85dahl <jadahl@redhat.com>
---
 drivers/gpu/drm/drm_connector.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index e3142c8142b3..90dad87e9ad0 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -582,6 +582,9 @@ void drm_connector_cleanup(struct drm_connector *connec=
tor)
 =09mutex_destroy(&connector->mutex);
=20
 =09memset(connector, 0, sizeof(*connector));
+
+=09if (dev->registered)
+=09=09drm_sysfs_hotplug_event(dev);
 }
 EXPORT_SYMBOL(drm_connector_cleanup);
=20
--=20
2.38.0


