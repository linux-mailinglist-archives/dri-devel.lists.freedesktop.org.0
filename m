Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169B7BF209B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 17:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D99010E46E;
	Mon, 20 Oct 2025 15:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="FYElAIP+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AF7FrrSE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vgE/Leg1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hp5mXvIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A0810E46E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:14:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EF00721184;
 Mon, 20 Oct 2025 15:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760973268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AclQit7R10Bu5TOfhKLZJuDDgTVtRb/9ChFhej3L314=;
 b=FYElAIP+DGnrQUbxrZq7d4lDBmBlSZ6HIDKtUmvgeExLHxuuGvoZEs5QC49bij0FlpKarf
 qbkvi+1fbv0cIgLsTUyVzsEeEVM/GT6K7/6YYelFvL0oEsGVScHq0PrHn3qN9ssvoh4JVX
 QqBbHc7f2reSGjyjZCeIxlwHr5xzDII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760973268;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AclQit7R10Bu5TOfhKLZJuDDgTVtRb/9ChFhej3L314=;
 b=AF7FrrSED/K2fENpb5hdJnMH1jYvtw//BqbHFa6tDNmz+BclVlRtS6U5bER6XdSnCzL8st
 BYQQSQORSbuQcnAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760973263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AclQit7R10Bu5TOfhKLZJuDDgTVtRb/9ChFhej3L314=;
 b=vgE/Leg1nZgNbqhroXlrCMeiMwmyn1lV+PbLzj6Qlaq3Kwklzl79Vkb7o/qWXWA3gIjcLY
 e+Dyo9lxJcPSvJn5JnjHE2+b5Gy1oSFlRAoaawTg+rPAF2rE90KtDm/xOvGmpPecB2Njrm
 DWICsqEcCACKMx8vDGo3UZ5qzoukn8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760973263;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AclQit7R10Bu5TOfhKLZJuDDgTVtRb/9ChFhej3L314=;
 b=Hp5mXvImQjHoFeulpVoSg4YfzCp/rc//DGtivmKk9ygE9H0NQETUkRFKVlpd9PG+yopxjY
 HsPweAVfP6bxPGDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AEAC013A8E;
 Mon, 20 Oct 2025 15:14:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ipd3Kc9R9mjtTgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Oct 2025 15:14:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, rrameshbabu@nvidia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/7] drm/client: Simply client-buffer interface and
 implementation
Date: Mon, 20 Oct 2025 17:04:16 +0200
Message-ID: <20251020151402.53013-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[redhat.com,nvidia.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCPT_COUNT_SEVEN(0.00)[9]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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
 drivers/gpu/drm/drm_client.c      | 192 ++++++++++++++----------------
 drivers/gpu/drm/drm_fbdev_dma.c   |   8 +-
 drivers/gpu/drm/drm_fbdev_shmem.c |   6 +-
 drivers/gpu/drm/drm_fbdev_ttm.c   |  10 +-
 include/drm/drm_client.h          |  20 +---
 6 files changed, 113 insertions(+), 133 deletions(-)

-- 
2.51.0

