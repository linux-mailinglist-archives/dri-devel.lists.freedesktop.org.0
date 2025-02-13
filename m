Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2BFA33DEE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 12:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE8910EA62;
	Thu, 13 Feb 2025 11:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Z5w1HCRM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6775310E3AC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 11:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739446012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ukp+DPAP2e5b+ECjigVMVBfgY4Lnhx6RbqGLiSUCLSU=;
 b=Z5w1HCRMhNa8eXHwMFb5oNDkwU04LaAYLk2Dot8IbrE2QpiL0iEdxSPSk3/ptOVPHjI/YF
 tPMUz9+IWGyPlXr5IEtUh0HTbuV+v6rxuXkjVc7dcLDqJQwJhqaqBean/1EFQvCzQKI80Z
 W03q5EMSaoTEeo4lKichEqjA7uIwbJ4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-685-TykmaSFxNdmug4K3nbaA3A-1; Thu,
 13 Feb 2025 06:26:47 -0500
X-MC-Unique: TykmaSFxNdmug4K3nbaA3A-1
X-Mimecast-MFC-AGG-ID: TykmaSFxNdmug4K3nbaA3A
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CC2841800878; Thu, 13 Feb 2025 11:26:45 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.79])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 494DF3000197; Thu, 13 Feb 2025 11:26:42 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v4 3/8] drm/i915/display: Add a disable_tiling() for skl planes
Date: Thu, 13 Feb 2025 12:19:27 +0100
Message-ID: <20250213112620.1923927-4-jfalempe@redhat.com>
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

drm_panic draws in linear framebuffer, so it's easier to re-use the
current framebuffer, and disable tiling in the panic handler, to show
the panic screen.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 .../drm/i915/display/skl_universal_plane.c    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ff9764cac1e71..7cc5f8e700e7e 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2603,6 +2603,25 @@ static u8 skl_get_plane_caps(struct drm_i915_private *i915,
 	return caps;
 }
 
+static void skl_disable_tiling(struct intel_plane *plane)
+{
+	u32 plane_ctl;
+	struct intel_plane_state *state = to_intel_plane_state(plane->base.state);
+	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	u32 stride = state->view.color_plane[0].scanout_stride / 64;
+
+	plane_ctl = intel_de_read(dev_priv, PLANE_CTL(plane->pipe, plane->id));
+	plane_ctl &= ~PLANE_CTL_TILED_MASK;
+
+	intel_de_write_fw(dev_priv, PLANE_STRIDE(plane->pipe, plane->id),
+			  PLANE_STRIDE_(stride));
+
+	intel_de_write_fw(dev_priv, PLANE_CTL(plane->pipe, plane->id), plane_ctl);
+
+	intel_de_write_fw(dev_priv, PLANE_SURF(plane->pipe, plane->id),
+			  skl_plane_surf(state, 0));
+}
+
 struct intel_plane *
 skl_universal_plane_create(struct drm_i915_private *dev_priv,
 			   enum pipe pipe, enum plane_id plane_id)
@@ -2648,6 +2667,7 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 		plane->max_height = skl_plane_max_height;
 		plane->min_cdclk = skl_plane_min_cdclk;
 	}
+	plane->disable_tiling = skl_disable_tiling;
 
 	if (DISPLAY_VER(dev_priv) >= 13)
 		plane->max_stride = adl_plane_max_stride;
-- 
2.47.1

