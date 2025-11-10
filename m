Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1465AC479FE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 16:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B574D10E40D;
	Mon, 10 Nov 2025 15:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="FyBqNXII";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IQgr6j/B";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eUjB/tiS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T8OCU6Zq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A010010E40A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 15:46:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E67921F81C;
 Mon, 10 Nov 2025 15:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762789581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=H+gyrLQ2twDoaaLxcUfklHs12upNHsyrZM7lOdeN4zI=;
 b=FyBqNXIIXw0MVbe4HGkG1ARc49NgwTVlZ5kM4Y/6C9hOcTS+FUjAqRz4hmZvafomHtpbWJ
 ToUWNuCkwzYuG0fhBfUZasYd3EJfjukHB3CBL0cGlRQ1VW06GWNpq1oACVA6KPjXGsHHLs
 oeSGHwP2jXxmw1VBjSyFkZj6K0Mxmho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762789581;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=H+gyrLQ2twDoaaLxcUfklHs12upNHsyrZM7lOdeN4zI=;
 b=IQgr6j/Bu3qSTQVqdu67DDl7gAuDC0Aa7JoBkwxrvCE/+3FLOG8IQVEaZoLWGgv2P+DbgK
 FHtchQWd8Jnt7+Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762789580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=H+gyrLQ2twDoaaLxcUfklHs12upNHsyrZM7lOdeN4zI=;
 b=eUjB/tiSHsSetunQDNaILQYArEVwDVXf51FC/xhchCmCBULLBLmkoCiCLTjY9Np52DmR5R
 PWl+zpzduIiK4Ps5OjByi60CsbdVF0Pnqs9r+TysLIWUYFROmMEvOG0KDh0mt1LJYsMrxt
 9YRpAwsW0x5yKpz6l4pKSja7VKI2tKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762789580;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=H+gyrLQ2twDoaaLxcUfklHs12upNHsyrZM7lOdeN4zI=;
 b=T8OCU6ZqF1GJ7r7qXmKnNPukCEwh8lbko6b95lYMIm0hBFMKYSd33eWY0WEyM4cYpNR2Or
 QAoSv5q7Hscd1xAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8229014483;
 Mon, 10 Nov 2025 15:46:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kNVjHswIEmlHXQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Nov 2025 15:46:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, francesco@valla.it,
 rrameshbabu@nvidia.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/3] drm/client: Wire up sysrq for all clients and update
 drm_log
Date: Mon, 10 Nov 2025 16:44:20 +0100
Message-ID: <20251110154616.539328-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[14];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[redhat.com,valla.it,nvidia.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com,linuxfoundation.org];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

DRM's fbdev emulation has long supported SysRq+v to bring up the
framebuffer console for emergency output. Wire up sysrq for all
DRM clients and make it work with drm_log.

Patch 1 and 2 set up DRM client functionality for sysrq. The patches
adopt existing conventions from fbdev emulation, so that there's no
visible change to users. Invoke SysRq+v to bring up the in-kernel DRM
client.

Patch 3 adds restore functionality to drm_log. This enables SysRq, but
also brings back drm_log when user space releases control of the display.

Tested on amdgpu and bochs.

v2:
- fix placeholder functions
- fix grammar in commit descriptions

Thomas Zimmermann (3):
  drm/client: Pass force parameter to client restore
  drm/client: Support emergency restore via sysrq for all clients
  drm/client: log: Implement struct drm_client_funcs.restore

 drivers/gpu/drm/Makefile                   |  3 +-
 drivers/gpu/drm/clients/drm_fbdev_client.c |  6 +-
 drivers/gpu/drm/clients/drm_log.c          | 13 ++++
 drivers/gpu/drm/drm_client.c               |  1 +
 drivers/gpu/drm/drm_client_event.c         |  4 +-
 drivers/gpu/drm/drm_client_sysrq.c         | 65 ++++++++++++++++++++
 drivers/gpu/drm/drm_drv.c                  |  3 +
 drivers/gpu/drm/drm_fb_helper.c            | 69 +++-------------------
 drivers/gpu/drm/drm_file.c                 |  2 +-
 drivers/gpu/drm/drm_internal.h             | 11 ++++
 include/drm/drm_client.h                   |  8 ++-
 include/drm/drm_client_event.h             |  4 +-
 include/drm/drm_device.h                   |  8 +++
 include/drm/drm_fb_helper.h                |  8 +--
 14 files changed, 126 insertions(+), 79 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_client_sysrq.c

-- 
2.51.1

