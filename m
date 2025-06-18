Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F113ADE74C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 11:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4AD10E7D0;
	Wed, 18 Jun 2025 09:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YO6Kt2rJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7A510E7E3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 09:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750239691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cb5LZwIu7WhAhZdNSHxlhoczvo6dlF0WrpDcRxWpRZw=;
 b=YO6Kt2rJZlCpaEpdGbivVXBQdWrq9Be3x89/3DEeWyOie0qyLq4ZbK4iQDFaeajX3UDobl
 +skfb3YYDkBJl7T6gjqbsk5oaBFmlKOfJOT90zZiDP5IIvjU1Ki1gslSn5KMwkTD/huK2z
 A61XwhDo6Q1z8l5Mf8COA81lsr1Skfc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-441-71_E0i8LO3yfiyP4Ju9tJQ-1; Wed,
 18 Jun 2025 05:41:27 -0400
X-MC-Unique: 71_E0i8LO3yfiyP4Ju9tJQ-1
X-Mimecast-MFC-AGG-ID: 71_E0i8LO3yfiyP4Ju9tJQ_1750239685
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 641C018089B6; Wed, 18 Jun 2025 09:41:25 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.137])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CD5E119560A3; Wed, 18 Jun 2025 09:41:19 +0000 (UTC)
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
Subject: [PATCH v10 09/10] drm/i915/display: Add drm_panic support for
 4-tiling with DPT
Date: Wed, 18 Jun 2025 11:31:27 +0200
Message-ID: <20250618094011.238154-10-jfalempe@redhat.com>
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

On Alder Lake and later, it's not possible to disable tiling when DPT
is enabled.
So this commit implements 4-Tiling support, to still be able to draw
the panic screen.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

 .../gpu/drm/i915/display/intel_atomic_plane.c | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 044328d83df9..086195a11af9 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1297,6 +1297,25 @@ static unsigned int intel_ytile_get_offset(unsigned int width, unsigned int x, u
 	return offset;
 }
 
+static unsigned int intel_4tile_get_offset(unsigned int width, unsigned int x, unsigned int y)
+{
+	u32 offset;
+	unsigned int swizzle;
+	unsigned int width_in_blocks = DIV_ROUND_UP(width, 32);
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
+	return offset;
+}
+
 static void intel_panic_flush(struct drm_plane *plane)
 {
 	struct intel_plane_state *plane_state = to_intel_plane_state(plane->state);
@@ -1340,6 +1359,7 @@ static unsigned int (*intel_get_tiling_func(u64 fb_modifier))(unsigned int width
 	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED_BMG_CCS:
 	case I915_FORMAT_MOD_4_TILED_LNL_CCS:
+		return intel_4tile_get_offset;
 	case I915_FORMAT_MOD_X_TILED:
 	case I915_FORMAT_MOD_Yf_TILED:
 	case I915_FORMAT_MOD_Yf_TILED_CCS:
-- 
2.49.0

