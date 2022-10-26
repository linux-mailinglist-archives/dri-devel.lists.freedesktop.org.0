Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF1260DD2D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 10:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CF710E2D6;
	Wed, 26 Oct 2022 08:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A42610E2D6;
 Wed, 26 Oct 2022 08:40:03 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id q9so19498269ejd.0;
 Wed, 26 Oct 2022 01:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pB+C6SdYHI1MJjuO7kRlLZxMto9minOW953/oIWwSMc=;
 b=JoFBDXVY5isva+nxYxgaq3YVgdfHiUZhYlC0Sjiep3ioAnHAGPsoxDQ65NM95RlThs
 X5xJVbdcg1RcxL/mzhYAny1E0NIbx5sLIHRniJ7T6f2DNIus1tAnnbqpP3qxbwFC8VWj
 yV/SUIYv4a33e5AZY5AP4aB8HADC9onKuX9qLlIPFv0pCgKOFjiwBZzIWiyx0bW2gXJ5
 AoPDqyJCdmRNVSbD1HFcPIy3gqLbDKXOT3pfiIrgfMbLifphg+4ZG81lKg9OtM7JkJ9e
 agMRYckuS3J3+/0OeRHsRqIEiSsifi3A4+tFTSC2SNPpL6gwZb+EjMA5CIRv0aC98isI
 Zsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pB+C6SdYHI1MJjuO7kRlLZxMto9minOW953/oIWwSMc=;
 b=ZBYUzc8rxJvC+OJC+3op2QmBzYnLHrVuIqedjiYcXKZ91GQ1T6nA8rFSsR7w5rq2pU
 3+fOGwQkbWbZMnr6AXKRYEMLt2Pdsx2WijrPMCTsobmBcgtq+U+K9hNLwghxbAIdXnB1
 8GDmZKKAeyOP9JjDioi0e3dmOVPmc/gS18XIWCaAOSMaZ9cxqVMLpzt7RzKdjhwgunJk
 UEsgNuGFEzOrxz+x7hc9wNQiorar6InHlABqj7SRNpYZ/IePhArkjBrfaOcrc59i5mCZ
 QfRSb8G6jI5hwcWWorPNl4M82jCqTI1LcYfxaU5ECgusbzZ80jYeX2W1q8uuSw1Xqiow
 p1Tw==
X-Gm-Message-State: ACrzQf2VCoJ/73+vucPzK7cWwi+DUGw4mOPWmmFy7KdLrl+Da7kREHYA
 0i9O/sSrjXpDXEPNU5Pb9DU=
X-Google-Smtp-Source: AMsMyM7UKMXUWTe8FYSuDI2bfhbwqS/rw2TfsjdvdhlWOZRFfg7UlDYfKYtExpOJzibuYs77q65BLg==
X-Received: by 2002:a17:907:d03:b0:7a2:d213:de18 with SMTP id
 gn3-20020a1709070d0300b007a2d213de18mr17639680ejc.124.1666773601908; 
 Wed, 26 Oct 2022 01:40:01 -0700 (PDT)
Received: from centennial.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 su24-20020a17090703d800b0073cf6ec3276sm2600232ejb.207.2022.10.26.01.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 01:40:01 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/lima: Fix dev_pm_opp_set_config in case of missing
 regulator
Date: Wed, 26 Oct 2022 10:39:50 +0200
Message-Id: <20221026083950.3712598-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit d8c32d3971e4 ("drm/lima: Migrate to dev_pm_opp_set_config()")
introduced a regression as it may undo the clk_names setting in case
the optional regulator is missing. This resulted in test and performance
regressions with lima.

Restore the old behavior where clk_names is set separately so it is not
undone in case of a missing optional regulator.

Fixes: d8c32d3971e4 ("drm/lima: Migrate to dev_pm_opp_set_config()")
Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_devfreq.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index 011be7ff51e1..9c8654934fea 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -113,10 +113,12 @@ int lima_devfreq_init(struct lima_device *ldev)
 	int ret;
 	const char *regulator_names[] = { "mali", NULL };
 	const char *clk_names[] = { "core", NULL };
-	struct dev_pm_opp_config config = {
-		.regulator_names = regulator_names,
+	struct dev_pm_opp_config config_clk_names = {
 		.clk_names = clk_names,
 	};
+	struct dev_pm_opp_config config_regulator_names = {
+		.regulator_names = regulator_names,
+	};
 
 	if (!device_property_present(dev, "operating-points-v2"))
 		/* Optional, continue without devfreq */
@@ -124,7 +126,15 @@ int lima_devfreq_init(struct lima_device *ldev)
 
 	spin_lock_init(&ldevfreq->lock);
 
-	ret = devm_pm_opp_set_config(dev, &config);
+	/*
+	 * Set clk_names separately so it is not undone in case of
+	 * a missing optional regulator.
+	 */
+	ret = devm_pm_opp_set_config(dev, &config_clk_names);
+	if (ret)
+		return ret;
+
+	ret = devm_pm_opp_set_config(dev, &config_regulator_names);
 	if (ret) {
 		/* Continue if the optional regulator is missing */
 		if (ret != -ENODEV)
-- 
2.37.3

