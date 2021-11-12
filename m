Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4C144E855
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 15:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260446E0F5;
	Fri, 12 Nov 2021 14:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7BF6E0F5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 14:16:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8371021981;
 Fri, 12 Nov 2021 14:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636726590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GbSzca/IRUTHVcXzLF29dXcn2Fz8UnKuCr1ydiC3fTw=;
 b=17owjxK+oz54WTvGLdQk7vxqviv29d7dUUDvGRXXCZ5/p5AkaTySb7Qz4bQu72sciyZBRF
 PFvDbMbN8yVxLN8p9Tt+ySlhMLRV5iw0nQvQPHhO/d7Urd0LRAnjS83jBqRBqsDKMnnK3K
 rpqepOEbqfBSfmD/f6IpU4w5g3SxjcY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636726590;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GbSzca/IRUTHVcXzLF29dXcn2Fz8UnKuCr1ydiC3fTw=;
 b=fOsRSnNI12tCfbR6zsg9X66itpDvw8LmwORxx+V4sVj3kTECcCWwrWPc3/yVFThkUFtAMM
 44pOMitEDhM6f2DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 41E9613C7C;
 Fri, 12 Nov 2021 14:16:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JsoMDz53jmHhPAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Nov 2021 14:16:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel.vetter@ffwll.ch, arnd@arndb.de,
 gregkh@linuxfoundation.org, James.Bottomley@HansenPartnership.com,
 deller@gmx.de
Subject: [PATCH 0/7] agp: Various minor fixes
Date: Fri, 12 Nov 2021 15:16:21 +0100
Message-Id: <20211112141628.12904-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a number of compiler warnings in the AGP drivers. No functional
changes.

Thomas Zimmermann (7):
  agp: Remove trailing whitespaces
  agp: Include "compat_ioctl.h" where necessary
  agp: Documentation fixes
  agp/ati: Return error from ati_create_page_map()
  agp/nvidia: Ignore value returned by readl()
  agp/sworks: Remove unused variable 'current_size'
  agp/via: Remove unused variable 'current_size'

 drivers/char/agp/ati-agp.c    | 10 ++++++++--
 drivers/char/agp/backend.c    |  2 ++
 drivers/char/agp/frontend.c   |  4 +++-
 drivers/char/agp/nvidia-agp.c |  6 +++---
 drivers/char/agp/sworks-agp.c |  5 +----
 drivers/char/agp/via-agp.c    |  3 ---
 6 files changed, 17 insertions(+), 13 deletions(-)

--
2.33.1

