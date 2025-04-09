Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 565C9A82080
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 10:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAA510E817;
	Wed,  9 Apr 2025 08:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nlfBUSG3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NLabZZVR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nlfBUSG3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NLabZZVR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D239010E309
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 08:50:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 696031F388;
 Wed,  9 Apr 2025 08:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744188620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7en74yqqu6EgXvKDH4Cr3eIpGr/Ua10bBCzvml+apbY=;
 b=nlfBUSG3TrPxv80tKEraFsrnYkMfBhnSfEk+MOg4fO+AIsvEgx9d8X3TAa/sxQv2rV3mlf
 +K4J/Jlus1y0vzRmAyOXRaQdusEulkzDkkNe8bD5+t5xUAaWE6w0uwU++Zej70KNS8dDcd
 Jxfj8hMg60qz+gEAA4XZKTIHOBHmviU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744188620;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7en74yqqu6EgXvKDH4Cr3eIpGr/Ua10bBCzvml+apbY=;
 b=NLabZZVRnQhFyFEdMGVg4CplIhCbbkf/bNM8qxbf70jlyY8Ei0KivkihGTtic2z/XS2xOh
 8RjeEZKUgNqsyBBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744188620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7en74yqqu6EgXvKDH4Cr3eIpGr/Ua10bBCzvml+apbY=;
 b=nlfBUSG3TrPxv80tKEraFsrnYkMfBhnSfEk+MOg4fO+AIsvEgx9d8X3TAa/sxQv2rV3mlf
 +K4J/Jlus1y0vzRmAyOXRaQdusEulkzDkkNe8bD5+t5xUAaWE6w0uwU++Zej70KNS8dDcd
 Jxfj8hMg60qz+gEAA4XZKTIHOBHmviU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744188620;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7en74yqqu6EgXvKDH4Cr3eIpGr/Ua10bBCzvml+apbY=;
 b=NLabZZVRnQhFyFEdMGVg4CplIhCbbkf/bNM8qxbf70jlyY8Ei0KivkihGTtic2z/XS2xOh
 8RjeEZKUgNqsyBBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CC6713691;
 Wed,  9 Apr 2025 08:50:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jdhaDcw09mdgZQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Apr 2025 08:50:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] drm/sysfb: Share framebuffer validation helpers
Date: Wed,  9 Apr 2025 10:45:35 +0200
Message-ID: <20250409084729.236719-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO
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

Drivers for system framebuffers validate the provided values against
limits. Share most of the driver code in the sysfb helper library and
update drivers.

Thomas Zimmermann (3):
  drm/sysfb: Split source file
  drm/sysfb: Share helpers for integer validation
  drm/sysfb: Share helpers for screen_info validation

 drivers/gpu/drm/sysfb/Makefile                |   4 +
 drivers/gpu/drm/sysfb/drm_sysfb.c             |  35 +++++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |  48 +++++++
 ...drm_sysfb_helper.c => drm_sysfb_modeset.c} |   4 -
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c | 107 +++++++++++++++
 drivers/gpu/drm/sysfb/efidrm.c                | 126 ++----------------
 drivers/gpu/drm/sysfb/ofdrm.c                 |  12 +-
 drivers/gpu/drm/sysfb/simpledrm.c             |  14 +-
 drivers/gpu/drm/sysfb/vesadrm.c               | 126 ++----------------
 9 files changed, 216 insertions(+), 260 deletions(-)
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb.c
 rename drivers/gpu/drm/sysfb/{drm_sysfb_helper.c => drm_sysfb_modeset.c} (98%)
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c

-- 
2.49.0

