Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF99BA35A41
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 10:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CFC10EC1F;
	Fri, 14 Feb 2025 09:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fnXznk8E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A38410EC20
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739525199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tfKE1kNNaqYoc1NBMaOS+ggx5uGIG296IykfzUyaXYE=;
 b=fnXznk8E4m/resQrAFcdT/WYMEni0VerDwTSBbivXn3RJah/xx5qugSBhmtk0Tc2DD/JV/
 fBEV1S4Arq1ZRmw0lCXhHGOdQfe9fdB1ZGsMwd8/miJzgIqrXijF79v4vmDEaKzFopG4n4
 8kzeffH4A7qpxHFVFS+638OSmhCU2Vk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-191-HVKhkX9COyOcrUJJuCl4gA-1; Fri,
 14 Feb 2025 04:26:36 -0500
X-MC-Unique: HVKhkX9COyOcrUJJuCl4gA-1
X-Mimecast-MFC-AGG-ID: HVKhkX9COyOcrUJJuCl4gA_1739525195
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 11E8519373D9; Fri, 14 Feb 2025 09:26:35 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.79])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6B0B0180035E; Fri, 14 Feb 2025 09:26:31 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v5 3/8] drm/i915/display: Add a disable_tiling() for skl planes
Date: Fri, 14 Feb 2025 10:21:38 +0100
Message-ID: <20250214092608.2555218-4-jfalempe@redhat.com>
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
 .../drm/i915/display/skl_universal_plane.c    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index eb85d3d6cdc3c..3eef0f9f4241b 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2703,6 +2703,25 @@ static u8 tgl_plane_caps(struct intel_display *display,
 	return caps;
 }
 
+static void skl_disable_tiling(struct intel_plane *plane)
+{
+	struct intel_plane_state *state = to_intel_plane_state(plane->base.state);
+	struct intel_display *display = to_intel_display(plane);
+	u32 stride = state->view.color_plane[0].scanout_stride / 64;
+	u32 plane_ctl;
+
+	plane_ctl = intel_de_read(display, PLANE_CTL(plane->pipe, plane->id));
+	plane_ctl &= ~PLANE_CTL_TILED_MASK;
+
+	intel_de_write_fw(display, PLANE_STRIDE(plane->pipe, plane->id),
+			  PLANE_STRIDE_(stride));
+
+	intel_de_write_fw(display, PLANE_CTL(plane->pipe, plane->id), plane_ctl);
+
+	intel_de_write_fw(display, PLANE_SURF(plane->pipe, plane->id),
+			  skl_plane_surf(state, 0));
+}
+
 struct intel_plane *
 skl_universal_plane_create(struct intel_display *display,
 			   enum pipe pipe, enum plane_id plane_id)
@@ -2749,6 +2768,7 @@ skl_universal_plane_create(struct intel_display *display,
 		plane->max_height = skl_plane_max_height;
 		plane->min_cdclk = skl_plane_min_cdclk;
 	}
+	plane->disable_tiling = skl_disable_tiling;
 
 	if (DISPLAY_VER(display) >= 13)
 		plane->max_stride = adl_plane_max_stride;
-- 
2.47.1

