Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E184BA9C435
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA87510E915;
	Fri, 25 Apr 2025 09:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Vrhxyjcp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5831310E914
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745574677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8s8KHAMjyvqc6s17EiYvbQe/uUqv5VtsZeEDVMrS8no=;
 b=VrhxyjcpTDDkGHDcHL2k43xEzfdYyCxiuN1aCi38+4ZnfdlEj5LoN3yHXm7ur9dWq5fYuQ
 F/DU5hjlKJ4XTo5JN67rQqb/zjlayP8Y0oIL5G61xW/4PfGNnUY0S1jc+3CVDzm0D2iVOY
 dyeX7KbdgcvCUXSgJTYIOSID8AJ0ABs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-489-1DncDLH4O2GJx7kwVDQrpg-1; Fri,
 25 Apr 2025 05:51:13 -0400
X-MC-Unique: 1DncDLH4O2GJx7kwVDQrpg-1
X-Mimecast-MFC-AGG-ID: 1DncDLH4O2GJx7kwVDQrpg_1745574672
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1377A1800875; Fri, 25 Apr 2025 09:51:12 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.34.172])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4D151195608D; Fri, 25 Apr 2025 09:51:07 +0000 (UTC)
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
Subject: [PATCH v7 8/8] drm/i915/display: Add drm_panic support for 4-tiling
 with DPT
Date: Fri, 25 Apr 2025 11:37:54 +0200
Message-ID: <20250425094949.473060-9-jfalempe@redhat.com>
In-Reply-To: <20250425094949.473060-1-jfalempe@redhat.com>
References: <20250425094949.473060-1-jfalempe@redhat.com>
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

On Alder Lake and later, it's not possible to disable tiling when DPT
is enabled.
So this commit implements 4-Tiling support, to still be able to draw
the panic screen.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index c846e300c48c..c96f7d45a67d 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1289,6 +1289,26 @@ static void intel_ytile_set_pixel(struct drm_scanout_buffer *sb, unsigned int x,
 	iosys_map_wr(&sb->map[0], offset, u32, color);
 }
 
+static void intel_4tile_set_pixel(struct drm_scanout_buffer *sb, unsigned int x, unsigned int y,
+				  u32 color)
+{
+	u32 offset;
+	unsigned int swizzle;
+	unsigned int width_in_blocks = DIV_ROUND_UP(sb->width, 32);
+
+	/* Block offset */
+	offset = ((y / YTILE_HEIGHT) * width_in_blocks + (x / YTILE_WIDTH)) * YTILE_SIZE;
+
+	x = x % YTILE_WIDTH;
+	y = y % YTILE_HEIGHT;
+
+	/* bit order inside a block is y4 y3 x4 y2 x3 x2 y1 y0 x1 x0 */
+	swizzle = (x & 3) | ((y & 3) << 2) | ((x & 0xc) << 2) | (y & 4) << 4 |
+		  ((x & 0x10) << 3) | ((y & 0x18) << 5);
+	offset += swizzle * 4;
+	iosys_map_wr(&sb->map[0], offset, u32, color);
+}
+
 static void intel_panic_flush(struct drm_plane *plane)
 {
 	struct intel_plane_state *plane_state = to_intel_plane_state(plane->state);
@@ -1323,7 +1343,6 @@ static void (*intel_get_tiling_func(u64 fb_modifier))(struct drm_scanout_buffer
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
 	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
 		return intel_ytile_set_pixel;
-	case I915_FORMAT_MOD_X_TILED:
 	case I915_FORMAT_MOD_4_TILED:
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
@@ -1333,6 +1352,8 @@ static void (*intel_get_tiling_func(u64 fb_modifier))(struct drm_scanout_buffer
 	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED_BMG_CCS:
 	case I915_FORMAT_MOD_4_TILED_LNL_CCS:
+		return intel_4tile_set_pixel;
+	case I915_FORMAT_MOD_X_TILED:
 	case I915_FORMAT_MOD_Yf_TILED:
 	case I915_FORMAT_MOD_Yf_TILED_CCS:
 	default:
-- 
2.49.0

