Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6478232009D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 22:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123BA6EC4C;
	Fri, 19 Feb 2021 21:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735B66EC47
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 21:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613771667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uk6DZT7TNUGw7YR8fKa6KekVHXLB1t7YOqK+pDP8C8Q=;
 b=MmNajd9zOz6gkiz+KhQfgfHJ/TR4eYQqc6Tmq6IKhvrxWEGUhBbWgfHVwCOBPD8KnZaNSN
 c3jdz3m4XIJ09FUsIJZJY8zU2eG7GYwOf2POpAl4fBH0vXXtpp1P31YGvZsvY8/DOxxFiy
 GrH0VEqYhyubtd0lrBNtKNC3uSVnO08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86--XRwb9wpOmuITkdCQmPxng-1; Fri, 19 Feb 2021 16:54:24 -0500
X-MC-Unique: -XRwb9wpOmuITkdCQmPxng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55AB31020C27;
 Fri, 19 Feb 2021 21:54:21 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-118-5.rdu2.redhat.com [10.10.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11F966A03C;
 Fri, 19 Feb 2021 21:54:18 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 11/30] drm/bridge/analogix/anx6345: Don't link encoder until
 after connector registration
Date: Fri, 19 Feb 2021 16:53:07 -0500
Message-Id: <20210219215326.2227596-12-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-1-lyude@redhat.com>
References: <20210219215326.2227596-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joe Perches <joe@perches.com>, Sam Ravnborg <sam@ravnborg.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Another case of linking an encoder to a connector after the connector's
been registered. The proper place to do this is before connector
registration, so let's fix that.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 8e016ba7c54a..6258f16da0e8 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -556,12 +556,6 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
 	drm_connector_helper_add(&anx6345->connector,
 				 &anx6345_connector_helper_funcs);
 
-	err = drm_connector_register(&anx6345->connector);
-	if (err) {
-		DRM_ERROR("Failed to register connector: %d\n", err);
-		return err;
-	}
-
 	anx6345->connector.polled = DRM_CONNECTOR_POLL_HPD;
 
 	err = drm_connector_attach_encoder(&anx6345->connector,
@@ -571,6 +565,12 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
 		return err;
 	}
 
+	err = drm_connector_register(&anx6345->connector);
+	if (err) {
+		DRM_ERROR("Failed to register connector: %d\n", err);
+		return err;
+	}
+
 	return 0;
 }
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
