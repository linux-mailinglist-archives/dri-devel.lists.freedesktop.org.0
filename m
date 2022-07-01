Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDD9562DC0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 10:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F19510F457;
	Fri,  1 Jul 2022 08:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A3010F425
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 08:21:21 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 x1-20020a17090abc8100b001ec7f8a51f5so5758608pjr.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 01:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3JX/iuVBCiH5yj/WHuJ1/f+3WaqUl5eDHzSMUfsG02Q=;
 b=oXr6tPXGRlwJyo7ncqnJ8UPZRb3uawOmoReKvVpwTiZjWFBXYflSM7jEaKzg8PZYPE
 dD/4ilotL0U7US5/tlJkTQmmuzQKM0G/yZFuhApDntNmMoKE/AVOST/FGLSgcrwIg6Ta
 P9DRyk09nOuLX3FhQ8BKO6hZrP1HDaUoTf5E8YxYOPBfNl3O4QiTqdMDTC5QvmAm0XgL
 LfzMOWe1uBs53DHy7YUSfj97XsELS/VwZMIKr+LaxQ8Pdshf9gt3DvKbl6oGyX02DQDc
 8nOMM223R5lXDqAY0SJ1Hsu5QI3pT7pzqUqAZzWIrhfwUqai0bSpy66fdZnMiMEpi7Jq
 pE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3JX/iuVBCiH5yj/WHuJ1/f+3WaqUl5eDHzSMUfsG02Q=;
 b=jzdpam0nlnZ2R4WH68rb0ZTZYVNrI8wCHW0szboojk9C84M6Kb4V2nFRutedo/cB94
 XboG2iWfS0YSbF1vJE7UmxsPj0n+QEe+uVgP+EHmaEjvbTW6iSVg/k3xwBwTEKY0BlYd
 Lk5J8A/qOmd5hkQQ3pDAVEbpaCiCDQQX/KmBoJQp11jOnxW/Jjpgug9NzgB1QYYswgJ3
 5WfaNnZ6aehjw5pMqFDKP8fbpLIR5epu4CjwJQUgwG4/XBs6wWi//c2QIKO60XhMHN0x
 tmU/B836rkY2WWsdF7r+UirSRahgkSxEUcp4leCXIlyp4sH5Vyklb7+e5XNDdH40L6eU
 7MoQ==
X-Gm-Message-State: AJIora8eF2FUUKuUP+4lZ31D6wf1o0sSJsljMEjNcwLO9wYLtdAjak/b
 oIFL2/E2p96UbDa7zboo8MQLVA==
X-Google-Smtp-Source: AGRyM1v9z853kLDeBAeq79Scb9HDzro3Uyn0gVbpfMw6suMfjPhB2mkfyUWMkJIrsml3S0jT+kWzwA==
X-Received: by 2002:a17:903:40cd:b0:16a:2dcf:408f with SMTP id
 t13-20020a17090340cd00b0016a2dcf408fmr18611553pld.18.1656663680823; 
 Fri, 01 Jul 2022 01:21:20 -0700 (PDT)
Received: from localhost ([122.172.201.58]) by smtp.gmail.com with ESMTPSA id
 b21-20020a17090a8c9500b001ec8d191db4sm5883557pjo.17.2022.07.01.01.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 01:21:20 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Qiang Yu <yuq825@gmail.com>
Subject: [PATCH V2 13/30] drm/lima: Migrate to dev_pm_opp_set_config()
Date: Fri,  1 Jul 2022 13:50:08 +0530
Message-Id: <9e65578ab96ae33acbe7bcba664ef65663fff938.1656660185.git.viresh.kumar@linaro.org>
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
 lima@lists.freedesktop.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OPP core now provides a unified API for setting all configuration
types, i.e. dev_pm_opp_set_config().

Lets start using it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpu/drm/lima/lima_devfreq.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index 8989e215dfc9..d8c67843fa1b 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -111,6 +111,12 @@ int lima_devfreq_init(struct lima_device *ldev)
 	struct dev_pm_opp *opp;
 	unsigned long cur_freq;
 	int ret;
+	struct dev_pm_opp_config config = {
+		.regulator_names = (const char *[]){ "mali" },
+		.regulator_count = 1,
+		.clk_names = (const char *[]){ "core" },
+		.clk_count = 1,
+	};
 
 	if (!device_property_present(dev, "operating-points-v2"))
 		/* Optional, continue without devfreq */
@@ -118,11 +124,7 @@ int lima_devfreq_init(struct lima_device *ldev)
 
 	spin_lock_init(&ldevfreq->lock);
 
-	ret = devm_pm_opp_set_clkname(dev, "core");
-	if (ret)
-		return ret;
-
-	ret = devm_pm_opp_set_regulators(dev, (const char *[]){ "mali" }, 1);
+	ret = devm_pm_opp_set_config(dev, &config);
 	if (ret) {
 		/* Continue if the optional regulator is missing */
 		if (ret != -ENODEV)
-- 
2.31.1.272.g89b43f80a514

