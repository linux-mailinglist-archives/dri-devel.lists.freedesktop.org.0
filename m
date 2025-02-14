Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5941A35A44
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 10:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134A810EC1C;
	Fri, 14 Feb 2025 09:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Tp+9/aRN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C13410EC1E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739525203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JK04INHG5UyOm3qCRe/HTI+C1zqotKR2ndPyjDYxCQQ=;
 b=Tp+9/aRNf0xvtdcl5CSwIc/2z2sMj2VJfSQhqFC8lMysHXXPzaMoTmvyV5Md0MT4vhIdzl
 6zroNV4bIAKNe4oD7nJJFT81LhVtVskrgbELBzsfbw2bm/ZZAM9pG4ZAM3CishVI/lD/WA
 OZf+XcxFteQqYqkyszGYFMD0Ay6hNBE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-45-_QOfwnhAOJ2q1aR2jhJgAg-1; Fri,
 14 Feb 2025 04:26:34 -0500
X-MC-Unique: _QOfwnhAOJ2q1aR2jhJgAg-1
X-Mimecast-MFC-AGG-ID: _QOfwnhAOJ2q1aR2jhJgAg_1739525191
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E405918EB2CB; Fri, 14 Feb 2025 09:26:30 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.79])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1A13B180035E; Fri, 14 Feb 2025 09:26:26 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v5 2/8] drm/i915/display/i9xx: Add a disable_tiling() for i9xx
 planes
Date: Fri, 14 Feb 2025 10:21:37 +0100
Message-ID: <20250214092608.2555218-3-jfalempe@redhat.com>
In-Reply-To: <20250214092608.2555218-1-jfalempe@redhat.com>
References: <20250214092608.2555218-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/i915/display/i9xx_plane.c     | 23 +++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index aef8d8b7ea85f..d5538adbb3624 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -866,6 +866,27 @@ static const struct drm_plane_funcs i8xx_plane_funcs = {
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
@@ -1001,6 +1022,8 @@ intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
 		}
 	}
 
+	plane->disable_tiling = i9xx_disable_tiling;
+
 	modifiers = intel_fb_plane_get_modifiers(display, INTEL_PLANE_CAP_TILING_X);
 
 	if (DISPLAY_VER(display) >= 5 || display->platform.g4x)
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 6a82c6ade549b..38e2108b01ff6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1507,6 +1507,8 @@ struct intel_plane {
 			   bool async_flip);
 	void (*enable_flip_done)(struct intel_plane *plane);
 	void (*disable_flip_done)(struct intel_plane *plane);
+	/* For drm_panic */
+	void (*disable_tiling)(struct intel_plane *plane);
 };
 
 #define to_intel_atomic_state(x) container_of(x, struct intel_atomic_state, base)
-- 
2.47.1

