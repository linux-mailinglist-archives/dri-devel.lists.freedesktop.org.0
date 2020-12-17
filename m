Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C592DDFE4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0754189FE8;
	Fri, 18 Dec 2020 08:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A376E204
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:46 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id o19so34208924lfo.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NX+MS+anU76BlhEILutoJiS/7/Thy1nqdrl3kCzllJ4=;
 b=m+RcrvCN5SVrC4E9GsHQPZphjjmtSgb6vuW0wmrHP3sg/7u7V+Hka3Yz10nHRBIxUV
 8UV768vcIQ+01fjn0PkPPxF+oLpCfOhdiGMGBDnrsILzLvxYhOSOifjhnRxs/HVEVyn6
 3ZsI83oqk77uAHPWY8AhNT3DQe6YpD0gs1NFWahq0b0q9n4yDXnm7aBZCe5eDJG1LvpP
 zjMk/P17UXO40lcqYkyijOIomLa1G4M0uXMPS0E9EQAbEU49va0WIVYn6oBBujqzciPE
 QaxGQKnyhWyxfVKhKid9wYcl1G+4A72GGTAmGaMdNzjWKaK3YvR+eOFL4SdIEwRHHc65
 RtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NX+MS+anU76BlhEILutoJiS/7/Thy1nqdrl3kCzllJ4=;
 b=GEjte55OYppI8eXvskq/Mtnw0xFPrmIzbdI7mKP/Nhqmv38zDWwO9QwVFLuiRXUe+T
 cLMk82BTrsST81etEoRdRrRk/ZiVPzTGKkfM/lasAj0F9IZ8ci63qbP5xzmSrE9ixld6
 Pih4hfRdag7nq+FB/VKkEGVjRVYGhqvQnXW+W0Qc1U0kNi+N/wozV/L5NgCOLCEyB8/3
 KNFwxMFwMrby3Qebs0xBb+b/EgK4HrZVE+t3KRCD8/cW0SrxwJPkAEmUHPOu21MEirg5
 ahQVcMnbvTZXFbUKf+WcQB/ytcRbI51Q7McnYM+OUy4jnmj2jAjtHO5l0U38dPs+7f9D
 EZPA==
X-Gm-Message-State: AOAM5338MvyYxsFJPRU+SwsyZFb67lVg8SUxd3sHt8iQ8epnduq79het
 frWcNq62kKnku3vt22qKzeU=
X-Google-Smtp-Source: ABdhPJzZPdbXPbkUp1eRbNGTe1GkWb+tswPD3NA3JbqvyYw4q06czICReBowWtbbVUqPBOhPjZBhXQ==
X-Received: by 2002:a19:9d8:: with SMTP id 207mr8275690lfj.581.1608228465466; 
 Thu, 17 Dec 2020 10:07:45 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:45 -0800 (PST)
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
Subject: [PATCH v2 22/48] soc/tegra: pmc: Fix imbalanced clock disabling in
 error code path
Date: Thu, 17 Dec 2020 21:06:12 +0300
Message-Id: <20201217180638.22748-23-digetx@gmail.com>
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

The tegra_powergate_power_up() has a typo in the error code path where it
will try to disable clocks twice, fix it. In practice that error never
happens, so this is a minor correction.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index df9a5ca8c99c..fd2ba3c59178 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -638,7 +638,7 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
 
 	err = tegra_powergate_enable_clocks(pg);
 	if (err)
-		goto disable_clks;
+		goto powergate_off;
 
 	usleep_range(10, 20);
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
