Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A3233A60F
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 17:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22956E0CF;
	Sun, 14 Mar 2021 16:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A046E0DC;
 Sun, 14 Mar 2021 16:35:00 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id x16so4497106wrn.4;
 Sun, 14 Mar 2021 09:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mgZKFLRFAbBRu7Q5z215LMK01y6B/VlLhTD6jZqDHxk=;
 b=H8o2FrMfH9tVu1ztan+gWiBd5bSVUm05dSFXZPAoZffhE06GKaXK7RxLEX2BIZ+OSg
 KmSaaU1WbXyqIzqzbi4zmt4+Zz1ark29b9LV0ic78Irq7sIv+PRFji3Ht8MMMFTvs/WG
 R6rLeHeZQ0fInZZchJpX7vd9vxb3hDGw6d/bHB6xzSstme+lgVDvHrn5ilkZDuSw8Cy4
 NGS+cBsEtmktgYM2PICmTgp5kmLeZIn9q3pgc7idtv+GgAPwtDgfyNgy8+QpfB62MN0c
 hN7U4R348CTb70GQ15NLtWFsJNSF0ifkPMrnYf4SLCgu8BzQ5S3L+nbbns+OXXy8iyCg
 AiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mgZKFLRFAbBRu7Q5z215LMK01y6B/VlLhTD6jZqDHxk=;
 b=EvRICpPMX6+dlF0TnebHE2qkrsaVU3m34dXZKV8GcLTOKaBuUNG9mnkPd8UsDy6x1j
 ZZ1tVNcVxnbPCXqlvK/xaCK97SsaPq8LhcS7/jc8THxfNMnG8gxvGt8yqlzMdhiteAk9
 rPXAJQ25bRNMzzbDMexeMb2w8RM/zSh+um8tLx2IhmOpLAqzLPC9JuA4lvkSCEJcRVWp
 uLdHuV1KLNgyYKdjtnsxEoott3tJtaURPG+Q0ohMxBDf9JrTwGiXC1Cr/Gt3YQipHGOP
 Bi5e8N+KISzGX3V4hN8PJGOpIPXFGsUAYTNVq3j/z+SeCHP3qpR6jIXu4JX/g/yTECsx
 q1Dg==
X-Gm-Message-State: AOAM533EUqzafi1qF6o2fEhbAreEEXvbJyl61Tt/RF2nMTDV6u83Z8Py
 RjXDrleFsaxjNWLeL/m7Hk0=
X-Google-Smtp-Source: ABdhPJwPZqEVDSr9D0mUwH6ne5arFGsjVko9cENT/XLUXmmB5qBPOLoqvm+C5z1r87vsWkwte6sPcQ==
X-Received: by 2002:adf:fa08:: with SMTP id m8mr23720418wrr.12.1615739699340; 
 Sun, 14 Mar 2021 09:34:59 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id o7sm15723239wrs.16.2021.03.14.09.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 09:34:59 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v3 14/15] media: venus: Convert to use resource-managed OPP API
Date: Sun, 14 Mar 2021 19:34:07 +0300
Message-Id: <20210314163408.22292-15-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314163408.22292-1-digetx@gmail.com>
References: <20210314163408.22292-1-digetx@gmail.com>
MIME-Version: 1.0
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
Cc: linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yangtao Li <tiny.windzz@gmail.com>

Use resource-managed OPP API to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.h      |  1 -
 .../media/platform/qcom/venus/pm_helpers.c    | 35 +++++--------------
 2 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index a252ed32cc14..d35f60d2cb56 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -125,7 +125,6 @@ struct venus_core {
 	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct icc_path *video_path;
 	struct icc_path *cpucfg_path;
-	struct opp_table *opp_table;
 	bool has_opp_table;
 	struct device *pmdomains[VIDC_PMDOMAINS_NUM_MAX];
 	struct device_link *opp_dl_venus;
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 43c4e3d9e281..e61317220b9a 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -756,7 +756,6 @@ static int venc_power_v4(struct device *dev, int on)
 static int vcodec_domains_get(struct device *dev)
 {
 	int ret;
-	struct opp_table *opp_table;
 	struct device **opp_virt_dev;
 	struct venus_core *core = dev_get_drvdata(dev);
 	const struct venus_resources *res = core->res;
@@ -779,11 +778,9 @@ static int vcodec_domains_get(struct device *dev)
 		return 0;
 
 	/* Attach the power domain for setting performance state */
-	opp_table = dev_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
-	if (IS_ERR(opp_table)) {
-		ret = PTR_ERR(opp_table);
+	ret = devm_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
+	if (ret)
 		goto opp_attach_err;
-	}
 
 	core->opp_pmdomain = *opp_virt_dev;
 	core->opp_dl_venus = device_link_add(dev, core->opp_pmdomain,
@@ -792,13 +789,11 @@ static int vcodec_domains_get(struct device *dev)
 					     DL_FLAG_STATELESS);
 	if (!core->opp_dl_venus) {
 		ret = -ENODEV;
-		goto opp_dl_add_err;
+		goto opp_attach_err;
 	}
 
 	return 0;
 
-opp_dl_add_err:
-	dev_pm_opp_detach_genpd(core->opp_table);
 opp_attach_err:
 	for (i = 0; i < res->vcodec_pmdomains_num; i++) {
 		if (IS_ERR_OR_NULL(core->pmdomains[i]))
@@ -830,8 +825,6 @@ static void vcodec_domains_put(struct device *dev)
 
 	if (core->opp_dl_venus)
 		device_link_del(core->opp_dl_venus);
-
-	dev_pm_opp_detach_genpd(core->opp_table);
 }
 
 static int core_get_v4(struct device *dev)
@@ -860,45 +853,33 @@ static int core_get_v4(struct device *dev)
 	if (legacy_binding)
 		return 0;
 
-	core->opp_table = dev_pm_opp_set_clkname(dev, "core");
-	if (IS_ERR(core->opp_table))
-		return PTR_ERR(core->opp_table);
+	ret = devm_pm_opp_set_clkname(dev, "core");
+	if (ret)
+		return ret;
 
 	if (core->res->opp_pmdomain) {
-		ret = dev_pm_opp_of_add_table(dev);
+		ret = devm_pm_opp_of_add_table(dev);
 		if (!ret) {
 			core->has_opp_table = true;
 		} else if (ret != -ENODEV) {
 			dev_err(dev, "invalid OPP table in device tree\n");
-			dev_pm_opp_put_clkname(core->opp_table);
 			return ret;
 		}
 	}
 
 	ret = vcodec_domains_get(dev);
-	if (ret) {
-		if (core->has_opp_table)
-			dev_pm_opp_of_remove_table(dev);
-		dev_pm_opp_put_clkname(core->opp_table);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
 
 static void core_put_v4(struct device *dev)
 {
-	struct venus_core *core = dev_get_drvdata(dev);
-
 	if (legacy_binding)
 		return;
 
 	vcodec_domains_put(dev);
-
-	if (core->has_opp_table)
-		dev_pm_opp_of_remove_table(dev);
-	dev_pm_opp_put_clkname(core->opp_table);
-
 }
 
 static int core_power_v4(struct device *dev, int on)
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
