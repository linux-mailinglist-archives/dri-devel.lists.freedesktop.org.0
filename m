Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892315976EB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 21:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4210A8B71F;
	Wed, 17 Aug 2022 19:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCF7988B8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 19:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660765221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nAMc4JfLKYfg0/w7KMNfHryoYc6iVSVzopF6Uhg7wgM=;
 b=V4ox4ITRbO8f1rPvwBmOiB5IQqMw4G1d/QT3dEORKEnHYvk2T6vPwXsShomzz3li6hmTni
 XF9Bsb5MS1QAdw+OWwuDphTWHRaOhEY3Qdps4stcBX2kJSsxA2e9sqnqL86R9BseMCiIIB
 l9HRirdo4uy3nJLd+UnQZOWJqbVXgRA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-fOfUeP-xOVqxVcJC9KYM2w-1; Wed, 17 Aug 2022 15:40:18 -0400
X-MC-Unique: fOfUeP-xOVqxVcJC9KYM2w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 916A880231E;
 Wed, 17 Aug 2022 19:40:17 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.18.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B4A5492C3B;
 Wed, 17 Aug 2022 19:40:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [RFC v4 11/17] drm/nouveau/kms: Cache DP encoders in nouveau_connector
Date: Wed, 17 Aug 2022 15:38:40 -0400
Message-Id: <20220817193847.557945-12-lyude@redhat.com>
In-Reply-To: <20220817193847.557945-1-lyude@redhat.com>
References: <20220817193847.557945-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
index 8100c75ee731..b8ee2173ca8f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1368,7 +1368,7 @@ nouveau_connector_create(struct drm_device *dev,
 			return ERR_PTR(-ENOMEM);
 		}
 		drm_dp_aux_init(&nv_connector->aux);
-		fallthrough;
+		break;
 	default:
 		funcs = &nouveau_connector_funcs;
 		break;
@@ -1431,6 +1431,8 @@ nouveau_connector_create(struct drm_device *dev,
 
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

