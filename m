Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24B2A9C427
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA98310E905;
	Fri, 25 Apr 2025 09:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Z+mnEnLG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D3510E909
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745574632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UzG3x/gkLWPOScz2+XOG7DZeBmtr2uIxexf3063+54k=;
 b=Z+mnEnLGIUVbtW1usIfLREM5JKZdfbWIg5p5H0Z0WZdjqi/g+fTSy5zQP1HwKLXNITv4qP
 htvKrVKu9gZTFuyV11Oe5w0SIScbBFxqON1tM8TaRO3Jahqk+vWA7TEu8NcTP2x0k6D1Eq
 EC8EsZiotgfU0qig8Dc/oL2rOgZ8OS0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-122-0T4y5msNNn6WQC-GXxuT0g-1; Fri,
 25 Apr 2025 05:50:28 -0400
X-MC-Unique: 0T4y5msNNn6WQC-GXxuT0g-1
X-Mimecast-MFC-AGG-ID: 0T4y5msNNn6WQC-GXxuT0g_1745574626
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 48E071800446; Fri, 25 Apr 2025 09:50:26 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.34.172])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9F715195608F; Fri, 25 Apr 2025 09:50:21 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v7 2/8] drm/i915/display/i9xx: Add a disable_tiling() for i9xx
 planes
Date: Fri, 25 Apr 2025 11:37:48 +0200
Message-ID: <20250425094949.473060-3-jfalempe@redhat.com>
In-Reply-To: <20250425094949.473060-1-jfalempe@redhat.com>
References: <20250425094949.473060-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

drm_panic draws in linear framebuffer, so it's easier to re-use the
current framebuffer, and disable tiling in the panic handler, to show
the panic screen.
This assumes that the alignment restriction is always smaller in
linear than in tiled.
It also assumes that the linear framebuffer size is always smaller
than the tiled.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v7:
 * Reword commit message about alignment/size when disabling tiling (Ville Syrjälä)

 drivers/gpu/drm/i915/display/i9xx_plane.c     | 23 +++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index 5e8344fdfc28..9c93d5ac7129 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -908,6 +908,27 @@ static const struct drm_plane_funcs i8xx_plane_funcs = {
 	.format_mod_supported = i8xx_plane_format_mod_supported,
 };
 
+static void i9xx_disable_tiling(struct intel_plane *plane)
+{
+	struct intel_display *display = to_intel_display(plane);
+	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
+	u32 dspcntr;
+	u32 reg;
+
+	dspcntr = intel_de_read_fw(display, DSPCNTR(display, i9xx_plane));
+	dspcntr &= ~DISP_TILED;
+	intel_de_write_fw(display, DSPCNTR(display, i9xx_plane), dspcntr);
+
+	if (DISPLAY_VER(display) >= 4) {
+		reg = intel_de_read_fw(display, DSPSURF(display, i9xx_plane));
+		intel_de_write_fw(display, DSPSURF(display, i9xx_plane), reg);
+
+	} else {
+		reg = intel_de_read_fw(display, DSPADDR(display, i9xx_plane));
+		intel_de_write_fw(display, DSPADDR(display, i9xx_plane), reg);
+	}
+}
+
 struct intel_plane *
 intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
 {
@@ -1050,6 +1071,8 @@ intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
 		}
 	}
 
+	plane->disable_tiling = i9xx_disable_tiling;
+
 	modifiers = intel_fb_plane_get_modifiers(display, INTEL_PLANE_CAP_TILING_X);
 
 	if (DISPLAY_VER(display) >= 5 || display->platform.g4x)
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 7415564d058a..69deb6ae14a0 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1513,6 +1513,8 @@ struct intel_plane {
 			   bool async_flip);
 	void (*enable_flip_done)(struct intel_plane *plane);
 	void (*disable_flip_done)(struct intel_plane *plane);
+	/* For drm_panic */
+	void (*disable_tiling)(struct intel_plane *plane);
 };
 
 #define to_intel_atomic_state(x) container_of(x, struct intel_atomic_state, base)
-- 
2.49.0

