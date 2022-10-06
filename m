Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EC55F63D7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 11:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E6910E002;
	Thu,  6 Oct 2022 09:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EED10E002
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 09:53:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DEAEC2190B;
 Thu,  6 Oct 2022 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665050036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WlvlqOD6ZbIMiPpLScZYgvPIa/WMPF5c3jwUFP1Ituc=;
 b=lZJduG2KAglg3lW4hzOFZ3d52yrokTcsHx4L5foWyCWLgi9/KsllJBoVSnYP2f2tJdl0th
 rCFwRiAOnz4eACIAdB5cUBUOB6DoqWMlcUyLxlBAgkhbaWM2LLl0GKE1J1phWYwN5i7YZb
 ShErLCK/KyB56AKknKEvq4QAborqueQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665050036;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WlvlqOD6ZbIMiPpLScZYgvPIa/WMPF5c3jwUFP1Ituc=;
 b=iK01QJTeaEpEYTA9AyFml1fouMZvqMLVz72eFwRZdL2OFwRW8g3HwwUn4Xm/ii0sdsvmq4
 d9IavtNoqXjBhJCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B8BD913AC8;
 Thu,  6 Oct 2022 09:53:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id i/JOLLSlPmNnYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Oct 2022 09:53:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch
Subject: [PATCH v2 00/16] drm/udl: Better modesetting, hot-unplug, protocol
Date: Thu,  6 Oct 2022 11:53:39 +0200
Message-Id: <20221006095355.23579-1-tzimmermann@suse.de>
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

v2:
	* use FIELD_GET macros when programming scanout address (Javier)
	* improve commit messages (Javier)
	* drop empty atomic_disable plane helper

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
 drivers/gpu/drm/udl/udl_modeset.c   | 563 ++++++++++++++++++----------
 drivers/gpu/drm/udl/udl_proto.h     |  68 ++++
 drivers/gpu/drm/udl/udl_transfer.c  |   7 +-
 7 files changed, 451 insertions(+), 385 deletions(-)
 delete mode 100644 drivers/gpu/drm/udl/udl_connector.c
 delete mode 100644 drivers/gpu/drm/udl/udl_connector.h
 create mode 100644 drivers/gpu/drm/udl/udl_proto.h

-- 
2.37.3

