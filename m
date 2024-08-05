Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E4D947B88
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 15:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC9510E1F7;
	Mon,  5 Aug 2024 13:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="eNSo1ZV/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D38d4mXN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eNSo1ZV/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D38d4mXN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80CF10E1EA
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 13:06:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2377821281;
 Mon,  5 Aug 2024 13:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722863184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=84h2PHG4rOtHxwW9cagb8KOF4/LcrvwdOG4Ie+DBJ8s=;
 b=eNSo1ZV/l69dNgYVIXYPSlP46uXJN9RP9RT+W7DLlYVZtpyh7AnlhJMQFdVfQwsmtQai6T
 uqeHQIkFuAG6LTRyXyWYcHzv031+PUzb9aUpV1wXXFUEcMMt7URW53BbvXsJmJmcD9VNEM
 6uRM5oya1pA5BUtqP+0csoI0YXSCF4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722863184;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=84h2PHG4rOtHxwW9cagb8KOF4/LcrvwdOG4Ie+DBJ8s=;
 b=D38d4mXNKHgdArugGAgNWy2+SrSl3XHxnuAXG/T33HxC5rk7TY8mVlazWKxTPfPxH4B7BB
 DaBYAnqhyKmuBRBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722863184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=84h2PHG4rOtHxwW9cagb8KOF4/LcrvwdOG4Ie+DBJ8s=;
 b=eNSo1ZV/l69dNgYVIXYPSlP46uXJN9RP9RT+W7DLlYVZtpyh7AnlhJMQFdVfQwsmtQai6T
 uqeHQIkFuAG6LTRyXyWYcHzv031+PUzb9aUpV1wXXFUEcMMt7URW53BbvXsJmJmcD9VNEM
 6uRM5oya1pA5BUtqP+0csoI0YXSCF4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722863184;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=84h2PHG4rOtHxwW9cagb8KOF4/LcrvwdOG4Ie+DBJ8s=;
 b=D38d4mXNKHgdArugGAgNWy2+SrSl3XHxnuAXG/T33HxC5rk7TY8mVlazWKxTPfPxH4B7BB
 DaBYAnqhyKmuBRBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D79F213ACF;
 Mon,  5 Aug 2024 13:06:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UYfMMk/OsGaiMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Aug 2024 13:06:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/5] drm/mgag200: Handle BMC in dedicated VGA output
Date: Mon,  5 Aug 2024 15:05:56 +0200
Message-ID: <20240805130622.63458-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.20 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: 0.20
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

Add a separate output for VGA connectors with BMC support. Convert
code for server models. Keep the original VGA for regular G200 models.

The VGA-BMC output either reports the connected VGA display or, if 
that is not available, the BMC. Makes the BMC connector obsolete, so 
remove it.

The benefit of the VGA-BMC connector is that is works with any
userspace. Most userspace compositors have problems configuring the
current BMC connector. The BMC connector is now gone and only a
VGA connector is present.
 
A different approach to removing the BMC connector has been tried in
[1]. The new series also picks up an idea from an older series, [2]
where BMC support is entirely transparent to the CRTC.
 
[1] https://patchwork.freedesktop.org/series/136084/
[2] https://patchwork.freedesktop.org/series/135931/

Thomas Zimmermann (5):
  drm/mgag200: Add VGA-BMC output
  drm/mgag200: vga-bmc: Transparently handle BMC
  drm/mgag200: vga-bmc: Control CRTC VIDRST flag from encoder
  drm/mgag200: vga-bmc: Control BMC scanout from encoder
  drm/mgag200: Remove BMC output

 drivers/gpu/drm/mgag200/Makefile          |   1 +
 drivers/gpu/drm/mgag200/mgag200_bmc.c     | 102 --------------
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  13 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |   6 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |   6 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |   9 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |   9 +-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |   6 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |   9 +-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |   6 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c    |   9 --
 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c | 156 ++++++++++++++++++++++
 12 files changed, 167 insertions(+), 165 deletions(-)
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c

-- 
2.46.0

