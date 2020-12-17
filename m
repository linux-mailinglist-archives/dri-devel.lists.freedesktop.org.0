Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F7C2DDFAC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994C889B12;
	Fri, 18 Dec 2020 08:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D456E20C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:56 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id o17so56902562lfg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G4bkjkogJjxhucwk91y1cMW03U1PPlta2j9gVHq9Ll8=;
 b=rCQoU2/mmvaocNvlxnid7FO29LSc024mSugBl0tdXdcytFbXH2gOlnpwvt8N+30PAg
 yb7ttQI7FzhzKZR924B0d/3R9LNPoRgpBoGk0IOcVJPsgsWCQsxmEeE2TiSNUf6U2zEk
 UAcyUD0vHfvlRRaoHCc/jZeM8FZ6u+jxT5WvXS4q07C3L49UI1+T4YyeAM47/km2IUMY
 +h1CezyjEzhVg+SazrlVF4o2uUgbBVRUzc6A6H4zBIs3ZtIXUR4lCvTjP1X8Ma8ljpX9
 s1nx5sADEfu0hG1dR8Px9QD2KFwkR1jqfRP1a8gQc0nLBI4Jl41CHBYNpt0S5HTVpgKO
 Zxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G4bkjkogJjxhucwk91y1cMW03U1PPlta2j9gVHq9Ll8=;
 b=jUlQoW1Cdn05jJ1x7NzrG0RkD27chSnaze8lW2t5LFTIYC0DMGQ9P5mqQp1dc2WNJ6
 RFhl25Ods3yimPrQY8YL8qOVu0tOj3KpwDJ+ABPEB9d3WsKXTixhj3AuRw6EAGaJme33
 6PDPEZC/3DbUOr+G37onhJX9q/8GDQoCxRo0OAt43h0vj0BxlIonjDPsM6iFBBeCluuK
 Ge78MmzzIG639Ey80jUf+YxRJhrFAzHF7g/Qzxx38sjIuv4AmvQ3ZY2FgJSDvay85Nbm
 422GECnZ5NfuqXScldghvLs0WHG3zdGerZe/+NaxqoDMIbdEvjEYMPefMUmWdrP1lYQl
 RCAg==
X-Gm-Message-State: AOAM530a23H/4e1rcFkRLeisl6zAKO5FCwTHHpCGxVTtL0M6idpa0gwR
 sMxEk00aGaegDz7dCZ9OF4M=
X-Google-Smtp-Source: ABdhPJyqYsSi5e5FbU0bmUx3znLJH35GGikhngE/ppL8K7VwQ0KK0y3SqjiWzxI9i0uAFK/MRB0qlg==
X-Received: by 2002:a2e:9b4d:: with SMTP id o13mr200509ljj.163.1608228474656; 
 Thu, 17 Dec 2020 10:07:54 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:54 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 30/48] soc/tegra: regulators: Fix locking up when
 voltage-spread is out of range
Date: Thu, 17 Dec 2020 21:06:20 +0300
Message-Id: <20201217180638.22748-31-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
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
index 7f21f31de09d..0e776b20f625 100644
--- a/drivers/soc/tegra/regulators-tegra30.c
+++ b/drivers/soc/tegra/regulators-tegra30.c
@@ -178,7 +178,7 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 	 * survive the voltage drop if it's running on a higher frequency.
 	 */
 	if (!cpu_min_uV_consumers)
-		cpu_min_uV = cpu_uV;
+		cpu_min_uV = max(cpu_uV, cpu_min_uV);
 
 	/*
 	 * Bootloader shall set up voltages correctly, but if it
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
