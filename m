Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 907C4A74639
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 10:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2990710E9AD;
	Fri, 28 Mar 2025 09:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="eDs/ttWY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iEj4h4ib";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j069adGx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B79qi1ix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4126510E9AD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 09:22:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EF2092118E;
 Fri, 28 Mar 2025 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743153713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VzQPAoBvCW+0TleETRDVvfoU8jGg30OBv182MBzm9l8=;
 b=eDs/ttWYXt35C+y9+hZYXFRKqihYup9NcjGvUo7hKGEVgfRRL0KR1t/OUopIHhvdpD1+Ag
 HAbYAf7V5YffR22wdnUSx1sQm5SvFkAI4iaogoLznQ9rKmmX7KNDxfAmbtvMnbsFM2eRYf
 6l8+p10JGgvUgx6aIfjcRSPIdWmvEoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743153713;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VzQPAoBvCW+0TleETRDVvfoU8jGg30OBv182MBzm9l8=;
 b=iEj4h4ibu06NUdiYUci39+75qg2oT7VrPQQTvUKjtJC+bsGxxitOHY0xAaY84nLQFUt0Rh
 XxyODZGAqbAkQ0Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743153712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VzQPAoBvCW+0TleETRDVvfoU8jGg30OBv182MBzm9l8=;
 b=j069adGxtJMhPjxUlTvRQvOq4bVU6JnXRHTeApmwX4ZkM6TBdCx8+TTOCPUchu5A0cT9PG
 zepLCvFtuZP6LlhGqbJFDg0mP5IQBW4An5smUrVEZyLLlZeuj85nucsIhn65qFwq0Ez6jm
 f8Ki7RRgRHXQJIpj26V0SCyUrNbsWfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743153712;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VzQPAoBvCW+0TleETRDVvfoU8jGg30OBv182MBzm9l8=;
 b=B79qi1ix2+rIWYmcHUEwCsxjmV59MYVcjolBTOFD6fd/BSA4MXj86izLv2HC9cdW0RVtOB
 21Vmra0Vqe3thIAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5070139D4;
 Fri, 28 Mar 2025 09:21:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yALoLjBq5mciEwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Mar 2025 09:21:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com,
	airlied@redhat.com
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/4] drm/cirrus-qemu: Stricter mode validation
Date: Fri, 28 Mar 2025 10:17:06 +0100
Message-ID: <20250328091821.195061-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328091821.195061-1-tzimmermann@suse.de>
References: <20250328091821.195061-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
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

Implement strict checking of a display mode's minimum scanline
pitch in cirrus_mode_config_mode_valid(). Sort out all modes that
possibly overflow the maximum pitch.

The current validation only tests against a display mode's minimum
requirements for video memory. Only atomic_check later tests against
the pitch limit before programming the framebuffer.

The problem is that user-space compositors do not handle this
gracefully. If atomic_check fails to validate the scanline pitch
and returns an error, the compositor, namely Weston, does nothing
and the display remains stale.

Ruling out display modes that possibly overflow the pitch avoids
this problem. With only 4 MiB of video memory available, this
effectively limits horizontal resolution to 800 pixels. But with
cirrus-qemu being low-end and obsolete, this is probably not an
issue in practice. Better alternatives are available in qemu.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/tiny/cirrus-qemu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus-qemu.c b/drivers/gpu/drm/tiny/cirrus-qemu.c
index a00d3b7ded6c5..0306433ec117c 100644
--- a/drivers/gpu/drm/tiny/cirrus-qemu.c
+++ b/drivers/gpu/drm/tiny/cirrus-qemu.c
@@ -613,9 +613,17 @@ static enum drm_mode_status cirrus_mode_config_mode_valid(struct drm_device *dev
 							  const struct drm_display_mode *mode)
 {
 	const struct drm_format_info *format = drm_format_info(DRM_FORMAT_XRGB8888);
-	uint64_t pitch = drm_format_info_min_pitch(format, 0, mode->hdisplay);
+	u64 pitch;
 
-	if (pitch * mode->vdisplay > CIRRUS_VRAM_SIZE)
+	if (drm_WARN_ON_ONCE(dev, !format))
+		return MODE_ERROR; /* driver bug */
+
+	pitch = drm_format_info_min_pitch(format, 0, mode->hdisplay);
+	if (!pitch)
+		return MODE_BAD_WIDTH;
+	if (pitch > CIRRUS_MAX_PITCH)
+		return MODE_BAD_WIDTH; /* maximum programmable pitch */
+	if (pitch > CIRRUS_VRAM_SIZE / mode->vdisplay)
 		return MODE_MEM;
 
 	return MODE_OK;
-- 
2.48.1

