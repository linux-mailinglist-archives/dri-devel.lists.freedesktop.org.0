Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ED5A7F94D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 11:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9630810E20A;
	Tue,  8 Apr 2025 09:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="YWfAk01K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fHA8B0n+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YWfAk01K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fHA8B0n+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123FE10E20A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 09:22:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 955E421193;
 Tue,  8 Apr 2025 09:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744104132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eXUWYOngjVNirHR8qiPBC2izVuooBo+1CpyPJkcFs+k=;
 b=YWfAk01K2jf+aC/IAdiXNA3PkEPfucUGyzYT7T/TKT1EWF5WU9mpPjzI6Doh/HKLjc+yxR
 7DtcHtoYlpZtGB7Ln1ztnfwN6Pb1RLFoTtYzkZ2MnZ7fxq3NhfmyqbdkpyI2OTRNfDZGO6
 FAnw8ikmxSfeZzWRCnqs7MqZwxZoCYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744104132;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eXUWYOngjVNirHR8qiPBC2izVuooBo+1CpyPJkcFs+k=;
 b=fHA8B0n+CdXop8lYLCAdPFAK5HhVFd8ELirxCkxh/C+1WLCV0j8LovUjicxYNtiHWleQpO
 mFsKr0F1NvCEdhDA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YWfAk01K;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fHA8B0n+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744104132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eXUWYOngjVNirHR8qiPBC2izVuooBo+1CpyPJkcFs+k=;
 b=YWfAk01K2jf+aC/IAdiXNA3PkEPfucUGyzYT7T/TKT1EWF5WU9mpPjzI6Doh/HKLjc+yxR
 7DtcHtoYlpZtGB7Ln1ztnfwN6Pb1RLFoTtYzkZ2MnZ7fxq3NhfmyqbdkpyI2OTRNfDZGO6
 FAnw8ikmxSfeZzWRCnqs7MqZwxZoCYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744104132;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eXUWYOngjVNirHR8qiPBC2izVuooBo+1CpyPJkcFs+k=;
 b=fHA8B0n+CdXop8lYLCAdPFAK5HhVFd8ELirxCkxh/C+1WLCV0j8LovUjicxYNtiHWleQpO
 mFsKr0F1NvCEdhDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5189513691;
 Tue,  8 Apr 2025 09:22:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gnFuEsTq9Gf2YgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Apr 2025 09:22:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ardb@kernel.org, javierm@redhat.com, linux-efi@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm,efi: Export efi_mem_desc_lookup for efidrm
Date: Tue,  8 Apr 2025 11:17:03 +0200
Message-ID: <20250408091837.407401-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 955E421193
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_FIVE(0.00)[5]; DKIM_TRACE(0.00)[suse.de:+]
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

Efidrm invokes efi_mem_desc_lookup(). Export the symbol to enable
module builds of efidrm.

Thomas Zimmermann (2):
  efi: Export symbol efi_mem_desc_lookup
  drm/sysfb: efidrm: Support module builds

 drivers/firmware/efi/efi.c    | 1 +
 drivers/gpu/drm/sysfb/Kconfig | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.49.0

