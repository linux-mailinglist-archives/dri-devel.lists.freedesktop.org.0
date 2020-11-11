Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B312AEA7F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF1989F0B;
	Wed, 11 Nov 2020 07:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9BC89D6C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:15:18 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id s13so539882wmh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yHNbWPkrTb0yyMBNVbyvruwI0j5FiAUBfarfcvC5tnQ=;
 b=K9k6yRTEzRmQ2mqzH5BNitSKPtlpx5UPNyhzsfZ3CZXuqxGDCx+3rLioJqtOWRX7fp
 GbN3Z2ONcjIEOS+L+3kpNplyVgPAAmJausNFSZRSiSLtZ+b3GzkEf2kB2mJWffy5Xe3u
 JEHqAM96aaGSh5bOoWD4xKBjGg0L8V7soyOGoA040QWKRSMP3moX2v+LtsF2BOmH763w
 hbVeRZVjSXWFcegE64SVArJbvvlhk/NzXEyHzezsolEqZOAjfMozyFGUI6b7wDlxEYRp
 1nP8o2gTAfpMlgQh9BAzAcYfURzlthM0rb+bnS76SmQ5u2S3b6yay63PmoRoKGb8wiqq
 dTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yHNbWPkrTb0yyMBNVbyvruwI0j5FiAUBfarfcvC5tnQ=;
 b=gLyPZiKcCNge1lFwHVYGwOaNZk+rl7a7YFSRX2uvUm1W47UdfvWQuSHZ1wEHJ4C6cc
 2wHBRU3seiNinuCKwHad9B5utH6+EW7DPhnMB/R3TZrMxpVWUR7KXPcUrZ8XtOthHkJ2
 r1Hdd4Rib0hkmqXBh1ded90aKPq+7HeYu9G4ub9Haudbvt79qnQ//gFZ6kEkViXZxVKm
 l4+Lvfokd1HewA3+Bpl8D4R6bs/KYqUo9uXdUfpHEYQI+k/6ypVs0OweI3SYsiDMhpzI
 QmOM+dOsKZILwxjBV63T8UeKbqpKdxPyAeaj5g+Gxsd4dmUwXXHy/dsQDXdVqIl02Odt
 0loA==
X-Gm-Message-State: AOAM533kuRJ5Gv+NVMbRItcyYSQM5FA1p4remJoBP2rOrn8HjEBdM6Um
 R1i2JVCGwj5sKM9KBaa/JYY=
X-Google-Smtp-Source: ABdhPJwMpC8/L0r4cSYNPDf8hWqCNiTg7SuMpXF6Myd+0zGn4oksOR4Ah3UwA/Ww+8eibE7SXUT9kQ==
X-Received: by 2002:a1c:e442:: with SMTP id b63mr995368wmh.10.1605057317711;
 Tue, 10 Nov 2020 17:15:17 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id g131sm564329wma.35.2020.11.10.17.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 17:15:16 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v8 05/26] memory: tegra20-emc: Remove IRQ number from error
 message
Date: Wed, 11 Nov 2020 04:14:35 +0300
Message-Id: <20201111011456.7875-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111011456.7875-1-digetx@gmail.com>
References: <20201111011456.7875-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove IRQ number from error message since it doesn't add any useful
information, especially because this number is virtual.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index b9cd965980e2..0320d9df4a20 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -1131,7 +1131,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	err = devm_request_irq(&pdev->dev, irq, tegra_emc_isr, 0,
 			       dev_name(&pdev->dev), emc);
 	if (err) {
-		dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", irq, err);
+		dev_err(&pdev->dev, "failed to request IRQ: %d\n", err);
 		return err;
 	}
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
