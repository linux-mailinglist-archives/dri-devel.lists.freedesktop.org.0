Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C75B245CFB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96FD6E421;
	Mon, 17 Aug 2020 07:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805DB6EAC6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:11 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w14so8109856ljj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pct9NC8VO0a8nghXwi5ctazbfo4aqrjWxTsK8RkybFc=;
 b=nH8/nuDXiy+4Qdh4ChCGp+9h4XJ/9orptXrVOfCGXo8g+bGPVp+4G6DKAvwtXVNGcw
 3DJBl33KCs4+QjqTqoZ/qQgzaXBlsIj3EIL6WnA7qEZsl4chs+w/DA5HaJ+hgepPgCFH
 JLZMbAQO86mgVlzXaZ/zvut7677+7DAwt34OYK8h2q6Azv+5UC1p5rjW1S2K8j+Xgm0y
 oNaD/QUFefOibo4csQeD6FlxP+oiNdtWiVSyLuViPMRiAf7A5cwwDMdCqsM8bSeNu/id
 1N36EyGbl/SK/faEi5nfVZOvfGGtpvidQqg0ZX+6SksOzafnhQs1lXcXd4jT7QN0hB8E
 +lQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pct9NC8VO0a8nghXwi5ctazbfo4aqrjWxTsK8RkybFc=;
 b=P85+VVTVUpJZ4ivgOq3aCEeD3jrF6DpDm9LH4qCX3yqild2RzEyl5ciDJAU+seaw6A
 3YHt6uYcBfG7LlwQTedGWibPguZ+zTLTg+wQ2RjAxMV3GkAPtunbmnimdRZHzweOOlVF
 WUTHjFLEr2CtXA3CIExhjQjlLlmH74XOF8INRmexrTFyNPluzvmrhamqDT+5BL3COkQP
 FRdik5zvTvtbNvoB1ZcP1NqiXWNnORGmQO503VRIP+Kb3iOoEXjNrekCJ5redCYqpK5w
 p/hCebmejKbrZ+CWfaVYuXfRkQhl+j3L46qkbeezi8LRyxIk36mluiuSraDF3fQfCMMZ
 meBw==
X-Gm-Message-State: AOAM530w5EqwTpEs9h0nHG4Q/3CEYSOFY29O+rBQPKgcFjraLxG9aYDQ
 cl4bqMtI6fEjwiUAgyjC7ulgF3Af
X-Google-Smtp-Source: ABdhPJxPiJZrWxjd5umBuvDpZgsGH2/Uz9/ZQbEwecYHehDNeedDfyMunYNlTn8uBO3uFSmir3TMrQ==
X-Received: by 2002:a2e:9d91:: with SMTP id c17mr102359ljj.131.1597363629992; 
 Thu, 13 Aug 2020 17:07:09 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:09 -0700 (PDT)
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
Subject: [PATCH v5 08/36] soc/tegra: fuse: Export tegra_read_ram_code()
Date: Fri, 14 Aug 2020 03:05:53 +0300
Message-Id: <20200814000621.8415-9-digetx@gmail.com>
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

The tegra_read_ram_code() is used by EMC drivers and we're going to make
these driver modular, hence this function needs to be exported.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 8e416ad91ee2..151eccb6069d 100644
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
