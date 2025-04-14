Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5F7A881E7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7950A10E536;
	Mon, 14 Apr 2025 13:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="vAZkuqJ7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C4vIW1/z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vAZkuqJ7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C4vIW1/z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BBE10E5BC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:27:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8561B21978;
 Mon, 14 Apr 2025 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744637276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XG5qFk/NLltNPetuvGXPnrMUafh+SGQXfbwHTiUyjm4=;
 b=vAZkuqJ7Z2fYHXz/68xUQEx1FcAyXiqXhv1tzLkqMf2b9YdqJsQyVvuL7iEb4IxXbEVGwY
 6p+QvV7cJHc/wFR9MF4uIPYFqu5zWGBqDKwkpwZwa4CQfclorHeplelEekXtEBMo8HB8PI
 a4vkr3RWFlHkLjsGAVrSolrVkKtRAAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744637276;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XG5qFk/NLltNPetuvGXPnrMUafh+SGQXfbwHTiUyjm4=;
 b=C4vIW1/z6liPKq2j+Brg4i4CwEtH8DknLeEfCXioqxiLtbZpL7c3lTHR5GDcB3/ZCxx/0O
 VHYoGVpB6LQNTMBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744637276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XG5qFk/NLltNPetuvGXPnrMUafh+SGQXfbwHTiUyjm4=;
 b=vAZkuqJ7Z2fYHXz/68xUQEx1FcAyXiqXhv1tzLkqMf2b9YdqJsQyVvuL7iEb4IxXbEVGwY
 6p+QvV7cJHc/wFR9MF4uIPYFqu5zWGBqDKwkpwZwa4CQfclorHeplelEekXtEBMo8HB8PI
 a4vkr3RWFlHkLjsGAVrSolrVkKtRAAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744637276;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XG5qFk/NLltNPetuvGXPnrMUafh+SGQXfbwHTiUyjm4=;
 b=C4vIW1/z6liPKq2j+Brg4i4CwEtH8DknLeEfCXioqxiLtbZpL7c3lTHR5GDcB3/ZCxx/0O
 VHYoGVpB6LQNTMBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C468136A7;
 Mon, 14 Apr 2025 13:27:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BmBOFVwN/WdGfQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Apr 2025 13:27:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/amdgpu: Avoid struct drm_gem_object.import_attach
Date: Mon, 14 Apr 2025 15:23:33 +0200
Message-ID: <20250414132449.566772-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -2.80
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

Avoid the use of struct drm_gem_object.import_attach to get the
object's dma-buf or test for an imported buffer. The import_attach
field in struct drm_gem_object is an artifact of the import process,
but should not be used otherwise.

The helper drm_gem_is_imported() tests if a GEM object's buffer
has been imported into the driver. The corresponding dma-buf is
referenced by the object itself. Both cases avoid import_attach.

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

