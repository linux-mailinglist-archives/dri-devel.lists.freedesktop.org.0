Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5650C2DDFE9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE6F6E02D;
	Fri, 18 Dec 2020 08:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89FA6E1E9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:30 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id u18so59829657lfd.9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=85Y5Xy0sCYGIXnoBRS4PIkvg6O/T96bo2+JpLeZeoDU=;
 b=HO8B6pRWWY34CmtfEP2kpsIswJ2lPhhfqt6pCe/KhgZFrWjAvhfVC/olegJlNCb7eF
 UI3MKbRzrqIhUSxGSc5Ajvbj/hJs+jZ8oq79wnAhjB7etVTaRWe4bMbSawUlSSLPp3Sm
 gCkoFwyBIrpdeWNZ5sjoyHEP793xOAsMnj6a4mh49sHgbLePE2qqdLPbO9YOXsp09Ar5
 fFnxwvcfqqIwW6ZgiE1KVVbHtu/AdCwcdYddZ+PNfP7cZL8U7GJO6Xf5MAWOk7rTpt8Q
 hKO49nwhSnI90wCCw8KhsSWqHvaLpPRSm/m3rAfl3WzFoYpQz3bkg9b+THJ9m6P12R5F
 8/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=85Y5Xy0sCYGIXnoBRS4PIkvg6O/T96bo2+JpLeZeoDU=;
 b=ZdI5KQFWyhd2B2EsB/6OLzBpTS7dbJknHgLDYb+OS29sB6pTK9nOzbuL1HNKW8jvh+
 U1QUVh0AuF7vzFU6dSptpoq1bFEkF8mbFeksRKvKd551si0oKlXoKrOMa6SPS7GwTl9F
 KnK06aj8eDmCcTpKTdXG5DbtCjLONFPp1ToAqsu9d4a9mBnECClgyLR2B0fJg/iJheKn
 XLgIPUx5kKx3t5X3JviyUgBq9VeF/V+Z+pzKTPfTi51FlqwhHyJ2tZZNJ9hjIZImH50s
 NxFYZ7P8+0yxs54HznIfXCNMBKEwRlkvMW1urOM6u0RIR7tVskM3VX6C+ZR4fOIXBnn3
 LEnQ==
X-Gm-Message-State: AOAM532F0tqVCZm4Vp6CRXtXNrWsyx+rnuxL1kjpBxaiQ3yT7TvbbfVH
 8w4ix0wbaM+pDzsbEGITnp8=
X-Google-Smtp-Source: ABdhPJxdsk3SmejHPdeEJpjzdTthLwWs3KYuEnkts5yzgKLNEZKMY28YcLV/8fEvQKXp+zJuE2Yd2Q==
X-Received: by 2002:ac2:4359:: with SMTP id o25mr5495403lfl.536.1608228449259; 
 Thu, 17 Dec 2020 10:07:29 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:28 -0800 (PST)
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
Subject: [PATCH v2 08/48] regulator: Make regulator_sync_voltage() usable by
 coupled regulators
Date: Thu, 17 Dec 2020 21:05:58 +0300
Message-Id: <20201217180638.22748-9-digetx@gmail.com>
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

Make regulator_sync_voltage() to re-balance voltage state of a coupled
regulators instead of changing the voltage directly.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/regulator/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index ca03d8e70bd1..576efb815eb8 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -4131,6 +4131,12 @@ int regulator_sync_voltage(struct regulator *regulator)
 	if (ret < 0)
 		goto out;
 
+	/* balance only if there are regulators coupled */
+	if (rdev->coupling_desc.n_coupled > 1) {
+		ret = regulator_balance_voltage(rdev, PM_SUSPEND_ON);
+		goto out;
+	}
+
 	ret = _regulator_do_set_voltage(rdev, min_uV, max_uV);
 
 out:
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
