Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C84AB9D6246
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FEA10EC14;
	Fri, 22 Nov 2024 16:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="L0R5LLuX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8B710EC14
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:28:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B9D6FF80C;
 Fri, 22 Nov 2024 16:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732292886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7mrH4nMB6P5AeJ5Mz8Ak1miBGu6SgNHfqh2MFhH/Sk=;
 b=L0R5LLuX33gt5SA18g0DlnbRhP05jPVopQIj9c8WQDAC/jFD7ycEhQNGsXnYZ0ns4uurRb
 vDJzvl+isW0pX9tmJQ7Z3pXDuq6eD48AJFtvrapfR9RJTqKsZAWqiNofNikWzgish73YvB
 jSKHYfpKwOeWEQ1RnVZ44yZcG4iHH6p3GoMcnVZ/jRgWj2+eib1Y9sKWf/KxHSxi1xcMge
 ZG9x+QlBgP018yuR+/xDCx1FZipLzXsgcIZyEyb4YJgE3ayw/DlRslzveiziyUjmis73ry
 EKcr4P8W0Ocm1TntOdPZSVRkA2ZpmyQ3EJdnoQcrc5hgHHEmeNd67Uj4yFhEIQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 17:28:00 +0100
Subject: [PATCH v5 5/5] drm/vkms: Switch to managed for writeback connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-vkms-managed-v5-5-1ab60403e960@bootlin.com>
References: <20241122-google-vkms-managed-v5-0-1ab60403e960@bootlin.com>
In-Reply-To: <20241122-google-vkms-managed-v5-0-1ab60403e960@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1671;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=xbDbD69KZNScHlgCMisg2HJq8BICvN3NQAqTm8bzP/k=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQLEPFkspIJns27wzQHp2ZOPEZwLqsuzSD1Zw5
 l0evx6X0wyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CxDwAKCRAgrS7GWxAs
 4ljQEACMYE8CiMHmW/LFkuycRe9+cFYBWwhAixe0AubRsW5P53/jwu2qWrHkWb60Xb85+uAAwm5
 Ob3U1y0Te1PtYzFxopxxl7Bw0NZzxjZkzyACVodyfDkAvBI6SdVfwLE0gruCaXNd5FigQq3C2DT
 cM9FQdH2LvnoRTW7uI5QTW+5RB5kvitp/TzSWx9umlBsk3ummiNj4lkvdMCuT9+5ucBhWVb8QCa
 9GqqYu0SJGC+jhi5or065XHJ/iKhoyjHMil+XPJYnPhmEKMM5DV/g74jWUXPLNitDjeiylyFAUT
 f8iwL+UILfmK1i+nQe1GWMWAqkr8kDhkjD4JcBW5Op/pj/FF9PdiMLL6mpoVZuqu1GLI1/5zcew
 rW/VPJ4RMzKC0x/1OfRe2juj/eIF/xsnMlyjn6dXuu7jwwEsTQwL7KPaZ+qa9anzGvuDIV84WW/
 G86rgq5FUBDv177fa5WZWsCtUkAs5cX3ljlxttUjG3tycvY107SaGC/IzxXnOOMEfbAVoHDdmds
 q7sVF9C5yNl/PiljOEaGwQ+U/AyjckHHpTPEFESZXDqMdnRri9DZTzCk179RpCW16poFAVqZojH
 oElfpbVz9ZgTqQu6y5p6LtObOhyfbksL/iS88fxdD+a9doNHK7tQVtK2W861oPc1qvyC1iIeI/q
 yFEubUDCBY+XkdA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

The current VKMS driver uses non-managed function to create
writeback connectors. It is not an issue yet, but in order
to support multiple devices easily, convert this code to
use drm and device managed helpers.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_writeback.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 79918b44fedd7ae2451d1d530fc6d5aabf2d99a3..f12417b2d24803a33e4ff56108cc89704a500faf 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -24,7 +24,6 @@ static const u32 vkms_wb_formats[] = {
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -169,10 +168,10 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
 
 	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&vkmsdev->drm, wb,
-					    &vkms_wb_connector_funcs,
-					    NULL,
-					    vkms_wb_formats,
-					    ARRAY_SIZE(vkms_wb_formats),
-					    1);
+	return drmm_writeback_connector_init(&vkmsdev->drm, wb,
+					     &vkms_wb_connector_funcs,
+					     NULL, NULL,
+					     vkms_wb_formats,
+					     ARRAY_SIZE(vkms_wb_formats),
+					     1);
 }

-- 
2.47.0

