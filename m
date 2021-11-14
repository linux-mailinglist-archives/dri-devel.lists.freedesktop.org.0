Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40E544FA2D
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BB46E86C;
	Sun, 14 Nov 2021 19:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C1D6E86C
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:00 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id l22so37516319lfg.7
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BYMzBVvFXat+EF6D7Xq1trPhz10Qnf9JVl9Iy6huEzk=;
 b=ppo1Nuy3hCzzVWf+dK+TuoyRe0srrpnDCAnnL2isE3MbnPGehdIAJ0mqeMYQ2MJMDt
 9UblzxNgCIj6S1RHfns7F/zCgeancy+xo91fCEgJNikVpyJKapMLk7HDTRzup/PGthrE
 HACW+/cjTs1RYVeZ/KLSPk5t3sf6pI3kLnGWEqwYVlzbABsjgKy/f5mknix4q4C1c8zY
 i2Ck3/PsTDUJ5EuDqrDEqwiGgfkEOP7wRB6tdMD7N4HljVUfsKobOxqcl1WgGG+mfW5c
 J28tIlCZSXyx7x90TXSMDzOARcYcsTz2rK4jC+KgWLXqOhP+WWa/Iz4d4ZJYShMcSX+u
 nQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BYMzBVvFXat+EF6D7Xq1trPhz10Qnf9JVl9Iy6huEzk=;
 b=2NODLnGGUK/tefD1tqULzqRBIwuB/0Xv5kKOE8NFYW3GXqXVo1ykZsMEaoyfzLoOMk
 +GNmHuCPNCl8aQcKn/rY0j3GYHrKlVnfDOfrpyVx+zE3jjPkH+/w5750uwrTwbK4ZfY9
 IxKvbehRF0HVQW9ly1c0BloOlFyoswnDexUqmtEHSVfG3Rv2mGtk3CHdHABu6BWHhXpg
 6YxwsiDmcl3k1iUpnBqHfLbVGft5MNRkMun82E2xeh+fOLfl/DcIp28uOOY38j3gsTO7
 6u2fmu667GeVNIMUTkFCHqqBdo2QFTYXQoq8sennGh2PoTA3SQzXVVqy1vPZWWOR/jM3
 /C9w==
X-Gm-Message-State: AOAM531ltuItkKWjEW2UN8ZOD9o4RaCS1nDdbZVlghRwZJOSwXXf0vXf
 maBvK4wByLYeEqnNOwnl/c8=
X-Google-Smtp-Source: ABdhPJx+Wz6gB8VCqF1e/R/0jBJZsGb+bImJiOHD5oJbf6GFFR3Z4Z1WTTqmqM0RthfM7uKsZ/+2vg==
X-Received: by 2002:ac2:4bc2:: with SMTP id o2mr22454206lfq.660.1636918558544; 
 Sun, 14 Nov 2021 11:35:58 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:35:58 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v15 02/39] soc/tegra: Add
 devm_tegra_core_dev_init_opp_table_common()
Date: Sun, 14 Nov 2021 22:33:58 +0300
Message-Id: <20211114193435.7705-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114193435.7705-1-digetx@gmail.com>
References: <20211114193435.7705-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only couple drivers need to get the -ENODEV error code and majority of
drivers need to explicitly initialize the performance state. Add new
common helper which sets up OPP table for these drivers.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/soc/tegra/common.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
index af41ad80ec21..8ec1ac07fc85 100644
--- a/include/soc/tegra/common.h
+++ b/include/soc/tegra/common.h
@@ -39,4 +39,19 @@ devm_tegra_core_dev_init_opp_table(struct device *dev,
 }
 #endif
 
+static inline int
+devm_tegra_core_dev_init_opp_table_common(struct device *dev)
+{
+	struct tegra_core_opp_params opp_params = {};
+	int err;
+
+	opp_params.init_state = true;
+
+	err = devm_tegra_core_dev_init_opp_table(dev, &opp_params);
+	if (err != -ENODEV)
+		return err;
+
+	return 0;
+}
+
 #endif /* __SOC_TEGRA_COMMON_H__ */
-- 
2.33.1

