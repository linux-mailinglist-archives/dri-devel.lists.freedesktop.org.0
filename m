Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B36464266
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA37B6E7E2;
	Tue, 30 Nov 2021 23:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0AC6E581
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:23:57 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id p8so30794754ljo.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BYMzBVvFXat+EF6D7Xq1trPhz10Qnf9JVl9Iy6huEzk=;
 b=lajLqZROAECuoHKxexs4CSVKYhbsBMDk4I1TxsQBgo1ZcmQMZhfPetyzsORD1zUCbT
 dg49kWtezjJpQBK5De5XGtS6PmAIV8AcWv7ISkgw36PvZ966QCiDmThWPOo3MWqhB59E
 9NWdXH88LqbUoLDEDfHYniJEPnxIqXE3YK64a4RArEYtZj6vhf1ql01+HDGMoNmwoJMJ
 8xK5pmdLDLlILMd/ZNLXmSTlz9AUxgw7wpZMucKTVtUCcElxPXgzZUH7ut0zd5jzEaCe
 wx59Hsx56KukR46I4wdrR54+MyKERQkeZz2TT3jor4xjgMa3u508cow2zk75oiUyzMwS
 +cbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BYMzBVvFXat+EF6D7Xq1trPhz10Qnf9JVl9Iy6huEzk=;
 b=TRMaaft+Jv20PdK+oa274vORTyA1IGctCpgywpJ7phzkCnjrlAVqFEH8YkSkfABSs+
 4QaY3zEOCqAOrEOUkT3hUekjC3+atPJInU8MkOswGajfFinyxIOCSP5kMDFmJIEgLE8/
 ZTctBI0BlKNwv8H60l1f0zSHcil/GlqCpIBiY0gA0T5rf4GPjIY+NGeJJ9KhYkOfplth
 /PbMXrFvvema1DB2EsZ/BfC6RVEvnJAXGW5wOdvhQoV0FLtIQEsJJbv02ojcszKi4Aml
 BB8qjR+7y4S3E8s+/7AkPxGJSgEhVZ8o8w4Qp6NwZidOKDZzruF/S/syH42m0CNpaEtt
 VxBQ==
X-Gm-Message-State: AOAM531y7kq4Jcy9t5E/mogiq7nr3yW2CGU6ku0q2DTqMmCqYPkQt1ST
 QwQ/1vDUPAWIbJpTLn1oA7dRWffQ+cA=
X-Google-Smtp-Source: ABdhPJzDqM3LD+qXyxpdHhNPXxTaxrLKFRpuZ2TirfMAQAsFquYJGar5RSjZrTnAyk3PPNjBUIRI1A==
X-Received: by 2002:a2e:2e0b:: with SMTP id u11mr1918056lju.190.1638314636269; 
 Tue, 30 Nov 2021 15:23:56 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:23:55 -0800 (PST)
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
Subject: [PATCH v16 02/40] soc/tegra: Add
 devm_tegra_core_dev_init_opp_table_common()
Date: Wed,  1 Dec 2021 02:23:09 +0300
Message-Id: <20211130232347.950-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130232347.950-1-digetx@gmail.com>
References: <20211130232347.950-1-digetx@gmail.com>
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

