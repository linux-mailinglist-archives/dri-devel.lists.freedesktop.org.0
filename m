Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FFE497FAE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 13:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959DD10EAF4;
	Mon, 24 Jan 2022 12:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1752E10E173
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 12:37:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AB8C8212B7;
 Mon, 24 Jan 2022 12:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643027825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mTIBZHMlvugjDJFX7BwroyoTZJMWkdOfb0O7uFauqM4=;
 b=lJ1I6Szf0cfwtsUK3kuVqDMVsK7EUN4/WPEjpdIUFQa1vfnDR/4JsZErwl/eKsxy/o+rLe
 Al5hWpU+q3xS9X67EcXhYsnPOJjZtTgglHKHosWxRaKr9TzwRTx77x8E+Lc4QBas8/lyrd
 MID3n2YpQ448xP1ghrE4LeC5dxGHgSc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643027825;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mTIBZHMlvugjDJFX7BwroyoTZJMWkdOfb0O7uFauqM4=;
 b=5ur3pY++tRDAFa1Jiu4OoCzEQfCjFmYHI4YEHNIUxQDHobZfk1u5Nw5J0Jlq+MuY22Nb10
 HM+e2wY67s1/XcCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7085613B97;
 Mon, 24 Jan 2022 12:37:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NvqJGnGd7mFyNQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Jan 2022 12:37:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: zackr@vmware.com, javierm@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
 hdegoede@redhat.com
Subject: [PATCH 0/5] sysfb: Fix memory-region management
Date: Mon, 24 Jan 2022 13:36:54 +0100
Message-Id: <20220124123659.4692-1-tzimmermann@suse.de>
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

Javier Martinez Canillas (1):
  drivers/firmware: Don't mark as busy the simple-framebuffer IO
    resource

Thomas Zimmermann (4):
  fbdev: Hot-unplug firmware fb devices on forced removal
  drm/simpledrm: Request memory region in driver
  fbdev/simplefb: Request memory region in driver
  drm: Add TODO item for requesting memory regions

 Documentation/gpu/todo.rst        | 15 ++++++++
 drivers/firmware/sysfb_simplefb.c |  2 +-
 drivers/gpu/drm/tiny/simpledrm.c  | 20 ++++++++---
 drivers/video/fbdev/core/fbmem.c  | 29 +++++++++++++--
 drivers/video/fbdev/simplefb.c    | 59 ++++++++++++++++++++++---------
 include/linux/fb.h                |  1 +
 6 files changed, 100 insertions(+), 26 deletions(-)


base-commit: 0bb81b5d6db5f689b67f9d8b35323235c45e890f
-- 
2.34.1

