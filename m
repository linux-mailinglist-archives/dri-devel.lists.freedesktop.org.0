Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0015130B9A8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B026E8DA;
	Tue,  2 Feb 2021 08:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3896E7D9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 14:42:22 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id e133so6725324iof.8
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 06:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vYWcn7sL4czH23insMbT/xXB/qPApleY+YB9g2DqZvw=;
 b=srCiPPLg+FKyiypCOM4HhWnQR9qLFpjBesMwYf6bJhq048o7gMqqliN0JoZ8TIrxx7
 lR2AhWdnqqRR1yM8pTNZYzgB5D8LFIvmsSp6UIlW0Gr2G8pHtDgwTswLA+T1xcC2Dz/s
 mTlTAYHbuU8GsoSGFIPPk3pUzkWkll0EbNP9gVdE2gFkJMUBTmiMZzLO9V+QwNpYCnXt
 MbaY22d3pkt7aVOjdbwzfFPez1PFGZ3tqSgM0E/8Yx80X2gkuLgvRACpuQICL1UX77g+
 gJkyjLusERVpodvFNV/sUnBP+SOlagv7mVfC7PYEcgFauxvzGa/6GHQT9ARSfjY9Z3Jx
 ShAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vYWcn7sL4czH23insMbT/xXB/qPApleY+YB9g2DqZvw=;
 b=eMGjawKgcm94PbH+YJmGEMwll0fcM10lTaA/0OcoaPSP/gOMTZht8gCm2e+VC74FMx
 8UCWnMpvJP8Z55x9/21q8kkvCXrp9+HkYD5vBanWw8WqGhqEqp8yZWynH+nYdUikrxa1
 X6YDU221POV1JVbxhfkBFaOWbrDMfgxvGR2yEyG+e9EWtvWpwF1hpeQDGUZgEP0c2Z1C
 l8Ms47f4d7NCP0nPEbfGnZVryz5803MK0vUdcVqRIQBT9t4m+KN4ysXV2mzi77hMbfXU
 zF5zU8hidKu2qSn+Nf5qRPq2XcaurNo+C4QXs8PsT/bsdmxj3u5uQm63jSv5YsK8E8de
 phqQ==
X-Gm-Message-State: AOAM530MjHx3yW7yRLRFifiViwyF6l0l0zYGgIgXMoWYcqf5JdQ/S16Z
 jEwEbn7JJNIp5toCx5FId+0=
X-Google-Smtp-Source: ABdhPJybG8fZlQcKGj1GssmKBu/UxhmQ73Q9+3UlPhYlNwH0kDkW72buRTLQh4I5AFqrw8SG5cAWhA==
X-Received: by 2002:a6b:7501:: with SMTP id l1mr12314288ioh.92.1612190542355; 
 Mon, 01 Feb 2021 06:42:22 -0800 (PST)
Received: from spring-Precision-5820-Tower.cs.umn.edu
 ([2607:ea00:101:3c74:b4b0:f34c:770:f33f])
 by smtp.gmail.com with ESMTPSA id w2sm8470106ioa.46.2021.02.01.06.42.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 06:42:22 -0800 (PST)
From: Wenjia Zhao <driverfuzzing@gmail.com>
To: 
Subject: [PATCH] backlight: pcf50633: pdata may be a null pointer,
 null pointer dereference cause crash
Date: Mon,  1 Feb 2021 08:41:38 -0600
Message-Id: <1612190499-73818-1-git-send-email-driverfuzzing@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, driverfuzzing@gmail.com,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Wenjia Zhao <driverfuzzing@gmail.com>
---
 drivers/video/backlight/pcf50633-backlight.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/pcf50633-backlight.c b/drivers/video/backlight/pcf50633-backlight.c
index 540dd338..43267af 100644
--- a/drivers/video/backlight/pcf50633-backlight.c
+++ b/drivers/video/backlight/pcf50633-backlight.c
@@ -127,7 +127,8 @@ static int pcf50633_bl_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pcf_bl);
 
-	pcf50633_reg_write(pcf_bl->pcf, PCF50633_REG_LEDDIM, pdata->ramp_time);
+  if (pdata)
+    pcf50633_reg_write(pcf_bl->pcf, PCF50633_REG_LEDDIM, pdata->ramp_time);
 
 	/*
 	 * Should be different from bl_props.brightness, so we do not exit
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
