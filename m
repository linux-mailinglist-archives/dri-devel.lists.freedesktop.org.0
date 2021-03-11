Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B8E337D92
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 20:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9516EB8C;
	Thu, 11 Mar 2021 19:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1556EB8D;
 Thu, 11 Mar 2021 19:21:43 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id z8so3611697ljm.12;
 Thu, 11 Mar 2021 11:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m7dOV4uNWoySiVfi1U62XLNIjOEl4DQUJk7AsVchpY0=;
 b=jNzZ5bhFzRYwTGoQGRFZr6zS62/1FCJrLohl6shdMFzIMvJ9cnxiadM1oStpJhoEYa
 YCcxwfYd4JEkxZWExeIpo0vQ/F+5ARIaUbaLXJ4naL6G2C23qefVXtKwg/H3YCkYJwMC
 IUW2DuICeG5jN7ND+VmdViRmZ/XJQ00vfNBMxLFV7yU0x4uUqWyDC0H2QO4srri21zZL
 B9d0ZnwwMsIFkrDTAje/tBFbeHQsfgi5f/DHcvqFbwkuVLVCcANkIPpClAvX3v1FPyhu
 +Ti/rO4EW6vyd/D81w+cAOTP5lvhMKSUXx/NJhg8sBmlLFGspR/iKaphy+ta/665s5bq
 cFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m7dOV4uNWoySiVfi1U62XLNIjOEl4DQUJk7AsVchpY0=;
 b=uVnxGSRzBJe77PCF1wSScNKd2deQ8rmRSl+f6qy/wqKLA8faWa/kpSTb2L8yR+ttzA
 HN4f4seDrV5qjwtjI/y4yD3fkJXFfVsaLaEy1eCnHeizU6wmnNl7dZ4flT6+OUl5ONyW
 E8mf2SviFMFN9qnZy4/UJjNYeFt2Vm75/hnLmd8CfG6EA5rMWMrZF0M7EpY9CI5u2lDQ
 UAXTsCXSYsF9Cy+NY/LhT1vghDERZEyMvqodXy+UkPT0odCWtLkl1IZP5YXu1DlNXXsv
 11k1AqlslOlikyYYpJaoQzQSe/TH+PEcqymKdgtg2Kc1OPQtUf11pgplwfQG5hmqcdzz
 Q2UQ==
X-Gm-Message-State: AOAM5310lvgZUkxLTif5U4sZMmN+mIookb5bN9u76GAiZyPzrhkBStWh
 vzOp3Y6k8dAYh8fjVA37SZ0=
X-Google-Smtp-Source: ABdhPJxKtt0/QNPAPokFtyrBLj9jSOu1ZxgRF4Tu4gWmrQeJALVgjaKWtCy+IAGZ2Sw/4/W0FVeyAg==
X-Received: by 2002:a2e:9101:: with SMTP id m1mr236037ljg.378.1615490501433;
 Thu, 11 Mar 2021 11:21:41 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id u14sm1121153lfl.40.2021.03.11.11.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 11:21:41 -0800 (PST)
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
Subject: [PATCH v2 04/14] opp: Add devres wrapper for dev_pm_opp_of_add_table
Date: Thu, 11 Mar 2021 22:20:55 +0300
Message-Id: <20210311192105.14998-5-digetx@gmail.com>
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

Add devres wrapper for dev_pm_opp_of_add_table() to simplify driver
code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/of.c       | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/pm_opp.h |  6 ++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index f480c10e6314..c582a9ca397b 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -1104,6 +1104,42 @@ static int _of_add_table_indexed(struct device *dev, int index, bool getclk)
 	return ret;
 }
 
+static void devm_pm_opp_of_table_release(void *data)
+{
+	dev_pm_opp_of_remove_table(data);
+}
+
+/**
+ * devm_pm_opp_of_add_table() - Initialize opp table from device tree
+ * @dev:	device pointer used to lookup OPP table.
+ *
+ * Register the initial OPP table with the OPP library for given device.
+ *
+ * The opp_table structure will be freed after the device is destroyed.
+ *
+ * Return:
+ * 0		On success OR
+ *		Duplicate OPPs (both freq and volt are same) and opp->available
+ * -EEXIST	Freq are same and volt are different OR
+ *		Duplicate OPPs (both freq and volt are same) and !opp->available
+ * -ENOMEM	Memory allocation failure
+ * -ENODEV	when 'operating-points' property is not found or is invalid data
+ *		in device node.
+ * -ENODATA	when empty 'operating-points' property is found
+ * -EINVAL	when invalid entries are found in opp-v2 table
+ */
+int devm_pm_opp_of_add_table(struct device *dev)
+{
+	int ret;
+
+	ret = dev_pm_opp_of_add_table(dev);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, devm_pm_opp_of_table_release, dev);
+}
+EXPORT_SYMBOL_GPL(devm_pm_opp_of_add_table);
+
 /**
  * dev_pm_opp_of_add_table() - Initialize opp table from device tree
  * @dev:	device pointer used to lookup OPP table.
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index e68c3c29301e..2f5dc123c1a0 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -441,6 +441,7 @@ int dev_pm_opp_of_add_table(struct device *dev);
 int dev_pm_opp_of_add_table_indexed(struct device *dev, int index);
 int dev_pm_opp_of_add_table_noclk(struct device *dev, int index);
 void dev_pm_opp_of_remove_table(struct device *dev);
+int devm_pm_opp_of_add_table(struct device *dev);
 int dev_pm_opp_of_cpumask_add_table(const struct cpumask *cpumask);
 void dev_pm_opp_of_cpumask_remove_table(const struct cpumask *cpumask);
 int dev_pm_opp_of_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask);
@@ -473,6 +474,11 @@ static inline void dev_pm_opp_of_remove_table(struct device *dev)
 {
 }
 
+static inline int devm_pm_opp_of_add_table(struct device *dev)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int dev_pm_opp_of_cpumask_add_table(const struct cpumask *cpumask)
 {
 	return -EOPNOTSUPP;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
