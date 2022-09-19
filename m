Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A2A5BCC82
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 15:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A878F10E628;
	Mon, 19 Sep 2022 13:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D46910E270
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 13:04:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 009921F8DE;
 Mon, 19 Sep 2022 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663592652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IMmOUF13Ycl3vNztLUkzBOEKbC56azPHisiWk3o2GeA=;
 b=gufDCunpEDkGdhHGzyXrPW4zvj8PZK2ynSNHwuHUIHvKb6ccnr9ff29SjsUsNCpNyhxa9W
 +CIZnbt0mWzJgfsbjkhC+4ZaD/ZVhPhh9geg3Ppz5GYyg2qlmbPS9ZwIsO3hXbwhOT4ycO
 IZE34AhyaOd377+JT9wF71u7yKUAX1k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663592652;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IMmOUF13Ycl3vNztLUkzBOEKbC56azPHisiWk3o2GeA=;
 b=T6h9hLRrd37M8LO3lU0uYwqkqYNeAdV9VTFVi0O8yiRcIkaaQdwG8+Qio9pRHfz3aGuOOu
 s7eK46p4Jo0mzLDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C8F5313A96;
 Mon, 19 Sep 2022 13:04:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +PvGL8toKGMzOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Sep 2022 13:04:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	daniel@ffwll.ch
Subject: [PATCH 00/16] drm/udl: Better modesetting, hot-unplug, protocol
Date: Mon, 19 Sep 2022 15:03:52 +0200
Message-Id: <20220919130408.21486-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
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

This patchset reworks the udl driver's modesetting code.

Patches #1 to #5 improve the connector code with various updates.

Patches #6 to #10 improve the modesetting code. Patch #7 replaces the
simple-KMS helpers with the regular atomic helpers. Patch #9 adds DRM
hot-unplugging. The driver had some unplugging support via USB functions,
the DRM side was probably not prepared yet. Patch #10 changes damage
updates to the damage iterator. This minimizes the amount of data to
send over USB.

Patches #11 to #16 add protocol constants for the various UDL display
operations.

Tested with X11, console and Weston.

Thomas Zimmermann (16):
  drm/udl: Rename struct udl_drm_connector to struct udl_connector
  drm/udl: Test pixel limit in mode-config's mode-valid function
  drm/udl: Use USB timeout constant when reading EDID
  drm/udl: Various improvements to the connector
  drm/udl: Move connector to modesetting code
  drm/udl: Remove udl_simple_display_pipe_mode_valid()
  drm/udl: Convert to atomic-modesetting helpers
  drm/udl: Simplify modesetting in CRTC's enable function
  drm/udl: Support DRM hot-unplugging
  drm/udl: Use damage iterator
  drm/udl: Move register constants to udl_proto.h
  drm/udl: Add constants for display-mode registers
  drm/udl: Add register constants for color depth
  drm/udl: Add register constants for video locks
  drm/udl: Add register constants for framebuffer scanout addresses
  drm/udl: Add constants for commands

 drivers/gpu/drm/udl/Makefile        |   2 +-
 drivers/gpu/drm/udl/udl_connector.c | 139 -------
 drivers/gpu/drm/udl/udl_connector.h |  15 -
 drivers/gpu/drm/udl/udl_drv.h       |  42 +--
 drivers/gpu/drm/udl/udl_modeset.c   | 567 ++++++++++++++++++----------
 drivers/gpu/drm/udl/udl_proto.h     |  62 +++
 drivers/gpu/drm/udl/udl_transfer.c  |   7 +-
 7 files changed, 450 insertions(+), 384 deletions(-)
 delete mode 100644 drivers/gpu/drm/udl/udl_connector.c
 delete mode 100644 drivers/gpu/drm/udl/udl_connector.h
 create mode 100644 drivers/gpu/drm/udl/udl_proto.h


base-commit: d8deedaa0fcd8192715a052a0239bee3f74a8fb1
-- 
2.37.3

