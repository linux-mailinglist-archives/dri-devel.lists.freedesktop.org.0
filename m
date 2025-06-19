Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9798CAE056B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 14:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3336C10E109;
	Thu, 19 Jun 2025 12:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="eHLS/Xpb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T9lxjRgC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eHLS/Xpb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T9lxjRgC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0294210E109
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 12:20:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C520F1F397;
 Thu, 19 Jun 2025 12:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750335615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QVEIIOIJXtiEQ/3g9nfb6CKyT0PlAzOgAUC+buNw/xk=;
 b=eHLS/XpbZQp/VPE8etA8MSGwriLw12KwyNaW4D6YNtpcZZreVbzeW9sQ9bS4hkdR+79XK9
 P994JC2SSqw8Z9FAsYmJ9CbEiiHjtslEV6hpi8LMcTJeRWNvTJBthE3Fdcwhc/FySR5Vc0
 sKV4ChWJQhb1Xvndb2PmRGCU0KlIr5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750335615;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QVEIIOIJXtiEQ/3g9nfb6CKyT0PlAzOgAUC+buNw/xk=;
 b=T9lxjRgCeaDpYckSAe7bU8TlPHQzUHBTtm9SWOGWJoB+fAPDaQYu0P7kQE6ITGXVUM6dl2
 F3e9r3Bf3Jmd6xBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750335615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QVEIIOIJXtiEQ/3g9nfb6CKyT0PlAzOgAUC+buNw/xk=;
 b=eHLS/XpbZQp/VPE8etA8MSGwriLw12KwyNaW4D6YNtpcZZreVbzeW9sQ9bS4hkdR+79XK9
 P994JC2SSqw8Z9FAsYmJ9CbEiiHjtslEV6hpi8LMcTJeRWNvTJBthE3Fdcwhc/FySR5Vc0
 sKV4ChWJQhb1Xvndb2PmRGCU0KlIr5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750335615;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QVEIIOIJXtiEQ/3g9nfb6CKyT0PlAzOgAUC+buNw/xk=;
 b=T9lxjRgCeaDpYckSAe7bU8TlPHQzUHBTtm9SWOGWJoB+fAPDaQYu0P7kQE6ITGXVUM6dl2
 F3e9r3Bf3Jmd6xBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7CAF8136CC;
 Thu, 19 Jun 2025 12:20:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fywIHX8AVGigegAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 19 Jun 2025 12:20:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sumit.semwal@linaro.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/amd: Avoid using import_attach directly
Date: Thu, 19 Jun 2025 14:15:45 +0200
Message-ID: <20250619121635.105329-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.998];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
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

The field import_attach of struct drm_gem_object is often only
required by PRIME code. In other places, replace its use with
clearer alternatives.

Thomas Zimmermann (2):
  drm/amdgpu: Test for imported buffers with drm_gem_is_imported()
  drm/amdgpu: Use dma_buf from GEM object instance

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |  5 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 14 ++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  6 +++---
 6 files changed, 15 insertions(+), 18 deletions(-)

-- 
2.49.0

