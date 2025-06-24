Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B820AE671D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 15:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDD310E5BD;
	Tue, 24 Jun 2025 13:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1WovXrx6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hcveDnqE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1WovXrx6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hcveDnqE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586BA10E5BB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 13:51:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1B10C1F46E;
 Tue, 24 Jun 2025 13:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750773110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oQQv5SKftafQDp93BKFKqx3Knbyd8+l+43ItvVQJEH8=;
 b=1WovXrx6UqQo6zQcTf8U7Bu/rWjeSinKFSUf1NPEDGTUQceqnLv16kiIJhBW1SPMlhmTV8
 CttmqkoQkbBlCEDYgeb59GaTmVlMZoRjdW+B80riomQeLVa6UowWTiBMXFLTpS7Q2hW7sm
 zy0dFhDkBuS4/FSdzRFDdWHc4QG5kRI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750773110;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oQQv5SKftafQDp93BKFKqx3Knbyd8+l+43ItvVQJEH8=;
 b=hcveDnqE/tmOpeJFISbFw72dzXR8c8HmEOap5owJHNIaa3Z9BWhHMFc5NfSG7Hr3uKgjGs
 xA7KCky0GNofSHDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750773110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oQQv5SKftafQDp93BKFKqx3Knbyd8+l+43ItvVQJEH8=;
 b=1WovXrx6UqQo6zQcTf8U7Bu/rWjeSinKFSUf1NPEDGTUQceqnLv16kiIJhBW1SPMlhmTV8
 CttmqkoQkbBlCEDYgeb59GaTmVlMZoRjdW+B80riomQeLVa6UowWTiBMXFLTpS7Q2hW7sm
 zy0dFhDkBuS4/FSdzRFDdWHc4QG5kRI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750773110;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oQQv5SKftafQDp93BKFKqx3Knbyd8+l+43ItvVQJEH8=;
 b=hcveDnqE/tmOpeJFISbFw72dzXR8c8HmEOap5owJHNIaa3Z9BWhHMFc5NfSG7Hr3uKgjGs
 xA7KCky0GNofSHDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7038113751;
 Tue, 24 Jun 2025 13:51:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id e9f6GXWtWmjFcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Jun 2025 13:51:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, sven@kernel.org, alyssa@rosenzweig.io,
 neal@gompa.dev, deller@gmx.de, support.opensource@diasemi.com,
 duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/15] backlight: Do not include <linux/fb.h> in header file
Date: Tue, 24 Jun 2025 15:45:40 +0200
Message-ID: <20250624134858.1736090-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.982]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[]; RCPT_COUNT_TWELVE(0.00)[25];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,gmx.de,diasemi.com,skole.hr];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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

Remove the final dependencies on fbdev from the backlight subsystem.
This is really just the include of <linux/fb.h> in <linux/backlight.h>,
but it has some fallout in other code.

Patches 1 to 14 fix all the implicit includes that come from fb.h
throughout the kernel. It's all trivial, but touches various drivers.
Maintainers are in CC. Patch 15 fixes the backlight header.

With the series applied the backlight subsystem should be free from
fbdev dependencies.

v2:
- fix jornada720, rave-sp and rt4831 (kernel test robot)

Thomas Zimmermann (15):
  platform/x86: dell-uart-backlight: Use blacklight power constant
  drm/panel: panel-samsung-s6e63m0: Include <linux/of.h>
  drm/panel: panel-samsung-s6e88a0-ams427ap24: Include <linux/of.h>
  drm/panel: panel-summit: Include <linux/of.h>
  fbcon: Add necessary include statements and forward declarations
  backlight: Include <linux/of.h>
  backlight: apple_dwi_bl: Include <linux/mod_devicetable.h>
  backlight: as3711_bl: Include <linux/of.h>
  backlight: da9052_bl: Include <linux/mod_devicetable.h>
  backlight: jornada720: Include <linux/io.h>
  backlight: ktd2801: Include <linux/mod_devicetable.h>
  backlight: led_bl: Include <linux/of.h>
  backlight: rave-sp: Include <linux/of.h> and <linux/mod_devicetable.h>
  backlight: rt4831: Include <linux/mod_devicetable.h>
  backlight: Do not include <linux/fb.h> in header file

 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c            | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 1 +
 drivers/gpu/drm/panel/panel-summit.c                     | 1 +
 drivers/platform/x86/dell/dell-uart-backlight.c          | 2 +-
 drivers/video/backlight/apple_dwi_bl.c                   | 1 +
 drivers/video/backlight/as3711_bl.c                      | 1 +
 drivers/video/backlight/backlight.c                      | 1 +
 drivers/video/backlight/da9052_bl.c                      | 1 +
 drivers/video/backlight/jornada720_bl.c                  | 1 +
 drivers/video/backlight/ktd2801-backlight.c              | 1 +
 drivers/video/backlight/led_bl.c                         | 1 +
 drivers/video/backlight/rave-sp-backlight.c              | 2 ++
 drivers/video/backlight/rt4831-backlight.c               | 1 +
 include/linux/backlight.h                                | 1 -
 include/linux/fbcon.h                                    | 7 +++++++
 15 files changed, 21 insertions(+), 2 deletions(-)

-- 
2.50.0

