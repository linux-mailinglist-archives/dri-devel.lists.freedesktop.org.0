Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943E9C85156
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD5610E3AD;
	Tue, 25 Nov 2025 13:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DEmLhryJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CF8N5+gN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0xC0HYNL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BAvExWgx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A5910E3D9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 13:06:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E5AAC22801;
 Tue, 25 Nov 2025 13:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764076001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sxdR3rVrh6wveW6JDQWCYI6rLyZ66pqvN39rkmuwDMc=;
 b=DEmLhryJkcavwhqHsOOps64DkM2US43sMEQ6DggXt56OtW1PmGNFxbEHitmBxUUo7CpB9e
 kcna+usc9dglz4sYLDY7zHNVRgR0//YL3k/jgIHGPhFgtLi/BdJ/acOt0YwxTprRHklxYR
 5PS/PSW683sL6s7z0nw6lISW2b2yyy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764076001;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sxdR3rVrh6wveW6JDQWCYI6rLyZ66pqvN39rkmuwDMc=;
 b=CF8N5+gNraQ/EIvZnNAR3GZLJAL3cJMetQw7U6xFcDxGYK+7ZifCXrdDA7Du32dWdflvCH
 XKH0TbfjRdFWQxDQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0xC0HYNL;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BAvExWgx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764076000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sxdR3rVrh6wveW6JDQWCYI6rLyZ66pqvN39rkmuwDMc=;
 b=0xC0HYNLrlQBR5fNFxyIyT91xgOCfn6tMYtHAQEmD/BIKskV/2LzO3vY4qmjU8CSLCbJ1d
 g3heZQpg77of9mFpeEcs/BChCaeoF5BRIbPMVkDX7s8L9mxAZWc1j6BCsR1pxxGjr/lvLP
 o5ywDq0Vm6PjEucLNhO5i3Y4FL5BgwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764076000;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sxdR3rVrh6wveW6JDQWCYI6rLyZ66pqvN39rkmuwDMc=;
 b=BAvExWgxlU8sWtmJQ8B3fft1o4R3+fIuG+sbSliN6uAoi8eZz6owx8ivdBqeJnUlqdgwql
 JVg1IDWu77DOHyCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6423D3EA63;
 Tue, 25 Nov 2025 13:06:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IdsOF+CpJWkDFAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Nov 2025 13:06:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, lyude@redhat.com, dakr@kernel.org, deller@gmx.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jason.wessel@windriver.com, danielt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/5] drm: Remove remaining support for kdb
Date: Tue, 25 Nov 2025 13:52:12 +0100
Message-ID: <20251125130634.1080966-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E5AAC22801
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,amd.com,redhat.com,kernel.org,gmx.de,linux.intel.com,windriver.com,chromium.org];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[19]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -3.01
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

Remove the rest of the kbd support from DRM. Driver support has been
broken for years without anyone complaining.

Kdb cannot use regular DRM mode setting, so DRM drivers have to
implement an additional hook to make it work (in theory). As outlined
by Sima in commit 9c79e0b1d096 ("drm/fb-helper: Give up on kgdb for
atomic drivers") from 2017, kdb is not compatible with DRM atomic mode
setting. Non-atomic mode setting meanwhile has become rare.

Only 3 DRM drivers implement the hooks for kdb support. Amdgpu and
nouveau use non-atomic mode setting on older devices. But both drivers
have switched to generic fbdev emulation, which isn't compatible with
kdb. Radeon still runs kdb, but it doesn't work in practice. See the
commits in this series for details

Therefore remove the remaining support for kdb from the DRM drivers
and from DRM fbdev emulation. Also remove the hooks from fbdev, as
there are no fbdev drivers with kdb support.

If we ever want to address kdb support within DRM drivers, a place to
start would be the scanout buffers used by DRM's panic screen. These
use the current display mode. They can be written and flushed without
mode setting involved.

Note: kdb over serial lines is not affected by this series and continues
to work as before.

Thomas Zimmermann (5):
  drm/amdgpu: Do not implement mode_set_base_atomic callback
  drm/nouveau: Do not implement mode_set_base_atomic callback
  drm/radeon: Do not implement mode_set_base_atomic callback
  drm/fbdev-helper: Remove drm_fb_helper_debug_enter/_leave()
  fbcon: Remove fb_debug_enter/_leave from struct fb_ops

 Documentation/process/debugging/kgdb.rst    |  28 -----
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c      |  35 ++-----
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c       |  35 ++-----
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c       |  35 ++-----
 drivers/gpu/drm/drm_fb_helper.c             | 108 --------------------
 drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  24 +----
 drivers/gpu/drm/radeon/atombios_crtc.c      |  74 ++++----------
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c |  23 ++---
 drivers/gpu/drm/radeon/radeon_mode.h        |  10 +-
 drivers/video/fbdev/core/fbcon.c            |  24 -----
 drivers/video/fbdev/core/fbcon.h            |   1 -
 include/drm/drm_fb_helper.h                 |  21 ----
 include/drm/drm_modeset_helper_vtables.h    |  23 -----
 include/linux/fb.h                          |   4 -
 14 files changed, 63 insertions(+), 382 deletions(-)


base-commit: 0a21e96e0b6840d2a4e0b45a957679eeddeb4362
-- 
2.51.1

