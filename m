Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564A42DDFCC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587DB89C59;
	Fri, 18 Dec 2020 08:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5026E1E9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:31 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id o13so36631313lfr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UciLuLVan0P0SH0oR2Zf1mFiYSDrxBfVN7jaTPVHllw=;
 b=aUHpk7k/bNFUizBJ9NAhFPP7O5TZO/wM8Ol/u8aIt3gZ9x3kH86JtXskjxBVjqT3VN
 hgbgaSF/3nKKMcdizRSAFP8bRTPWk69Z9Gt4F8YqU2dJ+52b4MGNlZ6YWO5gYPjErj/a
 hT5sWjNy0okhQ4km6Sa+6l8FwMx6iy5UBSD/PPb/QgXJBSzTUNx0rVq+i6viLDLHVwoV
 i1szlSQyGrXl5jz+/N/ZM4FWQ3pzvaMCO/mA12PzGz743GTFBFTgh8LQBiH4inY3JVgx
 6cMXpjHPHWIZyjbtsxU0pN5s0nz5bzQrAu+Sbzp7G90bLayZtcUOHSlsWBsfZ66iRjZP
 1NUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UciLuLVan0P0SH0oR2Zf1mFiYSDrxBfVN7jaTPVHllw=;
 b=Hc2IqUtMC46KA5zZ9rRim7Ffl5/9W1K3BEGwTPYvaEu5gfdImQTaHOOThx7OsUlgET
 z0dcBzA+BMx1xe2Q9pCktpEIJwTblp1TmHvYzQ3ieTzBXuvOda/nZnpLMJmgwIO3niUA
 Ev2RsYtafXyZf+SEp+8Wp4CaJm8c48mMYsdlP8jji/h/4v5fPhhd4JwIvmDiVYdsUTbl
 UWHFvZVmbka5EL8bqvyo5pRrYNrnTouYa/KZWdyYMKmAmX+fC5IUMvwvykQCfYPK3bct
 TnHaBx6psyi/8JNj7l7IdZQcWtoecTTF2ZEiTs5qblkCCszKSxp+BlC+aPHCBQfxOe61
 g+bQ==
X-Gm-Message-State: AOAM531I/uFme7DuRe8+oIazZehf9T0xZ7VPCNRYFvur1+HGR6tfvmOW
 +xOkxL8Vm8iC0UdbtQ6wlnE=
X-Google-Smtp-Source: ABdhPJyqRF/GAfRVFFJhIN88THdxl4cwg3KVxuRdpu65i6dxhir2dh7Hvi6opFqgBO7mbKTSa0o+vw==
X-Received: by 2002:a05:6512:2009:: with SMTP id
 a9mr674300lfb.575.1608228450395; 
 Thu, 17 Dec 2020 10:07:30 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:29 -0800 (PST)
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
Subject: [PATCH v2 09/48] opp: Add dev_pm_opp_sync_regulators()
Date: Thu, 17 Dec 2020 21:05:59 +0300
Message-Id: <20201217180638.22748-10-digetx@gmail.com>
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

Extend OPP API with dev_pm_opp_sync_regulators() function, which syncs
voltage state of regulators.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c     | 42 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_opp.h | 11 +++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 4268eb359915..500d6c716283 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2499,3 +2499,45 @@ void dev_pm_opp_remove_table(struct device *dev)
 	dev_pm_opp_put_opp_table(opp_table);
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_remove_table);
+
+/**
+ * dev_pm_opp_sync_regulators() - Sync state of voltage regulators
+ * @dev:	device for which we do this operation
+ *
+ * Sync voltage state of the OPP table regulators.
+ *
+ * Return: 0 on success or a negative error value.
+ */
+int dev_pm_opp_sync_regulators(struct device *dev)
+{
+	struct opp_table *opp_table;
+	struct regulator *reg;
+	int i, ret = 0;
+
+	/* Device may not have OPP table */
+	opp_table = _find_opp_table(dev);
+	if (IS_ERR(opp_table))
+		return 0;
+
+	/* Regulator may not be required for the device */
+	if (!opp_table->regulators)
+		goto put_table;
+
+	/* Nothing to sync if voltage wasn't changed */
+	if (!opp_table->enabled)
+		goto put_table;
+
+	for (i = 0; i < opp_table->regulator_count; i++) {
+		reg = opp_table->regulators[i];
+		ret = regulator_sync_voltage(reg);
+		if (ret)
+			break;
+	}
+
+put_table:
+	/* Drop reference taken by _find_opp_table() */
+	dev_pm_opp_put_opp_table(opp_table);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dev_pm_opp_sync_regulators);
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 1435c054016a..4c79faa2025e 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -156,6 +156,7 @@ int dev_pm_opp_set_sharing_cpus(struct device *cpu_dev, const struct cpumask *cp
 int dev_pm_opp_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask);
 void dev_pm_opp_remove_table(struct device *dev);
 void dev_pm_opp_cpumask_remove_table(const struct cpumask *cpumask);
+int dev_pm_opp_sync_regulators(struct device *dev);
 #else
 static inline struct opp_table *dev_pm_opp_get_opp_table(struct device *dev)
 {
@@ -366,6 +367,11 @@ static inline void dev_pm_opp_cpumask_remove_table(const struct cpumask *cpumask
 {
 }
 
+static inline int dev_pm_opp_sync_regulators(struct device *dev)
+{
+	return -ENOTSUPP;
+}
+
 #endif		/* CONFIG_PM_OPP */
 
 #if defined(CONFIG_PM_OPP) && defined(CONFIG_OF)
@@ -442,6 +448,11 @@ static inline int dev_pm_opp_of_find_icc_paths(struct device *dev, struct opp_ta
 {
 	return -ENOTSUPP;
 }
+
+static inline int dev_pm_opp_sync_regulators(struct device *dev)
+{
+	return -ENOTSUPP;
+}
 #endif
 
 #endif		/* __LINUX_OPP_H__ */
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
