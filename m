Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C0EADAB27
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 10:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2038B10E2E1;
	Mon, 16 Jun 2025 08:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="lRBnRwYa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="elInvWUk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Oi8o5FE5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kyyfGkqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C6310E2E1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 08:42:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 05909211F3;
 Mon, 16 Jun 2025 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750063343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sdnwZbC4WmFoxvhyZ68HdYr1pvQI3x6TFStQjNMQ4R4=;
 b=lRBnRwYawMlRcoppx6yADktRR6ABbc+/SXSiBJrvZrOCvLlgFhqoy1w8SvsBmG9ZmBdOFv
 BE4SNwJRRDxJJyWgNFPmOuav+GOuMtiG8UNfG9TnA7e78HqTpKyhIpsbqbHjuXQemJT66L
 qEPlYaSmW89Q0GF+6itjOo5Upqlh7Nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750063343;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sdnwZbC4WmFoxvhyZ68HdYr1pvQI3x6TFStQjNMQ4R4=;
 b=elInvWUkasLhw8t3L+fgJUga++uJZ14RrelYx4BhLpQNIA79kSqbVUCKt8YYncX+OgsPbX
 iQePZPJopxt+vvAg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Oi8o5FE5;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kyyfGkqk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750063342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sdnwZbC4WmFoxvhyZ68HdYr1pvQI3x6TFStQjNMQ4R4=;
 b=Oi8o5FE5cV3vNVh+KjLvgFHQMCj0Jq2zxJoN9wEfR3lBApcbzdpl+Y56WQ79N6G9NY8/ha
 U07MX6stV7s9yuTdQaaOYlMnq+JejFOmNpP4lwEc6K7LQcZGh/bLfLa89hYnDWPro/ajw6
 riRYXVamKWZJdKE5KUi9Z8GawaY/fEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750063342;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sdnwZbC4WmFoxvhyZ68HdYr1pvQI3x6TFStQjNMQ4R4=;
 b=kyyfGkqks2d4+nDZobG6QLyvsuW1Vly7jzuDdeNNaEzu5BBEuAz6aRgk7aFtat78KM1tW7
 P+bU5QUMcT9SnFBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BDDE4139E2;
 Mon, 16 Jun 2025 08:42:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8jbHLO3YT2gwPgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Jun 2025 08:42:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arthurgrillo@riseup.net, jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/3] drm/tests: Update format-helper tests for sysfb
Date: Mon, 16 Jun 2025 10:37:03 +0200
Message-ID: <20250616083846.221396-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 05909211F3
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[riseup.net,gmail.com,redhat.com,linux.intel.com,kernel.org]; 
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[7]; TAGGED_RCPT(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:mid,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.01
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

The helpers drm_fb_blit() and drm_fb_build_fourcc_list() will be
integrated into sysfb helpers. Update the DRM format-helper tests
accordingly in patches 1 and 2.

The change to drm_fb_build_fourcc_list() is simple enough that we
can apply it here in patch 3.

v3:
- rename symbols (José)
v2:
- fix test filename (Maxime)
- fix dependencies (kernel test robot)

Thomas Zimmermann (3):
  drm/tests: Do not use drm_fb_blit() in format-helper tests
  drm/tests: Test drm_fb_build_fourcc_list() in separate test suite
  drm/format-helper: Move drm_fb_build_fourcc_list() to sysfb helpers

 drivers/gpu/drm/Kconfig.debug                 |   1 +
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
 .../gpu/drm/tests/drm_sysfb_modeset_test.c    | 168 ++++++++++++
 include/drm/drm_format_helper.h               |  13 +-
 13 files changed, 452 insertions(+), 397 deletions(-)
 create mode 100644 drivers/gpu/drm/tests/drm_sysfb_modeset_test.c

-- 
2.49.0

