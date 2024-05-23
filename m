Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6836C8CD349
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 15:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F3B10E4A5;
	Thu, 23 May 2024 13:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="L8nL3Ohl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3E910E6F0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716469822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cB82FNgbXEX4IJPOYVeC1z6CFjPatNWRWj6HBq6lNDc=;
 b=L8nL3OhlQm15LnvRB4QR1rb8p50JDJBy8kE+EEV/Uz6UVMqjp6Lc/daXIa7KC15uUSmN3x
 SZ/TP3MPPQj7NAeCpudUpm1RRx32tso3I7ZItguSLHnPIuNvSsQlrRAwkeyFDojcNrxMoS
 Dr5OB5viogka4no4MxuzgI7d60pqv8w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-GSiEZSxdN6KdB-W2Alq8_A-1; Thu, 23 May 2024 09:10:19 -0400
X-MC-Unique: GSiEZSxdN6KdB-W2Alq8_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 851C9101A54F;
 Thu, 23 May 2024 13:10:18 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C393CC15BF5;
 Thu, 23 May 2024 13:10:16 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 nouveau@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 4/5] drm/panic: add a private pointer to drm_scanout_buffer
Date: Thu, 23 May 2024 15:00:37 +0200
Message-ID: <20240523130955.428233-5-jfalempe@redhat.com>
In-Reply-To: <20240523130955.428233-1-jfalempe@redhat.com>
References: <20240523130955.428233-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

So you can pass a parameter to the set_pixel() callback.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 include/drm/drm_panic.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index 73bb3f3d9ed9..f7c32d64af5f 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -51,6 +51,12 @@ struct drm_scanout_buffer {
 	 */
 	unsigned int pitch[DRM_FORMAT_MAX_PLANES];
 
+	/**
+	 * @private: Optional pointer to some private data you want to pass to
+	 * the set_pixel() function.
+	 */
+	void *private;
+
 	/**
 	 * @set_pixel: Optional function, to set a pixel color on the
 	 * framebuffer. It allows to handle special tiling format inside the
-- 
2.45.0

