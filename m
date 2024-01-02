Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A4C821935
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 10:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF6E10E125;
	Tue,  2 Jan 2024 09:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F9410E09D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 09:56:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0ACAE21DFA;
 Tue,  2 Jan 2024 09:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704189366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lVT0bGqHDuC3GVb9QA5bz+T2kctIOvFICUHrJehaw9o=;
 b=y+sn94oukXFMkpPdg4DfLC13OolAFksFsR+Kx0pXcsC8CE39MsypSfd7Ve2hX3up2ObsxJ
 YM46W2xlz+u9ZB+/dgi9oWp5YsGom1zdRDnnyzOqC6cCXAhXbtBivYgF3hO0Sm30Yq5jLe
 9PKHMj/MoPwAssWeISh2rW4ZVBIzZjc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704189366;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lVT0bGqHDuC3GVb9QA5bz+T2kctIOvFICUHrJehaw9o=;
 b=TwYTfwpCKKgA9rZ5CkST706urbx5GMVxlvHVF/vCEWtLfvym4mKbJyz/RWwdg4V0lJxfmi
 IAszfEr8Eb0qvTCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704189366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lVT0bGqHDuC3GVb9QA5bz+T2kctIOvFICUHrJehaw9o=;
 b=y+sn94oukXFMkpPdg4DfLC13OolAFksFsR+Kx0pXcsC8CE39MsypSfd7Ve2hX3up2ObsxJ
 YM46W2xlz+u9ZB+/dgi9oWp5YsGom1zdRDnnyzOqC6cCXAhXbtBivYgF3hO0Sm30Yq5jLe
 9PKHMj/MoPwAssWeISh2rW4ZVBIzZjc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704189366;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lVT0bGqHDuC3GVb9QA5bz+T2kctIOvFICUHrJehaw9o=;
 b=TwYTfwpCKKgA9rZ5CkST706urbx5GMVxlvHVF/vCEWtLfvym4mKbJyz/RWwdg4V0lJxfmi
 IAszfEr8Eb0qvTCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C664913AC6;
 Tue,  2 Jan 2024 09:56:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AccDL7Xdk2WBEwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 02 Jan 2024 09:56:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	James.Bottomley@HansenPartnership.com,
	arnd@arndb.de
Subject: [PATCH v2 0/4] arch/parisc: Detect primary framebuffer from device
Date: Tue,  2 Jan 2024 10:52:32 +0100
Message-ID: <20240102095604.7276-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ****
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=y+sn94ou;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TwYTfwpC
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[7]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[gmx.de,HansenPartnership.com,arndb.de];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-0.00)[11.76%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: -0.01
X-Rspamd-Queue-Id: 0ACAE21DFA
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-parisc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On parisc, change detection of the primary framebuffer to test for
the Linux device instead of fbdev's fb_info in fb_is_primary_device().
Makes the test independent from fbdev.

This patchset is part of a larger effort to clean up the low-level
display handling. There are various functions that attempt to detect
the system's primary framebuffer device, such as in vgaarb, [1]
fbcon, [2] or fbmon. [3] This code should be unified in a single helper
that implements the test. The function fb_is_primary_device() already
does this, but requires fbdev on parisc. With the patchset applied, the
parisc implementation tests directly with the Linux device. No fbdev is
required.

Patch 1 adds the framebuffer's Linux device to the STI ROM structures,
which represents the graphics firmware. Patches 2 updates the stifb
driver to refer to the correct Linux device. The device is used in
patch 3 to change the test in fb_is_primary_device(). Patch 4 removes
the obsolete fb_info from the STI ROM structures.

A later patchset will update the interface of fb_is_primary_device() to
receive a Linux device instead of an instance of fb_info. This involves
several architectures, so it is better done in a separate patch.

[1] https://elixir.bootlin.com/linux/v6.6/source/drivers/pci/vgaarb.c#L557
[2] https://elixir.bootlin.com/linux/v6.6/source/drivers/video/fbdev/core/fbcon.c#L2943
[3] https://elixir.bootlin.com/linux/v6.6/source/drivers/video/fbdev/core/fbmon.c#L1503

v2:
	* fix crash during driver initialization (Helge)

Thomas Zimmermann (4):
  video/sticore: Store ROM device in STI struct
  fbdev/stifb: Allocate fb_info instance with framebuffer_alloc()
  arch/parisc: Detect primary video device from device instance
  video/sticore: Remove info field from STI struct

 arch/parisc/video/fbdev.c   |   2 +-
 drivers/video/fbdev/stifb.c | 111 ++++++++++++++++++------------------
 drivers/video/sticore.c     |   5 ++
 include/video/sticore.h     |   6 +-
 4 files changed, 66 insertions(+), 58 deletions(-)


base-commit: 25232eb8a9ac7fa0dac7e846a4bf7fba2b6db39a
-- 
2.43.0

