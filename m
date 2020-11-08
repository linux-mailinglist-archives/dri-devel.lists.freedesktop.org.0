Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D32172AAAB5
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 12:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEE589D66;
	Sun,  8 Nov 2020 11:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6123189D66
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 11:35:41 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 11so6534784ljf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Nov 2020 03:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zsO9qj3hOff5NOSOpIFrZ8MIY2eqvEyld04gtQde6C4=;
 b=pN0KXhJODW+P8Wzfmyw02AyzBjJ2PBJoG7Z8IodtHhjrK1lqb27iGoAkM1UbcR6SU/
 uEzC6JJSO6GDTU2jkZIqElUu0bF8+6JDcsALZAAZEBENFwr4QYjVpyEhGGzFceizZbP+
 5lm/NxpKVPZYCxb1SsxYytqsEYoJz7Fvl55jErL4At0xSPfVPO5y8V67GFxpk3Sjl16P
 N6mk6bDDxcepiH0qmhA7twcOCyXd1GSdR04VZ8eqUk7/wkE0EKyluEgnsQgmvTykhu5g
 LRDiuomV7oIEbAtittTquyNNfa5mLiYWBC0Va7PAY6ihM0ROSMYlqJWnzBQVwPB3mcAZ
 mdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zsO9qj3hOff5NOSOpIFrZ8MIY2eqvEyld04gtQde6C4=;
 b=RbOdnwLVV6fhePEUMAzzTXWFHA+5FSgLY8ksa9GBGKXqkt5Ga9cAzAAzRDn438BhQD
 +U0MXiNbEjn2Zgq18UkrkSwxyydOphNuMCr81I79tin/VsLHh/h3LVJkCx7eF1q7KZUo
 hp5lmCLzZvOO4glY2WOHurqBlM8keXq6Am672HIN2K2sy4zZXqi9hkY0WOEdGT4w+47N
 dlPGuijby+zdhFkbr/ut1QMFrHYSHSkFAVXHjb+fsWVBC5lg4Ln6AP37F2ljGAUOPLMj
 P+W2T24r1UCrk3RWUmg1oKBRix6O9U+++pQW94KuUqvaijoHIJfSw3qWFKLDWAjIId0G
 FJRQ==
X-Gm-Message-State: AOAM5329VpUg5n6xjB5jsUNxcxRNIf8/EQBRcWftwNR/gjuYONixtOG+
 GDAJHdfB36DeAUUAmfLvICKuPWZKCCVgO0ax
X-Google-Smtp-Source: ABdhPJwm1SjNX6ipLvHWY88FbQVhPRfmC+eeU+d7JnKsfVnoA3SeCAqxed15OC7WFrCHv0l/rTc3Og==
X-Received: by 2002:a05:651c:506:: with SMTP id
 o6mr3827631ljp.249.1604835339581; 
 Sun, 08 Nov 2020 03:35:39 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id z188sm870028lfa.141.2020.11.08.03.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2020 03:35:38 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/mcde: Fix unbalanced regulator
Date: Sun,  8 Nov 2020 12:35:35 +0100
Message-Id: <20201108113535.1819952-1-linus.walleij@linaro.org>
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
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we now turn off the EPOD regulator to reset the
hardware, we need to balance the regulators after that
point. If registering the master fails we only need
to disable one regulator. Fix this by open-coding
this leg of the error path.

Cc: Stephan Gerhold <stephan@gerhold.net>
Fixes: c4842d4d0f74 ("drm/mcde: Fix display pipeline restart")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index c592957ed07f..92f8bd907193 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -413,7 +413,13 @@ static int mcde_probe(struct platform_device *pdev)
 					      match);
 	if (ret) {
 		dev_err(dev, "failed to add component master\n");
-		goto clk_disable;
+		/*
+		 * The EPOD regulator is already disabled at this point so some
+		 * special errorpath code is needed
+		 */
+		clk_disable_unprepare(mcde->mcde_clk);
+		regulator_disable(mcde->vana);
+		return ret;
 	}
 
 	return 0;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
