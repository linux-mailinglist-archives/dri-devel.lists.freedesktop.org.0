Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D858313E53
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 20:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E2C6E9B8;
	Mon,  8 Feb 2021 19:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C5F6E9B8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 18:58:57 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id t63so15564069qkc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 10:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jYhNq9J4eUCsJQlyB7QDTAg4cfCspRt25Vic1ErfLYE=;
 b=CqixGP/PzRiRbv/LMmJxXg2aPCD6CwmtfGrFoOzBjw9hlC5/BWTQOqPnvOpotAcnS/
 qXTtdYim1pxsFkV3KMZKQG8c5zzT5l8dW4xStkWHis3v+ns1X9EaSMMKNOzTI3olEM3S
 w9rtyQr8aPUaE6v7HLgx6M2k/vEehnm72uJrtIpKmYLYQ17cuR5otqxyWvVu5a/y1Q2f
 UKTVMzJHsGHS2wL0+LSW3kMHdRf7rDD7BlDzyBWit9fMnibCKJ2FJKIRe95FYMnL6YDK
 lcR1L5fRH+ZFPR2yQ5LDS5BNm/kHIOAwej4FsofoTQYA92bgZM4yyY5NJBalUZK1Am9q
 JI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jYhNq9J4eUCsJQlyB7QDTAg4cfCspRt25Vic1ErfLYE=;
 b=JXevH/EdS/Z4xFeB4rKrYAWLr7vMOX2jUkQiIyHQLhwQKy9zllwTmqh1Sa1u5a77Pb
 aaw+PymeDqqoOhzXDYPC834vqeBLSMYdwUMtQ5ngfd7aHEZYntYG33srs3/fAMj6f2Aa
 4bQH4E9TRS/UYIRObmEn6qI6aUejsb4ixKdDxn+1gwhYQI06lvsqRGM830kTJFvPl1Kz
 VLfzBIo7G8U16Fj78PYt6x33UyJmu/Y7SSqHLgn/nIA35ZHHAOnwAp41NBnKj78u0prR
 Mzf94SXO+sgpLqsk00UqCwjsmK9iNUTDLOzGggs18O//YwGprUhsy3092u/r27CEoyI0
 Lh8A==
X-Gm-Message-State: AOAM530+PUNF9CXlJW1KtrF3vB7Ia/Ma5Y1veFUiP0um2oK3lfWodK3b
 paUzSJwAVszsko044QIHpwsfLg==
X-Google-Smtp-Source: ABdhPJxBgoyARebzLux0sy3rxY2UD6jbjWyAv34vrESk8EiNTwfqkD/P/dRw1REVGzbBLj/BH/aj3w==
X-Received: by 2002:a37:a7c3:: with SMTP id q186mr4972322qke.475.1612810736317; 
 Mon, 08 Feb 2021 10:58:56 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id o46sm4069218qtb.76.2021.02.08.10.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:58:55 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: fix a6xx_gmu_clear_oob
Date: Mon,  8 Feb 2021 13:55:54 -0500
Message-Id: <20210208185557.15703-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Feb 2021 19:01:23 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The cleanup patch broke a6xx_gmu_clear_oob, fix it by adding the missing
bitshift operation.

Fixes: 555c50a4a19b ("drm/msm: Clean up GMU OOB set/clear handling")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 71c917f909af..91cf46f84025 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -339,7 +339,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 	else
 		bit = a6xx_gmu_oob_bits[state].ack_new;
 
-	gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, bit);
+	gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 1 << bit);
 }
 
 /* Enable CPU control of SPTP power power collapse */
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
