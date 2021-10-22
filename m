Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6CB437223
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 08:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9348A89E2A;
	Fri, 22 Oct 2021 06:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AD389E2A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 06:49:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8D2452197F;
 Fri, 22 Oct 2021 06:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1634885344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=vdb5nLtyp5tIbT7/OLrVEaSBnq6naUGZA07AQT86v2c=;
 b=PMNO7u+JK4lsjHIAmHQ/NYSH6PSDWxW5oi4qSzEsVw9p0v6RgIf1dw5L1M0yxZnnPmUE42
 bEdzMHkjaPHjMsStRKaaW/VG+AFY5hngJA838Yw55Zrc0gCY9ILGst8rEWSnr+azo7IRtQ
 wVKKkBy8OqPGObfHmn8PuQkefgkgXAA=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A09513AAD;
 Fri, 22 Oct 2021 06:49:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jpEMBeBecmEIEwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 22 Oct 2021 06:49:04 +0000
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Juergen Gross <jgross@suse.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Subject: [PATCH 0/5] xen: cleanup detection of non-essential pv devices
Date: Fri, 22 Oct 2021 08:47:55 +0200
Message-Id: <20211022064800.14978-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
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

Today the non-essential pv devices are hard coded in the xenbus driver
and this list is lacking multiple entries.

This series reworks the detection logic of non-essential devices by
adding a flag for that purpose to struct xenbus_driver.

Juergen Gross (5):
  xen: add "not_essential" flag to struct xenbus_driver
  xen: flag xen_drm_front to be not essential for system boot
  xen: flag hvc_xen to be not essential for system boot
  xen: flag pvcalls-front to be not essential for system boot
  xen: flag xen_snd_front to be not essential for system boot

 drivers/gpu/drm/xen/xen_drm_front.c        |  1 +
 drivers/input/misc/xen-kbdfront.c          |  1 +
 drivers/tty/hvc/hvc_xen.c                  |  1 +
 drivers/video/fbdev/xen-fbfront.c          |  1 +
 drivers/xen/pvcalls-front.c                |  1 +
 drivers/xen/xenbus/xenbus_probe_frontend.c | 14 +++-----------
 include/xen/xenbus.h                       |  1 +
 sound/xen/xen_snd_front.c                  |  1 +
 8 files changed, 10 insertions(+), 11 deletions(-)

-- 
2.26.2

