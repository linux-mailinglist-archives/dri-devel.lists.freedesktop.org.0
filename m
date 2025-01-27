Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE8FA1D710
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 14:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFD910E518;
	Mon, 27 Jan 2025 13:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="2EtO39jv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3uS7xLaq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2EtO39jv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3uS7xLaq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DA810E53A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 13:44:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2383C1F38F;
 Mon, 27 Jan 2025 13:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737985471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GblkuLUpfO9/0e++OB5tz4bfioZoUEee+FJox1oNoEw=;
 b=2EtO39jvT6Lx32f4TkQXAvNI1J16hTwo6v+xebCLR0cqD1HJvJmZVRj/NfLG6f7sLGZ7tx
 uuijJL59Fvl/D71peApvUtySZD+0pQ23AfKLSw+EFUvs9oSfYuhH5bAUve8sW/Ou52pjdm
 P3d/6e3qKOl8ss9JBOopCMhvS90esfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737985471;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GblkuLUpfO9/0e++OB5tz4bfioZoUEee+FJox1oNoEw=;
 b=3uS7xLaqBndleOs5tVIEk2W3d1GZbE7peZJrIF1qQ2uPAaFJfmImEK4vsK7ZOvaK+2qnR3
 R0H9a58Bw0lE4nDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2EtO39jv;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3uS7xLaq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737985471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GblkuLUpfO9/0e++OB5tz4bfioZoUEee+FJox1oNoEw=;
 b=2EtO39jvT6Lx32f4TkQXAvNI1J16hTwo6v+xebCLR0cqD1HJvJmZVRj/NfLG6f7sLGZ7tx
 uuijJL59Fvl/D71peApvUtySZD+0pQ23AfKLSw+EFUvs9oSfYuhH5bAUve8sW/Ou52pjdm
 P3d/6e3qKOl8ss9JBOopCMhvS90esfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737985471;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GblkuLUpfO9/0e++OB5tz4bfioZoUEee+FJox1oNoEw=;
 b=3uS7xLaqBndleOs5tVIEk2W3d1GZbE7peZJrIF1qQ2uPAaFJfmImEK4vsK7ZOvaK+2qnR3
 R0H9a58Bw0lE4nDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE99D137C0;
 Mon, 27 Jan 2025 13:44:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 82cEOb6Nl2fqIQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Jan 2025 13:44:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org
Subject: [PATCH] drm/ast: astdp: Fix timeout for enabling video signal
Date: Mon, 27 Jan 2025 14:44:14 +0100
Message-ID: <20250127134423.84266-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2383C1F38F
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; ARC_NA(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCPT_COUNT_FIVE(0.00)[5];
 RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

The ASTDP transmitter sometimes takes up to second for enabling the
video signal, while the timeout is only 200 msec. This results in a
kernel error message. Increase the timeout to 1 second. An example
of the error message is shown below.

[  697.084433] ------------[ cut here ]------------
[  697.091115] ast 0000:02:00.0: [drm] drm_WARN_ON(!__ast_dp_wait_enable(ast, enabled))
[  697.091233] WARNING: CPU: 1 PID: 160 at drivers/gpu/drm/ast/ast_dp.c:232 ast_dp_set_enable+0x123/0x140 [ast]
[...]
[  697.272469] RIP: 0010:ast_dp_set_enable+0x123/0x140 [ast]
[...]
[  697.415283] Call Trace:
[  697.420727]  <TASK>
[  697.425908]  ? show_trace_log_lvl+0x196/0x2c0
[  697.433304]  ? show_trace_log_lvl+0x196/0x2c0
[  697.440693]  ? drm_atomic_helper_commit_modeset_enables+0x30a/0x470
[  697.450115]  ? ast_dp_set_enable+0x123/0x140 [ast]
[  697.458059]  ? __warn.cold+0xaf/0xca
[  697.464713]  ? ast_dp_set_enable+0x123/0x140 [ast]
[  697.472633]  ? report_bug+0x134/0x1d0
[  697.479544]  ? handle_bug+0x58/0x90
[  697.486127]  ? exc_invalid_op+0x13/0x40
[  697.492975]  ? asm_exc_invalid_op+0x16/0x20
[  697.500224]  ? preempt_count_sub+0x14/0xc0
[  697.507473]  ? ast_dp_set_enable+0x123/0x140 [ast]
[  697.515377]  ? ast_dp_set_enable+0x123/0x140 [ast]
[  697.523227]  drm_atomic_helper_commit_modeset_enables+0x30a/0x470
[  697.532388]  drm_atomic_helper_commit_tail+0x58/0x90
[  697.540400]  ast_mode_config_helper_atomic_commit_tail+0x30/0x40 [ast]
[  697.550009]  commit_tail+0xfe/0x1d0
[  697.556547]  drm_atomic_helper_commit+0x198/0x1c0

This is a cosmetical problem. Enabling the video signal still works
even with the error message. The problem has always been present, but
only recent versions of the ast driver warn about missing the timeout.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 4e29cc7c5c67 ("drm/ast: astdp: Replace ast_dp_set_on_off()")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.13+
---
 drivers/gpu/drm/ast/ast_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 30aad5c0112a1..2d7482a65f62a 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -201,7 +201,7 @@ static bool __ast_dp_wait_enable(struct ast_device *ast, bool enabled)
 	if (enabled)
 		vgacrdf_test |= AST_IO_VGACRDF_DP_VIDEO_ENABLE;
 
-	for (i = 0; i < 200; ++i) {
+	for (i = 0; i < 1000; ++i) {
 		if (i)
 			mdelay(1);
 		vgacrdf = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xdf,
-- 
2.48.1

