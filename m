Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F9443A6EE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E5B6E2D7;
	Mon, 25 Oct 2021 22:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21D76E2C7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:45:49 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id o26so16225405ljj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cfYN7XHpH+9woQPLaDemd7XarYfLNqssALI4rIMlpEY=;
 b=TIcjAVSSZ/UNHVrpIadHBggfdiSAKY9zyphvZ3bUq5dXMuQXjVJqG9s/pYzfIC5rN1
 maI4zSszTvzmQqyBcGtzMvrwyfdqFHUMA2weUwivQEV8H4B/c9sbRF1tFtaysd8VbPkf
 rw+IXfCczdRUgkorMrKG4iQGVcuO3D73WHf8W+2JXjRovBeB1zNeE/jBV0awGAo31Mbl
 KQjERexoLk2//Z8Dhej47KRzZUrJxJnQ42GVySpddmhDTdqBi+G0oZZQIg20JvCAaatH
 V4VMVzJTiXYw3Zse3XYAGo18X5+9dMAw5PZwlRstda/9qKUHu7LSQWfogniULPCFkTWS
 R1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cfYN7XHpH+9woQPLaDemd7XarYfLNqssALI4rIMlpEY=;
 b=AoGQqbd8Oz30gDL6Zb+1Wfryh3VoyUUY20gxWsANNxkZJLe/A8zXP3OIwD/gukPbUv
 5UmXmcm2Bi9XfwDirCeVbrMOmxiRLXcUnSk6cii/qT58o3dRzFJduEEoUFthX3h01b4G
 LDbxv/7N44AF4xNbFhDjJpzl+X5UD/0yWlF9SlpkRaVTtN6cOPq0GIEmAOEe2x86skWp
 SpaiYZ6lZz+R/QB4OQHKUPnnFhCoT3U5vrDG4qfgb95MhYl2HjrxHuaJHff/6IrnfHgv
 lwDeArD22l1odMGZVyEyVcjQfz3VleV0wjUYPh17Ahk7N2+Qzhe1dsbrSxdu9Upm6/8v
 +mqA==
X-Gm-Message-State: AOAM5318MPYiN0XGCKEXBEzgmpR/hX3wQUdWMi+k5THZ249yxWth6T+l
 N9q8t4VvkGN8aXJc7CjFgO0=
X-Google-Smtp-Source: ABdhPJx+D1XFwTP5mWwDmLmQmWmYlnzBAJkt9DAZjsILcYyCGJDBNtGhKPR9ckO6xOTTUZ8zTm38Pg==
X-Received: by 2002:a05:651c:4c6:: with SMTP id
 e6mr21879679lji.530.1635201948023; 
 Mon, 25 Oct 2021 15:45:48 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:45:47 -0700 (PDT)
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
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v14 02/39] soc/tegra: Add
 devm_tegra_core_dev_init_opp_table_common()
Date: Tue, 26 Oct 2021 01:39:55 +0300
Message-Id: <20211025224032.21012-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025224032.21012-1-digetx@gmail.com>
References: <20211025224032.21012-1-digetx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only couple drivers need to get the -ENODEV error code and majority of
drivers need to explicitly initialize the performance state. Add new
common helper which sets up OPP table for these drivers.

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

