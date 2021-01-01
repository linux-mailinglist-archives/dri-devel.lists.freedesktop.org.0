Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D072E91F2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6498389D66;
	Mon,  4 Jan 2021 08:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4168A89B95;
 Fri,  1 Jan 2021 16:56:29 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id e2so11238315plt.12;
 Fri, 01 Jan 2021 08:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ulQjK7kE8S67z3HibvwlRCmu1V05Rz1A1b3NTvlFpsA=;
 b=d37hsCjlIJM9PnHPvhDM8Aa1Yf1xLR++dqxOkxOD9FIdmzwWkxif7cz9rkA9Flnsk7
 1xROyWnwh/glGfukWFhv6bF4yfFTgc4QT2gsWn0/pn8jj3Xkhnj636so0I9Bh/Nn6+Go
 3iyEM96c1dC12FDDOYZJ6DIxBPiVFZoWF02+XhyPM/Pgxux579V/J9jfWKsgaZIxlGZ1
 Aq1gv4RSFHr6q3+fsZR1Y3WjRXW6ayXVqg3FjRyG8Von4nnhB6QyMQRC4PmM/rpypECr
 3k3+NI+o19zonId5ZjisleYBBN1DSQFwCIvWh60K3MxWCExqz1ti54jz6kLxmefZgYhL
 a0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ulQjK7kE8S67z3HibvwlRCmu1V05Rz1A1b3NTvlFpsA=;
 b=HwkXkl19Ps9yB9weitOH9ldVzcToKwHETaR8JUoHLzXfLcXNueCNBXakTjsDHre7+J
 t2v/5Nx64IPVXhyvxbdBV8cWT/+ZxmQZa+kLT3thFIcMg7Ove1kGUnabQaiCxLBlmKs/
 G8DebGaVv32JkqXJNI12PpAnsYKXlX0IGF3/Ya9VxgdOVGxngL1qKPINk3prNNGfmDMm
 UUSihBglhbvOOdgKObLIgRRNX+jIfo9yY4cB97SOjZSy2PIWA9k+shqyr0vinUWRtyej
 +JX62+bcD5Hdmi7WdeMcgAgmC0wuNBDEYrbgSeXvoyAQPG76jsZdzWqx1+rgEGDQu751
 CBxw==
X-Gm-Message-State: AOAM530GsMI97Xbsf9IRVEfHz5ddumVNIZICX2IOfPfj9d1sfCzv4k+J
 UDsFGc8sEVRqIc1MFwoKGPI=
X-Google-Smtp-Source: ABdhPJyHf7+sjNLEXdYcgzxEZu7mqhbeD6IKkSjgZZ/shmnq8zr/pyFYG91Cl9w3jRu6JPR+Ddm+pQ==
X-Received: by 2002:a17:90a:5501:: with SMTP id
 b1mr18014940pji.7.1609520188919; 
 Fri, 01 Jan 2021 08:56:28 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id 84sm50002729pfy.9.2021.01.01.08.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 08:56:28 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com,
 krzk@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 digetx@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 yuq825@gmail.com, airlied@linux.ie, daniel@ffwll.ch, robdclark@gmail.com,
 sean@poorly.run, robh@kernel.org, tomeu.vizoso@collabora.com,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 stanimir.varbanov@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, mchehab@kernel.org, lukasz.luba@arm.com,
 adrian.hunter@intel.com, ulf.hansson@linaro.org, vireshk@kernel.org,
 nm@ti.com, sboyd@kernel.org, broonie@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, rjw@rjwysocki.net,
 jcrouse@codeaurora.org, hoegsberg@google.com, eric@anholt.net,
 tzimmermann@suse.de, marijn.suijten@somainline.org, gustavoars@kernel.org,
 emil.velikov@collabora.com, jonathan@marek.ca, akhilpo@codeaurora.org,
 smasetty@codeaurora.org, airlied@redhat.com, masneyb@onstation.org,
 kalyan_t@codeaurora.org, tanmay@codeaurora.org, tiny.windzz@gmail.com,
 ddavenport@chromium.org, jsanka@codeaurora.org, rnayak@codeaurora.org,
 tongtiangen@huawei.com, miaoqinglang@huawei.com, khsieh@codeaurora.org,
 abhinavk@codeaurora.org, chandanu@codeaurora.org, groeck@chromium.org,
 varar@codeaurora.org, mka@chromium.org, harigovi@codeaurora.org,
 rikard.falkeborn@gmail.com, natechancellor@gmail.com,
 georgi.djakov@linaro.org, akashast@codeaurora.org, parashar@codeaurora.org,
 dianders@chromium.org
Subject: [PATCH 04/31] opp: Add devres wrapper for dev_pm_opp_of_add_table
Date: Fri,  1 Jan 2021 16:54:40 +0000
Message-Id: <20210101165507.19486-5-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210101165507.19486-1-tiny.windzz@gmail.com>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add devres wrapper for dev_pm_opp_of_add_table() to simplify driver
code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/opp/of.c       | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/pm_opp.h |  6 ++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index 03cb387236c4..50df483c7dc3 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -998,6 +998,42 @@ int dev_pm_opp_of_add_table(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_of_add_table);
 
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
  * dev_pm_opp_of_add_table_indexed() - Initialize indexed opp table from device tree
  * @dev:	device pointer used to lookup OPP table.
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index e5260fc82ba1..e8bdac5f9555 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -398,6 +398,7 @@ static inline void dev_pm_opp_cpumask_remove_table(const struct cpumask *cpumask
 int dev_pm_opp_of_add_table(struct device *dev);
 int dev_pm_opp_of_add_table_indexed(struct device *dev, int index);
 void dev_pm_opp_of_remove_table(struct device *dev);
+int devm_pm_opp_of_add_table(struct device *dev);
 int dev_pm_opp_of_cpumask_add_table(const struct cpumask *cpumask);
 void dev_pm_opp_of_cpumask_remove_table(const struct cpumask *cpumask);
 int dev_pm_opp_of_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask);
@@ -425,6 +426,11 @@ static inline void dev_pm_opp_of_remove_table(struct device *dev)
 {
 }
 
+static inline int devm_pm_opp_of_add_table(struct device *dev)
+{
+	return -ENOTSUPP;
+}
+
 static inline int dev_pm_opp_of_cpumask_add_table(const struct cpumask *cpumask)
 {
 	return -ENOTSUPP;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
