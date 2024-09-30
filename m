Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4A998A404
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C643810E455;
	Mon, 30 Sep 2024 13:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GXkNGg3T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WNPSvEW5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GXkNGg3T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WNPSvEW5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F110E89CE3;
 Mon, 30 Sep 2024 13:09:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 825DF1F450;
 Mon, 30 Sep 2024 13:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727701764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5JPFjgHzF2vGRWoPqCKZZ+OshwWJ5jymI7gOjcD9t/U=;
 b=GXkNGg3TH1XBx5Ws0JVnuJ0aVZ9evynpiKYSAvJNnwcoSM8BcDaOWVGKXpBALWH68cl04k
 ePhs5f7G1jf8EcyivGJzJvvwmUVzaPZzfzWGi8fNyNV1f6CF84noVEyddwhT33KZs9BC2U
 MAWTcWc+CP6AJBgxt1es6cO3GyGQFrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727701764;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5JPFjgHzF2vGRWoPqCKZZ+OshwWJ5jymI7gOjcD9t/U=;
 b=WNPSvEW5LVUUz8hsNfzzNSY8XitB7OgQFcyMw9yRK2+Rx2uXpx0ZPfqOuk4SX+CVPUGOna
 vJtlBozZHzdF34Dg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GXkNGg3T;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WNPSvEW5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727701764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5JPFjgHzF2vGRWoPqCKZZ+OshwWJ5jymI7gOjcD9t/U=;
 b=GXkNGg3TH1XBx5Ws0JVnuJ0aVZ9evynpiKYSAvJNnwcoSM8BcDaOWVGKXpBALWH68cl04k
 ePhs5f7G1jf8EcyivGJzJvvwmUVzaPZzfzWGi8fNyNV1f6CF84noVEyddwhT33KZs9BC2U
 MAWTcWc+CP6AJBgxt1es6cO3GyGQFrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727701764;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5JPFjgHzF2vGRWoPqCKZZ+OshwWJ5jymI7gOjcD9t/U=;
 b=WNPSvEW5LVUUz8hsNfzzNSY8XitB7OgQFcyMw9yRK2+Rx2uXpx0ZPfqOuk4SX+CVPUGOna
 vJtlBozZHzdF34Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CE2A136CB;
 Mon, 30 Sep 2024 13:09:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YsuaDQSj+mb2dQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 30 Sep 2024 13:09:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/28] drm: Remove DRM aperture helpers
Date: Mon, 30 Sep 2024 15:02:58 +0200
Message-ID: <20240930130921.689876-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 825DF1F450
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:mid, suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

DRM's aperture helpers are merely wrappers around the respective
helpers in drivers/video/. The DRM interface existed first, but was
later generalized for use with fbdev and a few other graphics-related
places in the kernel. It is time to remove the DRM wrappers and call
the video helpers directly.

No functional changes intended. This series should replace one interface
with another. Individual patches could go into the various trees and the
DRM wrappers can be removed when all driver changes have been merged.

Thomas Zimmermann (28):
  drm/amdgpu: Use video aperture helpers
  drm/arm/hdlcd: Use video aperture helpers
  drm/armada: Use video aperture helpers
  drm/ast: Use video aperture helpers
  drm/hisilicon/hibmc: Use video aperture helpers
  drm/hyperv-drm: Use video aperture helpers
  drm/i915: Use video aperture helpers
  drm/loongson: Use video aperture helpers
  drm/meson: Use video aperture helpers
  drm/mgag200: Use video aperture helpers
  drm/msm: Use video aperture helpers
  drm/nouveau: Use video aperture helpers
  drm/ofdrm: Use video aperture helpers
  drm/qxl: Use video aperture helpers
  drm/radeon: Use video aperture helpers
  drm/rockchip: Use video aperture helpers
  drm/simpledrm: Use video aperture helpers
  drm/stm: Use video aperture helpers
  drm/sun4i: Use video aperture helpers
  drm/tegra: Use video aperture helpers
  drm/bochs: Use video aperture helpers
  drm/cirrus: Use video aperture helpers
  drm/vboxvideo: Use video aperture helpers
  drm/vc4: Use video aperture helpers
  drm/virtgpu: Use video aperture helpers
  drm/vmwgfx: Use video aperture helpers
  drm/xe: Use video aperture helpers
  drm: Remove DRM aperture helpers

 Documentation/gpu/drm-internals.rst           |  12 --
 MAINTAINERS                                   |   2 -
 drivers/gpu/drm/Makefile                      |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   5 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |   4 +-
 drivers/gpu/drm/armada/armada_drv.c           |   4 +-
 drivers/gpu/drm/ast/ast_drv.c                 |   4 +-
 drivers/gpu/drm/drm_aperture.c                | 192 ------------------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |   4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c       |   4 +-
 drivers/gpu/drm/i915/i915_driver.c            |   4 +-
 drivers/gpu/drm/loongson/lsdc_drv.c           |   8 +-
 drivers/gpu/drm/meson/meson_drv.c             |   4 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c         |   4 +-
 drivers/gpu/drm/msm/msm_kms.c                 |   4 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   4 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |   4 +-
 drivers/gpu/drm/radeon/radeon_drv.c           |   5 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |   4 +-
 drivers/gpu/drm/stm/drv.c                     |   4 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   4 +-
 drivers/gpu/drm/tegra/drm.c                   |   4 +-
 drivers/gpu/drm/tiny/bochs.c                  |   4 +-
 drivers/gpu/drm/tiny/cirrus.c                 |   4 +-
 drivers/gpu/drm/tiny/ofdrm.c                  |   4 +-
 drivers/gpu/drm/tiny/simpledrm.c              |   8 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |   5 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |   4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   5 +-
 drivers/gpu/drm/xe/xe_device.c                |   4 +-
 include/drm/drm_aperture.h                    |  38 ----
 32 files changed, 62 insertions(+), 303 deletions(-)
 delete mode 100644 drivers/gpu/drm/drm_aperture.c
 delete mode 100644 include/drm/drm_aperture.h

-- 
2.46.0

