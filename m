Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E06D81A01C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 14:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7252710E58B;
	Wed, 20 Dec 2023 13:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE8910E579
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 13:46:49 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1D6E622325;
 Wed, 20 Dec 2023 13:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703080008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=V7rBKRF5U987GZ2V8rZcJdNb2y/t5gEqQqzMEkY87+0=;
 b=CvP87Lp96ZVhf93/hO3DsuljHUILOS3KNAgoxKETii+o2l5q6E3h6DCvDV5gokHO9d5Z+J
 EqN9MbnuF4V//nc8R++1ezMg/eS53MzD81wuNSB8vgfLwvJVewhno6gd8G9rO1ho6HKqqN
 dz9+40ppv71zhCHdyrRnb1sOrUNcUCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703080008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=V7rBKRF5U987GZ2V8rZcJdNb2y/t5gEqQqzMEkY87+0=;
 b=3Ak8jNhlSRr9Pbh/PwzdWin3e9M9Tbf8Z+qbFEFZ1v9j/LOZo6qEq436tAtxZgYuSux0Am
 RQLud70eryy2omBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703080007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=V7rBKRF5U987GZ2V8rZcJdNb2y/t5gEqQqzMEkY87+0=;
 b=W6ZQsU/yggrAGOPSa2X/Kds/aUT6z90Mo30fuBRW7jmbJOBHQhIKfQY0OWYdZcm8viPqpD
 lel+P0rVGiGjeb3R3IQqD9oVxmubZReaZeWcEz3s3MTaOJg1uNSzfHI1JUXC8x+jZGfqFC
 NeN3DP75uaADwHkQ+aB54ElaO9KAZls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703080007;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=V7rBKRF5U987GZ2V8rZcJdNb2y/t5gEqQqzMEkY87+0=;
 b=wTc+iQ6tLepEtqIn0nxfOKzjoh6QXPl0IjAvpJHQ7s4Ts1IwJhvJTQOvm0rNF4+exHA5n6
 IhXPl+9saIJXH+BQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id DD91513A08;
 Wed, 20 Dec 2023 13:46:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 4W3VNEbwgmWZJwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Dec 2023 13:46:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	James.Bottomley@HansenPartnership.com,
	arnd@arndb.de
Subject: [PATCH 0/4] arch/parisc: Detect primary framebuffer from device
Date: Wed, 20 Dec 2023 14:22:53 +0100
Message-ID: <20231220134639.8190-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***
X-Spamd-Bar: +++
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="W6ZQsU/y";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wTc+iQ6t
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [3.49 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[7]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[gmx.de,HansenPartnership.com,arndb.de];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-0.00)[22.46%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 3.49
X-Rspamd-Queue-Id: 1D6E622325
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
several architectures, so it better done in a separate patch.

[1] https://elixir.bootlin.com/linux/v6.6/source/drivers/pci/vgaarb.c#L557
[2] https://elixir.bootlin.com/linux/v6.6/source/drivers/video/fbdev/core/fbcon.c#L2943
[3] https://elixir.bootlin.com/linux/v6.6/source/drivers/video/fbdev/core/fbmon.c#L1503

Thomas Zimmermann (4):
  video/sticore: Store ROM device in STI struct
  fbdev/stifb: Allocate fb_info instance with framebuffer_alloc()
  arch/parisc: Detect primary video device from device instance
  video/sticore: Remove info field from STI struct

 arch/parisc/video/fbdev.c   |   2 +-
 drivers/video/fbdev/stifb.c | 109 ++++++++++++++++++------------------
 drivers/video/sticore.c     |   5 ++
 include/video/sticore.h     |   6 +-
 4 files changed, 65 insertions(+), 57 deletions(-)


base-commit: 8da6351b7194938a876184d34c4c0802e805d3cf
-- 
2.43.0

