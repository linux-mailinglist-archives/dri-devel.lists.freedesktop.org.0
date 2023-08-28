Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3379678B183
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 15:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FD610E2D5;
	Mon, 28 Aug 2023 13:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6666810E2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 13:21:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0C0C8219E6;
 Mon, 28 Aug 2023 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693228895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pnwZ65nZK9qeQ06lv/Mt+cgcaEzXDu6AFEyAEI4AnZk=;
 b=fPBDEz9qgFehf6BuZhp2iHjeAXo/bJTGn1MR05cIllGWQEwYt12OohQ7V/SV5rPR3DRSgS
 +D+xZOWIOPYd5gMN9NtONvBFEh8OoNGl25Uvy02zsnXSDCv2DVVB67QOgcZnp3qmoyQWgs
 L5SEUTRtXCtetol+ZjGd5hSUQQiXIxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693228895;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pnwZ65nZK9qeQ06lv/Mt+cgcaEzXDu6AFEyAEI4AnZk=;
 b=wGiy3UgLSj9rxu9VhhXasfT7LMsu/Be88DValn/yjpnAOHvrGmKm0T6IVTQzl+NB5CHtUL
 GuLsL4b/7iaRxtDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C699213A11;
 Mon, 28 Aug 2023 13:21:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Mx11L16f7GTyOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 28 Aug 2023 13:21:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	daniel@ffwll.ch,
	sam@ravnborg.org,
	javierm@redhat.com
Subject: [PATCH 0/8] fbdev: Use helpers for deferred I/O
Date: Mon, 28 Aug 2023 15:14:16 +0200
Message-ID: <20230828132131.29295-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here's another patchset for deferred-I/O helpers. Update a number
of fbdev drivers with deferred I/O to use fbdev's helper macros and
Kconfig tokens.

Generating and initializing via helpers macros will later allow for
a fine-grained setup, depending on Kconfig options. For example, it
will be possible to leave out file I/O if FB_DEVICE has not been set.

Each driver in special in its own way. The smscufx and udlfb drivers
support file I/O without damage updates. (That probably doesn't work
correctly.) So they provide their own mmap code. The hyperv_fb driver
sometimes operates on memory in I/O address spaces and fails to do
damage handling correctly for write operations. The picolcd and fbtft
drivers are outside of fbdev.

Thomas Zimmermann (8):
  fbdev/smscufx: Use fb_ops helpers for deferred I/O
  fbdev/udlfb: Use fb_ops helpers for deferred I/O
  fbdev: Add Kconfig macro FB_IOMEM_HELPERS_DEFERRED
  fbdev/hyperv_fb: Use fb_ops helpers for deferred I/O
  hid: Remove trailing whitespace
  hid/picolcd: Use fb_ops helpers for deferred I/O
  staging/fbtft: Initialize fb_op struct as static const
  staging/fbtft: Use fb_ops helpers for deferred I/O

 drivers/hid/Kconfig                |  8 +--
 drivers/hid/hid-picolcd_fb.c       | 73 ++++++----------------
 drivers/staging/fbtft/Kconfig      |  6 +-
 drivers/staging/fbtft/fbtft-core.c | 99 ++++++++----------------------
 drivers/video/fbdev/Kconfig        |  5 +-
 drivers/video/fbdev/core/Kconfig   |  6 ++
 drivers/video/fbdev/hyperv_fb.c    | 48 +++++----------
 drivers/video/fbdev/smscufx.c      | 85 +++++++------------------
 drivers/video/fbdev/udlfb.c        | 89 +++++++--------------------
 9 files changed, 114 insertions(+), 305 deletions(-)

-- 
2.41.0

