Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A36337D91
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 20:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085D66EB92;
	Thu, 11 Mar 2021 19:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2896EB87;
 Thu, 11 Mar 2021 19:21:40 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id r3so33451636lfc.13;
 Thu, 11 Mar 2021 11:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8i2m6/lbGAJtR7Xwt+kU6jxv1RbA+nyvb63j6asz8nw=;
 b=MUE9yscja7aODDVELlQzIVChcBIY3VT343YpkiHtPvHUx3/KmJumGYJWGzCDGGbDYx
 lBnHjCeSfpKyO5cSrJOG01g1+pZVsw/kqlS9XYfHSsavbSfJQNirkFlTmm0BBYoqhcn7
 5iz5VS2e9/JCdqaJs4A0fJQ1Y9dAvGwQWXPllP4p/X+X7xwW78N9LTa7PCvIbiyirWcB
 UQAQAtNx3B39+lHCgLkfVK60Egvxa+6XepdgUXoq54LQhRPeoHmZiVA0mFwbNOXywdtt
 LDWFTT/gmDp54FCYjR2m7BuwX0hOjgzZFRsNX9GKOgXBhs40uN3GQKwReR3haMNd8+9Z
 /vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8i2m6/lbGAJtR7Xwt+kU6jxv1RbA+nyvb63j6asz8nw=;
 b=N3EDKH4caaItPmpIiXqCKPziMPzNPj0BYRVxmuZhtXYfpp96PVwuMzJWYWPTxuMTLK
 OAkvzOOSf2PdaY8xhVT7bNUiob1xQ/+AmCqP2YdeSoa2LRDV+Fc/G8NaXlXfBq9aSb95
 PUMWNDu6WWlXVLK23FlOOPQGI0F5rROy/TiAxtQV7r31XKKH0+6orEyeycWV7AnKYdJI
 d5htHrXd/dsVcYFm5NNYYvRZk70LQXd3WBDEXxVt8fsT8zumGLV6uCP/a7TvXGexEQDe
 gk7qcMoAceHQKYiEt3aCmcPZObuJ+US1VQoFzQrLAkhshQUnWXJlREr/AeqBLVVq6TgH
 +sOg==
X-Gm-Message-State: AOAM532b57Gd+zAF+H5Z63t+7ZnKgtrPMv4D5m0BbUs9zAKkC6/B7J2b
 qx4HTE71bW6mJ+FJPEB3/Fs=
X-Google-Smtp-Source: ABdhPJzyUMWCLGE0yuiOb/wr0yRnTsa8uCE3SwXolRlUCGlz7AcSAe4t/FII105i2sbhdr3WZ15zHg==
X-Received: by 2002:ac2:5052:: with SMTP id a18mr3025894lfm.55.1615490498881; 
 Thu, 11 Mar 2021 11:21:38 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id u14sm1121153lfl.40.2021.03.11.11.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 11:21:38 -0800 (PST)
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
Subject: [PATCH v2 02/14] opp: Add devres wrapper for dev_pm_opp_set_regulators
Date: Thu, 11 Mar 2021 22:20:53 +0300
Message-Id: <20210311192105.14998-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311192105.14998-1-digetx@gmail.com>
References: <20210311192105.14998-1-digetx@gmail.com>
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

Add devres wrapper for dev_pm_opp_set_regulators() to simplify drivers
code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c     | 39 +++++++++++++++++++++++++++++++++++++++
 include/linux/pm_opp.h |  8 ++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 3345ab8da6b2..32fa2bff847b 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2047,6 +2047,45 @@ void dev_pm_opp_put_regulators(struct opp_table *opp_table)
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_put_regulators);
 
+static void devm_pm_opp_regulators_release(void *data)
+{
+	dev_pm_opp_put_regulators(data);
+}
+
+/**
+ * devm_pm_opp_set_regulators() - Set regulator names for the device
+ * @dev: Device for which regulator name is being set.
+ * @names: Array of pointers to the names of the regulator.
+ * @count: Number of regulators.
+ *
+ * In order to support OPP switching, OPP layer needs to know the name of the
+ * device's regulators, as the core would be required to switch voltages as
+ * well.
+ *
+ * This must be called before any OPPs are initialized for the device.
+ *
+ * The opp_table structure will be freed after the device is destroyed.
+ */
+struct opp_table *devm_pm_opp_set_regulators(struct device *dev,
+					     const char * const names[],
+					     unsigned int count)
+{
+	struct opp_table *opp_table;
+	int err;
+
+	opp_table = dev_pm_opp_set_regulators(dev, names, count);
+	if (IS_ERR(opp_table))
+		return opp_table;
+
+	err = devm_add_action_or_reset(dev, devm_pm_opp_regulators_release,
+				       opp_table);
+	if (err)
+		opp_table = ERR_PTR(err);
+
+	return opp_table;
+}
+EXPORT_SYMBOL_GPL(devm_pm_opp_set_regulators);
+
 /**
  * dev_pm_opp_set_clkname() - Set clk name for the device
  * @dev: Device for which clk name is being set.
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 6fb992168f1e..284d23665b15 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -148,6 +148,7 @@ struct opp_table *dev_pm_opp_set_prop_name(struct device *dev, const char *name)
 void dev_pm_opp_put_prop_name(struct opp_table *opp_table);
 struct opp_table *dev_pm_opp_set_regulators(struct device *dev, const char * const names[], unsigned int count);
 void dev_pm_opp_put_regulators(struct opp_table *opp_table);
+struct opp_table *devm_pm_opp_set_regulators(struct device *dev, const char * const names[], unsigned int count);
 struct opp_table *dev_pm_opp_set_clkname(struct device *dev, const char *name);
 void dev_pm_opp_put_clkname(struct opp_table *opp_table);
 struct opp_table *devm_pm_opp_set_clkname(struct device *dev, const char *name);
@@ -349,6 +350,13 @@ static inline struct opp_table *dev_pm_opp_set_regulators(struct device *dev, co
 
 static inline void dev_pm_opp_put_regulators(struct opp_table *opp_table) {}
 
+static inline struct opp_table *devm_pm_opp_set_regulators(struct device *dev,
+							   const char * const names[],
+							   unsigned int count)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
 static inline struct opp_table *dev_pm_opp_set_clkname(struct device *dev, const char *name)
 {
 	return ERR_PTR(-EOPNOTSUPP);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
