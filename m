Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C04196F0E8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 12:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D636F10E9F6;
	Fri,  6 Sep 2024 10:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PtpNH9gq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C9E10E9F4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 10:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725617102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VFO3W/ZUCLWQ9AAwcJEb1HAwNECuSqbI/yZqAmLm/9g=;
 b=PtpNH9gqMGIaRZv4XIMxAl+79QyYXt46UgRXps2DAwJAr00BhYnBfa3ONdbXhDfFwfH9Qt
 C+U3gGOVe90+zoUOWkzz31XuVSSbJvI5GDkpXZtRyMg7xCwOkgoahcGsfMAUOAdefBKWrp
 kpKcdbcNC+p0lGRTLrO7Bo8U1HZ8WV8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-265-0egiFsLTOlaIdZVKGYhNuw-1; Fri,
 06 Sep 2024 06:04:58 -0400
X-MC-Unique: 0egiFsLTOlaIdZVKGYhNuw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B639B1955F68; Fri,  6 Sep 2024 10:04:56 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.228])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 62F2A1956086; Fri,  6 Sep 2024 10:04:53 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2 2/3] drm/panic: add a private pointer to struct
 drm_scanout_buffer
Date: Fri,  6 Sep 2024 12:03:01 +0200
Message-ID: <20240906100434.1171093-3-jfalempe@redhat.com>
In-Reply-To: <20240906100434.1171093-1-jfalempe@redhat.com>
References: <20240906100434.1171093-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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

It can be set to a private structure in get_scanout_buffer(), and
used later in set_pixel() or in panic_flush().

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 include/drm/drm_panic.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index 54085d5d05c3..afdbb27ead67 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -54,6 +54,13 @@ struct drm_scanout_buffer {
 	 */
 	unsigned int pitch[DRM_FORMAT_MAX_PLANES];
 
+	/**
+	 * @private: Optional pointer to some private data you want to pass to
+	 * the set_pixel() or panic_flush() function. It must stay valid between
+	 * the get_scanout_buffer() call and the panic_flush() call.
+	 */
+	void *private;
+
 	/**
 	 * @set_pixel: Optional function, to set a pixel color on the
 	 * framebuffer. It allows to handle special tiling format inside the
-- 
2.46.0

