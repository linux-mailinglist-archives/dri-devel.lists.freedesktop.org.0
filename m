Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D0CACAA41
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 09:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1F610E28E;
	Mon,  2 Jun 2025 07:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="vsqb1XU9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Sos2EEun";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vsqb1XU9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Sos2EEun";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE4310E28E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 07:59:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5B7E621257;
 Mon,  2 Jun 2025 07:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748851146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eYgOuhLOmrS8XPFfIn1moRKm4FdkzK24f56NqUjcbDc=;
 b=vsqb1XU94sXY43AdLx5xRWRkAgag5KKKU5tjOqWUhgqNg0tGYJ6gLIIcfActHJGayQ7pEP
 EIWTZFC2/qBRqB49QLUrYJEBQxzw11+/IQvMSILw4lVsBDakkGSJJ10irSd49qFeQmaYHw
 ytTqBvqn4Zu2lkRsiLJr6kxcsG57+s4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748851146;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eYgOuhLOmrS8XPFfIn1moRKm4FdkzK24f56NqUjcbDc=;
 b=Sos2EEunwMsqjjQMSNJJohi5MmJaNdYQcsCTwQpuunL+vc4FiBiKELau0dVfqUXnQS0pq4
 urG4lFq+7nOzWtDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748851146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eYgOuhLOmrS8XPFfIn1moRKm4FdkzK24f56NqUjcbDc=;
 b=vsqb1XU94sXY43AdLx5xRWRkAgag5KKKU5tjOqWUhgqNg0tGYJ6gLIIcfActHJGayQ7pEP
 EIWTZFC2/qBRqB49QLUrYJEBQxzw11+/IQvMSILw4lVsBDakkGSJJ10irSd49qFeQmaYHw
 ytTqBvqn4Zu2lkRsiLJr6kxcsG57+s4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748851146;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eYgOuhLOmrS8XPFfIn1moRKm4FdkzK24f56NqUjcbDc=;
 b=Sos2EEunwMsqjjQMSNJJohi5MmJaNdYQcsCTwQpuunL+vc4FiBiKELau0dVfqUXnQS0pq4
 urG4lFq+7nOzWtDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DA99136C7;
 Mon,  2 Jun 2025 07:59:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id olvrBcpZPWhuYQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Jun 2025 07:59:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	javierm@redhat.com,
	deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] video: Make edid_info generally available in x86
Date: Mon,  2 Jun 2025 09:51:42 +0200
Message-ID: <20250602075537.137759-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[arndb.de,redhat.com,gmx.de]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

The global variable edid_info provides the system framebuffer's EDID
information, if any. Make it available on x86 without dependencies on
fbdev. DRM drivers for system framebuffers export the information to
userspace.

Besides cleaning up, this series prepares support for firmware EDID on
EFI-based systems.

Thomas Zimmermann (2):
  video: Make CONFIG_FIRMWARE_EDID generally available
  video: Make global edid_info depend on CONFIG_FIRMWARE_EDID

 arch/x86/kernel/setup.c          |  4 ++++
 drivers/gpu/drm/sysfb/efidrm.c   |  2 +-
 drivers/gpu/drm/sysfb/vesadrm.c  |  2 +-
 drivers/video/Kconfig            | 18 +++++++++++++++++-
 drivers/video/fbdev/core/Kconfig | 15 ---------------
 drivers/video/fbdev/core/fbmon.c |  3 +--
 include/video/edid.h             |  3 ++-
 7 files changed, 26 insertions(+), 21 deletions(-)

-- 
2.49.0

