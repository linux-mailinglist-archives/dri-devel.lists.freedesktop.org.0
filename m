Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 934FFA24E6B
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 14:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C415F10E331;
	Sun,  2 Feb 2025 13:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=asahilina.net header.i=@asahilina.net header.b="nm7K4cVS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1588B10E287;
 Sun,  2 Feb 2025 13:52:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: sendonly@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 5AC5742CF1;
 Sun,  2 Feb 2025 13:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1738503919;
 bh=0XFfZsAZ8wQpbnhE6TGG8iedGMVB/EG9zg7bdoPFJoA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=nm7K4cVS4rwKjKVxWcc2cg+UVPIcOAq0K12y3VQvRTBC1ZHkCUd58qs6Fk0j8mVqv
 mQQ3zPWCOjHM2UOclSb6whdjeFEasfvR2DINw1AiNhKT5cnRE32GPny2VEGpAbz48F
 okxAnjgxJFjwWa4Xr061mxJ18ibEaZ2zWttqqK4pOm1OTs9QZAcilQK7jpW6YFOw6N
 vFyUzim12zV396CLz0HItPT79/mR+1J7NpXwessFju3p9agWcFNbp/bk55jb9TkfyJ
 liEgx1WP10+nJgeWx68AePa+43X3bist2vxaJZpL5dbDurKGfSaLdU4K55db/TcML5
 dGDwb2Ds2H4KA==
From: Asahi Lina <lina@asahilina.net>
Date: Sun, 02 Feb 2025 22:34:53 +0900
Subject: [PATCH 4/4] drm/gpuvm: Plumb through flags into drm_gpuva_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-gpuvm-single-page-v1-4-8cbd44fdcbd4@asahilina.net>
References: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
In-Reply-To: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738503908; l=1490;
 i=lina@asahilina.net; s=20240902; h=from:subject:message-id;
 bh=0XFfZsAZ8wQpbnhE6TGG8iedGMVB/EG9zg7bdoPFJoA=;
 b=D+jN0JTcW8OEsc4F0xQUGomb+e08KZzszhk8MTkGQJJUb6FugQDyAS80JiIo92stTlSBSR5hW
 crOLmCG7gcBBn96kSZChB8ofBm8ohHG4uA2OUGtDm3Mam0OsYR7Egsf
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=tpv7cWfUnHNw5jwf6h4t0gGgglt3/xcwlfs0+A/uUu8=
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

Now that drm_gpuva_op_map has a flags field, plumb it through to the
helper that populates a drm_gpuva.

This helper is only used by drm_gpuva_remap(), which in turn is only
used by drivers which do not use flags at all (panthor, imagination),
so this change has no effect on existing drivers.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 include/drm/drm_gpuvm.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index dfeec61908b1a8295ae08b26bef211d3d4fda85b..16e6dcb8755bfedca5d1f184d72db9b2e9b857d0 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -168,12 +168,14 @@ struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuvm *gpuvm, u64 start);
 struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuvm *gpuvm, u64 end);
 
 static inline void drm_gpuva_init(struct drm_gpuva *va, u64 addr, u64 range,
-				  struct drm_gem_object *obj, u64 offset)
+				  struct drm_gem_object *obj, u64 offset,
+				  enum drm_gpuva_flags flags)
 {
 	va->va.addr = addr;
 	va->va.range = range;
 	va->gem.obj = obj;
 	va->gem.offset = offset;
+	va->flags = flags;
 }
 
 /**
@@ -1088,7 +1090,7 @@ static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
 					  struct drm_gpuva_op_map *op)
 {
 	drm_gpuva_init(va, op->va.addr, op->va.range,
-		       op->gem.obj, op->gem.offset);
+		       op->gem.obj, op->gem.offset, op->flags);
 }
 
 /**

-- 
2.47.1

