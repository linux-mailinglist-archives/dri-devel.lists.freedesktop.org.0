Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805419C40F2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 15:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C688A10E4D1;
	Mon, 11 Nov 2024 14:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="HNP7mWjx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XxpU9Zqb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HNP7mWjx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XxpU9Zqb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FAB10E4CF
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 14:31:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3FAB91F38E;
 Mon, 11 Nov 2024 14:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731335479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZtSNhYQRp5l2qSu/9O2ZZDBYQDxE3j+2jm6pYNufK9E=;
 b=HNP7mWjxRuY1rlTlc1Vfy1n2uaeeBLCXkUqxbqsM9RX0VusoE6izvlZN6WJE0xjSasSBPu
 /GrMbwPOcBp6LAYOe2ZaM6dU4FNchNf7yMAQjZH0Qk8r3c+Gn7HDS/Y49ggw6jp3crKrnH
 uNKCVZbavd2/+BTTTAHe/6GyYIEyOco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731335479;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZtSNhYQRp5l2qSu/9O2ZZDBYQDxE3j+2jm6pYNufK9E=;
 b=XxpU9Zqbq8hDr4TXU4J7+iE5lqplzEqdLIVzCX21V2PMdkDUW5e8HW0dAlYQKXXxc779QL
 1axiA65MrULVs/DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731335479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZtSNhYQRp5l2qSu/9O2ZZDBYQDxE3j+2jm6pYNufK9E=;
 b=HNP7mWjxRuY1rlTlc1Vfy1n2uaeeBLCXkUqxbqsM9RX0VusoE6izvlZN6WJE0xjSasSBPu
 /GrMbwPOcBp6LAYOe2ZaM6dU4FNchNf7yMAQjZH0Qk8r3c+Gn7HDS/Y49ggw6jp3crKrnH
 uNKCVZbavd2/+BTTTAHe/6GyYIEyOco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731335479;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZtSNhYQRp5l2qSu/9O2ZZDBYQDxE3j+2jm6pYNufK9E=;
 b=XxpU9Zqbq8hDr4TXU4J7+iE5lqplzEqdLIVzCX21V2PMdkDUW5e8HW0dAlYQKXXxc779QL
 1axiA65MrULVs/DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 06A8313301;
 Mon, 11 Nov 2024 14:31:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sk83ADcVMmeWaAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Nov 2024 14:31:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, p.zabel@pengutronix.de
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/5] drm/dumb-buffers: Fix and improve buffer-size calculation
Date: Mon, 11 Nov 2024 15:23:02 +0100
Message-ID: <20241111143114.631690-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_SEVEN(0.00)[8];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,pengutronix.de];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
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

Dumb-buffer pitch and size is specified by width, height, bits-per-pixel
plus various hardware-specific alignments. The calculation of these
values is inconsistent and duplicated among drivers. The results for
formats with bpp < 8 are incorrect.

This series begins to fix this. Default scanline pitch and buffer size
are now calculated with the existing 4CC helpers. The results are
provided to drivers to avoid recalculating them. The series fixes the
3 common GEM implementations for DMA, SHMEM and VRAM. Other memory
managers can later be addressed separately.

Thomas Zimmermann (5):
  drm/dumb-buffers: Sanitize output on errors
  drm/dumb-buffers: Fix size calculations and set default pitch and size
  drm/gem-dma: Use aligned default pitch and size for dumb buffers
  drm/gem-shmem: Use aligned default pitch and size for dumb buffers
  drm/gem-vram: Use default pitch and size for dumb buffers

 drivers/gpu/drm/drm_dumb_buffers.c       | 123 +++++++++++++++++------
 drivers/gpu/drm/drm_gem_dma_helper.c     |   7 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c   |  16 +--
 drivers/gpu/drm/drm_gem_vram_helper.c    |  24 ++++-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c |   2 +
 include/drm/drm_dumb_buffers.h           |  12 +++
 6 files changed, 141 insertions(+), 43 deletions(-)
 create mode 100644 include/drm/drm_dumb_buffers.h

-- 
2.47.0

