Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36835A707FF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 18:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C43410E5BD;
	Tue, 25 Mar 2025 17:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C78510E3AC
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 17:20:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6DEBD2119A;
 Tue, 25 Mar 2025 17:20:42 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3EF2813957;
 Tue, 25 Mar 2025 17:20:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MHUpDurl4mfzWAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Mar 2025 17:20:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com,
	airlied@redhat.com
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/4] drm/cirrus-qemu: Stricter mode validation
Date: Tue, 25 Mar 2025 18:12:50 +0100
Message-ID: <20250325171716.154097-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250325171716.154097-1-tzimmermann@suse.de>
References: <20250325171716.154097-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 6DEBD2119A
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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
---
 drivers/gpu/drm/tiny/cirrus-qemu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus-qemu.c b/drivers/gpu/drm/tiny/cirrus-qemu.c
index a00d3b7ded6c..0306433ec117 100644
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

