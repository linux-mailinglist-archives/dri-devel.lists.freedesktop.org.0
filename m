Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E1AADE736
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 11:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D9410E7C1;
	Wed, 18 Jun 2025 09:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A0JPSkf4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C08010E7BE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 09:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750239642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jg05gLn4LYp6QB0cNwt5RW/tA0G9+DCBeUGxTXSbrQE=;
 b=A0JPSkf4ZQni9NDX46QzgiDwum2r5bex+S/VhBt/KVyThF4g/lnGbtBGX2coWDAgKK2RtO
 oULeq4hVR0//IVm3mrik32WRDOSfVra2tVQXF/tjK5h+RqVFrvDFj/4n6sQcdKt+NylVgK
 /b2y3s+FJivnS2fgd3lMgwMKx/dpnTg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-153-yKyOanwfNWOF19qMVku-9w-1; Wed,
 18 Jun 2025 05:40:38 -0400
X-MC-Unique: yKyOanwfNWOF19qMVku-9w-1
X-Mimecast-MFC-AGG-ID: yKyOanwfNWOF19qMVku-9w_1750239636
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CA537180136B; Wed, 18 Jun 2025 09:40:35 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.137])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9D58519560AF; Wed, 18 Jun 2025 09:40:29 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v10 01/10] drm/panic: Add a private field to struct
 drm_scanout_buffer
Date: Wed, 18 Jun 2025 11:31:19 +0200
Message-ID: <20250618094011.238154-2-jfalempe@redhat.com>
In-Reply-To: <20250618094011.238154-1-jfalempe@redhat.com>
References: <20250618094011.238154-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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

This allows driver to set some private data in get_scanout_buffer(),
and re-use them in set_pixel() callback.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v10:
 * Added in v10, to avoid static variables

 include/drm/drm_panic.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index 310c88c4d336..ac0e46b73436 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -72,6 +72,12 @@ struct drm_scanout_buffer {
 	void (*set_pixel)(struct drm_scanout_buffer *sb, unsigned int x,
 			  unsigned int y, u32 color);
 
+	/**
+	 * @private: private pointer that you can use in the callbacks
+	 * set_pixel()
+	 */
+	void *private;
+
 };
 
 #ifdef CONFIG_DRM_PANIC
-- 
2.49.0

