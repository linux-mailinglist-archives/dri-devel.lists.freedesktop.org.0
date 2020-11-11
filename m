Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EDC2AEA69
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A8989E63;
	Wed, 11 Nov 2020 07:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B249C89D42
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:15:11 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id s8so707256wrw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/1K9JydNjYGGf9JAlOSaGXH6qVrxRvoP2lWgFH96HkM=;
 b=Cv5xWDPxk8xXbLs5HxX3RHPoQ/O/30KrlaV8JsvI3UTW6WMi5ZV+DQ54BFGXpXnzRh
 LS8bW/a948cqvlFJyN0Wbux7TFaNwROVzyqnFZVwDmeYIwOFNza/f4AO7yHPyUiMLAlw
 NQnndH3KjL36McTSqribKgR/IOaviwOVCedknltWno/Y9aCOxtOZMAQclYpov8HlFjX/
 fPveqyNS8OZF4MeDIuitsWpTPStiNqY4woFrR9u7P//VET5Pl2kJS5AicLZQa3PVTqhM
 DFGNS32ZnNL8QPDjCQ1lkHlx2crcMWW1hCWpR2/0C2WRrvnJIkQLvuTBdsgKt87DlkZx
 Rq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/1K9JydNjYGGf9JAlOSaGXH6qVrxRvoP2lWgFH96HkM=;
 b=e3w/FzNl8LKdZcoLrxgZajcwsychjQWZxB3dLtCV7PFQjM/2tGbbQjRUQwRFFZ5hQW
 1HLfbtWhaRCIzN00sU2GmYD18jRs2OVr4NkoMAIGBPf4fZFTcgLfj6mOMbE1gMI44Lao
 UDoS1sO9lLn6cIY2gaioLdFAEoNtv57+pCge0p5OE5sxYoZWKF3zrHycDBro+WtvROGx
 0dsQgTrJCY2k9QwFRcuJfDmd22M2jZeftP78PeT28sArHrl0EPDqciYyBSazXV99cK5y
 kt8szlf3nR2ryy280mTjEG2kFlb1VdDmxBe5QPTrVVWGMEpE7sUJzho2lknnAWVadhRC
 HC6w==
X-Gm-Message-State: AOAM5317a7JNRpYoirhn+mFat0Y81I6dGKO78zmXRgRu7siYfZBnKKCz
 eqJeOVmlcIl1rBDK8W4pJYw=
X-Google-Smtp-Source: ABdhPJxvEtZ5NFZK3kxR71AKCtUXUe9qQEAfSqUzxsusNyNRfVl9g47Ovk4aXVdck1fJEYx6IMfhJg==
X-Received: by 2002:adf:f40a:: with SMTP id g10mr28589174wro.58.1605057310315; 
 Tue, 10 Nov 2020 17:15:10 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id g131sm564329wma.35.2020.11.10.17.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 17:15:09 -0800 (PST)
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
Subject: [PATCH v8 01/26] memory: tegra: Correct stub of
 devm_tegra_memory_controller_get()
Date: Wed, 11 Nov 2020 04:14:31 +0300
Message-Id: <20201111011456.7875-2-digetx@gmail.com>
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

Correct typo in a stub of devm_tegra_memory_controller_get() to fix a
non-ARM kernel compile-testing.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/soc/tegra/mc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 43876216de34..d731407e23bb 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -207,7 +207,7 @@ struct tegra_mc *devm_tegra_memory_controller_get(struct device *dev);
 static inline struct tegra_mc *
 devm_tegra_memory_controller_get(struct device *dev)
 {
-	ERR_PTR(-ENODEV);
+	return ERR_PTR(-ENODEV);
 }
 #endif
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
