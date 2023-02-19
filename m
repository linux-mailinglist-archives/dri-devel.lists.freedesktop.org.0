Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DADF69C014
	for <lists+dri-devel@lfdr.de>; Sun, 19 Feb 2023 12:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C35610E0E5;
	Sun, 19 Feb 2023 11:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959D710E0E5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Feb 2023 11:46:16 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4PKNzm2ymnz9sQK;
 Sun, 19 Feb 2023 12:46:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1676807172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=K+kWDPBvqhgCOkAg751UfyRZlB0vI5oXI8/N3dWFXV0=;
 b=vvnEvamWrQo1q8Bb1K5H9UfpI3lDkfmSWlsqLe9Hg9pstZZK2LsMuo22ORxSADSMyNxSZ/
 pZ2ucHMtplFzZCsgTl7tyZz8ZtmfcmfNv+d8tsuA2kdoTi5EsQaWTl92R6MuBUdwtRmfz+
 Ey/k4J4vMiouUm67oE4Zr5osbWVi+Uc+92572e4V9SUf6Ck7mfqmsn05s1Pe9RTM4LlZku
 kmL/S9UFRkR/TP4VpJPCHpTWuSeiAgb03X1/4qOeEXkJeDUZEqppC9/4zq0b1gwxYGdnJb
 0tPO2zWls8lztPfh+6gMS+CwtmM2sIeOuLcBFwpO3CsMH5lZEmlTRg9JqgjQPA==
From: Frank Oltmanns <frank@oltmanns.dev>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megous@megous.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/1] drm/panel: st7703: Fix vertical refresh rate of XBD599
Date: Sun, 19 Feb 2023 12:45:52 +0100
Message-Id: <20230219114553.288057-1-frank@oltmanns.dev>
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
Cc: Frank Oltmanns <frank@oltmanns.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the XBD599 panel has a pixel clock rate that results in a
vertical refresh rate of ~55.3 Hz. This causes a slight visual
stuttering, for example on the PinePhone.

To address this, I adjusted the pixel clock rate to 74844 kHz. Instead
of using this hard coded value, I inserted the formula. This approach is
already in use by:
panel-jdi-fhd-r63452.c
panel-samsung-s6e88a0-ams452ef01.c
panel-asus-z00t-tm5p5-n35596.c
panel-ebbg-ft8719.c
panel-visionox-vtdr6130.c
panel-sony-tulip-truly-nt35521.c
panel-sharp-ls060t1sx01.c
panel-samsung-sofef00.c

To have a consistent procedure within panel-sitronix-st7703.c, I also
used the formula for the JH057N panel's clock. The value for JH057N was
already correct, so this change is purely cosmetic.

I do realize that I submitted three separate patches for the ST7703
within just a few days ([1], [2]). Should I re-submit all three patches
as a single patch set? These are my first contributions to the Linux
kernel, therefore, I kindly ask for forgiveness regarding any breach of
etiquette.

Thanks,
  Frank

[1] https://lore.kernel.org/all/20230211171748.36692-1-frank@oltmanns.dev/
[2] https://lore.kernel.org/all/20230213123238.76889-1-frank@oltmanns.dev/

Frank Oltmanns (1):
  drm/panel: st7703: Fix vertical refresh rate of XBD599

 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.39.1

