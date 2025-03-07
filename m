Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466D0A5624D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 09:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C1410E05F;
	Fri,  7 Mar 2025 08:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="wmfToBkb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sTMy7z+J";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wmfToBkb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sTMy7z+J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7135B10E05F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 08:12:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0DF5E1F79D;
 Fri,  7 Mar 2025 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741335124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0+sgG+3G3uEYwdhbvZ6+PaNtoKM4lke4dayhD0FApsA=;
 b=wmfToBkbS8HbATPAbfZ1XY6v2bQ7Lu9hYuwGvJeyw7bSjxcwZEcRrmM4kg4YIM21fRLsBX
 UH1ox2ha0ITks+/4a9LIIdXs1Yc7wlLsHDmQ+UG1E7hR/rusxZQdvHaa2qLOQxVImcBLVv
 IjtR/WAmmDqawAhr2vsQ7xTwL1RgNxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741335124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0+sgG+3G3uEYwdhbvZ6+PaNtoKM4lke4dayhD0FApsA=;
 b=sTMy7z+JD9qmI0Jt7gArP005emxglEbnbUfeTBDqWjgv1E1WraM8wfSP8CW/Ea3Waxu0tZ
 nK1Pv/HPTs8ukxCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wmfToBkb;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sTMy7z+J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741335124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0+sgG+3G3uEYwdhbvZ6+PaNtoKM4lke4dayhD0FApsA=;
 b=wmfToBkbS8HbATPAbfZ1XY6v2bQ7Lu9hYuwGvJeyw7bSjxcwZEcRrmM4kg4YIM21fRLsBX
 UH1ox2ha0ITks+/4a9LIIdXs1Yc7wlLsHDmQ+UG1E7hR/rusxZQdvHaa2qLOQxVImcBLVv
 IjtR/WAmmDqawAhr2vsQ7xTwL1RgNxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741335124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0+sgG+3G3uEYwdhbvZ6+PaNtoKM4lke4dayhD0FApsA=;
 b=sTMy7z+JD9qmI0Jt7gArP005emxglEbnbUfeTBDqWjgv1E1WraM8wfSP8CW/Ea3Waxu0tZ
 nK1Pv/HPTs8ukxCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9FC1113A22;
 Fri,  7 Mar 2025 08:12:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id dpOhJVOqymftLgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Mar 2025 08:12:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 airlied@redhat.com, sean@poorly.run, sumit.semwal@linaro.org,
 christian.koenig@amd.com, admin@kodeit.net, gargaditya08@live.com,
 jani.nikula@intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/5] drm: Provide a dedicated DMA device for PRIME import
Date: Fri,  7 Mar 2025 09:03:58 +0100
Message-ID: <20250307080836.42848-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0DF5E1F79D
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]; ARC_NA(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[15]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[ffwll.ch,redhat.com,gmail.com,linux.intel.com,kernel.org,poorly.run,linaro.org,amd.com,kodeit.net,live.com,intel.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
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

Importing dma-bufs via PRIME requires a DMA-capable hardware device.
This is not the case for USB, where DMA is performed entirely by the
USB controller instead of the USB devices.

Drivers for USB-based hardware maintain their own workarounds for this
problem. The original idea to resolve this was to provide different
PRIME helpers for such devices, but the dma-buf code internally assumes
DMA functionality as well. So that ideas is not realistic.

Let's instead turn the current workaround into a feature. Patch 1 adds a
dma_dev field to struct drm_device and makes the PRIME code use it. Patches
2 to 5 replace related driver code.

It will also be useful in other code. The exynos and mediatek drivers
already maintain a dedicated DMA device for non-PRIME code. They could
likely use dma_dev as well. GEM-DMA helpers currently allocate DMA
memory with the regular parent device. They should support the dma_dev
settings as well.

Tested with udl.

v2:
- maintain reference on dma_dev (Jani)
- improve docs (Maxime)
- update appletbdrm

Thomas Zimmermann (5):
  drm/prime: Support dedicated DMA device for dma-buf imports
  drm/appletbdrm: Set struct drm_device.dma_dev
  drm/gm12u320: Set struct drm_device.dma_dev
  drm/gud: Set struct drm_device.dma_dev
  drm/udl: Set struct drm_device.dma_dev

 drivers/gpu/drm/drm_drv.c          | 21 ++++++++++++++
 drivers/gpu/drm/drm_prime.c        |  2 +-
 drivers/gpu/drm/gud/gud_drv.c      | 33 ++++++---------------
 drivers/gpu/drm/gud/gud_internal.h |  1 -
 drivers/gpu/drm/tiny/appletbdrm.c  | 27 +++++++-----------
 drivers/gpu/drm/tiny/gm12u320.c    | 46 +++++++++---------------------
 drivers/gpu/drm/udl/udl_drv.c      | 17 -----------
 drivers/gpu/drm/udl/udl_drv.h      |  1 -
 drivers/gpu/drm/udl/udl_main.c     | 14 ++++-----
 include/drm/drm_device.h           | 41 ++++++++++++++++++++++++++
 10 files changed, 102 insertions(+), 101 deletions(-)

-- 
2.48.1

