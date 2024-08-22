Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C647895B526
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 14:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDAB10E947;
	Thu, 22 Aug 2024 12:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="o+oo57LU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tFI7hPIQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o+oo57LU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tFI7hPIQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2743910E8B0;
 Thu, 22 Aug 2024 12:39:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B8869201C3;
 Thu, 22 Aug 2024 12:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724330349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=8pprcqBs6+If6UUIh8s+asxFJer04n/NrqzVHgtgM34=;
 b=o+oo57LUYw692dTpF+ELAQ/f6tHsDnQqiWIDnzEo+tuHdjNqVXgF5zrBMFoZ1aoe3T7eRy
 11bQSwtvEJ+LFzrR5t6Sphik0TGUkMi9g4jhM5gHcQNIczUOvF5NvSSbm55v/14LFejxNd
 ZDDZFWZThhwIVR7GqZf927KvPw93dzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724330349;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=8pprcqBs6+If6UUIh8s+asxFJer04n/NrqzVHgtgM34=;
 b=tFI7hPIQAVX+7cDrPqp6DKqCzi/SVGePhWyCJ30HHxKa8E0tXH/bZ+qrVwCqA+Gfd3WUeN
 nOQO01jnRfp3NVCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724330349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=8pprcqBs6+If6UUIh8s+asxFJer04n/NrqzVHgtgM34=;
 b=o+oo57LUYw692dTpF+ELAQ/f6tHsDnQqiWIDnzEo+tuHdjNqVXgF5zrBMFoZ1aoe3T7eRy
 11bQSwtvEJ+LFzrR5t6Sphik0TGUkMi9g4jhM5gHcQNIczUOvF5NvSSbm55v/14LFejxNd
 ZDDZFWZThhwIVR7GqZf927KvPw93dzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724330349;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=8pprcqBs6+If6UUIh8s+asxFJer04n/NrqzVHgtgM34=;
 b=tFI7hPIQAVX+7cDrPqp6DKqCzi/SVGePhWyCJ30HHxKa8E0tXH/bZ+qrVwCqA+Gfd3WUeN
 nOQO01jnRfp3NVCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 571B1139D3;
 Thu, 22 Aug 2024 12:39:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BFUOFG0xx2aAPQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 22 Aug 2024 12:39:09 +0000
Date: Thu, 22 Aug 2024 14:39:07 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <20240822123907.GA234335@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 MISSING_XM_UA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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

Hi Dave, Sima,

this is the weekly PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2024-08-22:
Short summary of fixes pull:

nouveau:
- firmware: use dma non-coherent allocator
The following changes since commit fd45cc614b8acca5bb435ba37fe9b3f9a17fab84:

  drm/rockchip: inno-hdmi: Fix infoframe upload (2024-08-15 12:31:47 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-08-22

for you to fetch changes up to 9b340aeb26d50e9a9ec99599e2a39b035fac978e:

  nouveau/firmware: use dma non-coherent allocator (2024-08-16 03:42:24 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

nouveau:
- firmware: use dma non-coherent allocator

----------------------------------------------------------------
Dave Airlie (1):
      nouveau/firmware: use dma non-coherent allocator

 drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 9 ++++++---
 drivers/gpu/drm/nouveau/nvkm/falcon/fw.c     | 6 ++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
