Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58540A8826B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C7210E5EE;
	Mon, 14 Apr 2025 13:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="w3tcU8UJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wfxtYhi2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w3tcU8UJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wfxtYhi2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F95B10E508
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:35:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CF21F2117C;
 Mon, 14 Apr 2025 13:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744637742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zVI7PazGQt+ZdVIu3vry9aECHHBaCzbLdY40zQra/ZI=;
 b=w3tcU8UJKoA8315hAXluAnwqTu0eEdxnQgPTpTrH5l+FhaLr1OX9FzEOsiBkBe071nDlQK
 mKonfXgW9uwXhVwV76/LC98A7TFWMTCtfymFJfZVtmS+OhTk91XQ+fU5McW2q0pp2dzt2q
 wnKZfttrJGQCIERE/ifUkXUchX+D/Zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744637742;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zVI7PazGQt+ZdVIu3vry9aECHHBaCzbLdY40zQra/ZI=;
 b=wfxtYhi2Tc/b8Jp9j0HlIiNdv0y6Aye5NfL9MIIbgl7vFuYMkIS7GUXQz6tty+IeED0Sdj
 TUrycr6+laPTWgBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744637742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zVI7PazGQt+ZdVIu3vry9aECHHBaCzbLdY40zQra/ZI=;
 b=w3tcU8UJKoA8315hAXluAnwqTu0eEdxnQgPTpTrH5l+FhaLr1OX9FzEOsiBkBe071nDlQK
 mKonfXgW9uwXhVwV76/LC98A7TFWMTCtfymFJfZVtmS+OhTk91XQ+fU5McW2q0pp2dzt2q
 wnKZfttrJGQCIERE/ifUkXUchX+D/Zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744637742;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zVI7PazGQt+ZdVIu3vry9aECHHBaCzbLdY40zQra/ZI=;
 b=wfxtYhi2Tc/b8Jp9j0HlIiNdv0y6Aye5NfL9MIIbgl7vFuYMkIS7GUXQz6tty+IeED0Sdj
 TUrycr6+laPTWgBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F927136A7;
 Mon, 14 Apr 2025 13:35:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5YjKIS4P/WfQfwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Apr 2025 13:35:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: thierry.reding@gmail.com,
	mperttunen@nvidia.com,
	jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/tegra: Avoid struct drm_gem_object.import_attach
Date: Mon, 14 Apr 2025 15:31:40 +0200
Message-ID: <20250414133242.567132-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; FREEMAIL_TO(0.00)[gmail.com,nvidia.com];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_FIVE(0.00)[6];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Avoid the use of struct drm_gem_object.import_attach to get the
object's dma-buf or test for an imported buffer. The import_attach
field in struct drm_gem_object is an artifact of the import process,
but should not be used otherwise.

The helper drm_gem_is_imported() tests if a GEM object's buffer
has been imported into the driver. The corresponding dma-buf is
referenced by the object itself. Both cases avoid import_attach.

Thomas Zimmermann (2):
  drm/tegra: Test for imported buffers with drm_gem_is_imported()
  drm/tegra: Use dma_buf from GEM object instance

 drivers/gpu/drm/tegra/gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.49.0

