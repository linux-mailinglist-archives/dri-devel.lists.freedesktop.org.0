Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A50E7698061
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5476610EB0A;
	Wed, 15 Feb 2023 16:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F9410EB08
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 16:15:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D5CA51F8D6;
 Wed, 15 Feb 2023 16:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676477720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=H8O2pqGGz2IXryxdRbZ/zKUMEMQ+ehGKWwZJA0uDVho=;
 b=IgBljbXsgPTiYSvqNr+ShEsIDE/SHrnQzwTeQYPX5dpMpweFMtXLxH61nhKWPnflJeX6nO
 KNK5XqqxK+EfQm+i8dSgGIW+C0TTiMc4gPbg3HR9vlyxhrKnHtLST6NwIrKIZb7tGOHa2r
 lbO13oVrWbqgTCoZS19FI1/RjpgqvNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676477720;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=H8O2pqGGz2IXryxdRbZ/zKUMEMQ+ehGKWwZJA0uDVho=;
 b=Uk4/09t8ES7GBW267K+UMBIdNOR/8xxcL82nSocq4Ojh74wFNWip6RtXB/Aug0FN4Zi5kI
 VpGMzKFuYQji+hBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 47314134BA;
 Wed, 15 Feb 2023 16:15:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DRtwDRgF7WNHOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Feb 2023 16:15:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 00/17] cirrus: Modernize the cirrus driver
Date: Wed, 15 Feb 2023 17:15:00 +0100
Message-Id: <20230215161517.5113-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the cirrus driver to follow current best practices. While the
driver's hardware is obsolete, the cirrus driver is still one of the
go-to modules to learn about writing a DRM driver. So keep it in good
shape.

Patches 1 to 3 simplify blitting and convert it to the DRM's current
helpers.

Patches 4 to 8 replace simple-KMS helpers with DRM's regular atomic
helpers. The former are midlayers on top of the latter, and should
be replaced entirely.

Patches 9 and 10 further improve blitting. This enables damage clipping
for userspace and the console. Until now, cirrus' mandatory fullscreen
updates have added unnecessary overhead to every screen update.

Patches 11 to 14 simplify mode and framebuffer tests. With the use
of regular helpers, these tests can now be implemented in the places
they belong.

Patches 15 and 16 move hardware color format and pitch into plane
state of the primary plane. These fields have been kept in the device
structure itself, where thy don't belong.

Patch 17 replaces two magic values by macro constants. There are
more such cases within cirrus, but those two values stuck out as
specifically hard to interpret.

Tested with qemu's cirrus emulation.

Thomas Zimmermann (17):
  drm/cirrus: Compute blit destination offset in single location
  drm/cirrus: Replace cpp value with format
  drm/cirrus: Use drm_fb_blit() to update scanout buffer
  drm/cirrus: Move drm_dev_{enter,exit}() into DRM helpers
  drm/cirrus: Split cirrus_mode_set() into smaller functions
  drm/cirrus: Integrate connector into pipeline code
  drm/cirrus: Move primary-plane format arrays
  drm/cirrus: Convert to regular atomic helpers
  drm/cirrus: Enable damage clipping on primary plane
  drm/cirrus: Inline cirrus_fb_blit_rect()
  drm/cirrus: Remove format test from cirrus_fb_create()
  drm/cirrus: Remove size test from cirrus_fb_create()
  drm/cirrus: Test mode against video-memory size in device-wide
    mode_valid
  drm/cirrus: Inline cirrus_check_size() into primary-plane atomic_check
  drm/cirrus: Introduce struct cirrus_primary_plane_state
  drm/cirrus: Store HW format/pitch in primary-plane state
  drm/cirrus: Use VGA macro constants to unblank

 drivers/gpu/drm/tiny/cirrus.c | 499 +++++++++++++++++++++-------------
 1 file changed, 305 insertions(+), 194 deletions(-)

-- 
2.39.1

