Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8A2562DC3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 10:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3AF10F47A;
	Fri,  1 Jul 2022 08:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E6310F47A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 08:21:27 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id n10so1758559plp.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 01:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MggsQ4TY4XeBgvA7QVMGXMCN2KhkYB30faLk4meCgmY=;
 b=rs/NQg8B3YMz/mXdzfqsGOdveJ25PwZxde1vf73UXhbF5yk92CA9Jlpgam3cHheIz+
 fzhXNzj9WbYhPukIx/QifaABEy4k6mAmPVzssxaxdU8XH4Zwvf32Mt4ujAyhrUwi7Dvu
 Rdmd4ZLrrjbPNPC7R24anUQBoxNTFyvJOFLoRH6i9+IpoFw9Rr88F3imH7ZcFACORMkl
 1MMREqAd8Jkc10wZs5+Hz5+TCzm80Uha7wjOobc+ExAg1fUWK52q28mkJGkLKt0zQWLH
 2cGq5zSLUbqY92VpoHLmzxJ5yfFDEl5UGRYgWVPfUIBFU0k7op4RU/DWdWathnO5TlA3
 +tkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MggsQ4TY4XeBgvA7QVMGXMCN2KhkYB30faLk4meCgmY=;
 b=gLnwRp8PEqXk9ApouX2y2qNbaoZ8Qd6gOzWnFoHqjM6P6HfN/AGQJVxvuWekgt1tC2
 BM8k5URbPCWwHAG14scj6HNHw2U0I1aBX0IZbTaiZm4L4viAaUvt/E2vxBlOSAelqBWP
 QVTgs5btj+I9JClBHSEscW3gzoE2wkBp1UIw/hiEWqtWunxDQm7bsmiz5Reus+9/uD6n
 l8/8KPYK202ZzFjT4uCplWjLYEAVdYNcfcJdef8GnF+mq7i62odsi+Rm+uzaFMoBytAK
 oPsvlLOdE3cc6bqFe8Xjc88gzS7kkQKcLez8mTGLiiXxCkzOY+mWSmcIuP4ZMMJxjsWu
 5HpA==
X-Gm-Message-State: AJIora8X7G+CNG2VjdfyNYVnMqaW/GngStqhKQUrftu1vo3Epjf1tMUs
 qunAK6eean6BTcy8B4w/vt1dCw==
X-Google-Smtp-Source: AGRyM1sOKtre5vBYoEvJpv35QmWxmGVHmbIKmanb1KOI/w0yrthBM5qY5HTR/cBv6eUk4S4fhX5bCw==
X-Received: by 2002:a17:902:ea47:b0:16b:a612:208d with SMTP id
 r7-20020a170902ea4700b0016ba612208dmr10862224plg.96.1656663686760; 
 Fri, 01 Jul 2022 01:21:26 -0700 (PDT)
Received: from localhost ([122.172.201.58]) by smtp.gmail.com with ESMTPSA id
 i4-20020a17090aee8400b001eb162ffaa3sm5884839pjz.25.2022.07.01.01.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 01:21:26 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH V2 15/30] drm/panfrost: Migrate to dev_pm_opp_set_config()
Date: Fri,  1 Jul 2022 13:50:10 +0530
Message-Id: <1179832f813aafc02c408b65765f299e7f668ad3.1656660185.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1656660185.git.viresh.kumar@linaro.org>
References: <cover.1656660185.git.viresh.kumar@linaro.org>
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OPP core now provides a unified API for setting all configuration
types, i.e. dev_pm_opp_set_config().

Lets start using it.

Acked-by: Steven Price <steven.price@arm.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 194af7f607a6..7826d9366d35 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -91,6 +91,10 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct devfreq *devfreq;
 	struct thermal_cooling_device *cooling;
 	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
+	struct dev_pm_opp_config config = {
+		.regulator_names = pfdev->comp->supply_names,
+		.regulator_count = pfdev->comp->num_supplies,
+	};
 
 	if (pfdev->comp->num_supplies > 1) {
 		/*
@@ -101,13 +105,12 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 		return 0;
 	}
 
-	ret = devm_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
-					 pfdev->comp->num_supplies);
+	ret = devm_pm_opp_set_config(dev, &config);
 	if (ret) {
 		/* Continue if the optional regulator is missing */
 		if (ret != -ENODEV) {
 			if (ret != -EPROBE_DEFER)
-				DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
+				DRM_DEV_ERROR(dev, "Couldn't set OPP config\n");
 			return ret;
 		}
 	}
-- 
2.31.1.272.g89b43f80a514

