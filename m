Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA419534E4F
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 13:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D9F10F2C8;
	Thu, 26 May 2022 11:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3968210E083
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 11:44:16 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id s68so1116306pgs.10
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 04:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mf/PBhXudWeikzmFArA4THf+WTmY69KBHxrOKvhpwhE=;
 b=JJrDny96JbGaIUMj4x/xpDMp+oQkXSZkQxSJGDuiTpnzlerMBuCp6OEPjlDrZjuPGT
 Ko/TRfplkx+duYaqEwQlc0npS3jyDJoPUUj95Jj7S1x78QZlaZpnETowzov1T7FLNHKU
 WwhZ5zjbbr6Y21jmTQLTrFTh3LFNLxfdnUmOgs8YH+knP5vuy3iYUy+BqPnqIgXEJgQF
 6MlBwSUd/twgwhmgeO4ve2f17aHiDTqmPYpNpwHO8HQ5mZCaJ6iDUFUENAp/dQOh8H7d
 XjUQRyeQoBQTh7b7PW0XCab62PJdTIzFONf+GOV+J2n7JXOk0ovYgBxDCyJ7plc4qzKt
 +rvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mf/PBhXudWeikzmFArA4THf+WTmY69KBHxrOKvhpwhE=;
 b=L3rIep8wootgfepmZiI1OtsBPIRfgDmiE6hp00utAFjFckZ18vWGCOcIkGQFZvM9cu
 csacfKF6njWM0zM2+VH1tkmoukkJT54RY2X5XzmInQrSaP4++MicDPax+j08O+f+hEXh
 Y+UrY5pBVwiA5a3gABWCs/1pwMclZ8hYShNimZAPy8+9DBgwe2zef9CgXXfkLpOPS843
 pOyyw3BM6+K5/7gF6dEjzKPc/pty9y2AyWI3oGuYuBOsKy0jur+AprKe00lnpSeiZlXz
 k5rvtBKeIlvRJ/8Oz0mcb8k9r5suOtmHfQdjpDo64ppAJUKrGkwrx6F83EaAbuZKun3m
 nVsw==
X-Gm-Message-State: AOAM530SjXXmdk9q0eaJrOVxTqM6rqSZi/jLkpFDB7BsfzcbjYD3+mTD
 vZrDgbONNaVzUpAgiSaUSU+uFg==
X-Google-Smtp-Source: ABdhPJziKnYEnwECbcUqLKProhmiWCkQ4BTngGPQbdjiQrftLw4d0/7RPvrSr33wj3o4SRqnCdRUlQ==
X-Received: by 2002:a62:15ca:0:b0:518:2bd1:aa65 with SMTP id
 193-20020a6215ca000000b005182bd1aa65mr37845386pfv.78.1653565455809; 
 Thu, 26 May 2022 04:44:15 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 j17-20020a170903025100b00161b407771dsm1313142plh.48.2022.05.26.04.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 04:44:15 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 16/31] drm/tegra: Migrate to dev_pm_opp_set_config()
Date: Thu, 26 May 2022 17:12:15 +0530
Message-Id: <b2272734b4ab0063569ea033dc218d18fec6aba8.1653564321.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1653564321.git.viresh.kumar@linaro.org>
References: <cover.1653564321.git.viresh.kumar@linaro.org>
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
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OPP core now provides a unified API for setting all configuration
types, i.e. dev_pm_opp_set_config().

Lets start using it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpu/drm/tegra/gr3d.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index a1fd3113ea96..05c45c104e13 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -389,6 +389,10 @@ static int gr3d_init_power(struct device *dev, struct gr3d *gr3d)
 	struct device_link *link;
 	unsigned int i;
 	int err;
+	struct dev_pm_opp_config config = {
+		.genpd_names = opp_genpd_names,
+		.virt_devs = &opp_virt_devs,
+	};
 
 	err = of_count_phandle_with_args(dev->of_node, "power-domains",
 					 "#power-domain-cells");
@@ -421,7 +425,7 @@ static int gr3d_init_power(struct device *dev, struct gr3d *gr3d)
 	if (dev->pm_domain)
 		return 0;
 
-	err = devm_pm_opp_attach_genpd(dev, opp_genpd_names, &opp_virt_devs);
+	err = devm_pm_opp_set_config(dev, &config);
 	if (err)
 		return err;
 
-- 
2.31.1.272.g89b43f80a514

