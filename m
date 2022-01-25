Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA15E49AF83
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A63010EF0E;
	Tue, 25 Jan 2022 09:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711A410EEF6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 09:12:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 163EA1F380;
 Tue, 25 Jan 2022 09:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643101945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+6tDQedEPoIZ47E47S0YoJ/2jrnf2VvXD6snoZLZYwk=;
 b=2RgemZqP2FbjG8zANtgScV5Yu4PNLoPi/CU3cDgiyLpPjNh0KtjOHynfA59JdXUek9/ZaD
 VZcztRGNt0Si2KG1hfgHth61QwW8X0Htm51qgdXaycoHlnR+E1LzBj8qRQ1hpW2hMNvMef
 xLD5k+6S03JbcfXRIKcz4h82OM42vjI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643101945;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+6tDQedEPoIZ47E47S0YoJ/2jrnf2VvXD6snoZLZYwk=;
 b=EnnZGwL+X8hTDiqalJY7osvGZDLBGEqgbQOMMgnACLblNH+diAj0SoYbJKcWaRpgM19LOd
 pZ3lksHkriQtLJCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C726E13DA2;
 Tue, 25 Jan 2022 09:12:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WdiVL/i+72GGQAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Jan 2022 09:12:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: zackr@vmware.com, javierm@redhat.com, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, hdegoede@redhat.com
Subject: [PATCH 0/5] sysfb: Fix memory-region management
Date: Tue, 25 Jan 2022 10:12:17 +0100
Message-Id: <20220125091222.21457-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Request framebuffer memory in simpledrm and simplefb. Do a hot-unplug
operation when removing fbdev firmware drivers.

After being unloaded by a hardware driver, simplefb leaves behind the
firmware framebuffer's platform device. This prevents other drivers
from acquiring the memory as reported at [1].

Patch 1 changes the removal code of remove_conflicting_framebuffers()
to remove the underlying device and the rsp memory region.

Patches 2 to 4 update sysfb and its drivers. The sysfb code does no
longer mark the framebuffer memory with IORESOURCE_BUSY. Instead, the
device drivers acquire the memory when they probe the device.

Patch 5 adds a todo item to acquire memory regions in all DRM drivers.

Tested with simpledrm and simplefb.

[1] https://lore.kernel.org/dri-devel/20220117180359.18114-1-zack@kde.org/

v2:
	* fix possible NULL deref in simpledrm (Jocelyn)
	* various style fixes (Javier)

Javier Martinez Canillas (1):
  drivers/firmware: Don't mark as busy the simple-framebuffer IO
    resource

Thomas Zimmermann (4):
  fbdev: Hot-unplug firmware fb devices on forced removal
  drm/simpledrm: Request memory region in driver
  fbdev/simplefb: Request memory region in driver
  drm: Add TODO item for requesting memory regions

 Documentation/gpu/todo.rst        | 15 +++++++
 drivers/firmware/sysfb_simplefb.c |  2 +-
 drivers/gpu/drm/tiny/simpledrm.c  | 22 ++++++++---
 drivers/video/fbdev/core/fbmem.c  | 29 ++++++++++++--
 drivers/video/fbdev/simplefb.c    | 65 +++++++++++++++++++++----------
 include/linux/fb.h                |  1 +
 6 files changed, 105 insertions(+), 29 deletions(-)


base-commit: 0bb81b5d6db5f689b67f9d8b35323235c45e890f
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 8e52143a6cd7b8fb789e656208f6edde71d0f499
-- 
2.34.1

