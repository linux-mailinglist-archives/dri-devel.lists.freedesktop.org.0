Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B4A33DFA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 12:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E454810EA70;
	Thu, 13 Feb 2025 11:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ok+jYqD9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CF310EA65
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 11:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739446024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+vkuXSpIUHTDHSrs1Umi3GC7kTah6gvJvklDFfkYRyo=;
 b=Ok+jYqD9qquflH3BaWaeSw4naYKjx6ELTCMBtFpS7Mf/r1ht47RyLytwQENwKYN/xht/CQ
 gOKhFqApeMTKXv4HUf2Sb/fhkH2xG9Oxy0jjBgcW56gzbPdPIHNyuzta5errKBkn0bxBMu
 Fl7LdKoxFD0brrSVcqG7wiJpSUqfzsI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-180-rUm5HQykPkifaSSWYHeioA-1; Thu,
 13 Feb 2025 06:27:00 -0500
X-MC-Unique: rUm5HQykPkifaSSWYHeioA-1
X-Mimecast-MFC-AGG-ID: rUm5HQykPkifaSSWYHeioA_1739446018
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 39B0219783BA; Thu, 13 Feb 2025 11:26:58 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.79])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B71CF300018D; Thu, 13 Feb 2025 11:26:54 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v4 6/8] drm/i915/display: Flush the front buffer in panic
 handler
Date: Thu, 13 Feb 2025 12:19:30 +0100
Message-ID: <20250213112620.1923927-7-jfalempe@redhat.com>
In-Reply-To: <20250213112620.1923927-1-jfalempe@redhat.com>
References: <20250213112620.1923927-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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

On Lunar Lake, if the panic occurs when fbcon is active, the panic
screen is only partially visible on the screen. Adding this
intel_frontbuffer_flush() call solves the issue.
It's probably not safe to do that in the panic handler, but that's
still better than nothing.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 96697ac0ef69a..ee8cc82af3a8b 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -56,6 +56,7 @@
 #include "intel_fb.h"
 #include "intel_fb_pin.h"
 #include "intel_fbdev.h"
+#include "intel_frontbuffer.h"
 #include "skl_scaler.h"
 #include "skl_watermark.h"
 
@@ -1211,8 +1212,14 @@ static void intel_panic_flush(struct drm_plane *plane)
 	drm_clflush_virt_range(panic_map.vaddr, fb->height * fb->pitches[0]);
 
 	/* Don't disable tiling if it's the fbdev framebuffer.*/
-	if (to_intel_framebuffer(fb) == intel_fbdev_framebuffer(dev_priv->display.fbdev.fbdev))
+	if (to_intel_framebuffer(fb) == intel_fbdev_framebuffer(dev_priv->display.fbdev.fbdev)) {
+		struct intel_frontbuffer *front = to_intel_frontbuffer(fb);
+		struct drm_gem_object *obj = intel_fb_bo(fb);
+
+		intel_bo_flush_if_display(obj);
+		intel_frontbuffer_flush(front, ORIGIN_DIRTYFB);
 		return;
+	}
 
 	if (fb->modifier && iplane->disable_tiling)
 		iplane->disable_tiling(iplane);
-- 
2.47.1

