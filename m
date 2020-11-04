Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1DE2A78F1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E300F6E9FA;
	Thu,  5 Nov 2020 08:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBDD89D9B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:34 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id v144so225375lfa.13
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AHtzrrepL8FLGGKPOwuB3OE0fpn5LFvoU4c2khdwzPk=;
 b=XM0pGDcMd53mhhwvHwq2NuOHBudK621+lRSRX6ORhsBYU/+mmOkgtziFDbI04bAlDd
 qAHJdK6azj3WR5sywwArvU0OlgtQxXMsZ/utcCcNBveXgtwsiGD2W9kGZ/2rMxlqmeov
 hNZpXL8P/4NIyQOKW5BKS8TrBGIUx9gzgvr8O/vEQ7lq+OzNEdVLnOyqD45K61A7kFfN
 6nNUAuvmw708ErfFqgWuzzvzU1kHkKh2ZedrRdqb1HWauu/GK4l9DsB/1OPJTvQGA8Ae
 fMZfB/IK4UC+rXzjtX0iieh+/OAPCprZ6FR98khPEjEtxcBVnNvV+OVfSI0Lztvyf8Yx
 Nq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AHtzrrepL8FLGGKPOwuB3OE0fpn5LFvoU4c2khdwzPk=;
 b=pp4dh0uT+pWSN9+rOzasSoZ16zuqZ9nfCVTRybhR2XsAi3FL+4jyA7qv/IoIKV/qdi
 e2LyZUcPDMszNSRvvLW+cKYVVUJYFpeXwLuTpLZwnZzBGbfnf1Hgxmo/dYtad168sPJH
 RPrbU04SqRVeFGBulgSamxcAUMa3O9qSlvq74LxH4rB/o8gR9J4A1O33ZLOC+XQGpT4H
 mMMHFKVIIXAOtujPTmmqhYvogADHDxTYx+zZKvjavGIW+MsTjew3U24NG9m5zMWdwkRV
 WYKKfxk/bdIIQofrCBGAek6zoFHQAZVLYvUcnGKeMIC74UpmBLlmHBajiY5I+HoCa7B3
 ZaYw==
X-Gm-Message-State: AOAM532BIA3y2rOBRud9eMYUMcCllpZSWVAX7CC7E9rjMfstnNyB4S8A
 JV102TLR/xXXPRMPKas1aT0=
X-Google-Smtp-Source: ABdhPJzb2kabU1emK04P7CDpE6ygpI0Ouh+Sky5hlfE9yzMJYFBqyj9cy/H74kx+Re6BsAu8ih58Cw==
X-Received: by 2002:a19:c8c2:: with SMTP id y185mr1328884lff.29.1604508572781; 
 Wed, 04 Nov 2020 08:49:32 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:32 -0800 (PST)
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
Subject: [PATCH v7 02/47] soc/tegra: fuse: Export tegra_read_ram_code()
Date: Wed,  4 Nov 2020 19:48:38 +0300
Message-Id: <20201104164923.21238-3-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104164923.21238-1-digetx@gmail.com>
References: <20201104164923.21238-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tegra_read_ram_code() is used by EMC drivers and we're going to make
these driver modular, hence this function needs to be exported.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index cee207d10024..590c862538d0 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2014, NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -90,6 +91,7 @@ u32 tegra_read_ram_code(void)
 
 	return straps >> PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT;
 }
+EXPORT_SYMBOL_GPL(tegra_read_ram_code);
 
 static const struct of_device_id apbmisc_match[] __initconst = {
 	{ .compatible = "nvidia,tegra20-apbmisc", },
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
