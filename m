Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E40640E9AD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 20:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B126E821;
	Thu, 16 Sep 2021 18:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06CA6E57E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:16:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EDECF223E0;
 Thu, 16 Sep 2021 18:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631816163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YVjbA3qw0sNlkujtQrRfEqRTdtm/0oEWmxsFhdHvpUE=;
 b=xXPDs0LSCSAzVvEDSZ2qCsNPwaOMP2aVM5DvYN5TcJ7qrashsEklK2nR3IR65nuFh0Zz5S
 x2KH3oGX9AL0I7zU6jpDlb7qragbtc139Oz4xYdzerH8aij/YKzgBSyOy+gyUlyMdK6KqF
 XC0HBNbnSSwSzG56nkIxc6ne/jy1ixE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631816163;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YVjbA3qw0sNlkujtQrRfEqRTdtm/0oEWmxsFhdHvpUE=;
 b=2jH7bodZHVKT9iVQHzclDESXGiqKhaaTWM2n5bIEKJHEWTlYn8s8b5KqTfRcd9oHCJSg4D
 5zYsOmzau3S7HnAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A15F013D67;
 Thu, 16 Sep 2021 18:16:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pXsIJuOJQ2FleQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Sep 2021 18:16:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch, hdegoede@redhat.com,
 marcan@marcan.st, maz@kernel.org, akpm@linux-foundation.org,
 npiggin@gmail.com, thunder.leizhen@huawei.com, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/5] lib: devres: Add managed helpers for write-combine setup
Date: Thu, 16 Sep 2021 20:15:56 +0200
Message-Id: <20210916181601.9146-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add devm_arch_phys_wc_add() and devm_arch_io_reserve_memtype_wc() for
automatic cleanup of writecombine setup.

Several DRM drivers use the non-managed functions for setting their
framebuffer memory to write-combine access. Convert ast, mgag200 and
vboxvideo. Remove rsp clean-up code form drivers.

Tested on mgag200 hardware.

Thomas Zimmermann (5):
  lib: devres: Add managed arch_phys_wc_add()
  lib: devres: Add managed arch_io_reserve_memtype_wc()
  drm/ast: Use managed interfaces for framebuffer write combining
  drm/mgag200: Use managed interfaces for framebuffer write combining
  drm/vboxvideo: Use managed interfaces for framebuffer write combining

 drivers/gpu/drm/ast/ast_drv.h         |  2 -
 drivers/gpu/drm/ast/ast_mm.c          | 27 ++++-----
 drivers/gpu/drm/mgag200/mgag200_drv.h |  2 -
 drivers/gpu/drm/mgag200/mgag200_mm.c  | 35 +++---------
 drivers/gpu/drm/vboxvideo/vbox_drv.c  |  5 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.h  |  1 -
 drivers/gpu/drm/vboxvideo/vbox_ttm.c  | 17 +++---
 include/linux/io.h                    |  5 ++
 lib/devres.c                          | 82 +++++++++++++++++++++++++++
 9 files changed, 113 insertions(+), 63 deletions(-)

--
2.33.0

