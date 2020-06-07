Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE581F0F03
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DC06E3B0;
	Sun,  7 Jun 2020 19:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29C56E394
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:21 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id e125so8874643lfd.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tzjWXOFJZUWh4EJTzInOXHHEbdt+siqMf/YejHURVDA=;
 b=hLlbN5QYcF1A4KVzUxLK2BgoLYJMQG7Blmal4anzav1J2m26hk7H82gnkxk1js+Xni
 98o3OoyeT6oRqwdE1zr32OawoCqKpjc0jEO8PsYmabIVg12Ibet0bVUN3sN/vwbnCrLh
 s4gc82tZaSsdcozgTpT/gq7Gpb8/boqO1YTkDdaOX/rfFvSVEawK+e59GLxWCMffkz5G
 cIO/Z+0Hsn7hbZyeYMXaZ6cjmS+cq94dp4GV5yyAzHOdbtr8oxcaVg5uhiFCQjAKFC+C
 RCcxjNrZqBI4lXtlSxVPBJiZHnKQhQsZPkk39djKWeUjs/CVYbhnbdKxcdm/0/I6UyFI
 CbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tzjWXOFJZUWh4EJTzInOXHHEbdt+siqMf/YejHURVDA=;
 b=YHr8i7CM4mMdStCtF0AwSTVgJjtuK9VZ7qebWPdpdP0SyvAs34Nt605oiLTXdn5fhd
 ac1aGeFeDvwr5/WOks1rBrOr+s2J566cHl2XJeXz8GFHXKcF4Oea9jtTb8bBiTHblppN
 qGtEPv86y5ER9DsGvvPpVzRllzq8T92QoE2Mopj/Mxo/DeFObnY73zSqrT309DsHEQOr
 qDE77Q+3ma3YDZ+AkIzakaTCII2/qa2LxLK4UDDYESe7gcWvjwNF3h9NQHkjpkqQZCXf
 GKhiey1FlI4/IUmzNf/1GcUWOlnLiqAScrfWSDXKUsTve5dL1ZMo7eEN1oSvitpUYPtK
 uOIw==
X-Gm-Message-State: AOAM531YJnYGD8L6JB81cxE3o3WSPDxeTjDxerSNR5P8+DpqweukMuMx
 FrJpNpGnrvZ205oOuV2uFBI=
X-Google-Smtp-Source: ABdhPJz95THuT13m/xyIJeJooBD8AxA5DNApvVZa6hnrfOxX9B/baYyCOZvQxeb4UPEHYfdsisVEcw==
X-Received: by 2002:ac2:5324:: with SMTP id f4mr10821248lfh.209.1591556240161; 
 Sun, 07 Jun 2020 11:57:20 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:19 -0700 (PDT)
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
Subject: [PATCH v3 08/39] soc/tegra: fuse: Export tegra_read_ram_code()
Date: Sun,  7 Jun 2020 21:54:59 +0300
Message-Id: <20200607185530.18113-9-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200607185530.18113-1-digetx@gmail.com>
References: <20200607185530.18113-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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

The tegra_read_ram_code() is used by EMC drivers and we're going to make
these driver modular, hence this function needs to be exported.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 3cdd69d1bd4d..b3c930b805c5 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2014, NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -65,6 +66,7 @@ u32 tegra_read_ram_code(void)
 
 	return straps >> PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT;
 }
+EXPORT_SYMBOL_GPL(tegra_read_ram_code);
 
 static const struct of_device_id apbmisc_match[] __initconst = {
 	{ .compatible = "nvidia,tegra20-apbmisc", },
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
