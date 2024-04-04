Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB47899232
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 01:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D173113675;
	Thu,  4 Apr 2024 23:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DEC9fZsa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF29D10E858
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 23:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712273867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UH0SdUkY0Y7wcvIlBfPcVRXDNk9BBU7t+uEZjzSWyug=;
 b=DEC9fZsauJ8oyelStoap9ti2AD9SaojEDaugCckUOX0YcnxxxMl7iHK4yP7j+QSGOU30BX
 z7SvKh9xBfOcU28bag8ydwkZBdoP3bpUw4OPQvGbluQfa4939mDaMFp5kBLdaWktOz76x3
 KCGfzAE9genOMD8tEJIZU7yBN+bXpXI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-638-EqSQlcGjNlGdio4Ofq0TTQ-1; Thu,
 04 Apr 2024 19:37:42 -0400
X-MC-Unique: EqSQlcGjNlGdio4Ofq0TTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 610D33C0219B;
 Thu,  4 Apr 2024 23:37:42 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.8.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB34D10E4B;
 Thu,  4 Apr 2024 23:37:41 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/nouveau/dp: Don't probe eDP ports twice harder
Date: Thu,  4 Apr 2024 19:35:54 -0400
Message-ID: <20240404233736.7946-3-lyude@redhat.com>
In-Reply-To: <20240404233736.7946-1-lyude@redhat.com>
References: <20240404233736.7946-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I didn't pay close enough attention the last time I tried to fix this
problem - while we currently do correctly take care to make sure we don't
probe a connected eDP port more then once, we don't do the same thing for
eDP ports we found to be disconnected.

So, fix this and make sure we only ever probe eDP ports once and then leave
them at that connector state forever (since without HPD, it's not going to
change on its own anyway). This should get rid of the last few GSP errors
getting spit out during runtime suspend and resume on some machines, as we
tried to reprobe eDP ports in response to ACPI hotplug probe events.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 8b1be7dd64ebe..8b27d372e86da 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -225,12 +225,16 @@ nouveau_dp_detect(struct nouveau_connector *nv_connector,
 	u8 *dpcd = nv_encoder->dp.dpcd;
 	int ret = NOUVEAU_DP_NONE, hpd;
 
-	/* If we've already read the DPCD on an eDP device, we don't need to
-	 * reread it as it won't change
+	/* eDP ports don't support hotplugging - so there's no point in probing eDP ports unless we
+	 * haven't probed them once before.
 	 */
-	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
-	    dpcd[DP_DPCD_REV] != 0)
-		return NOUVEAU_DP_SST;
+	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
+		if (connector->status == connector_status_connected) {
+			return NOUVEAU_DP_SST;
+		} else if (connector->status == connector_status_disconnected) {
+			return NOUVEAU_DP_NONE;
+		}
+	}
 
 	// Ensure that the aux bus is enabled for probing
 	drm_dp_dpcd_set_powered(&nv_connector->aux, true);
-- 
2.44.0

