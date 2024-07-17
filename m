Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD8B933986
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 11:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C4D10EA21;
	Wed, 17 Jul 2024 09:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FEDfseg+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB0710EA21
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 09:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721206918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynu5l0dA8yLcoF8+u6imCBMvI85koxu/QAk/w/8RBTM=;
 b=FEDfseg+BNN2F8kN5Q9zDcvca2BdJEDJ1I0BoQ3LyHatuahf7VTcoBcu2iDxe1BkNgrCRf
 5my1LivcyOXC1q/RMfhJwrasG5x5v0yXf5Xz9koopo0aCCARLDbTPfJh6Q0lOM3Jyde/QR
 SirELY5c0MOf04TMz5l+4iB6HXZUbOU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-471-CdEsZnMnOkujsJ1i0E8BUg-1; Wed,
 17 Jul 2024 05:01:50 -0400
X-MC-Unique: CdEsZnMnOkujsJ1i0E8BUg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 82A3E1955D53; Wed, 17 Jul 2024 09:01:48 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.18])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3CAD81955F40; Wed, 17 Jul 2024 09:01:43 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 1/3] drm/panic: Add drm_panic_is_enabled()
Date: Wed, 17 Jul 2024 10:48:39 +0200
Message-ID: <20240717090102.968152-2-jfalempe@redhat.com>
In-Reply-To: <20240717090102.968152-1-jfalempe@redhat.com>
References: <20240717090102.968152-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

It allows to check if the drm device supports drm_panic.
Prepare the work to have better integration with fbcon and vtconsole.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 20 ++++++++++++++++++++
 include/drm/drm_panic.h     |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 948aed00595e..d9a25c2d0a65 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -703,6 +703,26 @@ static void debugfs_register_plane(struct drm_plane *plane, int index)
 static void debugfs_register_plane(struct drm_plane *plane, int index) {}
 #endif /* CONFIG_DRM_PANIC_DEBUG */
 
+/**
+ * drm_panic_is_enabled
+ * @dev: the drm device that may supports drm_panic
+ *
+ * returns true if the drm device supports drm_panic
+ */
+bool drm_panic_is_enabled(struct drm_device *dev)
+{
+	struct drm_plane *plane;
+
+	if (!dev->mode_config.num_total_plane)
+		return false;
+
+	drm_for_each_plane(plane, dev)
+		if (plane->helper_private && plane->helper_private->get_scanout_buffer)
+			return true;
+	return false;
+}
+EXPORT_SYMBOL(drm_panic_is_enabled);
+
 /**
  * drm_panic_register() - Initialize DRM panic for a device
  * @dev: the drm device on which the panic screen will be displayed.
diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index 73bb3f3d9ed9..c3a358dc3e27 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -148,11 +148,13 @@ struct drm_scanout_buffer {
 
 #ifdef CONFIG_DRM_PANIC
 
+bool drm_panic_is_enabled(struct drm_device *dev);
 void drm_panic_register(struct drm_device *dev);
 void drm_panic_unregister(struct drm_device *dev);
 
 #else
 
+bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
 static inline void drm_panic_register(struct drm_device *dev) {}
 static inline void drm_panic_unregister(struct drm_device *dev) {}
 
-- 
2.45.2

