Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB0E797106
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 10:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2F910E09D;
	Thu,  7 Sep 2023 08:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B9710E796
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 08:54:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 795081F893;
 Thu,  7 Sep 2023 08:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694076850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HvIYKMndiy2O//rAfImHIjA5JinGDuMthkWNJO8tSAE=;
 b=dVu2JJh7yaOY3KO15y15P2xGo+rQlLwdEsUXVbjxeD+OG6vEQutU2d+kpg2OwSYckqBUdo
 NeIP54Wrl0g6C7mzMC2iuHt8TDj87YHOqiaDX3vDxvs07y19jO4el8e/9mquPCOzGXE5q8
 V09/ANszk/cYozHJ5lUoHhPpMDZTIfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694076850;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HvIYKMndiy2O//rAfImHIjA5JinGDuMthkWNJO8tSAE=;
 b=o/eFein2w2VFC1VYfEDiQiQc44H1XZ9Ks83W8x+iJX3S/iu5ZjxKk1mj2RPq0vk8EaqH78
 skRnFsliyUf/TBCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A6AE138FA;
 Thu,  7 Sep 2023 08:54:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GhMoEbKP+WT6JgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Sep 2023 08:54:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/7] fbdev: Split off code for boot-up logo
Date: Thu,  7 Sep 2023 10:51:59 +0200
Message-ID: <20230907085408.9354-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
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
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The boot-up logo is a feature of the fbcon console; with only a few
external callers. Move it from the core fbdev code into its own file.

Patches 1 and 2 remove the logo setup from fbdev drivers. The logo
requires a configured output, which is provided by the framebuffer
console. Drivers should not implement their own logo.

Patches 3 to 6 move the code for the boot-up logo into its own file
and add a number of simple cleanups. It's now separate from the core
fbdev code that maintains the display framebuffers.

Patch 7 then removes a number of unecessary include statements from
fbmem.c.

v2:
	* unexport helpers in a separate patch
	* squash patches that set up fb_logo.c (Javier)

Thomas Zimmermann (7):
  fbdev/au1200fb: Do not display boot-up logo
  fbdev/mmp/mmpfb: Do not display boot-up logo
  fbdev/core: Fix style of code for boot-up logo
  fbdev/core: Unexport logo helpers
  fbdev/core: Move logo functions into separate source file
  fbdev/core: Remove empty internal helpers from fb_logo.c
  fbdev/core: Clean up include statements in fbmem.c

 drivers/video/fbdev/au1200fb.c         |   9 -
 drivers/video/fbdev/core/Makefile      |   2 +
 drivers/video/fbdev/core/fb_internal.h |  17 +
 drivers/video/fbdev/core/fb_logo.c     | 508 +++++++++++++++++++++++
 drivers/video/fbdev/core/fbcon.c       |   2 +
 drivers/video/fbdev/core/fbmem.c       | 542 +------------------------
 drivers/video/fbdev/mmp/fb/mmpfb.c     |   7 -
 include/linux/fb.h                     |   5 -
 8 files changed, 530 insertions(+), 562 deletions(-)
 create mode 100644 drivers/video/fbdev/core/fb_logo.c

-- 
2.42.0

