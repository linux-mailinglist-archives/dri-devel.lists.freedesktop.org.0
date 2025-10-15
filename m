Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2F5BDF8E9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4E610E281;
	Wed, 15 Oct 2025 16:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="YTSBFCuf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z0S9t8sA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YTSBFCuf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z0S9t8sA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4EB10E281
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:08:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9D8F221165;
 Wed, 15 Oct 2025 16:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760544501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2/5SIJg2lKiYJKsot2Y2Vsd3jpOTGCpf7EYx2c3YM60=;
 b=YTSBFCuf+LUZJjQc5K0xa3wf/xsQgV8+drXYDsL8h66AaaGzRMKc9MCDzoxIBn+UaDhsnp
 cp0bItPTnGeLTrhdvdTdQHMgFetkviXOofF4FSVOKz6u31vOCMJS0MUfDHwJAsrehz6yuP
 IIAchYB0D17fLZil8BEkSrtpSWYYieE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760544501;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2/5SIJg2lKiYJKsot2Y2Vsd3jpOTGCpf7EYx2c3YM60=;
 b=z0S9t8sAx5ziXrHUgHFiIZ9Xang3WiyLPfjFahzKPH8yMXa0nS8Boc5IINlbHB1x5IU0wD
 rpmDNalRiDIijRCQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YTSBFCuf;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=z0S9t8sA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760544501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2/5SIJg2lKiYJKsot2Y2Vsd3jpOTGCpf7EYx2c3YM60=;
 b=YTSBFCuf+LUZJjQc5K0xa3wf/xsQgV8+drXYDsL8h66AaaGzRMKc9MCDzoxIBn+UaDhsnp
 cp0bItPTnGeLTrhdvdTdQHMgFetkviXOofF4FSVOKz6u31vOCMJS0MUfDHwJAsrehz6yuP
 IIAchYB0D17fLZil8BEkSrtpSWYYieE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760544501;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2/5SIJg2lKiYJKsot2Y2Vsd3jpOTGCpf7EYx2c3YM60=;
 b=z0S9t8sAx5ziXrHUgHFiIZ9Xang3WiyLPfjFahzKPH8yMXa0nS8Boc5IINlbHB1x5IU0wD
 rpmDNalRiDIijRCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 688AA13A42;
 Wed, 15 Oct 2025 16:08:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qxVVGPXG72inaQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Oct 2025 16:08:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ardb@kernel.org,
	jonathan@marek.ca,
	javierm@redhat.com
Cc: linux-efi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/5] efi: x86: Provide EDID from GOP device
Date: Wed, 15 Oct 2025 17:56:29 +0200
Message-ID: <20251015160816.525825-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 9D8F221165
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[7];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
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

Add support for EFI_EDID_ACTIVE_PROTOCOL and EFI_EDID_DISCOVERED_PROTOCOL
on x86. Refactor the GOP helpers for EDID support, then retrieve the EDID
into x86 boot_params.

Later boot code copies the EDID from the boot parameters into the global
variable edid_info. Graphics drivers, such as efidrm, can pick up the
information from there. In the case of efidrm, it provides the EDID to
user-space compositors, which use it for improved QoS on the display
output. Similar functionality is already available on old VESA systems
with vesadrm.

Tested on x86 EFI systems.

Another patch is required to provide EDID on non-x86 systems via the
generic EFI stub. The implementation can directly build upon this
series.

Thomas Zimmermann (5):
  efi: Fix trailing whitespace in header file
  efi/libstub: gop: Find GOP handle instead of GOP data
  efi/libstub: gop: Initialize screen_info in helper function
  efi/libstub: gop: Add support for reading EDID
  efi/libstub: x86: Store EDID in boot_params

 drivers/firmware/efi/libstub/efi-stub.c |   2 +-
 drivers/firmware/efi/libstub/efistub.h  |  31 +++++-
 drivers/firmware/efi/libstub/gop.c      | 137 +++++++++++++++---------
 drivers/firmware/efi/libstub/x86-stub.c |   3 +-
 include/linux/efi.h                     |   4 +-
 5 files changed, 120 insertions(+), 57 deletions(-)

-- 
2.51.0

