Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69795871916
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 10:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF88112967;
	Tue,  5 Mar 2024 09:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="lBeeAbK8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u1MMH9wn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LNEt80FI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wFTIxbPd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A71112961
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 09:09:15 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E10217666C;
 Tue,  5 Mar 2024 09:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709629754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Th/it1BW0cxTcajCDSkw5GZxs8x0WcNljdwQ9vEs7lk=;
 b=lBeeAbK8WH21FUjXt4+xWPPdaBMyQlk+8geYFgAgr6wlDdfbz2N/b8xKK6bRTfKBPj+izb
 oLpOpJUyWMPMX7+H1VeRvRYXeeCIPmFTGoCHJuE3F1rLPBX5rD3kqGnbehcUjaiHBXvz/C
 SHa5HKCsn6MDst7qeR1ABMIj3g6vMpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709629754;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Th/it1BW0cxTcajCDSkw5GZxs8x0WcNljdwQ9vEs7lk=;
 b=u1MMH9wnxcZ0wFK6jJM6z+AuBVAgahh7+0oNB/fiVE6PKpaPHXMzQ9Q9lXwJO2dEbu5X3v
 40srVuxgoTli57Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709629753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Th/it1BW0cxTcajCDSkw5GZxs8x0WcNljdwQ9vEs7lk=;
 b=LNEt80FIoHdRKHjQtXk/OyAmCQLcdDvuGPhIzjDGGQldx7c/kgi0jEErD7GL7jLJpP6mMM
 spVPIrUMCwgWFKbX8XWUoU8w+eN19VyLjANQyAotYPricrf6rCDALyHHc8d/LcsfIFTRDp
 HzLq1L8/FaL54YRxqG0KxmiwaoSfTwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709629753;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Th/it1BW0cxTcajCDSkw5GZxs8x0WcNljdwQ9vEs7lk=;
 b=wFTIxbPdteiwtr27ZfesXFwkCPaVGNcE62mfNw5etXaZeIk2VGTbJGE5phMf6vUdon7l2S
 JfPvw7ZH0x6E8nDQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8034913466;
 Tue,  5 Mar 2024 09:09:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id /8a2HTnh5mUSYgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 05 Mar 2024 09:09:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mpe@ellerman.id.au, jani.nikula@intel.com, naresh.kamboju@linaro.org,
 deller@gmx.de, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 lkft-triage@lists.linaro.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/3] arch/powerpc: Resolve backlight include dependencies
Date: Tue,  5 Mar 2024 10:00:57 +0100
Message-ID: <20240305090910.26742-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: **
X-Spamd-Bar: ++
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LNEt80FI;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wFTIxbPd
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [2.09 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[ellerman.id.au,intel.com,linaro.org,gmx.de,gmail.com,csgroup.eu,kernel.org,linux.ibm.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-1.40)[90.88%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[14]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]
X-Spam-Score: 2.09
X-Rspamd-Queue-Id: E10217666C
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

After cleaning up <linux/fb.h> in commit 11b4eedfc87d ("fbdev: Do
not include <linux/backlight.h> in header"), building with
CONFIG_PMAC_BACKLIGHT=y returns errors about missing declarations.
Patches 1 and 2 resolve the errors. Patch 1 has been reviewed at [1].
Patch 3 removes another dependency between backlight and fbdev code.

Compile tested with ppc6xx_defconfig.

v2:
	* via-pmu-backlight: fix build errors
	* powerpc: resolve dependency between fbdev and backlight

[1] https://patchwork.freedesktop.org/series/130661/

Thomas Zimmermann (3):
  fbdev/chipsfb: Include <linux/backlight.h>
  macintosh/via-pmu-backlight: Include <linux/backlight.h>
  arch/powerpc: Remove <linux/fb.h> from backlight code

 arch/powerpc/include/asm/backlight.h        |  5 ++--
 arch/powerpc/platforms/powermac/backlight.c | 26 ---------------------
 drivers/macintosh/via-pmu-backlight.c       |  1 +
 drivers/video/fbdev/chipsfb.c               |  1 +
 4 files changed, 4 insertions(+), 29 deletions(-)

-- 
2.44.0

