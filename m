Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C1AC0D6B0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB6810E45F;
	Mon, 27 Oct 2025 12:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="pGc9jCzX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I20c53Th";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RsPo9pfs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mpezUYXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1884610E463
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:11:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0145F1F385;
 Mon, 27 Oct 2025 12:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761567052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3z0c545mtTrHiFsqkxwFFtfc6hhwfU1aRYWrbnzVlZQ=;
 b=pGc9jCzXhjvtpQA/ttdFvzu+wpZQR4BZB66uBhNDEj1VJ2sCyBBbC4n6zRlpV6HDN+IhI5
 Em0ryyVqGug/7ir44URbEBHmNA3YNP89iaWfo7j2K3ep6VVfqPZ5smFsEDTDSVWCD4t6ji
 /oDu54UlNtPdfOg9nMyv/Q8Z1VE7Cw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761567052;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3z0c545mtTrHiFsqkxwFFtfc6hhwfU1aRYWrbnzVlZQ=;
 b=I20c53Th9gHdMwGA1LRQN+lXfEzhL7YdgrDOsfzeqkoBV/9hADh2vGcjAetOPLQmFXvBe4
 MmouiB1EH2ITOBCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RsPo9pfs;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mpezUYXa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761567051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3z0c545mtTrHiFsqkxwFFtfc6hhwfU1aRYWrbnzVlZQ=;
 b=RsPo9pfswxG0vRn6L5wYgzhGanbSFI1KiReWtpIh2lIMhdrzRSLrhpZG+GO9m/rWqtReQ+
 N0OytYMyEU0Bpmh1+ZLE5x3zQtyRyDQCsznRl3GdHDtReccjU+bLvFLSU3Z3G2rK0dQPYR
 jfy5cd9zjNu7gNbIMClEjE1mIUBCUoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761567051;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3z0c545mtTrHiFsqkxwFFtfc6hhwfU1aRYWrbnzVlZQ=;
 b=mpezUYXawfI92mZueVoPg2QPZPwUvMwloliFt+Vyf14380kTA7MM46V4EbePT38i10kYlF
 r/F4P0BilrnLLfDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B176113693;
 Mon, 27 Oct 2025 12:10:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id W8/eKUph/2gDAwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Oct 2025 12:10:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, rrameshbabu@nvidia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, francesco@valla.it,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/7] drm/client: Simply client-buffer interface and
 implementation
Date: Mon, 27 Oct 2025 13:09:11 +0100
Message-ID: <20251027121042.143588-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0145F1F385
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,nvidia.com,linux.intel.com,kernel.org,valla.it,gmail.com];
 MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9];
 R_RATELIMIT(0.00)[to_ip_from(RLo585esf9b7txaosbn5shab9z)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
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

Streamline the client-buffer code and remove the drm_client_framebuffer_
functions. Makes the code easier to work with.

Also prepares for importing non-dumb-buffer objects. Most of the in-
kernel clients will use dumb-buffer allocation. In the case of the
per-driver fbdev_probe code, the client buffer can also wrap an object
that comes from a different memory region; for example gma500's stolen
memory area. This functionality is required to move forward with the
various per-driver implementations of fbdev_probe within the overall
DRM-client framework.

Tested with efidrm and virtio-gpu on Virt I/O hardware.

v2:
- fix possible NULL-pointer deref in delete
- avoid dependency on KMS helpers

Thomas Zimmermann (7):
  drm/client: Remove pitch from struct drm_client_buffer
  drm/client: Move dumb-buffer handling to
    drm_client_framebuffer_create()
  drm/client: Inline drm_client_buffer_addfb() and _rmfb()
  drm/client: Deprecate struct drm_client_buffer.gem
  drm/client: Remove drm_client_framebuffer_delete()
  drm/client: Create client buffers with drm_client_buffer_create_dumb()
  drm/client: Flush client buffers with drm_client_buffer_sync()

 drivers/gpu/drm/clients/drm_log.c |  10 +-
 drivers/gpu/drm/drm_client.c      | 193 ++++++++++++++----------------
 drivers/gpu/drm/drm_fbdev_dma.c   |   8 +-
 drivers/gpu/drm/drm_fbdev_shmem.c |   6 +-
 drivers/gpu/drm/drm_fbdev_ttm.c   |  10 +-
 include/drm/drm_client.h          |  20 +---
 6 files changed, 114 insertions(+), 133 deletions(-)


base-commit: c03916cb446b6eefe91538599775bb54bf98238c
-- 
2.51.1

