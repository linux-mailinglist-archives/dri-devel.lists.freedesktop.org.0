Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 598474FF36B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 11:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB81B10E1AF;
	Wed, 13 Apr 2022 09:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F3410E1AF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 09:24:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 31DCF1F858;
 Wed, 13 Apr 2022 09:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649841896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4W5YKw3E419qmDfVne2ICDki06Ywem4NGMl+XKTu3gQ=;
 b=WTbdGhOmLxVtPR2InqJ8r+pjbvDQUucZ5w/7fUInhdmJV28c8v6hxsYxridQ4w+mgUK90A
 UvQEmdr/vOYlovqAmSOKiLmnn8EUNhCeoJkfH010M9OS0Uf/T5KVnLlqTtVoADrY6CDLEe
 yYI0fmuhYUP39E8LJXKRnnH7YYppfnU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649841896;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4W5YKw3E419qmDfVne2ICDki06Ywem4NGMl+XKTu3gQ=;
 b=mU+Ab/fQs030+wlBS3i9dXJdaRkJLe2vm13rREMl8geAXhV4LTeAQAbnYf93Z8c/BBTLlO
 kjUYoalnersbg4Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3D9813A91;
 Wed, 13 Apr 2022 09:24:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 89W1MueWVmI5FwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 13 Apr 2022 09:24:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robh+dt@kernel.org, frowand.list@gmail.com, daniel@ffwll.ch, deller@gmx.de,
 sam@ravnborg.org, linux@roeck-us.net, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
Subject: [PATCH 0/2] of: Register platform device for each framebuffer
Date: Wed, 13 Apr 2022 11:24:52 +0200
Message-Id: <20220413092454.1073-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the detection of OF framebuffers from fbdev into of platform code
and register a Linux platform device for each framebuffer. Allows for
DRM-based OF drivers and real hot-unplugging of the framebuffer.

This patchset has been tested with qemu's ppc64le emulation, which
provides a framebuffer via OF display node. If someone has an older
32-bit system with BootX available, please test.

Thomas Zimmermann (2):
  of: Create platform devices for OF framebuffers
  fbdev: Remove hot-unplug workaround for framebuffers without device

 drivers/of/platform.c            | 73 ++++++++++++++++++++++--
 drivers/video/fbdev/core/fbmem.c |  9 +--
 drivers/video/fbdev/offb.c       | 98 +++++++++++++++++++++-----------
 3 files changed, 135 insertions(+), 45 deletions(-)


base-commit: 74ee32cc715cd9557c62aba937d6995851c68fe7
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 6e1032c6302461624f33194c8b8f37103a3fa6ef
prerequisite-patch-id: dbf45768338ff1d944d093dc54bdffb3dc054b44
prerequisite-patch-id: 9c12c87b13a3519a93b81ca18299fae96ae4fefe
prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6
prerequisite-patch-id: ab7611d28d07723ab1dd392dcf9a6345de3b1040
-- 
2.35.1

