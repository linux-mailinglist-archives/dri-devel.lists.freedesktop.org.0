Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D426094E892
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 10:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC64B10E0AA;
	Mon, 12 Aug 2024 08:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ToePF8Wb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FatAsAcr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ToePF8Wb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FatAsAcr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAA410E08A;
 Mon, 12 Aug 2024 08:30:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A81B7224D3;
 Mon, 12 Aug 2024 08:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eFWLvJ51hGSvQbjiZp7pZRxv6CU0uQ91PVw3FS0sW60=;
 b=ToePF8WbFkuid/kJPBtFShG2AZnP5VJpKmQwp78gD+fTisj8Vnz7PXDX9JqYUPbUkI9JWl
 KP5x/e/S0q1p2SMkTeIqM8hfoDEBGaRCg/e5md1WQfz9Ad7W9xCson3W3kQseCxanK7Shi
 pQ5U/2kK/KyytdcucUHgcYxiqffsRd0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451405;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eFWLvJ51hGSvQbjiZp7pZRxv6CU0uQ91PVw3FS0sW60=;
 b=FatAsAcr5hCjlwQJrtl61YPJvI4Siq2ckiwK9hYdY50Cq20pMpYpb2qsBTvUCECBwksnAN
 NWVXWz7CutWKc/CA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ToePF8Wb;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FatAsAcr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eFWLvJ51hGSvQbjiZp7pZRxv6CU0uQ91PVw3FS0sW60=;
 b=ToePF8WbFkuid/kJPBtFShG2AZnP5VJpKmQwp78gD+fTisj8Vnz7PXDX9JqYUPbUkI9JWl
 KP5x/e/S0q1p2SMkTeIqM8hfoDEBGaRCg/e5md1WQfz9Ad7W9xCson3W3kQseCxanK7Shi
 pQ5U/2kK/KyytdcucUHgcYxiqffsRd0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451405;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eFWLvJ51hGSvQbjiZp7pZRxv6CU0uQ91PVw3FS0sW60=;
 b=FatAsAcr5hCjlwQJrtl61YPJvI4Siq2ckiwK9hYdY50Cq20pMpYpb2qsBTvUCECBwksnAN
 NWVXWz7CutWKc/CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 51C5413A23;
 Mon, 12 Aug 2024 08:30:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uQHFEg3IuWZpHwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 08:30:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/9] drm/{amdgpu,nouveau}: Remove old fbdev hooks
Date: Mon, 12 Aug 2024 10:28:21 +0200
Message-ID: <20240812083000.337744-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -5.01
X-Rspamd-Queue-Id: A81B7224D3
X-Spamd-Result: default: False [-5.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[14]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,redhat.com];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
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

After switching all drivers' fbdev emulation to DRM client, the
old fbdev hooks are now obsolete. Only amgdpu and nouveau still use
them in a several places. Remove the hooks from the drivers and the
DRM core.

The series would ideally be merged at once via drm-misc-next.

v2:
- call vga_switcheroo_process_delayed_switch() from
  drm_lastclose() (Sima)
- documentation updates

Thomas Zimmermann (9):
  drm: Do delayed switcheroo in drm_lastclose()
  drm/amdgpu: Do not set struct drm_driver.lastclose
  drm/nouveau: Do not set struct drm_driver.lastclose
  drm/nouveau: Do not set struct
    drm_mode_config_funcs.output_poll_changed
  drm/nouveau: Implement switcheroo reprobe with
    drm_client_dev_hotplug()
  drm/fbdev-helper: Update documentation on obsolete callbacks
  drm/fbdev-helper: Remove drm_fb_helper_output_poll_changed()
  drm: Remove struct drm_driver.lastclose
  drm: Remove struct drm_mode_config_funcs.output_poll_changed

 drivers/gpu/drm/amd/amdgpu/amdgpu.h       |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c   |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c   | 17 -----------
 drivers/gpu/drm/drm_fb_helper.c           | 37 +++++------------------
 drivers/gpu/drm/drm_file.c                | 32 ++++++--------------
 drivers/gpu/drm/drm_internal.h            |  1 -
 drivers/gpu/drm/drm_probe_helper.c        | 10 +-----
 drivers/gpu/drm/nouveau/dispnv50/disp.c   |  1 -
 drivers/gpu/drm/nouveau/nouveau_display.c |  1 -
 drivers/gpu/drm/nouveau/nouveau_drm.c     |  1 -
 drivers/gpu/drm/nouveau/nouveau_vga.c     | 10 ++----
 drivers/gpu/drm/nouveau/nouveau_vga.h     |  1 -
 drivers/gpu/vga/vga_switcheroo.c          |  3 +-
 include/drm/drm_drv.h                     | 28 -----------------
 include/drm/drm_fb_helper.h               |  6 ----
 include/drm/drm_mode_config.h             | 16 ----------
 16 files changed, 21 insertions(+), 146 deletions(-)

-- 
2.46.0

