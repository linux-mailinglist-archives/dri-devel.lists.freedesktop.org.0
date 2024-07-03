Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A29926257
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 15:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E764810E860;
	Wed,  3 Jul 2024 13:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cBEN4gt1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ij7GCBJ9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cBEN4gt1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ij7GCBJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B69E10E85D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 13:55:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D6C5D1F452;
 Wed,  3 Jul 2024 13:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720014905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=du5KH5AZTg6LT3cFyChEcCf7m3YHZju80Ty/j4phIPQ=;
 b=cBEN4gt1shnHTtPpIu2IPmOZlw8dIXZjERMf4IIevr3BaaP2mLA84rLxL3QbXAh0C58uMo
 2MkW+z38pZ9H6gbuzioa5pcLaU1JGfpBBnRB09d3Q6i22BalD+kxfLjcyDiBx1asHsoB2I
 4kd2siHNH7r/XraaD2b5d4sPCvJNPwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720014905;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=du5KH5AZTg6LT3cFyChEcCf7m3YHZju80Ty/j4phIPQ=;
 b=Ij7GCBJ9QaWToYxS0irOLVstqlTrzVQpGQzOycWAK0FP0Dp6TbUxrgVnhs4i7X1mLeo9Ut
 91/aoKy6JwjLGtCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cBEN4gt1;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ij7GCBJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720014905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=du5KH5AZTg6LT3cFyChEcCf7m3YHZju80Ty/j4phIPQ=;
 b=cBEN4gt1shnHTtPpIu2IPmOZlw8dIXZjERMf4IIevr3BaaP2mLA84rLxL3QbXAh0C58uMo
 2MkW+z38pZ9H6gbuzioa5pcLaU1JGfpBBnRB09d3Q6i22BalD+kxfLjcyDiBx1asHsoB2I
 4kd2siHNH7r/XraaD2b5d4sPCvJNPwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720014905;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=du5KH5AZTg6LT3cFyChEcCf7m3YHZju80Ty/j4phIPQ=;
 b=Ij7GCBJ9QaWToYxS0irOLVstqlTrzVQpGQzOycWAK0FP0Dp6TbUxrgVnhs4i7X1mLeo9Ut
 91/aoKy6JwjLGtCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E2A713974;
 Wed,  3 Jul 2024 13:55:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id c4xKJTlYhWZSMwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Jul 2024 13:55:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/4] drm/mgag200: Handle VIDRST from BMC helpers
Date: Wed,  3 Jul 2024 15:40:02 +0200
Message-ID: <20240703135502.29190-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D6C5D1F452
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_COUNT_TWO(0.00)[2]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_SEVEN(0.00)[8];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FROM_HAS_DN(0.00)[]; DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

The VIDRST pin controls CRTC synchronization with an external clock
chip, such as a BMC or TV encoder. This patchset separates the CRTC
state from the BMC state and streamlines the driver code.

Patch one moves the VIDRST programming logic into the CRTC modesetting
code. The status of the rsp flag bits is fully controlled by an active
BMC encoder. Without BMC, the CRTC ignores VIDRST by default.

During a modeset operation on the CRTC, the BMC has to stop scanning
out the display signal. Patch 2 integrates the logic controlling the
BMC scanout with the BMC encoder helpers.

Patches 3 and 4 then remove and rename obsolete and unused artifacts
within the mgag200 driver.

Thomas Zimmermann (4):
  drm/mgag200: Only set VIDRST bits in CRTC modesetting
  drm/mgag200: Start/stop BMC scanout in BMC encoder helpers
  drm/mgag200: Remove vidrst callbacks from struct mgag200_device_funcs
  drm/mgag200: Rename BMC vidrst names

 drivers/gpu/drm/mgag200/mgag200_bmc.c     | 50 +++++++++++++++++++----
 drivers/gpu/drm/mgag200/mgag200_drv.h     | 29 ++++---------
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |  8 +---
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  8 +---
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  2 -
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |  8 +---
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  2 -
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 24 ++++-------
 8 files changed, 62 insertions(+), 69 deletions(-)

-- 
2.45.2

