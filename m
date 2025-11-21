Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63473C79CEA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 14:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3B210E8C4;
	Fri, 21 Nov 2025 13:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="iMKPWBQ2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Abyw+g0j";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iMKPWBQ2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Abyw+g0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775A510E876
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 13:56:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 28247218EA;
 Fri, 21 Nov 2025 13:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1763733391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2fy6AJV5/LJmpRrj1RphVCyLdSqiM/Tki+XKx37wkHU=;
 b=iMKPWBQ2/YHLmQOMzgxyhZgL0qVKiRCtXOcpIhrGmp/kgyxlmA98lsYRipa9vkpslgCdGp
 KdwVujc9na0fwt4t97s6rd4OfBWKtXmh/kRfine8gwUkvhtdVbu9uNgzcGm9EhYGSdMrV1
 YEibxSNMD8K3yNpaFCBYQBYvBRpv3Ss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1763733391;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2fy6AJV5/LJmpRrj1RphVCyLdSqiM/Tki+XKx37wkHU=;
 b=Abyw+g0jyRAdyZfxtFfsshAV0j5bGUOXfi7JyQENaF5nTh7i2CQVizKVX7OXJuuSarUXYD
 zmJth7/Q/teZsWBQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iMKPWBQ2;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Abyw+g0j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1763733391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2fy6AJV5/LJmpRrj1RphVCyLdSqiM/Tki+XKx37wkHU=;
 b=iMKPWBQ2/YHLmQOMzgxyhZgL0qVKiRCtXOcpIhrGmp/kgyxlmA98lsYRipa9vkpslgCdGp
 KdwVujc9na0fwt4t97s6rd4OfBWKtXmh/kRfine8gwUkvhtdVbu9uNgzcGm9EhYGSdMrV1
 YEibxSNMD8K3yNpaFCBYQBYvBRpv3Ss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1763733391;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2fy6AJV5/LJmpRrj1RphVCyLdSqiM/Tki+XKx37wkHU=;
 b=Abyw+g0jyRAdyZfxtFfsshAV0j5bGUOXfi7JyQENaF5nTh7i2CQVizKVX7OXJuuSarUXYD
 zmJth7/Q/teZsWBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B94E83EA61;
 Fri, 21 Nov 2025 13:56:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id TzTPK45vIGkqdQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 21 Nov 2025 13:56:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ardb@kernel.org,
	javierm@redhat.com,
	arnd@arndb.de
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/6] arch,sysfb: Move screen and edid info into single place
Date: Fri, 21 Nov 2025 14:36:04 +0100
Message-ID: <20251121135624.494768-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 28247218EA
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[14];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
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

Replace screen_info and edid_info with sysfb_primary_device of type
struct sysfb_display_info. Update all users.

Sysfb DRM drivers currently fetch the global edid_info directly, when
they should get that information together with the screen_info from their
device. Wrapping screen_info and edid_info in sysfb_primary_display and
passing this to drivers enables this.

Replacing both with sysfb_primary_display has been motivate by the EFI
stub. EFI wants to transfer EDID via config table in a single entry.
Using struct sysfb_display_info this will become easily possible. Hence
accept some churn in architecture code for the long-term improvements.

Patches 1 and 2 reduce the exposure of screen_info in EFI-related code.

Patch 3 adds struct sysfb_display_info.

Patch 4 replaces scren_info with sysfb_primary_display. This results in
several changes throught the kernel, but is really just a refactoring.

Patch 5 updates sysfb to transfer sysfb_primary_display to the related
drivers.

Patch 6 moves edid_info into sysfb_primary_display. This resolves some
drivers' reference to the global edid_info, but also makes the EDID data
available on non-x86 architectures.

The short-term benefit of this series is in patches 5 and 6. With
sysfb_primary_display in place a follow-up series will improve EFI support
for EDID as outlined in the series at [1] and [2].

[1] https://lore.kernel.org/dri-devel/20251015160816.525825-1-tzimmermann@suse.de/
[2] https://lore.kernel.org/linux-efi/20251119123011.1187249-5-ardb+git@google.com/

Thomas Zimmermann (6):
  efi: earlycon: Reduce number of references to global screen_info
  efi: sysfb_efi: Reduce number of references to global screen_info
  sysfb: Add struct sysfb_display_info
  sysfb: Replace screen_info with sysfb_primary_display
  sysfb: Pass sysfb_primary_display to devices
  sysfb: Move edid_info into sysfb_primary_display

 arch/arm64/kernel/image-vars.h                |  2 +-
 arch/loongarch/kernel/efi.c                   | 11 +--
 arch/loongarch/kernel/image-vars.h            |  2 +-
 arch/riscv/kernel/image-vars.h                |  2 +-
 arch/x86/kernel/kexec-bzimage64.c             |  4 +-
 arch/x86/kernel/setup.c                       | 16 ++--
 arch/x86/video/video-common.c                 |  4 +-
 drivers/firmware/efi/earlycon.c               | 42 +++++-----
 drivers/firmware/efi/efi-init.c               | 14 ++--
 drivers/firmware/efi/libstub/efi-stub-entry.c | 18 +++--
 drivers/firmware/efi/sysfb_efi.c              | 81 ++++++++++---------
 drivers/firmware/sysfb.c                      | 13 +--
 drivers/firmware/sysfb_simplefb.c             |  2 +-
 drivers/gpu/drm/sysfb/efidrm.c                | 14 ++--
 drivers/gpu/drm/sysfb/vesadrm.c               | 14 ++--
 drivers/hv/vmbus_drv.c                        |  6 +-
 drivers/pci/vgaarb.c                          |  4 +-
 drivers/video/Kconfig                         |  1 -
 drivers/video/fbdev/core/fbmon.c              |  8 +-
 drivers/video/fbdev/efifb.c                   | 10 ++-
 drivers/video/fbdev/vesafb.c                  | 10 ++-
 drivers/video/fbdev/vga16fb.c                 |  8 +-
 drivers/video/screen_info_pci.c               |  5 +-
 include/linux/screen_info.h                   |  2 -
 include/linux/sysfb.h                         | 23 ++++--
 include/video/edid.h                          |  4 -
 26 files changed, 177 insertions(+), 143 deletions(-)


base-commit: 57e807d4454add8b60e8807ad1cf812141f34cdb
-- 
2.51.1

