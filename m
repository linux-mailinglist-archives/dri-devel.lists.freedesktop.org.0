Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B3A94A32B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 10:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7F810E45B;
	Wed,  7 Aug 2024 08:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GF6gqolE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RMLbsNjJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GF6gqolE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RMLbsNjJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4A910E460;
 Wed,  7 Aug 2024 08:45:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 979A921BFB;
 Wed,  7 Aug 2024 08:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723020342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lPcOjpVLTyJIjAJ1U93pVB3aAWvEfCZ4gdC0G1C2xgE=;
 b=GF6gqolEqc8uZfDmfHFdFSCeJK5MdLV50cXBhCsVKT14MdC+9ord/6hEQdiNCzxrnhC82H
 rXtpNL+pUowugiHMNh+qEv9xsnbNB5XscFUWiMSesNq+MjFmBX9N89E4eFXr1yQq3NoblG
 /JzzT99vqFhQVLBvgj8pwETkklNXVyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723020342;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lPcOjpVLTyJIjAJ1U93pVB3aAWvEfCZ4gdC0G1C2xgE=;
 b=RMLbsNjJpI4x5h9/5KZNf8TpvQA4Z5Gar9MT84wEREKlurtTPrnCOhKx+g6WLbGY/OBC6G
 7+aLYoYE3LSelKCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723020342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lPcOjpVLTyJIjAJ1U93pVB3aAWvEfCZ4gdC0G1C2xgE=;
 b=GF6gqolEqc8uZfDmfHFdFSCeJK5MdLV50cXBhCsVKT14MdC+9ord/6hEQdiNCzxrnhC82H
 rXtpNL+pUowugiHMNh+qEv9xsnbNB5XscFUWiMSesNq+MjFmBX9N89E4eFXr1yQq3NoblG
 /JzzT99vqFhQVLBvgj8pwETkklNXVyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723020342;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lPcOjpVLTyJIjAJ1U93pVB3aAWvEfCZ4gdC0G1C2xgE=;
 b=RMLbsNjJpI4x5h9/5KZNf8TpvQA4Z5Gar9MT84wEREKlurtTPrnCOhKx+g6WLbGY/OBC6G
 7+aLYoYE3LSelKCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3E88A13297;
 Wed,  7 Aug 2024 08:45:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UCLbDTY0s2ZmfQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Aug 2024 08:45:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/8] drm/{amdgpu,nouveau}: Remove old fbdev hooks
Date: Wed,  7 Aug 2024 10:41:32 +0200
Message-ID: <20240807084539.304014-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.20 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[14];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,redhat.com];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: 0.20
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

Thomas Zimmermann (8):
  drm/fbdev-helper: Do delayed switcheroo in lastclose helper
  drm/amdgpu: Do not set struct drm_driver.lastclose
  drm/nouveau: Do not set struct drm_driver.lastclose
  drm/nouveau: Do not set struct
    drm_mode_config_funcs.output_poll_changed
  drm/nouveau: Implement switcheroo reprobe with
    drm_client_dev_hotplug()
  drm/fbdev-helper: Remove drm_fb_helper_output_poll_changed()
  drm: Remove struct drm_driver.lastclose
  drm: Remove struct drm_mode_config_funcs.output_poll_changed

 drivers/gpu/drm/amd/amdgpu/amdgpu.h       |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c   |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c   | 17 -----------
 drivers/gpu/drm/drm_drv.c                 |  5 ++-
 drivers/gpu/drm/drm_fb_helper.c           | 37 ++++++-----------------
 drivers/gpu/drm/drm_file.c                | 35 +++++----------------
 drivers/gpu/drm/drm_internal.h            |  1 -
 drivers/gpu/drm/drm_probe_helper.c        | 10 +-----
 drivers/gpu/drm/nouveau/dispnv50/disp.c   |  1 -
 drivers/gpu/drm/nouveau/nouveau_display.c |  1 -
 drivers/gpu/drm/nouveau/nouveau_drm.c     |  1 -
 drivers/gpu/drm/nouveau/nouveau_vga.c     | 10 ++----
 drivers/gpu/drm/nouveau/nouveau_vga.h     |  1 -
 include/drm/drm_client.h                  |  7 +++--
 include/drm/drm_drv.h                     | 28 -----------------
 include/drm/drm_fb_helper.h               |  6 ----
 include/drm/drm_mode_config.h             | 16 ----------
 17 files changed, 25 insertions(+), 154 deletions(-)

-- 
2.46.0

