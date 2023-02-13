Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B214A6945D3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 13:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCF110E574;
	Mon, 13 Feb 2023 12:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5355010E574
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 12:32:55 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4PFkJM2l9Zz9sRf;
 Mon, 13 Feb 2023 13:32:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1676291571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ap3SZLIZ3ABe6KM6cgsMPbXThiqYabgT0Ez6IQos/cE=;
 b=GH6kJr+x853Q70eiM3EHrYJQv5ihmlVN0b6Ytbstqgb/xbFnKEWTQmZEXgZKzcpSDicTs6
 DltS6nran7utguJ2+sU/VuPobUyel5kB86odsn/114BgeYIvFvONXPf8YGgQTXyzWnIbJa
 Caa06lUewA1wpExgsINHnn3OTQHUTBrvSbR1fF8yxCVR4+wVcsxXLkpl4wX8JE06e0r3J8
 5UB6bN4ObCMpEKPnGwP0p9gwb3ye0qyUFZB0cFRXAYDwi9/sWDCdcfbzaN4FiiT2YEzU7B
 t0x65J8GFOqOiZmokcuwva0leaI8jDtfc+2GbWaloAxlPftPW+1Ti6bK8zmgXA==
From: Frank Oltmanns <frank@oltmanns.dev>
To: Ondrej Jirman <megi@xff.cz>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megous@megous.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 0/1] drm/panel: st7703: Fix resume of XBD599 panel
Date: Mon, 13 Feb 2023 13:32:37 +0100
Message-Id: <20230213123238.76889-1-frank@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4PFkJM2l9Zz9sRf
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
Cc: Frank Oltmanns <frank@oltmanns.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is V2 of a patch that fixes flickering after resume from sleep on
panel xingbangda,xbd599 (e.g. used in PinePhone).

Please see here for the discussion around V1:
https://lore.kernel.org/all/20230212120830.46880-1-frank@oltmanns.dev/T/

V1 introduced panel specific functions for the JH057N and XBD599 panels.
Ondřej Dirman deemed this unneccesary and finally convinced me.

Therefore, V2 is a much simpler patch.

The patch is just a refactoring of Ondřej's original patch, that is
already used today by PinePhone distributions like PostmarketOS.

This patch has not been tested with the JH057N panel used in the Librem
5 devkit. I hereby kindly ask for Librem (i.e. Guido) to test this.

The patch is based on drm-next.

Ondřej, since this is just a very minor refactoring of your work, I
would gladly put you as the author, if you wish so.

Thanks,
  Frank

Frank Oltmanns (1):
  drm/panel: st7703: Fix timings when entering/exiting sleep

 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.39.1

