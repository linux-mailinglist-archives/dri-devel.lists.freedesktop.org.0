Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5623B2B3B1B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F806E9EE;
	Mon, 16 Nov 2020 01:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E076E9E1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 21:33:20 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u19so16122063lfr.7
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 13:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iEcxOMp1NLOMF0Qi1vlqDEHmnss3NDqpNYlgo52Rbfc=;
 b=lXS3HiSsnEqc6AR8AaWtwNjKCLrhEhS+nSrbmu8b7vopM4l8ZVWioON+5jYSsLoaM8
 a1arLGaw+zTR6pSwBXSN3/eKjQbPc0jBcRKgjaIj1TqdrIMlN6RqDUemAQOAVEhLe/yT
 I9DNoqlMV/phAzqeaJE8P0vySPpPbajdujVkKTxz950TzWhOOq21KGhOLvVJAyNMZz0Z
 Gf9RswheRxrrMFsh4NihXTH4sOW1FyCfVSh9NcFMbFq7byuQ2TbX6N5XRNkiNdQhEIv1
 tIIs1p+nU4euvgjHf40aAHQhDX/1ypg6yBlcERsssVDi0TuoYwPtEXXq/TY84IfUJaD9
 tp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iEcxOMp1NLOMF0Qi1vlqDEHmnss3NDqpNYlgo52Rbfc=;
 b=J+kV5CD9gPZZ2QWyJWmMncHQYh28RrM7oqMzjMmKmIOUoTjDXc/z/loWzLaRa+meQn
 vpzPTaPP0I62ySqIfYq+j3u8wYptG1bdMgZJkz08o8z6I4x5q0rN+p5Pq6lO5ueQCg2h
 sqwRKC5E4Z8DKCxiZHz6VVH1RFKdT5e3jDAwidaJRoqQEn7edbI56RalyBv3XeMw/Q96
 PCPp7u9MQmZbwMsuRqQqYqA8EEJ/8f/ryfs1nO8bLeK0E4hawtD1GOcKREyEpplpiDG5
 FFFUYU2C7ZNQecj7rY7yH7KusJMwDpqeuB3yaQUqGHSQGWChrHkkwZAt9+zWXmwrrCNa
 BEEg==
X-Gm-Message-State: AOAM530n8nLXyEql/omSHWV7oOSNvFTcXXkX9FNTqDxsPMgtVAwsS3VS
 mxhBBMJMC+ShVA5NkqEqPJ0=
X-Google-Smtp-Source: ABdhPJxQn0b1TgtIIsx4pYPR1+xf/Od/q1CGBVV94Ksm1gZDO5gg75PeUHiFEI7NDYOLoBlz0r+ohg==
X-Received: by 2002:ac2:4543:: with SMTP id j3mr4040093lfm.511.1605475999179; 
 Sun, 15 Nov 2020 13:33:19 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id o3sm2462055lfo.217.2020.11.15.13.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 13:33:18 -0800 (PST)
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
Subject: [PATCH v9 03/17] memory: tegra124-emc: Continue probing if timings
 are missing in device-tree
Date: Mon, 16 Nov 2020 00:29:08 +0300
Message-Id: <20201115212922.4390-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201115212922.4390-1-digetx@gmail.com>
References: <20201115212922.4390-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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

EMC driver will become mandatory after turning it into interconnect
provider because interconnect users, like display controller driver, will
fail to probe using newer device-trees that have interconnect properties.
Thus make EMC driver to probe even if timings are missing in device-tree.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra124-emc.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index edfbf6d6d357..8fb8c1af25c9 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1201,23 +1201,15 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	ram_code = tegra_read_ram_code();
 
 	np = tegra_emc_find_node_by_ram_code(pdev->dev.of_node, ram_code);
-	if (!np) {
-		dev_err(&pdev->dev,
-			"no memory timings for RAM code %u found in DT\n",
-			ram_code);
-		return -ENOENT;
-	}
-
-	err = tegra_emc_load_timings_from_dt(emc, np);
-	of_node_put(np);
-	if (err)
-		return err;
-
-	if (emc->num_timings == 0) {
-		dev_err(&pdev->dev,
-			"no memory timings for RAM code %u registered\n",
-			ram_code);
-		return -ENOENT;
+	if (np) {
+		err = tegra_emc_load_timings_from_dt(emc, np);
+		of_node_put(np);
+		if (err)
+			return err;
+	} else {
+		dev_info(&pdev->dev,
+			 "no memory timings for RAM code %u found in DT\n",
+			 ram_code);
 	}
 
 	err = emc_init(emc);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
