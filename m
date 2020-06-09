Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7B51F4F17
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CE36E3CE;
	Wed, 10 Jun 2020 07:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A676E2C4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:39 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y11so23349094ljm.9
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AOO2W4vvP/igevCu4IH6JEPHANPVq7vKrjpVvFg7+eU=;
 b=A51TyIWJ7Rx+M/S8Z4AxBJiGchLlAeYlZ9ygTRNM9UaeJytu7axCuE6NJ30tVQb/Qr
 wEt4bI7SGiqBmsN23yEmDSXOk+m58XiRM6LaVPColj+n/rZS7rRxDn59tMQNy4EigbVN
 nYYQAN9mrEc6YG9EFJrx/xV9JUFeBG56QJaaK6ctw0n9H4UKpcK0yeWeLRtKGRx0Ilpf
 YcOWTe4IS6rfIefYSChRPl65tCRS5zLpNX7ENVYDg8VG/t+Nzn6WGjwFHYKKfIFm6jzj
 1OzrGWgkKUDR7rluN2q1UJjrqxJpHT1ZyFL0NCnjLpU9/VG3Pvc+C+YBL4o5gX6JHfDZ
 DhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AOO2W4vvP/igevCu4IH6JEPHANPVq7vKrjpVvFg7+eU=;
 b=jL5jIXRiCd1z+wXe5zesjnPx28pyWCKXpk83jZEK0oSprMA6c+9wfH9gRR5eprV0QT
 kZ1Kbi7Zjr5Lp1fxAMh21BZb27RmyXc6j+R3S4U6A6vt6XOXcp/ZPAX8gEeqeT7CDxgi
 sGKwgErgWcr9gi4p2yYdGy6pBYgERj2ZoljrCU8yVXdhhiok2VBRBYvJHq1c5QPZ14kV
 ZfyHjiWt4MtaRPm5VU3QlF60skgP+lLFatt6qi8orgB7QclTx07RIa1tMFYFfzQotRkK
 wUxqnjuLq9YHqR5SexGRaUT57g+cOLOgLcLDMQc77XSqW7s2AE/hywpUxO1oNhy6GC7V
 Zu7A==
X-Gm-Message-State: AOAM53182Lf064MCYwH4dScG2TKr1libDcCj2RiFAlG/b+d10Hum8fwh
 9dhJ7DetAaYFtYPe8sqa0TI=
X-Google-Smtp-Source: ABdhPJyVqj4ryz9H2FvaQa4kZS3Q1Z6etIVNWy3kfiBgX8s492y43kO2ILP+3gviTVFVyE7n7KtZEw==
X-Received: by 2002:a05:651c:1213:: with SMTP id
 i19mr12768662lja.116.1591708477515; 
 Tue, 09 Jun 2020 06:14:37 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:37 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v4 10/37] PM / devfreq: tegra20: Silence deferred probe error
Date: Tue,  9 Jun 2020 16:13:37 +0300
Message-Id: <20200609131404.17523-11-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tegra EMC driver was turned into a regular kernel driver, it also could
be compiled as a loadable kernel module now. Hence EMC clock isn't
guaranteed to be available and clk_get("emc") may return -EPROBE_DEFER and
there is no good reason to spam KMSG with a error about missing EMC clock
in this case, so let's silence the deferred probe error.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra20-devfreq.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
index ff82bac9ee4e..6469dc69c5e0 100644
--- a/drivers/devfreq/tegra20-devfreq.c
+++ b/drivers/devfreq/tegra20-devfreq.c
@@ -141,9 +141,11 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 
 	/* EMC is a system-critical clock that is always enabled */
 	tegra->emc_clock = devm_clk_get(&pdev->dev, "emc");
-	if (IS_ERR(tegra->emc_clock)) {
-		err = PTR_ERR(tegra->emc_clock);
-		dev_err(&pdev->dev, "failed to get emc clock: %d\n", err);
+	err = PTR_ERR_OR_ZERO(tegra->emc_clock);
+	if (err) {
+		if (err != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "failed to get emc clock: %d\n",
+				err);
 		return err;
 	}
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
