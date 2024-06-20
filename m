Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D685C910901
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0456110EA5C;
	Thu, 20 Jun 2024 14:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="JNn/C/30";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Huhv+lV4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JNn/C/30";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Huhv+lV4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BB110EA5C;
 Thu, 20 Jun 2024 14:52:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A17E1F8B4;
 Thu, 20 Jun 2024 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718895163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WNaSpdhbYg9hsBJU8pJsh/Xr22Gn1wKMc8x4m1MlUE0=;
 b=JNn/C/30FWFqc9QBKd3Je7KMIB8G4UXme9rr+kULoc8ZRAxaouAKtsGhj1VPqSve8vEmB0
 hb+yKx/RPJ36FiA+RUWuFNpsLXvKmq7zgxurANKlpVXh29MkVanZvQtrPoXHcSVWHwozTD
 eLIxGhbiaPt8Oo1SnwcQjzex9Ymc3iQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718895163;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WNaSpdhbYg9hsBJU8pJsh/Xr22Gn1wKMc8x4m1MlUE0=;
 b=Huhv+lV4IKZoVwblcFZAuNwXaNrja1JlSrXB/1G0LFCrxwinp7DpisdnoZ+SGJj7iEzztA
 p4T16fgb+92+QKBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="JNn/C/30";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Huhv+lV4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718895163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WNaSpdhbYg9hsBJU8pJsh/Xr22Gn1wKMc8x4m1MlUE0=;
 b=JNn/C/30FWFqc9QBKd3Je7KMIB8G4UXme9rr+kULoc8ZRAxaouAKtsGhj1VPqSve8vEmB0
 hb+yKx/RPJ36FiA+RUWuFNpsLXvKmq7zgxurANKlpVXh29MkVanZvQtrPoXHcSVWHwozTD
 eLIxGhbiaPt8Oo1SnwcQjzex9Ymc3iQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718895163;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WNaSpdhbYg9hsBJU8pJsh/Xr22Gn1wKMc8x4m1MlUE0=;
 b=Huhv+lV4IKZoVwblcFZAuNwXaNrja1JlSrXB/1G0LFCrxwinp7DpisdnoZ+SGJj7iEzztA
 p4T16fgb+92+QKBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 336411369F;
 Thu, 20 Jun 2024 14:52:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FMk+CztCdGZ+aQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Jun 2024 14:52:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, felix.kuehling@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [RFC PATCH 0/2] drm/amdgpu: Convert to ttm_bo_vmap()
Date: Thu, 20 Jun 2024 16:44:39 +0200
Message-ID: <20240620145238.25295-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.95 / 50.00]; BAYES_HAM(-2.94)[99.76%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_TRACE(0.00)[suse.de:+]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 8A17E1F8B4
X-Spam-Flag: NO
X-Spam-Score: -4.95
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

Convert amdgpu to use ttm_bo_vmap() instead of ttm_bo_kmap(). The
latter is deprecated. Passing ttm_bo_vmap()'s locking validation 
requires to remove the implicit unmap from the BO release path.

Smoke-tested with an Radeon RX 460.

There's similar patchset for xe at [1], which requires additional
changes.

[1] https://lore.kernel.org/dri-devel/20240614133556.11378-1-tzimmermann@suse.de/

Thomas Zimmermann (2):
  drm/amdgpu: Unmap BO memory before calling amdgpu_bo_unref()
  drm/amdgpu: Convert to ttm_bo_vmap() et al

 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 25 ++++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  4 +++-
 2 files changed, 19 insertions(+), 10 deletions(-)

-- 
2.45.2

