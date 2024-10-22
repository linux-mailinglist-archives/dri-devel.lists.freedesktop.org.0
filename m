Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAE89AB647
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 20:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A40710E62A;
	Tue, 22 Oct 2024 18:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YmjymRlN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B807910E168
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 18:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729623376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GlcZTon+rmjNchJi8TF94rgYx270vg1staLzUN5k48Y=;
 b=YmjymRlNJ+59i9C/543OIYNd+x37bXhFUVkvcVdCAx3J0Az1YAa+Ap8TH069nkz0UoTw4N
 44BXy3qs1hJlRCk76K9NEg54tqGj4QAL0ujLcA8FUYwzuj8GTvnlBQf8dCYWKsQgw+piHh
 Zw5C58CP2fljJ/xSwuMceDzm+tI7wT0=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-62-ILbnRr5_NUiDZTLcMfYscA-1; Tue,
 22 Oct 2024 14:56:13 -0400
X-MC-Unique: ILbnRr5_NUiDZTLcMfYscA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 216371955EE7; Tue, 22 Oct 2024 18:56:10 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.145])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 648CB1956056; Tue, 22 Oct 2024 18:56:06 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v4 1/3] drm/panic: Add ABGR2101010 support
Date: Tue, 22 Oct 2024 20:39:47 +0200
Message-ID: <20241022185553.1103384-2-jfalempe@redhat.com>
In-Reply-To: <20241022185553.1103384-1-jfalempe@redhat.com>
References: <20241022185553.1103384-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

Add support for ABGR2101010, used by the nouveau driver.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 74412b7bf936c..0a9ecc1380d2a 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -209,6 +209,14 @@ static u32 convert_xrgb8888_to_argb2101010(u32 pix)
 	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
 }
 
+static u32 convert_xrgb8888_to_abgr2101010(u32 pix)
+{
+	pix = ((pix & 0x00FF0000) >> 14) |
+	      ((pix & 0x0000FF00) << 4) |
+	      ((pix & 0x000000FF) << 22);
+	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
+}
+
 /*
  * convert_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
  * @color: input color, in xrgb8888 format
@@ -242,6 +250,8 @@ static u32 convert_from_xrgb8888(u32 color, u32 format)
 		return convert_xrgb8888_to_xrgb2101010(color);
 	case DRM_FORMAT_ARGB2101010:
 		return convert_xrgb8888_to_argb2101010(color);
+	case DRM_FORMAT_ABGR2101010:
+		return convert_xrgb8888_to_abgr2101010(color);
 	default:
 		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
 		return 0;
-- 
2.47.0

