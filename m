Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E6519753E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562D56E0D6;
	Mon, 30 Mar 2020 07:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA27B6E0AF
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 09:22:38 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id a24so180364pfc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 02:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1hCX0Eu5BSFoHJWyRefAvnMuTN8T0slwSrNK+D8BVUE=;
 b=seiBEgEWo89G0cm4eLCRBhoG4Ilds9sW/UkUVahSr62V/bc68xt4FSrpnMVkw8BfJn
 SO8C+hWFr7MqBP927XPkgd1v5y+scKb3sdMF15SV9rB60OKms3nLkpWT/7LpeBYmTx8T
 5MZ2mRL/6P8rvgoMzla/a+Wl1XOW4dHDbn0pXPmU/uibNDN+JK2J1blSPVOMMEyPC+py
 NLawegDjyJ203XfGz6tILqTQPOzGBBFiy9IiaXDbsJQFs2cI81MQw9gW6l4zRcpzMFPQ
 K5jmOkIUmQrD0ABHxXfFEG6P+rX2v6oke5jSor4qvAI1G3hOQZ09GYU377NQXRtPDM/e
 a/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1hCX0Eu5BSFoHJWyRefAvnMuTN8T0slwSrNK+D8BVUE=;
 b=iPSZrDx21DmIWG45EHcNuGAqutA/MdgSJV5chSCcMPw0aMDj0JqVsaVWdUMHfKrWTo
 VdaRj9as9cZZY2Ii7lXmMkrBzxu+heNU1klB5Y2KvJlV4XgV3RKdOwf/w8g0hNSKcz5d
 4SIU1MSlK72H+mOvUM0KYYxIop72Sez0X862SbWA1PhKl9yczqzds7Xcxmqs2BqlKUns
 bjYALvf32WbYQ5QK4q965MUdodqTMsbifXyzfyaGktSDGlGS9r8S7Hqv5m3KwUCk05qI
 jhNlOjQHwYfiAZ+BXK8roaNfn3wHvZQQ4bG159vZGX5nrxU0Kx5e8rVQArhXb7+ltbuY
 z3GA==
X-Gm-Message-State: ANhLgQ0SlMa1uxDygPhxHQAqc9qyhK5XSAV4BhzRtEgEPuBsJVnnkqML
 hNtawhSmnhO5VDMq3YzOUJo=
X-Google-Smtp-Source: ADFU+vs2xioDwndYreFjtqUiqCO2dHroI6mYZCs+EpeXHdChdsMV8FKCH9+T0VoQFeFpcNj8WaZt5A==
X-Received: by 2002:a65:5a87:: with SMTP id c7mr7664384pgt.237.1585473758132; 
 Sun, 29 Mar 2020 02:22:38 -0700 (PDT)
Received: from OptiPlexFedora.fios-router.home ([47.144.161.84])
 by smtp.gmail.com with ESMTPSA id b3sm7366962pgs.69.2020.03.29.02.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 02:22:37 -0700 (PDT)
From: "John B. Wyatt IV" <jbwyatt4@gmail.com>
To: outreachy-kernel@googlegroups.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Payal Kshirsagar <payal.s.kshirsagar.98@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: Replace udelay with preferred usleep_range
Date: Sun, 29 Mar 2020 02:22:04 -0700
Message-Id: <20200329092204.770405-1-jbwyatt4@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: "John B. Wyatt IV" <jbwyatt4@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix style issue with usleep_range being reported as preferred over
udelay.

Issue reported by checkpatch.

Please review.

As written in Documentation/timers/timers-howto.rst udelay is the
generally preferred API. hrtimers, as noted in the docs, may be too
expensive for this short timer.

Are the docs out of date, or, is this a checkpatch issue?

Signed-off-by: John B. Wyatt IV <jbwyatt4@gmail.com>
---
 drivers/staging/fbtft/fb_agm1264k-fl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_agm1264k-fl.c b/drivers/staging/fbtft/fb_agm1264k-fl.c
index eeeeec97ad27..019c8cce6bab 100644
--- a/drivers/staging/fbtft/fb_agm1264k-fl.c
+++ b/drivers/staging/fbtft/fb_agm1264k-fl.c
@@ -85,7 +85,7 @@ static void reset(struct fbtft_par *par)
 	dev_dbg(par->info->device, "%s()\n", __func__);
 
 	gpiod_set_value(par->gpio.reset, 0);
-	udelay(20);
+	usleep_range(20, 20);
 	gpiod_set_value(par->gpio.reset, 1);
 	mdelay(120);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
