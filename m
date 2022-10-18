Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C788C602459
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 08:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B0F10EE77;
	Tue, 18 Oct 2022 06:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334C610EE9F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 06:25:53 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id e129so12463463pgc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 23:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MYvjR3g96YfEQ0ewsYWqZk7cyUEKObEBSCZcF/olNgQ=;
 b=DJLHQ5hfoAbDCUNbz0QZQvIogzuJKKKs24q4fILB7q7h0ZaMw970yKPRmeUtBvpUoD
 cSdviupKi4vP4ua+AyO6cNjaCX44UQW1s4PSAs4EK7VQkOB+DHADafwt+7JfULanDNgi
 nZbcNbmTATpmC7WgFetn4OMXYzflslEOgGaWnCTdKiY+SiUxAsOTDKkPdQdXfVNlk2Xr
 GbuVEF/YffIhOVmW7qKRsfiRovt/BoG+4mfTLqPAR0jAdyebNPEl6ThMtryCYXkb/G1f
 7gdXX3cL7chK301bGbHfEBlV/5dSWVQgaSXncF0AnjwO9VmTVFg5oBqfa3rcHMJF7n+c
 zyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MYvjR3g96YfEQ0ewsYWqZk7cyUEKObEBSCZcF/olNgQ=;
 b=dUIjvgGH+XMJ4JDJEWmWwuAcA23enXysR6nlT/2KL7olZsXUii11BpqFUs4Y8FpRfW
 aLhg2ETWWNn2kG26vGii4W5sTzhGuZYcQujFJ808kPUqohz/0E7P3bRdTpYXXPTUKYD0
 r88bOxFXhHYfsEPFQu1fEzVyS2ZMP3Udgxd6y+yAkRnS3VGb1+puua/kB2j2wEZRObz6
 w1w1Hs2T7Ev/P5obEWvI/ls+XeS+llh1rYbf/BQ0ROkqe/Mf1SeQuWFXHnis02HSZ/Sw
 2FqFPvwPk5h0Sk1qxG+zh6wPfSu3GrIAzGNy+QURMe86DpLB/70RID2j+NFQH3qfOMSn
 2UGQ==
X-Gm-Message-State: ACrzQf3yMmMMuVA5ltQBxdDqonbBwiy1ESzMOpl5WKMSZynskY01G4j9
 dctxxUuLMHrQj/GMHZmRs/U=
X-Google-Smtp-Source: AMsMyM6xmbI68eieYRNV6FtgudrgCp1W0ORZiMBBgIF1oHpeB5ilIrFBwQhCvnSq7hmKG/lq8lPf7w==
X-Received: by 2002:a05:6a00:807:b0:563:136f:a4fe with SMTP id
 m7-20020a056a00080700b00563136fa4femr1658881pfk.36.1666074352645; 
 Mon, 17 Oct 2022 23:25:52 -0700 (PDT)
Received: from carlis-virtual-machine.localdomain ([156.236.96.164])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a1709027ec100b00172973d3cd9sm7672413plb.55.2022.10.17.23.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 23:25:52 -0700 (PDT)
From: Xuezhi Zhang <zhangxuezhi3@gmail.com>
To: deller@gmx.de, zhangxuezhi1@coolpad.com, wsa+renesas@sang-engineering.com
Subject: [PATCH] video: fbdev: sm501fb: onvert sysfs snprintf to sysfs_emit
Date: Tue, 18 Oct 2022 14:25:48 +0800
Message-Id: <20221018062548.642910-1-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xuezhi Zhang <zhangxuezhi1@coolpad.com>

Follow the advice of the Documentation/filesystems/sysfs.rst
and show() should only use sysfs_emit() or sysfs_emit_at()
when formatting the value to be returned to user space.

Signed-off-by: Xuezhi Zhang <zhangxuezhi1@coolpad.com>
---
 drivers/video/fbdev/sm501fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb.c
index fce6cfbadfd6..f743bfbde2a6 100644
--- a/drivers/video/fbdev/sm501fb.c
+++ b/drivers/video/fbdev/sm501fb.c
@@ -1166,7 +1166,7 @@ static ssize_t sm501fb_crtsrc_show(struct device *dev,
 	ctrl = smc501_readl(info->regs + SM501_DC_CRT_CONTROL);
 	ctrl &= SM501_DC_CRT_CONTROL_SEL;
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", ctrl ? "crt" : "panel");
+	return sysfs_emit(buf, "%s\n", ctrl ? "crt" : "panel");
 }
 
 /* sm501fb_crtsrc_show
-- 
2.25.1

