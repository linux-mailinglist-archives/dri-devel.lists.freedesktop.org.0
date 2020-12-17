Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B5D2DDFDD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E9E89D8E;
	Fri, 18 Dec 2020 08:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82E16E1CF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:38 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id m25so59779505lfc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NlDMl6XjPevCn3rRvWT/f1VR4LdbuUD4/E02zVLuVCI=;
 b=RTWkhu3VqMqpDCA4Qo24BTJf+2HuJmLcparbZ+4myGwK1DNAzIGrgipPwwDKIIjrKS
 ePerczxp+6zHrPN6Dqn9OXFrwkqgqVZKTxDtaFeEELTEv5tlBstMf0P3QwYRzM20vWTM
 BliaLVxvI1nhJVyskHZ3FMESXBjgr+oWdWqVqRNm2rlei11rc3wpmZbdQ4odalL2zKWD
 GwaPJoY/LSJ0dqPxg3Bq/HrsjDS7nXr5Uxa2HsKYjBt0fe7/MWnpeLhAWQ//k18Hkb4W
 Qgu8Q7C+KU3jCZyrFKxqARUQD6npMHl2BNPx+eMXU587ADHJ5fD/w80+TTFH/cNU5wLn
 gbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NlDMl6XjPevCn3rRvWT/f1VR4LdbuUD4/E02zVLuVCI=;
 b=Hwo8khfwYbr7FsLGChYn+BFI5TVO7gtMqKe3jkXhrCwW2ssidy0AdZBhiplenqeX7a
 usn1Uiox2HLOGBCydhZe3oKyhZtBUFtvVoG/18ncGPml8SpvnfGqvvk616GTDz9HrHeb
 +qnGfvm0pYikmYC1382wYwNxLDcJItpeLUqsT8im6LCIlpcswt3BvD86GiU+xC5Y7s4i
 +bDGQmJxxhLSJSBVbAVvLftop5S4PyIAGYPvsqV3X5Mryf73nCQRAYM90/XQ98Ygl1F0
 eUhdGQXzBpuRD/krXuAwO/Y2WZ3giUbatT+MmrEP1se29KcPcT1UUJ28esITdemH9f6A
 ukyw==
X-Gm-Message-State: AOAM5327jPTYEaGqqIIGkeAvuzYsk309Lqj6kYwvwIe/51YPdQy+W25W
 sLBX1t+u7XS+BwB8s2HlpTM=
X-Google-Smtp-Source: ABdhPJwLHLuEJNjyRdVPWt6WXEB6a0huo4TKPk5vwaRTMIFRcOi8N+JmP0jdXRGsy84KSAUugIUQMQ==
X-Received: by 2002:a05:651c:2dc:: with SMTP id
 f28mr207871ljo.13.1608228457280; 
 Thu, 17 Dec 2020 10:07:37 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:36 -0800 (PST)
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
Subject: [PATCH v2 15/48] opp: Support set_opp() customization without
 requiring to use regulators
Date: Thu, 17 Dec 2020 21:06:05 +0300
Message-Id: <20201217180638.22748-16-digetx@gmail.com>
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

Support set_opp() customization without requiring to use regulators. This
is needed by drivers which want to use dev_pm_opp_set_rate() for changing
rates of a multiple clocks and don't need to touch regulator.

One example is NVIDIA Tegra30/114 SoCs which have two sibling 3D hardware
units which should be use to the same clock rate, meanwhile voltage
scaling is done using a power domain. In this case OPP table doesn't have
a regulator, causing a NULL dereference in _set_opp_custom().

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 3d02fe33630b..625dae7a5ecb 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -828,17 +828,25 @@ static int _set_opp_custom(const struct opp_table *opp_table,
 			   struct dev_pm_opp_supply *old_supply,
 			   struct dev_pm_opp_supply *new_supply)
 {
-	struct dev_pm_set_opp_data *data;
+	struct dev_pm_set_opp_data *data, tmp_data;
+	unsigned int regulator_count;
 	int size;
 
-	data = opp_table->set_opp_data;
+	if (opp_table->set_opp_data) {
+		data = opp_table->set_opp_data;
+		regulator_count = opp_table->regulator_count;
+	} else {
+		data = &tmp_data;
+		regulator_count = 0;
+	}
+
 	data->regulators = opp_table->regulators;
-	data->regulator_count = opp_table->regulator_count;
+	data->regulator_count = regulator_count;
 	data->clk = opp_table->clk;
 	data->dev = dev;
 
 	data->old_opp.rate = old_freq;
-	size = sizeof(*old_supply) * opp_table->regulator_count;
+	size = sizeof(*old_supply) * regulator_count;
 	if (!old_supply)
 		memset(data->old_opp.supplies, 0, size);
 	else
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
