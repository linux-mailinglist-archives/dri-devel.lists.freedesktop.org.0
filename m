Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507D4C31E3C
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484A910E184;
	Tue,  4 Nov 2025 15:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="u1/LWY6c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H/TCw+Q6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u1/LWY6c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H/TCw+Q6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87DF10E184
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 15:38:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 61E7C2118F;
 Tue,  4 Nov 2025 15:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762270717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=amFe5OzZjkIwBTzqXd7tKqpumogn9x3YmmiMXkrqhWY=;
 b=u1/LWY6cZUZX11Pcul8YN5PCjc3xqGCX+64ygbVaDwYJCH6cvomONl2KC3hyT+SRUeWk1T
 RwDOhpyrECqigbUb8k1s+u5d7QhfB2/hBH7AGc5460c9cUhUST0EpmqSFpOY3R+RKeXNjI
 VEiaKm5C/qpF0pVrNayQAw5Y20XXcyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762270717;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=amFe5OzZjkIwBTzqXd7tKqpumogn9x3YmmiMXkrqhWY=;
 b=H/TCw+Q6BItM7URQN+7pLUSpZumJAAML/PZR2iYgycljwtAV59D5GkMFtQMmF0vDkp92YP
 7grTlBreMg8RycAg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="u1/LWY6c";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="H/TCw+Q6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762270717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=amFe5OzZjkIwBTzqXd7tKqpumogn9x3YmmiMXkrqhWY=;
 b=u1/LWY6cZUZX11Pcul8YN5PCjc3xqGCX+64ygbVaDwYJCH6cvomONl2KC3hyT+SRUeWk1T
 RwDOhpyrECqigbUb8k1s+u5d7QhfB2/hBH7AGc5460c9cUhUST0EpmqSFpOY3R+RKeXNjI
 VEiaKm5C/qpF0pVrNayQAw5Y20XXcyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762270717;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=amFe5OzZjkIwBTzqXd7tKqpumogn9x3YmmiMXkrqhWY=;
 b=H/TCw+Q6BItM7URQN+7pLUSpZumJAAML/PZR2iYgycljwtAV59D5GkMFtQMmF0vDkp92YP
 7grTlBreMg8RycAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE55B139A9;
 Tue,  4 Nov 2025 15:38:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id txe5OPwdCmmcFAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 04 Nov 2025 15:38:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 festevam@gmail.com, dmitry.baryshkov@oss.qualcomm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2] drm/imx/ipuv3: Fix dumb-buffer allocation for non-RGB
 formats
Date: Tue,  4 Nov 2025 16:38:05 +0100
Message-ID: <20251104153832.189666-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 61E7C2118F
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[14];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,gmail.com,oss.qualcomm.com,linux.intel.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,qualcomm.com:email,suse.de:dkim,suse.de:mid,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
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

Align pitch to multiples of 8 pixels for bpp values that do not map
to RGB formats. The call to drm_driver_color_mode_format() fails with
DRM_INVALID_FORMAT in these cases. Fall back to manually computing
the pitch alignment from which drm_mode_size_dumb() can compute the
correct pitch.

Fixes userspace that allocates dumb buffers for YUV formats, where
bpp equals 12. A common example is the IGT kms_getfb test.

v2:
- ignore width in calculation

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: b1d0e470f881 ("drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
This patch is based on Dmitry's fix for msm. [1] Please test.

There could later be a helper to contain these aligmentment calculations
in a single place.

[1] https://lore.kernel.org/dri-devel/20251103-drm-msm-fix-nv12-v2-1-75103b64576e@oss.qualcomm.com/
---
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index 465b5a6ad5bb..eddb471119c6 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -144,7 +144,6 @@ static int imx_drm_dumb_create(struct drm_file *file_priv,
 			       struct drm_mode_create_dumb *args)
 {
 	u32 fourcc;
-	const struct drm_format_info *info;
 	u64 pitch_align;
 	int ret;
 
@@ -156,12 +155,15 @@ static int imx_drm_dumb_create(struct drm_file *file_priv,
 	 * the allocated buffer.
 	 */
 	fourcc = drm_driver_color_mode_format(drm, args->bpp);
-	if (fourcc == DRM_FORMAT_INVALID)
-		return -EINVAL;
-	info = drm_format_info(fourcc);
-	if (!info)
-		return -EINVAL;
-	pitch_align = drm_format_info_min_pitch(info, 0, SZ_8);
+	if (fourcc != DRM_FORMAT_INVALID) {
+		const struct drm_format_info *info = drm_format_info(fourcc);
+
+		if (!info)
+			return -EINVAL;
+		pitch_align = drm_format_info_min_pitch(info, 0, 8);
+	} else {
+		pitch_align = DIV_ROUND_UP(args->bpp, SZ_8) * 8;
+	}
 	if (!pitch_align || pitch_align > U32_MAX)
 		return -EINVAL;
 	ret = drm_mode_size_dumb(drm, args, pitch_align, 0);
-- 
2.51.1

