Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 342CC58D0D4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 01:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDDE12BEB0;
	Mon,  8 Aug 2022 23:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908E412B618
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 23:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660002893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faeZcQ6XXvNVofIu9f1DXkDWsvpbTufhnASKSvVU4UU=;
 b=fy2+vLBmfikrPY+/cchzt5SZG4YE0C/ef54DlA0ql+zu84wyatlMC5dwf93K90jjsFyavF
 z76O/QjBOcztqw1iZ1g9CG3guQr9NtY/a0STgUhBzWttiaalGCsm0XLQHmuOwZ/OxHOdch
 Pe/uOLRAWXfQS6xSRnC/LJE4mel9qqw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-bjZuMN3cP2y2liQof0grlw-1; Mon, 08 Aug 2022 19:54:50 -0400
X-MC-Unique: bjZuMN3cP2y2liQof0grlw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F216293248A;
 Mon,  8 Aug 2022 23:54:50 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.17.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1999C15BA1;
 Mon,  8 Aug 2022 23:54:49 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [RFC v2 11/18] drm/nouveau/kms: Cache DP encoders in nouveau_connector
Date: Mon,  8 Aug 2022 19:51:56 -0400
Message-Id: <20220808235203.123892-12-lyude@redhat.com>
In-Reply-To: <20220808235203.123892-1-lyude@redhat.com>
References: <20220808235203.123892-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: Karol Herbst <kherbst@redhat.com>, Jani Nikula <jani.nikula@intel.com>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Post-NV50, the only kind of encoder you'll find for DP connectors on Nvidia
GPUs are SORs (serial output resources). Because SORs have fixed
associations with their connectors, we can correctly assume that any DP
connector on a nvidia GPU will have exactly one SOR encoder routed to it
for DisplayPort.

Since we're going to need to be able to retrieve this fixed SOR DP encoder
much more often as a result of hooking up MST helpers for tracking
SST<->MST transitions in atomic states, let's simply cache this encoder in
nouveau_connector for any DP connectors on the system to avoid looking it
up each time. This isn't safe for NV50 since PIORs then come into play,
however there's no code pre-NV50 that would need to look this up anyhow -
so it's not really an issue.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 4 +++-
 drivers/gpu/drm/nouveau/nouveau_connector.h | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 43a9d1e1cf71..bdaec3427f14 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1367,7 +1367,7 @@ nouveau_connector_create(struct drm_device *dev,
 			return ERR_PTR(-ENOMEM);
 		}
 		drm_dp_aux_init(&nv_connector->aux);
-		fallthrough;
+		break;
 	default:
 		funcs = &nouveau_connector_funcs;
 		break;
@@ -1430,6 +1430,8 @@ nouveau_connector_create(struct drm_device *dev,
 
 	switch (type) {
 	case DRM_MODE_CONNECTOR_DisplayPort:
+		nv_connector->dp_encoder = find_encoder(&nv_connector->base, DCB_OUTPUT_DP);
+		fallthrough;
 	case DRM_MODE_CONNECTOR_eDP:
 		drm_dp_cec_register_connector(&nv_connector->aux, connector);
 		break;
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index 4bf0c703eee7..f4e17ff68bf9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -128,6 +128,9 @@ struct nouveau_connector {
 
 	struct drm_dp_aux aux;
 
+	/* The fixed DP encoder for this connector, if there is one */
+	struct nouveau_encoder *dp_encoder;
+
 	int dithering_mode;
 	int scaling_mode;
 
-- 
2.37.1

