Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9598B3699FE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 20:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F01C6EC2C;
	Fri, 23 Apr 2021 18:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E819F6EC2C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 18:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619203425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xCk+7HBEDSqMgOjZMBk+r1aGT3OYcq/6hTQ7p1Jbu/c=;
 b=PCpm5hUKGdRXuiA8WQKOHvLhBYa9sqm5y48BbXYZ1EptZe6bDFl3KXY26axtf4Fz0pS4BE
 QEJE7uAh44+qQ9ywzUR7ZZCUQQXugOkSEIFH8PXvTyrqdJkCFyGfZLW/RtNjhxQEZqLSZF
 5O4L0RQkGhk1TZYvEU9CpoA0fe/cHP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-qwKfC8WPM_q7IqnQ0uIp8g-1; Fri, 23 Apr 2021 14:43:40 -0400
X-MC-Unique: qwKfC8WPM_q7IqnQ0uIp8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01E2C80D6A8;
 Fri, 23 Apr 2021 18:43:36 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-114-74.rdu2.redhat.com [10.10.114.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96776608BA;
 Fri, 23 Apr 2021 18:43:30 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v4 01/17] drm/bridge/cdns-mhdp8546: Register DP aux channel
 with userspace
Date: Fri, 23 Apr 2021 14:42:53 -0400
Message-Id: <20210423184309.207645-2-lyude@redhat.com>
In-Reply-To: <20210423184309.207645-1-lyude@redhat.com>
References: <20210423184309.207645-1-lyude@redhat.com>
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
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, Andrzej Hajda <a.hajda@samsung.com>,
 Parshuram Thombare <pthombar@cadence.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just adds some missing calls to
drm_dp_aux_register()/drm_dp_aux_unregister() for when we attach/detach the
bridge.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 01e95466502a..49e4c340f1de 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1719,10 +1719,14 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
 
 	dev_dbg(mhdp->dev, "%s\n", __func__);
 
+	ret = drm_dp_aux_register(&mhdp->aux);
+	if (ret < 0)
+		return ret;
+
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
 		ret = cdns_mhdp_connector_init(mhdp);
 		if (ret)
-			return ret;
+			goto aux_unregister;
 	}
 
 	spin_lock(&mhdp->start_lock);
@@ -1738,6 +1742,9 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
 		       mhdp->regs + CDNS_APB_INT_MASK);
 
 	return 0;
+aux_unregister:
+	drm_dp_aux_unregister(&mhdp->aux);
+	return ret;
 }
 
 static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
@@ -2082,6 +2089,8 @@ static void cdns_mhdp_detach(struct drm_bridge *bridge)
 
 	dev_dbg(mhdp->dev, "%s\n", __func__);
 
+	drm_dp_aux_unregister(&mhdp->aux);
+
 	spin_lock(&mhdp->start_lock);
 
 	mhdp->bridge_attached = false;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
