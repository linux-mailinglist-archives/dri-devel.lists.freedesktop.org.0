Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E507C4B9D3A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 11:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C58310EBB6;
	Thu, 17 Feb 2022 10:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF5310EBB1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 10:34:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B1D5A1F37D;
 Thu, 17 Feb 2022 10:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645094047; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TogbLB2YWZU4Ebgwufr1Y/9MrmIOZddMkz5APOYEyk0=;
 b=ejSElkuDIFJvnD8mhqer3og8gtKnJc7hI+VIrcQpad3nTbw1WZZEj80+BubB7OCu8a4b8M
 AMVdKKpM4z4sWHApxq6ROWnPY3+aWPI5hkNGhgJ3s92kfrMnlb4nog2r6trSeKNTIcqUto
 fDHlzMsv7ohc75VjU4+XFOvT+ayyJY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645094047;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TogbLB2YWZU4Ebgwufr1Y/9MrmIOZddMkz5APOYEyk0=;
 b=Utrpn1eilMnXnNzAQL9CM4MzrpYhhydPnsCh0IzX4VjMneXiTrj/BwcDaeYFliFbTL2pZ7
 Q+ROS9kWmQxS9wDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 860A413DD8;
 Thu, 17 Feb 2022 10:34:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QuOgH58kDmLQQgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 17 Feb 2022 10:34:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, deller@gmx.de, javierm@redhat.com, geert@linux-m68k.org
Subject: [PATCH 0/2] fbdev: Improve performance of fbdev console
Date: Thu, 17 Feb 2022 11:34:03 +0100
Message-Id: <20220217103405.26492-1-tzimmermann@suse.de>
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

Optimize performance of the fbdev console for the common case of
software-based clearing and image blitting.

The commit descripton of each patch contains resuls os a simple
microbenchmark. I also tested the full patchset's effect on the
console output by printing directory listings (i7-4790, FullHD,
simpledrm, kernel with debugging).

  > time find /usr/share/doc -type f

In the unoptimized case:

  real    0m6.173s
  user    0m0.044s
  sys     0m6.107s

With optimizations applied:

  real    0m4.754s
  user    0m0.044s
  sys     0m4.698s

In the optimized case, printing the directory listing is ~25% faster
than before.

Thomas Zimmermann (2):
  fbdev: Improve performance of sys_fillrect()
  fbdev: Improve performance of sys_imageblit()

 drivers/video/fbdev/core/sysfillrect.c | 16 ++------
 drivers/video/fbdev/core/sysimgblt.c   | 51 ++++++++++++++++++++------
 2 files changed, 42 insertions(+), 25 deletions(-)

-- 
2.34.1

