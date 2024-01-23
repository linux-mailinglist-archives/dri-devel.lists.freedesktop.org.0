Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6A7838E34
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 13:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD0D10E7BD;
	Tue, 23 Jan 2024 12:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F295410E7BD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 12:10:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C579D21DBD;
 Tue, 23 Jan 2024 12:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706011781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/+1BDwHJnbrAZhBlYSe1wZMRPanHDDMr02vP/6SuvQU=;
 b=B1cDTiprfahudrxoImph/fwM/kqG0wrxbI3Eep72sjZSbh1avyjXgD2VVIlHqcR5t+yytA
 +c4B8lRY4t8TzapW8BYJkk6ET80laQ6BTbf5NO4FA7gRg8pjpuvQ5bNpECr2zYaRuy39gb
 j9LEcIKhFh3j+QpaNTQUk4BvAKQThzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706011781;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/+1BDwHJnbrAZhBlYSe1wZMRPanHDDMr02vP/6SuvQU=;
 b=rSkTzEX/gwn29cDxjtf/iR//xik4AJ7BVAEeCbhubPR9IfJK6DJv+EkLWamFyG0psfYheh
 iQ7gLf5FQ0AMXVDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706011780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/+1BDwHJnbrAZhBlYSe1wZMRPanHDDMr02vP/6SuvQU=;
 b=d8BrprTY8ViLJy7Me6f/fUc9mexEb89wcEcOyCAKRaKRrRlu5AueuQ/LAGZxte4/rokRdH
 M9nzwq77i16PmyRlMdVv8ZBzFSxmfayYK8k9ISYFEJVOL2nz/5KhJeRnP5icT+touWuEM4
 YksK44+cSc7YT7UsXbr9YzPVhzv+fXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706011780;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/+1BDwHJnbrAZhBlYSe1wZMRPanHDDMr02vP/6SuvQU=;
 b=akPQxMhywd5JLeBxICmRJ9ihEhNX5OUXuedQuYvLvBMCo8+ekYORqo4eppuU7QjVKTCLrv
 teCpTH08foE+Q+Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8611813786;
 Tue, 23 Jan 2024 12:09:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Fa12H4Ssr2V7OAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 23 Jan 2024 12:09:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	chenhuacai@kernel.org
Subject: [PATCH] Revert "drivers/firmware: Move sysfb_init() from
 device_initcall to subsys_initcall_sync"
Date: Tue, 23 Jan 2024 13:09:26 +0100
Message-ID: <20240123120937.27736-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *
X-Spamd-Bar: +
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=d8BrprTY;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=akPQxMhy
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [1.49 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.00)[29.76%]
X-Spam-Score: 1.49
X-Rspamd-Queue-Id: C579D21DBD
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jaak Ristioja <jaak@ristioja.ee>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 60aebc9559492cea6a9625f514a8041717e3a2e4.

Commit 60aebc9559492cea ("drivers/firmware: Move sysfb_init() from
device_initcall to subsys_initcall_sync") messes up initialization order
of the graphics drivers and leads to blank displays on some systems. So
revert the commit.

To make the display drivers fully independent from initialization
order requires to track framebuffer memory by device and independently
from the loaded drivers. The kernel currently lacks the infrastructure
to do so.

Reported-by: Jaak Ristioja <jaak@ristioja.ee>
Closes: https://lore.kernel.org/dri-devel/ZUnNi3q3yB3zZfTl@P70.localdomain/T/#t
Reported-by: Huacai Chen <chenhuacai@loongson.cn>
Closes: https://lore.kernel.org/dri-devel/20231108024613.2898921-1-chenhuacai@loongson.cn/
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10133
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
---
 drivers/firmware/sysfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 82fcfd29bc4d2..3c197db42c9d9 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -128,4 +128,4 @@ static __init int sysfb_init(void)
 }
 
 /* must execute after PCI subsystem for EFI quirks */
-subsys_initcall_sync(sysfb_init);
+device_initcall(sysfb_init);
-- 
2.43.0

