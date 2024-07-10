Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA73292CD62
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 10:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86ACE10E6C0;
	Wed, 10 Jul 2024 08:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ci3xtrj/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xT8iDqnm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ci3xtrj/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xT8iDqnm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2131810E6BE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 08:46:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B559821B48;
 Wed, 10 Jul 2024 08:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720601171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Evx0DvCQIJYR7ttHWjXa1vaKPdTB6rGtF99eRMq164E=;
 b=ci3xtrj/YtOce681eJxZLODy11lI3R3CQz7MTc7xqQqNUisbWh+NF8yD9vMlA8wDnCoyPh
 R4tnuU4lqOGpwf+WzX2Nobf3+JzPfd3XISbkPMgwgkbchRFIklcQaDmQ04R5BEBKmF3LIG
 /qye7la376BNKsedQT05mb10mPd0Iis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720601171;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Evx0DvCQIJYR7ttHWjXa1vaKPdTB6rGtF99eRMq164E=;
 b=xT8iDqnmQwIy/BlwPFNNC0zQQHqRgopYAlhfG8hoRlaTlmYiEd9D9bSHiXwsJ275MvjGLL
 V2A/I4ljwC334HDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720601171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Evx0DvCQIJYR7ttHWjXa1vaKPdTB6rGtF99eRMq164E=;
 b=ci3xtrj/YtOce681eJxZLODy11lI3R3CQz7MTc7xqQqNUisbWh+NF8yD9vMlA8wDnCoyPh
 R4tnuU4lqOGpwf+WzX2Nobf3+JzPfd3XISbkPMgwgkbchRFIklcQaDmQ04R5BEBKmF3LIG
 /qye7la376BNKsedQT05mb10mPd0Iis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720601171;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Evx0DvCQIJYR7ttHWjXa1vaKPdTB6rGtF99eRMq164E=;
 b=xT8iDqnmQwIy/BlwPFNNC0zQQHqRgopYAlhfG8hoRlaTlmYiEd9D9bSHiXwsJ275MvjGLL
 V2A/I4ljwC334HDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7706B1369A;
 Wed, 10 Jul 2024 08:46:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id k01ZG1NKjmYNSwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Jul 2024 08:46:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/3] drm/mgag200: Control VIDRST and BMC from CRTC
Date: Wed, 10 Jul 2024 10:42:31 +0200
Message-ID: <20240710084609.354578-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

(was: drm/mgag200: Handle VIDRST from BMC helpers)

The VIDRST pin controls CRTC synchronization with an external clock
chip, such as a BMC or TV encoder. This patchset separates the CRTC
state from the BMC state and streamlines the driver code.

v2:
- run BMC and VIDRST logic from CRTC code (Jocelyn)

Thomas Zimmermann (3):
  drm/mgag200: Only set VIDRST bits in CRTC modesetting
  drm/mgag200: Remove vidrst callbacks from struct mgag200_device_funcs
  drm/mgag200: Rename BMC vidrst names

 drivers/gpu/drm/mgag200/mgag200_bmc.c     |  9 ++-----
 drivers/gpu/drm/mgag200/mgag200_drv.h     | 31 ++++++++---------------
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |  9 +++----
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  9 +++----
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  2 --
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |  9 +++----
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  2 --
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 29 ++++++++++-----------
 8 files changed, 36 insertions(+), 64 deletions(-)

-- 
2.45.2

