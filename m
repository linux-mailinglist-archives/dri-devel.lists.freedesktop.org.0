Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591BD896A99
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D71B112930;
	Wed,  3 Apr 2024 09:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hHQLUcO2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KKAw8J12";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DC211292E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:31:20 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A4EB95CA9C;
 Wed,  3 Apr 2024 09:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712136677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SxtXBMaHP94nYD+gdCWaJDZUZu+vg1EPIUrdy4xO/qY=;
 b=hHQLUcO2HJp0m09BRqKFuXW4tkajzfdJB7uOw/XtOycWupyUExnU7TaejsiRKZFeFWF+Ec
 gc/aNEBXGPQ4KjNltFyoqf38eobfQ0gTWlmGMPIouasrOuMMUGVCMbg95jFQfL5JY42gcO
 1qWBm8WFVGq/rc4cYDPYLYipXzpcRSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712136677;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SxtXBMaHP94nYD+gdCWaJDZUZu+vg1EPIUrdy4xO/qY=;
 b=KKAw8J12JIH0RNy17ooGg1BDy7sGD04m/AkcFLpVWwIOYQqMz8L/RTWo/UyIYFAz7XB7yF
 pUG6Cn2Gp7zaW3CQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 54E621331E;
 Wed,  3 Apr 2024 09:31:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id cyUME+UhDWYteQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Apr 2024 09:31:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/11] drm/mgag200: Detect connector status
Date: Wed,  3 Apr 2024 11:24:37 +0200
Message-ID: <20240403093114.22163-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 5.39
X-Spam-Flag: NO
X-Spamd-Bar: +++++
X-Spamd-Result: default: False [5.39 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 MX_GOOD(-0.01)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCPT_COUNT_SEVEN(0.00)[9];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; R_DKIM_NA(2.20)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:98:from];
 RCVD_TLS_ALL(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]
X-Spam-Level: *****
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A4EB95CA9C
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

Detect the connector status by polling the DDC. Update the status at
runtime. Clean up a the driver's DDC code in the process.

Patches 1 and 2 fix long-standing problems in the DDC code.

Patches 3 to 9 refactor the DDC code. The code then keeps its data
structures internal, acquires locks automatically and it much more
readable overall.

With patches 10 and 11, mgag200 makes use of existing helpers for
reading and probing the DDC. It then correctly updates the status
and EDID at runtime.

Tested on various Matrox hardware.

Thomas Zimmermann (11):
  drm/mgag200: Set DDC timeout in milliseconds
  drm/mgag200: Bind I2C lifetime to DRM device
  drm/mgag200: Store pointer to struct mga_device in struct mga_i2c_chan
  drm/mgag200: Allocate instance of struct mga_i2c_chan dynamically
  drm/mgag200: Inline mgag200_i2c_init()
  drm/mgag200: Replace struct mga_i2c_chan with struct mgag200_ddc
  drm/mgag200: Rename mgag200_i2c.c to mgag200_ddc.c
  drm/mgag200: Rename struct i2c_algo_bit_data callbacks
  drm/mgag200: Acquire I/O-register lock in DDC code
  drm/mgag200: Use drm_connector_helper_get_modes()
  drm/mgag200: Set .detect_ctx() and enable connector polling

 drivers/gpu/drm/mgag200/Makefile          |   2 +-
 drivers/gpu/drm/mgag200/mgag200_ddc.c     | 179 ++++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_ddc.h     |  11 ++
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  19 +--
 drivers/gpu/drm/mgag200/mgag200_g200.c    |  15 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  15 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  15 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |  15 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  15 +-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  15 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |  15 +-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  15 +-
 drivers/gpu/drm/mgag200/mgag200_i2c.c     | 129 ----------------
 drivers/gpu/drm/mgag200/mgag200_mode.c    |  27 +---
 14 files changed, 274 insertions(+), 213 deletions(-)
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_ddc.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_ddc.h
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_i2c.c

-- 
2.44.0

