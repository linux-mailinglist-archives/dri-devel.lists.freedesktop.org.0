Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B474F60F128
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 09:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBD710E330;
	Thu, 27 Oct 2022 07:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C4610E330;
 Thu, 27 Oct 2022 07:32:26 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 bh7-20020a05600c3d0700b003c6fb3b2052so494175wmb.2; 
 Thu, 27 Oct 2022 00:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HOFnbsaMjj+z0QevarG84ke4eXp98Xi5RLnaRZADVG8=;
 b=JijJgT1N/Pkpag73UjzE9AE7TzOg/CBoMBHYIQZZpOFuSqjMxDLd+ZphHNzknTCjFM
 CY5RIk/L7hru6tivh63LiMxr0oTClgyEgvWkt4FgJ6jQkEmpG54binJTkyVxgDR8sjn8
 3vjM0WtfQPy9paY9Ch+htY6gliRlzEjN5xL+ZmRs4kA1npvKDU1Mck5xxAjTMoCxgiZf
 KeiQxcA9qxxxbZ6OY9I+Lezzun0pZchu2vRSXHVJWW73D6eMedjsBN9d1sg+KBoasTLn
 soByV6hbvatP/U21JJUednK9uQA5BWv6+bf3M1+FKPYrDi309lMpUtDIDjwjPwUJSe4e
 2Gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HOFnbsaMjj+z0QevarG84ke4eXp98Xi5RLnaRZADVG8=;
 b=i6onZzg/6FKiFUJlNbQcIt9iLiw+Db0ZRa2fOxEIuRPTnMXCmSdBwG450Eny6yhUdo
 vW1uUDIklfAOnriBXDgM0zSWspPFwhFSneO5M/n0T67qK5kOw7tlhSjdm78KxGjRZBG1
 tH1PKKVi0vWVTx37M6hxcO5QIrqLgr1fpTUq6pompuZERg5s+8ck3gFqvT/FBlMud2EQ
 jcafjyJGvbClcc17x0KCHUAzaAcAZHnheWXvLcLYyQxSqkY6RQdon8CkqO6WDPGV2oO8
 fc3QCMU8nby3D7IRx/wq4a0cCDP8leBysa3QGLFPhP6MT5D6A56YU0VfswRxkKzcroJw
 3f7g==
X-Gm-Message-State: ACrzQf0iV2QUrebHdCqQWGLmGGI/MkuVm8dme+Jki0r93I97aI+eWbYV
 uFgcfHRaV2sve0kXeu6tbbw=
X-Google-Smtp-Source: AMsMyM5CNPLBPwYMeOSiOvpEWq3RexpoSGSYWI1DAbksmu+zJlzw6rBgv2uRY92+0KJaZMe+7fcvxQ==
X-Received: by 2002:a05:600c:524c:b0:3cc:ed19:707 with SMTP id
 fc12-20020a05600c524c00b003cced190707mr4951714wmb.80.1666855945320; 
 Thu, 27 Oct 2022 00:32:25 -0700 (PDT)
Received: from centennial.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 v18-20020a5d6b12000000b0022e47b57735sm398251wrw.97.2022.10.27.00.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 00:32:24 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/lima: Fix opp clkname setting in case of missing
 regulator
Date: Thu, 27 Oct 2022 09:32:00 +0200
Message-Id: <20221027073200.3885839-1-nunes.erico@gmail.com>
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
v2: revert back to using devm_pm_opp_set_clkname and
devm_pm_opp_set_regulators
---
 drivers/gpu/drm/lima/lima_devfreq.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index 011be7ff51e1..bc8fb4e38d0a 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -112,11 +112,6 @@ int lima_devfreq_init(struct lima_device *ldev)
 	unsigned long cur_freq;
 	int ret;
 	const char *regulator_names[] = { "mali", NULL };
-	const char *clk_names[] = { "core", NULL };
-	struct dev_pm_opp_config config = {
-		.regulator_names = regulator_names,
-		.clk_names = clk_names,
-	};
 
 	if (!device_property_present(dev, "operating-points-v2"))
 		/* Optional, continue without devfreq */
@@ -124,7 +119,15 @@ int lima_devfreq_init(struct lima_device *ldev)
 
 	spin_lock_init(&ldevfreq->lock);
 
-	ret = devm_pm_opp_set_config(dev, &config);
+	/*
+	 * clkname is set separately so it is not affected by the optional
+	 * regulator setting which may return error.
+	 */
+	ret = devm_pm_opp_set_clkname(dev, "core");
+	if (ret)
+		return ret;
+
+	ret = devm_pm_opp_set_regulators(dev, regulator_names);
 	if (ret) {
 		/* Continue if the optional regulator is missing */
 		if (ret != -ENODEV)
-- 
2.37.3

