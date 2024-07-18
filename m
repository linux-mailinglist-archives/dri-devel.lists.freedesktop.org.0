Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5749D934BDF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 12:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D687110E761;
	Thu, 18 Jul 2024 10:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZOhNJbEG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XXHUM+Z2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZOhNJbEG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XXHUM+Z2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B48110E73A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 10:45:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BFF751FBB6;
 Thu, 18 Jul 2024 10:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721299554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=T96O77/ryR8qiDa8r/tLo+qZPkffPyVFF2lvnnT0fkc=;
 b=ZOhNJbEGdwikANGSGWcYgG2cLUecCe++Pqdk9t4s0en+3w8S+dTgJoy6vxVMuXA27WeTlN
 mhbokWcGSSAVseKamJu8xjdbu+PwIN1k1K6sSncfQK84fwSbnMZsLwXF3YXEcD97jhZP67
 9Jqqg4DR/WgOCUnZWmjX8CUgadKbmSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721299554;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=T96O77/ryR8qiDa8r/tLo+qZPkffPyVFF2lvnnT0fkc=;
 b=XXHUM+Z2hKWqlU3zHv6Ie4NLJ7OcZNsVbLdJbc30HkSMTxuCFKwnoV6lQBQOnI2CqFdQla
 zpbIT0OnySWemfCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721299554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=T96O77/ryR8qiDa8r/tLo+qZPkffPyVFF2lvnnT0fkc=;
 b=ZOhNJbEGdwikANGSGWcYgG2cLUecCe++Pqdk9t4s0en+3w8S+dTgJoy6vxVMuXA27WeTlN
 mhbokWcGSSAVseKamJu8xjdbu+PwIN1k1K6sSncfQK84fwSbnMZsLwXF3YXEcD97jhZP67
 9Jqqg4DR/WgOCUnZWmjX8CUgadKbmSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721299554;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=T96O77/ryR8qiDa8r/tLo+qZPkffPyVFF2lvnnT0fkc=;
 b=XXHUM+Z2hKWqlU3zHv6Ie4NLJ7OcZNsVbLdJbc30HkSMTxuCFKwnoV6lQBQOnI2CqFdQla
 zpbIT0OnySWemfCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76C9A136F7;
 Thu, 18 Jul 2024 10:45:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NmxiG2LymGbeUAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Jul 2024 10:45:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, sam@ravnborg.org,
 emil.l.velikov@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 0/7] drm/mgag200: Implement VBLANK support
Date: Thu, 18 Jul 2024 12:44:10 +0200
Message-ID: <20240718104551.575912-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,ravnborg.org,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 URIBL_BLOCKED(0.00)[patchwork.freedesktop.org:url,imap1.dmz-prg2.suse.org:helo];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[10];
 DBL_BLOCKED_OPENRESOLVER(0.00)[patchwork.freedesktop.org:url,imap1.dmz-prg2.suse.org:helo];
 TAGGED_RCPT(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.30
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

Implement support for VBLANK events in mgag200.

Patches 1 to 5 prepare mgag200's modesetting code by renaming or
adding variables for various hardware fields. This makes the code
more readable and aligns it with the programming manuals for Matrox 
hardware.

Patch 6 implements support for VBLANK events. The patch has been
reviewed before at [1]. That old patchset never found its way into
the kernel, but the VBLANK support is still useful.

Patch 7 adds support for VBLANK timestamps.

v5:
- clear all interrupts before registering IRQ (Jocelyn)
- don't read from ICLEAR (Jocelyn)

v4:
- split off the patchset from an earlier series [1]

[1] https://patchwork.freedesktop.org/series/66442/

Thomas Zimmermann (7):
  drm/mgag200: Use hexadecimal register indeces
  drm/mgag200: Align register field names with documentation
  drm/mgag200: Use adjusted mode values for CRTCs
  drm/mgag200: Add dedicated variables for blanking fields
  drm/mgag200: Add dedicted variable for <linecomp> field
  drm/mgag200: Add vblank support
  drm/mgag200: Implement struct drm_crtc_funcs.get_vblank_timestamp

 drivers/gpu/drm/mgag200/mgag200_drv.c     |  40 ++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  14 +-
 drivers/gpu/drm/mgag200/mgag200_g200.c    |   5 +
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |   5 +
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |   5 +
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |   5 +
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |   5 +
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |   5 +
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |   5 +
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |   5 +
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 167 ++++++++++++++++------
 drivers/gpu/drm/mgag200/mgag200_reg.h     |   7 +
 12 files changed, 223 insertions(+), 45 deletions(-)

-- 
2.45.2

