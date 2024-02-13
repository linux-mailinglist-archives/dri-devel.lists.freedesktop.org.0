Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D005B852B76
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 09:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC9C10E45F;
	Tue, 13 Feb 2024 08:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="o+4m7vdC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r2i4WuDH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o+4m7vdC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r2i4WuDH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D5D10E0E9;
 Tue, 13 Feb 2024 08:44:07 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 447C41FC29;
 Tue, 13 Feb 2024 08:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707813846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=vM/MI9GQVcz0kQq4kuMC8GufU8ZlfC4eQUgNWb4/vqs=;
 b=o+4m7vdCMQ1oQJGHgg9R9ZAbeqsKqs+xisXdoLzNFytGQsP5y76kF+0w3h5f26OaLKpQEG
 VWZn0LejH6A8I7IgrtSaQU3TrjYIf/zUx11LAdZbcYqmAnWlg+3+T4YsXwvEa1zBZXGOc2
 AyTd42hsBrkdTooLAVXDhr50ZwMEsIo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707813846;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=vM/MI9GQVcz0kQq4kuMC8GufU8ZlfC4eQUgNWb4/vqs=;
 b=r2i4WuDHFqcpPOtI5fXgZJOuSWIYvH5YMM0gfu8lJr6vNaOu+kFjSd+0QEfEfxLtzt+7Sa
 x8gveR1Xo1Pa8sDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707813846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=vM/MI9GQVcz0kQq4kuMC8GufU8ZlfC4eQUgNWb4/vqs=;
 b=o+4m7vdCMQ1oQJGHgg9R9ZAbeqsKqs+xisXdoLzNFytGQsP5y76kF+0w3h5f26OaLKpQEG
 VWZn0LejH6A8I7IgrtSaQU3TrjYIf/zUx11LAdZbcYqmAnWlg+3+T4YsXwvEa1zBZXGOc2
 AyTd42hsBrkdTooLAVXDhr50ZwMEsIo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707813846;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=vM/MI9GQVcz0kQq4kuMC8GufU8ZlfC4eQUgNWb4/vqs=;
 b=r2i4WuDHFqcpPOtI5fXgZJOuSWIYvH5YMM0gfu8lJr6vNaOu+kFjSd+0QEfEfxLtzt+7Sa
 x8gveR1Xo1Pa8sDg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E21DF1329E;
 Tue, 13 Feb 2024 08:44:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id lNu2NdUry2VOFwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Feb 2024 08:44:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 jani.nikula@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com,
 gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-staging@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/8] fbdev: Clean up include dependencies in header
Date: Tue, 13 Feb 2024 09:42:18 +0100
Message-ID: <20240213084403.20995-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_TWELVE(0.00)[13];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[gmx.de,redhat.com,linux.intel.com,ffwll.ch,gmail.com,linuxfoundation.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.00)[14.48%]
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

Remove unnecessary dependencies in the include statements of the
header file <linux/fb.h>. Several files throughout the kernel include
the fbdev header, so reducing dependencies positively affects other
subsystems as well. Also fix up nouveau and fbtft, which need backlight.h
in some their source files.

v2:
	* include backlight.h in fbtft (kernel test robot)

Thomas Zimmermann (8):
  drm/nouveau: Include <linux/backlight.h>
  staging/fbtft: Include <linux/backlight.h>
  fbdev: Do not include <linux/backlight.h> in header
  fbdev: Do not include <linux/fs.h> in header
  fbdev: Do not include <linux/notifier.h> in header
  fbdev: Do not include <linux/slab.h> in header
  fbdev: Clean up forward declarations in header file
  fbdev: Clean up include statements in header file

 drivers/gpu/drm/nouveau/dispnv50/disp.c |  1 +
 drivers/staging/fbtft/fb_ssd1351.c      |  2 ++
 include/linux/fb.h                      | 24 +++++++++++++-----------
 3 files changed, 16 insertions(+), 11 deletions(-)

-- 
2.43.0

