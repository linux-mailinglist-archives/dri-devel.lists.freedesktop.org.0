Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE772DDFE1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D7289DD3;
	Fri, 18 Dec 2020 08:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8580C6E203
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:43 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id a9so59800587lfh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PBkFTp9tm3NIEsg9yT0qklFrPErhGsiU6/VwoxR8iVo=;
 b=Wr2PZ5CpiNFJmfsifDPV2pBLJCgPQk0fgJ7q+dzCHxYQ2qxEg6pfh3bKUgDKcdI7K5
 romrhZ+RhBrJbCJ79wNAdtBxL2APvo/0s6vmkXm7kvCQEJ00kIT5J8YB9d3DSTUARd7w
 zqs5xyyHJO7q28hpZ44tT+NdcBCKHrURVoFOYXYvuG9dg/sHWuSDrZaM0htPC1zy/o93
 9c7BLcO6zT3+qWm7cNBTL2gZZePdwFbQSBO+ekT/FYtNGLRJouCO2FL++zN0Z0I6Ba9A
 DEJMGYoSEVBmf48mppl0TcD1BclLXkF2VNJNUOR8iatoMStAkUS2D1S5er6OcumMC1rS
 9hgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PBkFTp9tm3NIEsg9yT0qklFrPErhGsiU6/VwoxR8iVo=;
 b=nXvkPMfo0FKuCy8/ejZZ3U2EbP7/dfA8qgp/AEvMuMn+SD0T/Wi7nArzI65dk9wQDS
 pHwZBv9MALDRJ2XJKy94BOPkP3WRvDTgdD3/ZblTWEIBmqlRnywDyo0Bxi9oN/kvkybW
 HeS4NqmaTQ0bHXms/NpXj3YG1oApM8XGqVd94HAqXfd02Z7Oq4wwdqc6+bTYyOB4QU+E
 5PbDoOCmmu6gPN+iouyCOy2BqVw28bKN+8jgWnbVCgJwMnG+5scqF4MdKF6hpPxlLaqm
 UV80Pu5jl5992Z/vtY57CSAA7Gjh4Rr3bvNHQbzl/+83KzAM3QCMUKb1Hr0RZ43OFcJe
 Do4w==
X-Gm-Message-State: AOAM530kOBbyFRTWB3dcbtDsu/lsBDf/hw8lCsDTQcWgrl1SPrtPtSjz
 ajBg6P9xPbicf6Sx7x1Vejo=
X-Google-Smtp-Source: ABdhPJzI9lQCqVR6L1Wp/rAyjMTzeX+0L0LyqYKCSSzn2J93gimBkGPQS81KvJv88WT1zNQwZK203A==
X-Received: by 2002:a19:670f:: with SMTP id b15mr7791855lfc.340.1608228461978; 
 Thu, 17 Dec 2020 10:07:41 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:41 -0800 (PST)
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
Subject: [PATCH v2 19/48] opp: Fix adding OPP entries in a wrong order if rate
 is unavailable
Date: Thu, 17 Dec 2020 21:06:09 +0300
Message-Id: <20201217180638.22748-20-digetx@gmail.com>
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

Fix adding OPP entries in a wrong (opposite) order if OPP rate is
unavailable. The OPP comparison is erroneously skipped if OPP rate is
missing, thus OPPs are left unsorted.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c | 23 ++++++++++++-----------
 drivers/opp/opp.h  |  2 +-
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 34f7e530d941..5c7f130a8de2 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1531,9 +1531,10 @@ static bool _opp_supported_by_regulators(struct dev_pm_opp *opp,
 	return true;
 }
 
-int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2)
+int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2,
+		     bool rate_not_available)
 {
-	if (opp1->rate != opp2->rate)
+	if (!rate_not_available && opp1->rate != opp2->rate)
 		return opp1->rate < opp2->rate ? -1 : 1;
 	if (opp1->bandwidth && opp2->bandwidth &&
 	    opp1->bandwidth[0].peak != opp2->bandwidth[0].peak)
@@ -1545,7 +1546,8 @@ int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2)
 
 static int _opp_is_duplicate(struct device *dev, struct dev_pm_opp *new_opp,
 			     struct opp_table *opp_table,
-			     struct list_head **head)
+			     struct list_head **head,
+			     bool rate_not_available)
 {
 	struct dev_pm_opp *opp;
 	int opp_cmp;
@@ -1559,13 +1561,13 @@ static int _opp_is_duplicate(struct device *dev, struct dev_pm_opp *new_opp,
 	 * loop.
 	 */
 	list_for_each_entry(opp, &opp_table->opp_list, node) {
-		opp_cmp = _opp_compare_key(new_opp, opp);
+		opp_cmp = _opp_compare_key(new_opp, opp, rate_not_available);
 		if (opp_cmp > 0) {
 			*head = &opp->node;
 			continue;
 		}
 
-		if (opp_cmp < 0)
+		if (opp_cmp < 0 || rate_not_available)
 			return 0;
 
 		/* Duplicate OPPs */
@@ -1601,12 +1603,11 @@ int _opp_add(struct device *dev, struct dev_pm_opp *new_opp,
 	mutex_lock(&opp_table->lock);
 	head = &opp_table->opp_list;
 
-	if (likely(!rate_not_available)) {
-		ret = _opp_is_duplicate(dev, new_opp, opp_table, &head);
-		if (ret) {
-			mutex_unlock(&opp_table->lock);
-			return ret;
-		}
+	ret = _opp_is_duplicate(dev, new_opp, opp_table, &head,
+				rate_not_available);
+	if (ret) {
+		mutex_unlock(&opp_table->lock);
+		return ret;
 	}
 
 	list_add(&new_opp->node, head);
diff --git a/drivers/opp/opp.h b/drivers/opp/opp.h
index 4ced7ffa8158..6f5be6c72f13 100644
--- a/drivers/opp/opp.h
+++ b/drivers/opp/opp.h
@@ -219,7 +219,7 @@ struct opp_table *_find_opp_table(struct device *dev);
 struct opp_device *_add_opp_dev(const struct device *dev, struct opp_table *opp_table);
 struct dev_pm_opp *_opp_allocate(struct opp_table *opp_table);
 void _opp_free(struct dev_pm_opp *opp);
-int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2);
+int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2, bool rate_not_available);
 int _opp_add(struct device *dev, struct dev_pm_opp *new_opp, struct opp_table *opp_table, bool rate_not_available);
 int _opp_add_v1(struct opp_table *opp_table, struct device *dev, unsigned long freq, long u_volt, bool dynamic);
 void _dev_pm_opp_cpumask_remove_table(const struct cpumask *cpumask, int last_cpu);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
