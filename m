Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BE9A46807
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 18:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756B210E97E;
	Wed, 26 Feb 2025 17:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="TIKTG6rB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RGL5rSH6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TIKTG6rB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RGL5rSH6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C2E10E979
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 17:28:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D5E751F38A;
 Wed, 26 Feb 2025 17:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740590892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lvC5IpKODLo71rXUnjpRnRd+CihegwFzeeqZY5LTXQ0=;
 b=TIKTG6rBXtvl9F6VhGAPlaQtY1sybTanqtELxhHDFmuq46cV2v2Il5Hl5RVLzWL957tIGl
 i4ISFtVOdkEovVP8x5LSI8JBUQQCEO8aSc+DzWy98e9c8vLGyjG8TlhgfyUXTnMS6ALDLb
 GUNILH67uHKkNzEGZBJNH14QsxSzAF8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740590892;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lvC5IpKODLo71rXUnjpRnRd+CihegwFzeeqZY5LTXQ0=;
 b=RGL5rSH6AfSWVchwmOXweMSvmXfrazD3iL+Go3ajIY4GnYPEzTiG99ALLUYFv5+HaQ/HMt
 2E6ldyC4ydfF0MBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TIKTG6rB;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RGL5rSH6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740590892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lvC5IpKODLo71rXUnjpRnRd+CihegwFzeeqZY5LTXQ0=;
 b=TIKTG6rBXtvl9F6VhGAPlaQtY1sybTanqtELxhHDFmuq46cV2v2Il5Hl5RVLzWL957tIGl
 i4ISFtVOdkEovVP8x5LSI8JBUQQCEO8aSc+DzWy98e9c8vLGyjG8TlhgfyUXTnMS6ALDLb
 GUNILH67uHKkNzEGZBJNH14QsxSzAF8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740590892;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lvC5IpKODLo71rXUnjpRnRd+CihegwFzeeqZY5LTXQ0=;
 b=RGL5rSH6AfSWVchwmOXweMSvmXfrazD3iL+Go3ajIY4GnYPEzTiG99ALLUYFv5+HaQ/HMt
 2E6ldyC4ydfF0MBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8CD5113A53;
 Wed, 26 Feb 2025 17:28:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hu0QISxPv2cWBAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 17:28:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/10] drm: Hide import_attach from GEM code and helpers
Date: Wed, 26 Feb 2025 18:03:03 +0100
Message-ID: <20250226172457.217725-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D5E751F38A
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.993]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,redhat.com,gmail.com,linux.intel.com,kernel.org,linaro.org,amd.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Do not use struct drm_gem_object.import_attach unnecessarily. The
field is set by the PRIME import helpers. GEM and other helpers use
it for testing for imported dma-bufs and retrieving the respective
dma-buf instance.

Replace all tests for import_attach with the new GEM helper function
drm_gem_is_imported(). The helper avoids import_attach in favor of
testing the imported dma-buf's object against the provided GEM object.

Also replace references to import_attach.dmabuf. The imported dma-buf
is also available in the GEM object's dma_buf field.

This series cleans up the GEM core and helpers. Drivers also use
import_attach and should later be updated as well.

There's a TODO item for making import_attach entirely optional. This
series is a first step towards this goal.

Thomas Zimmermann (10):
  drm/gem: Test for imported GEM buffers with helper
  drm/gem-dma: Test for imported buffers with drm_gem_is_imported()
  drm/gem-dma: Use dma_buf from GEM object instance
  drm/gem-shmem: Test for imported buffers with drm_gem_is_imported()
  drm/gem-shmem: Use dma_buf from GEM object instance
  drm/gem-framebuffer: Test for imported buffers with
    drm_gem_is_imported()
  drm/gem-framebuffer: Use dma_buf from GEM object instance
  drm/fb-dma-helper: Test for imported buffers with
    drm_gem_is_imported()
  drm/mipi-dbi: Test for imported buffers with drm_gem_is_imported()
  drm/prime: Use dma_buf from GEM object instance

 drivers/gpu/drm/drm_fb_dma_helper.c          |  2 +-
 drivers/gpu/drm/drm_gem.c                    |  4 +--
 drivers/gpu/drm/drm_gem_dma_helper.c         |  4 +--
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 12 +++-----
 drivers/gpu/drm/drm_gem_shmem_helper.c       | 30 ++++++++++----------
 drivers/gpu/drm/drm_mipi_dbi.c               |  2 +-
 drivers/gpu/drm/drm_prime.c                  |  8 +-----
 include/drm/drm_gem.h                        | 14 +++++++++
 include/drm/drm_gem_shmem_helper.h           |  2 +-
 9 files changed, 41 insertions(+), 37 deletions(-)

-- 
2.48.1

