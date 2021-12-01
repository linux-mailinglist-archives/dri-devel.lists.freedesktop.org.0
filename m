Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D19464D32
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 12:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FF76F991;
	Wed,  1 Dec 2021 11:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA74B6F953
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 11:46:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 40234212CC;
 Wed,  1 Dec 2021 11:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638359207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Unw5GEnH0oGNbkYI489YPeh2jzWsfo3V9/JDSEhMJvg=;
 b=Xeo9mlCk2VmS4lVFiKWOAh89AZT/tq6bZxKAoi8O4sBGsvU+W8D83gFvbOnvdVzZWHbTcX
 JK5awlk/2qLtD9/tefs22VxKT3JqRc+AAVv3slRw31MqRM+kkpzeHDDJGYg0HmqBBBaavh
 dWcLvarB1Gi6xmBoi1WEnw90KdvIrWE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638359207;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Unw5GEnH0oGNbkYI489YPeh2jzWsfo3V9/JDSEhMJvg=;
 b=p42tVrdNmkQHIaDF8HklgQ3/I6UD2FLogmb5lpKlCQ5s0A+9+0pw2Q3FtLReSvktMaTXNh
 HOEpkiGDg/3vCDBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0CFAB13B7E;
 Wed,  1 Dec 2021 11:46:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id l/4tAqdgp2HbDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Dec 2021 11:46:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel.vetter@ffwll.ch, arnd@arndb.de,
 gregkh@linuxfoundation.org, James.Bottomley@HansenPartnership.com,
 deller@gmx.de
Subject: [PATCH v2 0/7] agp: Various minor fixes
Date: Wed,  1 Dec 2021 12:46:38 +0100
Message-Id: <20211201114645.15384-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.0
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

v2:
	* ati-agp: free page in error branch (Helge)
	* nvidia-agp: Mark temp as __maybe_unused (Helge)

Thomas Zimmermann (7):
  agp: Remove trailing whitespaces
  agp: Include "compat_ioctl.h" where necessary
  agp: Documentation fixes
  agp/ati: Return error from ati_create_page_map()
  agp/nvidia: Declare value returned by readl() as unused
  agp/sworks: Remove unused variable 'current_size'
  agp/via: Remove unused variable 'current_size'

 drivers/char/agp/ati-agp.c    | 8 ++++++--
 drivers/char/agp/backend.c    | 2 ++
 drivers/char/agp/frontend.c   | 4 +++-
 drivers/char/agp/nvidia-agp.c | 3 ++-
 drivers/char/agp/sworks-agp.c | 5 +----
 drivers/char/agp/via-agp.c    | 3 ---
 6 files changed, 14 insertions(+), 11 deletions(-)


base-commit: 6a8f90ec433e2f5de5fc16d7a4839771b7027cc0
--
2.34.0

