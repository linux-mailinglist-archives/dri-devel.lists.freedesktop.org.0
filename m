Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7846F4AF64A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC17889907;
	Wed,  9 Feb 2022 16:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941E58940F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:16:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3FAF01F38E;
 Wed,  9 Feb 2022 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644423380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Uhyv25YaTpnvQs3KQU0BbAWa+gjcLRvJflGMCwkQOLw=;
 b=RclkEPwxcCvMzv21GWQ4JxFhiXPZxwpSr43QzxeoyL0nvGPnFKCBveFF0EBofo/sgl3U3j
 23F8ul1ATw0cMIzCM0cbBHeNzzCNuBqpGL+Ewla2K85XCHx3EObMVcxaDPu4y51geTXpR3
 keLaYnHgwQDJ4YFDswuh2QdGJPNLpy0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644423380;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Uhyv25YaTpnvQs3KQU0BbAWa+gjcLRvJflGMCwkQOLw=;
 b=78PiIZzSGuNAZRjVJRc7MhjZh0viyjxMy3OBkFyEeVGvM87A/b9B4YmqcXcZPhFyaPnZ65
 zsYuO0lUiLPHffCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 09DC413B0C;
 Wed,  9 Feb 2022 16:16:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /CVpAdToA2KfJwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Feb 2022 16:16:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, sam@ravnborg.org,
 noralf@tronnes.org
Subject: [PATCH v2 0/5] drm/fb-helper: Fix and improve fbdevio clipping
Date: Wed,  9 Feb 2022 17:16:12 +0100
Message-Id: <20220209161617.3553-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is one of several patchset s to improve fb deferred I/O and
DRM's use of it. The patches fix several problems with the current
helpers and add some easy improvements.

Deferred I/O tracks dirty pages of the screen buffer, from which
DRM calculates a bounding box of the damaged area. Patches 1 and 2
resolve bugs in the computation. Specifically, it makes the damage
handling work with overallocation and panning enabled.

Patches 3 to 5 add an easy performance improvement. Instead of
damaging the whole viewport after a write operation, only damage
the written area. For large writes the area consists of multiple
scanlines, for small writes the area might consist of only a few
pixels on a single scanline. Write operations now also work correctly
with overallocation and panning enabled.

v2:
	* rename memory-to-clip helper (Javier)

Thomas Zimmermann (5):
  drm/fb-helper: Fix clip rectangle height
  drm/fb-helper: Fix vertical damage clipping
  drm/fb-helper: Calculate damaged area in separate helper
  drm/fb-helper: Clip damage area to written memory range
  drm/fb-helper: Clip damage area horizontally

 drivers/gpu/drm/drm_fb_helper.c | 69 ++++++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 15 deletions(-)

-- 
2.34.1

