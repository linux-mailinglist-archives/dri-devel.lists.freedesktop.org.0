Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AD22A7925
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E509F6EA15;
	Thu,  5 Nov 2020 08:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6F789DB9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:50:08 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 23so23666593ljv.7
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TOGvVUHcibmPsiJFYWy41eUdIfTQfcWXxsgewF1xVKg=;
 b=hl9PYTeGaxu2o8M5LrEu6BtKQP8m6rA7XTM+RoY50/kPsRxa8J9MTXuP+rCTLD4pPI
 pcl/iTlEfddLxoJvSDTQMPheJb67tlB86IDV1YHFTv0Wm3/tj1K0nE/nVwYVhPdPaJYO
 NnCYXIPOOTIAbOp4kEH0pOeZMlF5DTw/3I3HK9+Lh2E52CEKYMxjgguS2YbdTN9m6wv1
 NPtSS5cdQ9nHITAZMxMqyhbWonBhdZgkc7Bv4mSlbYvQ/7kJwrY7rUXzCOAfmrk6TzBU
 LghymARrfDpLRWy51/4HibOiUXHV5K2mzHPJyddJU7D/shVzQT3S+jUOgkFUtnIGEflH
 pR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TOGvVUHcibmPsiJFYWy41eUdIfTQfcWXxsgewF1xVKg=;
 b=pqpNBGciikHzKnje5vgZHjno5CJeL4yP5T+zdOq4O7an2RbtvQ06NnWZHdxeilTuOt
 sZG5WQb56VNu2q2ktV4162pHYp7Vvvu9S/Co/MJ1w3eBreLpV51AnlJQF4P06IeVt4vI
 0PZlvo0Do68veHImvKAci5obK2YJ/3SxKSmn5utbOWloyg47pPhCMaziWKCnssJCxiRr
 nLKKxPJCrEf1yiGHKkVJ4wBPCK15Rw8Hx2b3EwsFCNTir2hUBs4edA7xc1JCTFci971y
 svrV5C4lghaMOw/kOfc04Fsf4Io1qiNNLWdiLIuCX/aFvNQEqf0ypGStu28mP8/OFbYZ
 ZqNA==
X-Gm-Message-State: AOAM532CZD5CPGGY+PkFbBTh+QzdC0AV1z1yj7oSa7OeJ2mspeGSzq/1
 GL2iUeFy0BMPE2BVnj8V/+Q=
X-Google-Smtp-Source: ABdhPJxze63P/PqGfFrXgCrXBjeFwj8H2RVN0iP7KJpDm/DqMJe1meNS4slHrFYeL5pTc5ZW0q+wPw==
X-Received: by 2002:a2e:5d4:: with SMTP id 203mr577835ljf.137.1604508607389;
 Wed, 04 Nov 2020 08:50:07 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:50:06 -0800 (PST)
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
Subject: [PATCH v7 31/47] memory: tegra: Add missing latency allowness entry
 for Page Table Cache
Date: Wed,  4 Nov 2020 19:49:07 +0300
Message-Id: <20201104164923.21238-32-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104164923.21238-1-digetx@gmail.com>
References: <20201104164923.21238-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:03 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing PTC memory client latency allowness entry to the Tegra MC
drivers.

This prevents erroneous clearing of MC_INTSTATUS 0x0 register during
of the LA programming in tegra_mc_setup_latency_allowance() due to the
missing entry. Note that this patch doesn't fix any known problems.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra114.c | 6 ++++++
 drivers/memory/tegra/tegra124.c | 6 ++++++
 drivers/memory/tegra/tegra30.c  | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index 48ef01c3ff90..ed376ba2d2fe 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -15,6 +15,12 @@ static const struct tegra_mc_client tegra114_mc_clients[] = {
 		.id = 0x00,
 		.name = "ptcr",
 		.swgroup = TEGRA_SWGROUP_PTC,
+		.la = {
+			.reg = 0x34c,
+			.shift = 0,
+			.mask = 0xff,
+			.def = 0x0,
+		},
 	}, {
 		.id = 0x01,
 		.name = "display0a",
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 0cede24479bf..e2389573d3c0 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -15,6 +15,12 @@ static const struct tegra_mc_client tegra124_mc_clients[] = {
 		.id = 0x00,
 		.name = "ptcr",
 		.swgroup = TEGRA_SWGROUP_PTC,
+		.la = {
+			.reg = 0x34c,
+			.shift = 0,
+			.mask = 0xff,
+			.def = 0x0,
+		},
 	}, {
 		.id = 0x01,
 		.name = "display0a",
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index fcdd812eed80..b1990b4133d8 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -36,6 +36,12 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 		.id = 0x00,
 		.name = "ptcr",
 		.swgroup = TEGRA_SWGROUP_PTC,
+		.la = {
+			.reg = 0x34c,
+			.shift = 0,
+			.mask = 0xff,
+			.def = 0x0,
+		},
 	}, {
 		.id = 0x01,
 		.name = "display0a",
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
