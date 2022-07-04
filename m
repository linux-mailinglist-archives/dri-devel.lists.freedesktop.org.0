Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 509A7565BC6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BFE10F4FA;
	Mon,  4 Jul 2022 16:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF92B10E013
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 12:08:30 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id t21so8809149pfq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 05:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zM6k7wksuNvGlGq6D8pYCpU91RIfKXfSwe1O1batFpM=;
 b=Pk79kImAgR1NPXrXBciuZ0mSuzaxskitVfe4NlJ2XlyTl0xMFuwItkbbi0cprHg6PF
 O/koDJOxvLb0hVLFIl0DvA3UYks4ajZlwD4ysoMPfq7cLIuLD03ucdgN2W1XiBgARkHG
 7XXdd4ID1CI9ykMAZaCXoaLOjf8pE4W2kR2G4bfMprveeyUOPvS4zKR2JCZdXUWp0n3M
 BvXSI4iI1+i9VJvp9SqVajDbKSPxAT9OjTUmp8X3DENT2hpcktHKFwRZLJaPWxNA4+VR
 L9qNGc7D7VVgeW0RoD4RKMKciIRAyKpnz//IV2y8FJuiSwgmInto+4iwU4jgt+Nejrp6
 wPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zM6k7wksuNvGlGq6D8pYCpU91RIfKXfSwe1O1batFpM=;
 b=IlbAQE1SWFA9yiRdK2Zp6bxejwa+xax24Z4+U8UTOIapb4l/Eif06SwI74VXJjQZ06
 bxRHQKOXUkRN5g6Sh7xChxpOrpdrsSmdvA1fp4y4mvcTBRensIoIrZ5rbHeD4+Crm348
 smLxBJlrikDkxD0O2uljobsYQQKLcVOCQS7MP0wTuDGvcKUhCEdjAlhbUuNcevZh9ltU
 DhmN4iifej0TF+cjSfwWiX0bHXF1DZCxIf8WuENR8qM9M/yCgMzC6R2qkf/E6CASa4Oa
 zNlKYdLpn1388n8KMYJfhW5oZu9TSqYvkWpNAWhvWL54kBboCtFtM51uoqvfu4kFUsgv
 SxjA==
X-Gm-Message-State: AJIora/GyRgMxQMfgFh+UipuAykTmSWkrdLnrS6ZiL2A7e2MqQzGNVQ+
 96dhQk2toNAJzOyB7pLn24u7tg==
X-Google-Smtp-Source: AGRyM1uqmJynJNrbJeDxw4sHqdMSf2eDgcVImaSFfyVb2XrpmBPc3tF3N1I5pjtaPgA1Xtm+BTaJ5Q==
X-Received: by 2002:a65:6054:0:b0:411:5e12:21b2 with SMTP id
 a20-20020a656054000000b004115e1221b2mr24544781pgp.222.1656936510437; 
 Mon, 04 Jul 2022 05:08:30 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 u2-20020a170902714200b0016a522915e5sm21089580plm.83.2022.07.04.05.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 05:08:30 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Qiang Yu <yuq825@gmail.com>
Subject: [PATCH V3 07/20] drm/lima: Migrate to dev_pm_opp_set_config()
Date: Mon,  4 Jul 2022 17:37:45 +0530
Message-Id: <734af371b2523219c719111be72d932dc3fd7eb9.1656935522.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1656935522.git.viresh.kumar@linaro.org>
References: <cover.1656935522.git.viresh.kumar@linaro.org>
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
 drivers/gpu/drm/lima/lima_devfreq.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index dc83c5421125..011be7ff51e1 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -112,6 +112,11 @@ int lima_devfreq_init(struct lima_device *ldev)
 	unsigned long cur_freq;
 	int ret;
 	const char *regulator_names[] = { "mali", NULL };
+	const char *clk_names[] = { "core", NULL };
+	struct dev_pm_opp_config config = {
+		.regulator_names = regulator_names,
+		.clk_names = clk_names,
+	};
 
 	if (!device_property_present(dev, "operating-points-v2"))
 		/* Optional, continue without devfreq */
@@ -119,11 +124,7 @@ int lima_devfreq_init(struct lima_device *ldev)
 
 	spin_lock_init(&ldevfreq->lock);
 
-	ret = devm_pm_opp_set_clkname(dev, "core");
-	if (ret)
-		return ret;
-
-	ret = devm_pm_opp_set_regulators(dev, regulator_names);
+	ret = devm_pm_opp_set_config(dev, &config);
 	if (ret) {
 		/* Continue if the optional regulator is missing */
 		if (ret != -ENODEV)
-- 
2.31.1.272.g89b43f80a514

