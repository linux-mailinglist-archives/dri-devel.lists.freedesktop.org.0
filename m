Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DCD69394B
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 19:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2D110E437;
	Sun, 12 Feb 2023 18:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747BF10E038
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 12:08:44 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4PF5pw3TBgz9scG;
 Sun, 12 Feb 2023 13:08:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1676203720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=B05YiRdcBvqwty9QnLiifB3HgSAbyHH2GODfXEZv2EU=;
 b=m1IKBXwAOloKJlMLqn1MZ2drjnzx7aW1qLDobF2YqHSayxCXKqvmDggepbmQnUHU1usHRY
 S8cA83BxKPocqm/AC9ieyvQhp4jhseieIkWesUxZH1n1CU0sTHm/4KgoJU5DZDmOW4OPau
 sQClzbUOh+0jvd8K6KVX//kZ9XzKoJ35etaYTZ9YZQ9w8hBO8z7PN7ZgqN7oPBcGeSP50w
 AZs3XugU72UaWrgglpIIDdJGIBvEe8OIubdouPktbUmTbIaQ+UqzemhjrMDCoJnDwsFvPM
 MXTB/0KN+BDHkJye/w65tGS2APbI9ODMWC5B1Ag7G83pW/IFNwjlUSzLWJndxg==
From: Frank Oltmanns <frank@oltmanns.dev>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megous@megous.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/1] drm/panel: st7703: Fix resume of XBD599 panel
Date: Sun, 12 Feb 2023 13:08:28 +0100
Message-Id: <20230212120830.46880-1-frank@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 12 Feb 2023 18:11:01 +0000
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

This patch fixes flickering after resume from sleep on panel
xingbangda,xbd599 (e.g. used in PinePhone).

It was originally submitted by Ondrej Jirman in July 2020:
https://lore.kernel.org/all/20200716123753.3552425-1-megous@megous.com/

The original patchset contained two patches. This submission fixes the
patch that broke handling of the JH057N panel of the Purism Librem 5.

In essence, it does not change any behavior towards the JH057N panel,
but only affects the XDB599.

The patch is just a refactoring of Ondřej's original patch, that is
already used today by PinePhone distributions like PostmarketOS.

I was torn between using function pointers and just calling msleep()
with device specific delays. I decided to go with function pointers,
because my understanding is that calling msleep(0), which would be
required for waiting for the JH057N display to discharge, still results
in a delay. The empty function I used has no side effect on that panel.

The patch is based on drm-next.

Ondřej, since this is just a refactoring, I would gladly add your SoB,
if you wish so.

Thanks,
  Frank

Frank Oltmanns (1):
  drm/panel: st7703: Fix resume of XBD599 panel

 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 40 ++++++++++++++++---
 1 file changed, 35 insertions(+), 5 deletions(-)

-- 
2.39.1

