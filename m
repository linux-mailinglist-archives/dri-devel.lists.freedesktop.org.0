Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A501D2A78FB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D63C6EA02;
	Thu,  5 Nov 2020 08:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292646E86C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:45:10 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u18so148265lfd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XFGG01cA595FrKS40PcuSC81ebTEtiTSpfS/ywMG7UI=;
 b=qCfnEwxe9a5udeJa2CYrqVZ5I2a9hmgiqZ2QaqEHjaKRgf2VXGvsewyVcIb28yZDc0
 NJtW1jYdxYxihEwtJ1JhHLt9GCrLEFLun5Srgpe/bZELevxRnAmujiK304OirJi3UZ0h
 OezhThzvVvw8gpQg9av4VU+hB8LuL1lQEpkLkPSBAJ44qZcPhCH6IpgDnyi1uDWq2TP8
 RYuqmPWz/JIvDnAxVgHW78wUUMZny2+47MlJ+gq2nxNa+CFz2O475KuV1N/UI1JeRY6C
 ieR4nU66wpG5FBdE1CzoaJ8S3Cn+p4XlpoQHf4l3Z7bAPbdtXXraV7xxJFeb1rAmopbi
 NZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XFGG01cA595FrKS40PcuSC81ebTEtiTSpfS/ywMG7UI=;
 b=fI+YMVbdp5FaFTKSReBsXkOhZMCA2tAFJQtdPNregrxNOB3HJkC9wYTFydVkWhsSa2
 5w6qbmL45QZh5sHr1rX/DouSB6isVSjk2MdDUvhppEl3AUg+ctGoNh9ayIWxQ0WxFsbV
 udEeMzELMHts2UE/cwYKA89zEjWO03IslrH9x613ehcWbfh9TH2GwrQpL3SRS3j1mNMF
 C+hGaX+S468TOH374IefQMqOihLt8klkkCxQYjtO3mQQnFYrLY9t5GmuuMnHRJC2ey81
 1jYwoUnO/sKCYXwZS23H9TTa8UE2tZyuLLjwE8f/XBU6uq6BonnJByqfKV6zBmfV1Vl/
 wsYw==
X-Gm-Message-State: AOAM533LlokILhxICrS2OG9VbEQ0hLhFrI0mjZLy6RHL4Vzr8ZTq2Iyx
 q06ZKeDD/AVzF5KArE93abA=
X-Google-Smtp-Source: ABdhPJxQAtS5/q5gEZTmOVMhIUSEXN1Ufp90D/WwdUezL1q7/08kLqzAjVTVWhHK+ZA/8JqkDwT3GQ==
X-Received: by 2002:a19:c55:: with SMTP id 82mr55638lfm.84.1604533508654;
 Wed, 04 Nov 2020 15:45:08 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 15:45:08 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Alan Stern <stern@rowland.harvard.edu>, Peter Chen <Peter.Chen@nxp.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH v1 09/30] soc/tegra: regulators: Fix lockup when
 voltage-spread is out of range
Date: Thu,  5 Nov 2020 02:44:06 +0300
Message-Id: <20201104234427.26477-10-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104234427.26477-1-digetx@gmail.com>
References: <20201104234427.26477-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: devel@driverdev.osuosl.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix voltage coupler lockup which happens when voltage-spread is out
of range due to a bug in the code. The max-spread requirement shall be
accounted when CPU regulator doesn't have consumers. This problem is
observed on Tegra30 Ouya game console once system-wide DVFS is enabled
in a device-tree.

Fixes: 783807436f36 ("soc/tegra: regulators: Add regulators coupler for Tegra30")
Cc: stable@vger.kernel.org
Tested-by: Peter Geis <pgwipeout@gmail.com>
Reported-by: Peter Geis <pgwipeout@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/regulators-tegra30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/regulators-tegra30.c b/drivers/soc/tegra/regulators-tegra30.c
index f7a5260edffe..fcf824f73131 100644
--- a/drivers/soc/tegra/regulators-tegra30.c
+++ b/drivers/soc/tegra/regulators-tegra30.c
@@ -198,7 +198,7 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 	 * survive the voltage drop if it's running on a higher frequency.
 	 */
 	if (!cpu_min_uV_consumers)
-		cpu_min_uV = cpu_uV;
+		cpu_min_uV = max(cpu_uV, cpu_min_uV);
 
 	/*
 	 * Bootloader shall set up voltages correctly, but if it
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
