Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90A6A00750
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 10:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3F010E052;
	Fri,  3 Jan 2025 09:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="OZ/6eX3n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NGLZa1Sf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nFHQGjWY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h57tt2xa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DFA10E052
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 09:56:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BDA372115E;
 Fri,  3 Jan 2025 09:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1735898185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Vex7xKbmiMw00Z6gg7me9Xn6FewnCUQLvXk+yrg9GUI=;
 b=OZ/6eX3nmM1y1nV+uAG5kgMIJjSREz5CzacnXbJW6pTv+xg3/t/MlYmrZtI0uzLzoxPSE7
 4Jt1TB4YSBzq254ZPAjjsLs/10IQWX6uTmtM/8dPINZMIjx2X9/ANsR6zkj8BHhV3RIHl3
 3NA9uVcmR/GrvVTBT4htSFeEXWYjGiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1735898185;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Vex7xKbmiMw00Z6gg7me9Xn6FewnCUQLvXk+yrg9GUI=;
 b=NGLZa1Sf/RM3CKyQZtEsQZuhHKO11xePWxZBPQGbBbqHF1t5d3kUH9vwE9rTInybhGgvjd
 btcNwfrZhzYEMnCA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nFHQGjWY;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=h57tt2xa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1735898183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Vex7xKbmiMw00Z6gg7me9Xn6FewnCUQLvXk+yrg9GUI=;
 b=nFHQGjWYE97eEQPQDx1GOTEdyEk5rzdy6UQaIHv17K2z06sS7o9XUK/02uaMV+Ices2GMD
 yNC/Za8X+30+Hdp6aAnD5rH1n9gKZJtuIipWjtGdUJxtzLPowYNPs37GX7tnwkchW3yk8a
 OlnIHVS4Emx/Jc1f+iXbpVZp1kbWW9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1735898183;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Vex7xKbmiMw00Z6gg7me9Xn6FewnCUQLvXk+yrg9GUI=;
 b=h57tt2xa2zlVwrTElkuDW+ZHZ5gc115IJrNNjFQ+auZQDZi5XQZJnBeD3tL7o27JTJARsM
 eM9xiqiNKWAKHSAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7349E134E4;
 Fri,  3 Jan 2025 09:56:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IAE7Gke0d2dCFgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 03 Jan 2025 09:56:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, dave@treblig.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/bochs: Do not put DRM device in PCI remove callback
Date: Fri,  3 Jan 2025 10:55:45 +0100
Message-ID: <20250103095615.231162-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BDA372115E
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,treblig.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,treblig.org:email,suse.de:dkim,suse.de:mid,suse.de:email,linux.dev:email,qemu.org:url];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Removing the bochs PCI device should mark the DRM device as unplugged
without removing it. Hence clear the respective call to drm_dev_put()
from bochs_pci_remove().

Fixes a double unref in devm_drm_dev_init_release(). An example error
message is shown below:

[   32.958338] BUG: KASAN: use-after-free in drm_dev_put.part.0+0x1b/0x90
[   32.958850] Write of size 4 at addr ffff888152134004 by task (udev-worker)/591
[   32.959574] CPU: 3 UID: 0 PID: 591 Comm: (udev-worker) Tainted: G            E      6.13.0-rc2-1-default+ #3417
[   32.960316] Tainted: [E]=UNSIGNED_MODULE
[   32.960637] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.3-2-gc13ff2cd-prebuilt.qemu.org 04/01/2014
[   32.961429] Call Trace:
[   32.961433]  <TASK>
[   32.961439]  dump_stack_lvl+0x68/0x90
[   32.961452]  print_address_description.constprop.0+0x88/0x330
[   32.961461]  ? preempt_count_sub+0x14/0xc0
[   32.961473]  print_report+0xe2/0x1d0
[   32.961479]  ? srso_alias_return_thunk+0x5/0xfbef5
[   32.963725]  ? __virt_addr_valid+0x143/0x320
[   32.964077]  ? srso_alias_return_thunk+0x5/0xfbef5
[   32.964463]  ? drm_dev_put.part.0+0x1b/0x90
[   32.964817]  kasan_report+0xce/0x1a0
[   32.965123]  ? drm_dev_put.part.0+0x1b/0x90
[   32.965474]  kasan_check_range+0xff/0x1c0
[   32.965806]  drm_dev_put.part.0+0x1b/0x90
[   32.966138]  release_nodes+0x84/0xc0
[   32.966447]  devres_release_all+0xd2/0x110
[   32.966788]  ? __pfx_devres_release_all+0x10/0x10
[   32.967177]  ? preempt_count_sub+0x14/0xc0
[   32.967523]  device_unbind_cleanup+0x16/0xc0
[   32.967886]  really_probe+0x1b7/0x570
[   32.968207]  __driver_probe_device+0xca/0x1b0
[   32.968568]  driver_probe_device+0x4a/0xf0
[   32.968907]  __driver_attach+0x10b/0x290
[   32.969239]  ? __pfx___driver_attach+0x10/0x10
[   32.969598]  bus_for_each_dev+0xc0/0x110
[   32.969923]  ? __pfx_bus_for_each_dev+0x10/0x10
[   32.970291]  ? bus_add_driver+0x17a/0x2b0
[   32.970622]  ? srso_alias_return_thunk+0x5/0xfbef5
[   32.971011]  bus_add_driver+0x19a/0x2b0
[   32.971335]  driver_register+0xd8/0x160
[   32.971671]  ? __pfx_bochs_pci_driver_init+0x10/0x10 [bochs]
[   32.972130]  do_one_initcall+0xba/0x390
[...]

After unplugging the DRM device, clients will close their references.
Closing the final reference will also release the DRM device.

Reported-by: Dr. David Alan Gilbert <dave@treblig.org>
Closes: https://lore.kernel.org/lkml/Z18dbfDAiFadsSdg@gallifrey/
Fixes: 04826f588682 ("drm/bochs: Allocate DRM device in struct bochs_device")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux.dev
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/bochs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 89a699370a59..c67e1f906785 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -757,7 +757,6 @@ static void bochs_pci_remove(struct pci_dev *pdev)
 
 	drm_dev_unplug(dev);
 	drm_atomic_helper_shutdown(dev);
-	drm_dev_put(dev);
 }
 
 static void bochs_pci_shutdown(struct pci_dev *pdev)
-- 
2.47.1

