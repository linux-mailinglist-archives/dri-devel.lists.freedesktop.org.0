Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E3EAD8A29
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 13:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925B510E9A8;
	Fri, 13 Jun 2025 11:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="WXWzRGt/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UeCIv7Hw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WXWzRGt/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UeCIv7Hw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C56C10E993
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 11:17:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A8E8D1F394;
 Fri, 13 Jun 2025 11:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749813437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6WQ2YLqaVVS5rKqPq6RXqsqhtMm6/2YAsGJv04b++po=;
 b=WXWzRGt/imEPU1+9aaLYET+V6wiY8GYZKLavIqdtsOgDjRvW0bQRgHNmmArSUWXjpOIrZP
 d4bijG3fxCSQ8ch817nvK9s0tfEQnCkBXM+0TP0RskKpdtp0zpdSONCD47ypc87wixM9Ni
 34P8QJq50xmn0hps70iovasR0hpV4zo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749813437;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6WQ2YLqaVVS5rKqPq6RXqsqhtMm6/2YAsGJv04b++po=;
 b=UeCIv7HwkjolXQ38N7bu0Rry+Ybj8XSo6QCRYSvpA34a6s+oOLPlI0MsnpWjRREjG+6CoW
 rd6zL76joiqoeACA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="WXWzRGt/";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UeCIv7Hw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749813437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6WQ2YLqaVVS5rKqPq6RXqsqhtMm6/2YAsGJv04b++po=;
 b=WXWzRGt/imEPU1+9aaLYET+V6wiY8GYZKLavIqdtsOgDjRvW0bQRgHNmmArSUWXjpOIrZP
 d4bijG3fxCSQ8ch817nvK9s0tfEQnCkBXM+0TP0RskKpdtp0zpdSONCD47ypc87wixM9Ni
 34P8QJq50xmn0hps70iovasR0hpV4zo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749813437;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6WQ2YLqaVVS5rKqPq6RXqsqhtMm6/2YAsGJv04b++po=;
 b=UeCIv7HwkjolXQ38N7bu0Rry+Ybj8XSo6QCRYSvpA34a6s+oOLPlI0MsnpWjRREjG+6CoW
 rd6zL76joiqoeACA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D6DA137FE;
 Fri, 13 Jun 2025 11:17:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id W7URHb0ITGhmWwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Jun 2025 11:17:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/format-helper: Update tests after BT601 changes
Date: Fri, 13 Jun 2025 13:16:46 +0200
Message-ID: <20250613111711.136993-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A8E8D1F394
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
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

Commit a979a54165c2 ("drm/format-helper: Normalize BT.601 factors
to 256") improved rounding precicion of the BT601 calculation, which
impacts the results of soem of the format-helper tests. Adapt the test
to the new results.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: a979a54165c2 ("drm/format-helper: Normalize BT.601 factors to 256")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 35cd3405d045..5aa8543ceb29 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -279,9 +279,9 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch = TEST_USE_DEFAULT_PITCH,
 			.expected = {
 				0xFF, 0x00,
-				0x4C, 0x99,
-				0x19, 0x66,
-				0xE5, 0xB2,
+				0x4C, 0x95,
+				0x1C, 0x69,
+				0xE2, 0xB2,
 			},
 		},
 		.rgb332_result = {
@@ -430,9 +430,9 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 		.gray8_result = {
 			.dst_pitch = 5,
 			.expected = {
-				0x3C, 0x33, 0xC4, 0x00, 0x00,
-				0xBB, 0x3C, 0x33, 0x00, 0x00,
-				0x34, 0xBB, 0x3C, 0x00, 0x00,
+				0x3D, 0x32, 0xC1, 0x00, 0x00,
+				0xBA, 0x3D, 0x32, 0x00, 0x00,
+				0x34, 0xBA, 0x3D, 0x00, 0x00,
 			},
 		},
 		.rgb332_result = {
-- 
2.49.0

