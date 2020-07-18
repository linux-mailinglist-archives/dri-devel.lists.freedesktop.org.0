Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C08224E44
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 01:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149496E2B6;
	Sat, 18 Jul 2020 23:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9A06E2B6
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 23:33:27 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s9so16506838ljm.11
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 16:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/uOHqtO1l7zkVQ8bbrjF3EFuuScxemsHl8Jv5NCr0Zs=;
 b=wZWp6ChjpBomhs7feoixsNH6mvZLKAYA8u/pFpS6/4nXNwsMmcWx1WrkYAa6kpeyhw
 ut1SO2AgAFg6va3LkF4XlPm8dhKGm8IRhMu+s/52INWp8R2v5f777thEv9Z2BmsFva+p
 tbvz0Dfvyrb8M8PNIGClarnUhD8glzwj4RxsQrH7DGmoWQ3hG0zA4kfDhYXULDfUifqC
 6Pia5lWZ07e49ux85FjYMggGYJFae0DeZVbbW9cDHIWz+9lxFMj4jk06rPuJ4jOchqBf
 ZBJdLaWhjbhZ6ngabbnkjbl4hEiOPNOjbJsipvegjgu17Hme8z1GhDtB5FCw/Wpor4GQ
 Wm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/uOHqtO1l7zkVQ8bbrjF3EFuuScxemsHl8Jv5NCr0Zs=;
 b=HZs2EKIuB16vKXUokCtUeVkeQut0xAKoFo2oYl/8uqehuf3Sw5h3iEq4vZ2bFrzHpw
 SUQBAR+l98vJDeOORJ04vvga7xjO0VgMY83JWy0eegWiUTOlsPPgTbNgzfYUzN922MoM
 st2QdyfgvJA8UtqzKYAUFIGl5SQ9Ht8sujy2BxTGGpzpkYLjohevwMWYSP/6vgZ67zQB
 fDhsgzf/1ZyrECFv60fni6fUiYaSsR9KGxCqpSYXRK2fJh0DjFlxvHNwCrqIEbZB6ns0
 k79Ib5zb6sEPTv3vRXNPW0/SXgleCoWtIjaa3O6AvSZhmAK6g6bv+FvH2wlVEPTBVqKh
 huFw==
X-Gm-Message-State: AOAM531ZqJIFbW3w167Fa9IVjfDL/GhHsO9Kg4z4men1Yp2Xo5+FdlDK
 ys6ds2EYh9z/dy84NyMIX+4C80XEOEP90A==
X-Google-Smtp-Source: ABdhPJzM97xRZHLijv/cmF6LPcoOA2S7d7QGKXpHi41IClGjjZvS6hGjF7P3ul7SN5iMTYkM1sHJgw==
X-Received: by 2002:a2e:978c:: with SMTP id y12mr7173559lji.270.1595115205664; 
 Sat, 18 Jul 2020 16:33:25 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id d22sm2014139lfs.26.2020.07.18.16.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 16:33:24 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/mcde: Fix stability issue
Date: Sun, 19 Jul 2020 01:33:22 +0200
Message-Id: <20200718233323.3407670-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: stable@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Whenener a display update was sent, apart from updating
the memory base address we called mcde_display_send_one_frame()
which also sent a command to the display requesting the TE IRQ
and enabling the FIFO.

When continous updates are running this is wrong: we need
to only send this to start the flow to the display on
the very first update. This lead to the display pipeline
locking up and crashing.

Check if the flow is already running and in that case
do not call mcde_display_send_one_frame().

This fixes crashes on the Samsung GT-S7710 (Skomer).

Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: stable@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_display.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 212aee60cf61..1d8ea8830a17 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -1086,9 +1086,14 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 	 */
 	if (fb) {
 		mcde_set_extsrc(mcde, drm_fb_cma_get_gem_addr(fb, pstate, 0));
-		if (!mcde->video_mode)
-			/* Send a single frame using software sync */
-			mcde_display_send_one_frame(mcde);
+		if (!mcde->video_mode) {
+			/*
+			 * Send a single frame using software sync if the flow
+			 * is not active yet.
+			 */
+			if (mcde->flow_active == 0)
+				mcde_display_send_one_frame(mcde);
+		}
 		dev_info_once(mcde->dev, "sent first display update\n");
 	} else {
 		/*
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
