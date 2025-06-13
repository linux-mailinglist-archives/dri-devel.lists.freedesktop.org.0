Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37749AD86A8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 11:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B9110E95D;
	Fri, 13 Jun 2025 09:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="OpvkHcV1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uh5rpvHS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OpvkHcV1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uh5rpvHS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E8C10E956
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 09:05:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6436921282;
 Fri, 13 Jun 2025 09:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749805491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7jf9qOExxDcSOt4izp67/OXl6KEF+Jd/H4a7h9LsPuc=;
 b=OpvkHcV1/2de0xS4OZzHVt9N8jm2reUe5KPT9bWKoZ9u4z1dvB8sO7YYkQVOyDC7JLzXrr
 cvbV4vCNMIdtMSVxhO1smLBtMckCpfjFbUvWdvpBwoOGjK8llf8bXPfCzxP0Nh4BF+kTy4
 3kVow4aDqx4epsUoxiGzL6JpexbF2vI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749805491;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7jf9qOExxDcSOt4izp67/OXl6KEF+Jd/H4a7h9LsPuc=;
 b=uh5rpvHS8JlHCsb5KBUR7mEQa3z2/atdoBMkNf0dIomDDg2iOAkRvf0OrFRgb/vopVkntg
 CudKOkXm40sL13Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749805491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7jf9qOExxDcSOt4izp67/OXl6KEF+Jd/H4a7h9LsPuc=;
 b=OpvkHcV1/2de0xS4OZzHVt9N8jm2reUe5KPT9bWKoZ9u4z1dvB8sO7YYkQVOyDC7JLzXrr
 cvbV4vCNMIdtMSVxhO1smLBtMckCpfjFbUvWdvpBwoOGjK8llf8bXPfCzxP0Nh4BF+kTy4
 3kVow4aDqx4epsUoxiGzL6JpexbF2vI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749805491;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7jf9qOExxDcSOt4izp67/OXl6KEF+Jd/H4a7h9LsPuc=;
 b=uh5rpvHS8JlHCsb5KBUR7mEQa3z2/atdoBMkNf0dIomDDg2iOAkRvf0OrFRgb/vopVkntg
 CudKOkXm40sL13Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C6143137FE;
 Fri, 13 Jun 2025 09:04:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sAX9LrLpS2inNAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Jun 2025 09:04:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
 tomi.valkeinen@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: [PATCH v5 22/25] drm/vmwgfx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Date: Fri, 13 Jun 2025 11:00:41 +0200
Message-ID: <20250613090431.127087-23-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613090431.127087-1-tzimmermann@suse.de>
References: <20250613090431.127087-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -5.30
X-Spamd-Result: default: False [-5.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; SUSPICIOUS_RECIPS(1.50)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_TWELVE(0.00)[23];
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
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

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
and buffer size. No alignment required.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 7e281c3c6bc5..c4ac9b47e23a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -15,6 +15,7 @@
 #include "vmw_surface_cache.h"
 #include "device_include/svga3d_surfacedefs.h"
 
+#include <drm/drm_dumb_buffers.h>
 #include <drm/ttm/ttm_placement.h>
 
 #define SVGA3D_FLAGS_64(upper32, lower32) (((uint64_t)upper32 << 32) | lower32)
@@ -2267,23 +2268,9 @@ int vmw_dumb_create(struct drm_file *file_priv,
 	 * contents is going to be rendered guest side.
 	 */
 	if (!dev_priv->has_mob || !vmw_supports_3d(dev_priv)) {
-		int cpp = DIV_ROUND_UP(args->bpp, 8);
-
-		switch (cpp) {
-		case 1: /* DRM_FORMAT_C8 */
-		case 2: /* DRM_FORMAT_RGB565 */
-		case 4: /* DRM_FORMAT_XRGB8888 */
-			break;
-		default:
-			/*
-			 * Dumb buffers don't allow anything else.
-			 * This is tested via IGT's dumb_buffers
-			 */
-			return -EINVAL;
-		}
-
-		args->pitch = args->width * cpp;
-		args->size = ALIGN(args->pitch * args->height, PAGE_SIZE);
+		ret = drm_mode_size_dumb(dev, args, 0, 0);
+		if (ret)
+			return ret;
 
 		ret = vmw_gem_object_create_with_handle(dev_priv, file_priv,
 							args->size, &args->handle,
-- 
2.49.0

