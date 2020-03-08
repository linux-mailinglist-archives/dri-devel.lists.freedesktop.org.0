Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B95A717DA6A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 09:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C016E3A4;
	Mon,  9 Mar 2020 08:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E0789F27
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2020 22:38:34 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id o10so1227632ljc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2020 15:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FL3h+cwZbCflVAndR4xdKBkAeyuMHCA8U7gScLSQOHY=;
 b=MAn0cLKAZHWrc94pPcfyc06cXQ1tIIh5eDouh2Kdz9liJN2PTfcSJ8gN8h7WFzxlPn
 3DVad+nEU4ZV571KhvzrWgscaBNGheZfYJV4IR85LyVAQit+mYWnFPtPcmjrWU+DuUZU
 vh92AyjHP9krKH08ncGfMQOvsr5H8NlGScwsPdEIt8BVLsedVqtmcG43WdnOh72nUouW
 YZ3HlPedxQCtQ9UM5uQqA+8IXnGRWvHRsOyb2G2NZc7OESIq6fpYSZ7ysBTnAAFpu5yw
 5ISdUtOVpTu++Mm09RMaVH+1ZgWbQ1bmU+Y5vrPQrohTMufNMt1mPmCSgvPMiXTOczNy
 4Y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FL3h+cwZbCflVAndR4xdKBkAeyuMHCA8U7gScLSQOHY=;
 b=LeXbhRVexQbzLW11IQ2fgHQ2Ta8kncJdH1bZSzHrrJcOK+UTm1QLyttjbmbnjVWSaO
 cPpOz4r4OdX8QVdm4T/LkDcnCv/S2nhfpb8lgZCfhC7xNUMaJTPHckHJxipcwyl4VJJd
 A4sh0r6IEPCVSY8y9RwSyl/U5qA2Ig0Q79ijlNbSgAeGThANWwclo8Dcs4bpuoHw+YYO
 4RE5GK1OxZmDY0tbwTjbqtwOMA86BKjSI235KSGoHP5NPghT3Mmu0+60gTjLB8e3xfWY
 Celj0Nuedz06G7Y1dgNL8lbvBBKwUD5++V9erU4UwoXFJF5mngRI4KmgZ4Tka2QYnBES
 zCzQ==
X-Gm-Message-State: ANhLgQ2MTvFpA8E9vA+zDnVSrF4BWcariKYOq76XYjCJO95tVBGOBTEL
 o7dAiVMqMCA4f3O7AOZn9Xw=
X-Google-Smtp-Source: ADFU+vtzjE1ZJLaO3rZlQoL8vIdhE6Mf4SoDYV2M4VAmzeiq8fBRH5ED4Unb0x3lRKJkZTU50B1moQ==
X-Received: by 2002:a05:651c:1078:: with SMTP id
 y24mr8171476ljm.102.1583707112536; 
 Sun, 08 Mar 2020 15:38:32 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru.
 [94.29.39.224])
 by smtp.gmail.com with ESMTPSA id y20sm18757695lfh.20.2020.03.08.15.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 15:38:32 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 3/3] drm/tegra: dc: Silence RGB output deferred-probe error
Date: Mon,  9 Mar 2020 01:38:09 +0300
Message-Id: <20200308223809.23549-3-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200308223809.23549-1-digetx@gmail.com>
References: <20200308223809.23549-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Mar 2020 08:13:37 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Driver fails to probe with -EPROBE_DEFER if display output isn't ready
yet. This produces a bit noisy error message in KMSG during kernel's boot
up on Tegra20 and Tegra30 because RGB output tends to be probed earlier
than a corresponding voltage regulator driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 56d933e81797..d7f2c4654b6b 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2571,7 +2571,11 @@ static int tegra_dc_probe(struct platform_device *pdev)
 
 	err = tegra_dc_rgb_probe(dc);
 	if (err < 0 && err != -ENODEV) {
-		dev_err(&pdev->dev, "failed to probe RGB output: %d\n", err);
+		if (err == -EPROBE_DEFER)
+			dev_dbg(&pdev->dev, "RGB output probe deferred\n");
+		else
+			dev_err(&pdev->dev, "failed to probe RGB output: %d\n",
+				err);
 		return err;
 	}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
