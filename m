Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE10245D13
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BC56E486;
	Mon, 17 Aug 2020 07:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150426EAC5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:34 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v9so8115285ljk.6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kNoHRWC/OTeJQYDVSJWGL8N8QOi/3TrdM4od2HXXDz4=;
 b=ui2VOlU7pA5o0ooPGCogDYofZDQWu1s2EnbOMwNFowfgtAewNgBcbu4CwCkemJv6Uu
 nkXn68iBqSa74VV27cZ+FMt7U8U37hU8WA+MWEs5qIZGCtR86Yhz/IZLHEMWZkYlKTBf
 +IEUzEGxFbqen+Xj+9i65BC55p6LEJrUzn0hKDEz0QfhxSgoFbrzillDWjgMOeNlss6S
 CeKG0n5QvV2lz3tEgXaHRmWpJ/Twa5GR6yjOWvbnfWU7kd203fNXlU3TYxnYMMSUmztX
 pBURil1BuC4a6+v28osGxR9oa6nJ2AFvbCkt4UmkTZpnRKN3b9PE2xBte9F3Dm/FFBIC
 8F9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kNoHRWC/OTeJQYDVSJWGL8N8QOi/3TrdM4od2HXXDz4=;
 b=oo7KsxYoTzdWwmnqKZkywKcgUmlVkWnqOgh9X61Zf7E30UKdQcvwHs1pTGYTFolwT8
 3JnHNEGiejwWDJrd7kmtxvlCcgeO6W9GfkaPPiyWaWn/nwsENYF8bu4H1nbSQjHVHP00
 /ZsbUL8BMK399MSM3D2hmYm5wH6Hq9FBvsJdxdly9b+svYIYw+RD/F5JQVtk/qgDq5vX
 THZowkc4G/BYC2BiSN/Oi1inW8/GZyZlEivVIy16ki6m58Cr2OPXVzBfGZVSWNoyRUep
 V82JdR/0Mk1PHF7nXXIQrNVhi2j5UJAzsZA1VTqYDe0oZHroEFamIAPmdt+pnvgkGftU
 Zabg==
X-Gm-Message-State: AOAM530d7chlxMA4hCoJnbfPRlS2KznFhXmHoSTXTBzYzwNcJM3W3VgU
 zPQrGXgOuc+WEp5IGu7fiuU=
X-Google-Smtp-Source: ABdhPJwzwyM2g3DLM/2D/MtnfuAylkbujM7XanOCIb5raluuebjKuWbBRWk8wwVbdGkFOlP50xVnmg==
X-Received: by 2002:a05:651c:d0:: with SMTP id 16mr101309ljr.313.1597363652508; 
 Thu, 13 Aug 2020 17:07:32 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:31 -0700 (PDT)
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
Subject: [PATCH v5 28/36] memory: tegra20-emc: Use
 devm_platform_ioremap_resource
Date: Fri, 14 Aug 2020 03:06:13 +0300
Message-Id: <20200814000621.8415-29-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814000621.8415-1-digetx@gmail.com>
References: <20200814000621.8415-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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

Utilize that relatively new helper which makes code a bit cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index a02ffc09c39e..db6a4bcb92fb 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -696,7 +696,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
 	struct tegra_emc *emc;
-	struct resource *res;
 	int irq, err;
 
 	/* driver has nothing to do in a case of memory timing absence */
@@ -731,8 +730,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	emc->regs = devm_ioremap_resource(&pdev->dev, res);
+	emc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(emc->regs))
 		return PTR_ERR(emc->regs);
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
