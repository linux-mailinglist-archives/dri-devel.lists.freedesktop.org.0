Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721BBACE1CB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 17:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E05810E73C;
	Wed,  4 Jun 2025 15:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ArIh2WaA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sY2gzK6w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ArIh2WaA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sY2gzK6w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FDD10E755
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 15:52:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 44DB820707;
 Wed,  4 Jun 2025 15:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749052357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=H4kWjsPJbYEyzKDAN8v4B1y0fQ3CZK3wx7VTloBxL5Q=;
 b=ArIh2WaALpmckBPfH9jXXSXJhy3uju2ifXN0ZB27eH3XmCXP66z/hsoXoFWdmSc6Wwsj3Q
 Jx2tkTFq0CeN0rXNxNBTABiBHBCRaBGh7MdTiSkGPVXVjZGMoYifYozRvjwFwL5goY9o7X
 ZguugtRqgiFdX+TJgAdp9svWUq0f6NY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749052357;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=H4kWjsPJbYEyzKDAN8v4B1y0fQ3CZK3wx7VTloBxL5Q=;
 b=sY2gzK6wrXR92yK5k17zG/dzz/inmtdd1DOr4B+SgDA96Ims0afUrFdzrlmxwOUmLhgxai
 VZ2tJlz4aTGNYfBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ArIh2WaA;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sY2gzK6w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749052357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=H4kWjsPJbYEyzKDAN8v4B1y0fQ3CZK3wx7VTloBxL5Q=;
 b=ArIh2WaALpmckBPfH9jXXSXJhy3uju2ifXN0ZB27eH3XmCXP66z/hsoXoFWdmSc6Wwsj3Q
 Jx2tkTFq0CeN0rXNxNBTABiBHBCRaBGh7MdTiSkGPVXVjZGMoYifYozRvjwFwL5goY9o7X
 ZguugtRqgiFdX+TJgAdp9svWUq0f6NY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749052357;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=H4kWjsPJbYEyzKDAN8v4B1y0fQ3CZK3wx7VTloBxL5Q=;
 b=sY2gzK6wrXR92yK5k17zG/dzz/inmtdd1DOr4B+SgDA96Ims0afUrFdzrlmxwOUmLhgxai
 VZ2tJlz4aTGNYfBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B2B6613A63;
 Wed,  4 Jun 2025 15:52:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id r0NVKsRrQGgkGAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Jun 2025 15:52:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arthurgrillo@riseup.net, jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] drm/tests: Update format-helper tests for sysfb
Date: Wed,  4 Jun 2025 17:45:41 +0200
Message-ID: <20250604154844.28995-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.37 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_SHORT(-0.06)[-0.296];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[riseup.net,gmail.com,redhat.com,linux.intel.com,kernel.org]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 RCVD_COUNT_TWO(0.00)[2];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 44DB820707
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -1.37
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

The helpers drm_fb_blit() and drm_fb_build_fourcc_list() will be
integrated into sysfb helpers. Update the DRM format-helper tests
accordingly in patches 1 and 2.

The change to drm_fb_build_fourcc_list() is simple enough that we
can apply it here in patch 3.

Thomas Zimmermann (3):
  drm/tests: Do not use drm_fb_blit() in format-helper tests
  drm/tests: Test drm_fb_build_fourcc_list() in separate test suite
  drm/format-helper: Move drm_fb_build_fourcc_list() to sysfb helpers

 drivers/gpu/drm/drm_format_helper.c           | 246 +++++++----------
 drivers/gpu/drm/drm_format_internal.h         |   8 +
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |   4 +
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c     | 138 ++++++++++
 drivers/gpu/drm/sysfb/efidrm.c                |   4 +-
 drivers/gpu/drm/sysfb/ofdrm.c                 |   5 +-
 drivers/gpu/drm/sysfb/simpledrm.c             |   5 +-
 drivers/gpu/drm/sysfb/vesadrm.c               |   4 +-
 drivers/gpu/drm/tests/Makefile                |   3 +-
 .../gpu/drm/tests/drm_format_helper_test.c    | 250 ++----------------
 drivers/gpu/drm/tests/drm_sysfb_helper_test.c | 167 ++++++++++++
 include/drm/drm_format_helper.h               |  13 +-
 12 files changed, 450 insertions(+), 397 deletions(-)
 create mode 100644 drivers/gpu/drm/tests/drm_sysfb_helper_test.c

-- 
2.49.0

