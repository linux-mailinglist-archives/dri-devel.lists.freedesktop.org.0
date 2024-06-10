Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED379023B7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 16:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E1910E0DA;
	Mon, 10 Jun 2024 14:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cIY4Xb7V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NBBFh9Yh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cIY4Xb7V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NBBFh9Yh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8375110E12F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 14:11:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 712A321AEB;
 Mon, 10 Jun 2024 14:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718028704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8XR5eUKb2RCWITl1XMAgxqVIwCyb/tvhSOkg/u51FI0=;
 b=cIY4Xb7V38FoNuMVuainV08Kbk/3N25LN+erXIsnpAy+Fyix4qK70xSi4KHImJvwQXFAPG
 QTBaZLXtessQHJ/UmRRRfLcdUMTsT246F0wQA8+UNttLB+8J6JD188Z9u9//ZiU9vfFbtl
 jW0lkFxWl9mLh0WCYJxzQSe4p6bjqlQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718028704;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8XR5eUKb2RCWITl1XMAgxqVIwCyb/tvhSOkg/u51FI0=;
 b=NBBFh9Yh7IOrdEjLTEIKoRbS6dEG6jnoINi+Q7kO4v3yk6UCW7Rv9dMSsU+fBTasAULiBs
 3qFLHFlTtLm6ZlCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718028704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8XR5eUKb2RCWITl1XMAgxqVIwCyb/tvhSOkg/u51FI0=;
 b=cIY4Xb7V38FoNuMVuainV08Kbk/3N25LN+erXIsnpAy+Fyix4qK70xSi4KHImJvwQXFAPG
 QTBaZLXtessQHJ/UmRRRfLcdUMTsT246F0wQA8+UNttLB+8J6JD188Z9u9//ZiU9vfFbtl
 jW0lkFxWl9mLh0WCYJxzQSe4p6bjqlQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718028704;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8XR5eUKb2RCWITl1XMAgxqVIwCyb/tvhSOkg/u51FI0=;
 b=NBBFh9Yh7IOrdEjLTEIKoRbS6dEG6jnoINi+Q7kO4v3yk6UCW7Rv9dMSsU+fBTasAULiBs
 3qFLHFlTtLm6ZlCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38C1713A7F;
 Mon, 10 Jun 2024 14:11:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id poCXDKAJZ2Z7QQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Jun 2024 14:11:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/3] drm/mgag200: Detect connector status
Date: Mon, 10 Jun 2024 16:06:03 +0200
Message-ID: <20240610141141.29527-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
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

Detect the connector status by polling the DDC. Update the status at
runtime. Add a dedicated BMC output to still display to the BMC while
the VGA connector is not attached.

This patchset fixes a long-standing problem where attaching the VGA
display a runtime resulted in incorrect display modes.

Tested on various Matrox hardware.

v2:
- move the DDC clean up into a separate patchset [1]
- add dedicated BMC support (Jocelyn)

[1] https://patchwork.freedesktop.org/series/133537/

Thomas Zimmermann (3):
  drm/mgag200: Consolidate VGA output
  drm/mgag200: Add BMC output
  drm/mgag200: Set .detect_ctx() and enable connector polling

 drivers/gpu/drm/mgag200/Makefile          |   3 +-
 drivers/gpu/drm/mgag200/mgag200_bmc.c     | 107 ++++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  34 ++++---
 drivers/gpu/drm/mgag200/mgag200_g200.c    |  47 +---------
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  47 +---------
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  47 +---------
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |  47 +---------
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  47 +---------
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  47 +---------
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |  47 +---------
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  47 +---------
 drivers/gpu/drm/mgag200/mgag200_vga.c     |  72 +++++++++++++++
 12 files changed, 238 insertions(+), 354 deletions(-)
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_vga.c


base-commit: 2bea08bd31298d60d416b2a6ed346bb53dd28037
-- 
2.45.2

