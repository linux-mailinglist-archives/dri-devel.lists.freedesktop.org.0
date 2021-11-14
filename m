Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39FC44FA91
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444D86E891;
	Sun, 14 Nov 2021 19:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6D36E888
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:23 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id b1so31689799lfs.13
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lzFtA16LetdYQr69hwWW6HmkTpjJj0vMycP3EfoabOc=;
 b=EE/chLe/LsFvIUSeQyQmGN91PrUcAuSyz0tVUW7sGhNUufPV6/cTlGndbYNLVSKxi+
 pNeJ/5bVtPYdNvdEoVffcIqOFzUpwuinreJBdVasxtx8x8vZ+2daOqSDO+rcZM2hpyUU
 svPqIbepnvLGSTm1Pm0FET5yEAw1i9JaThSjz+lx7KFyuqAoCfq6/CPaGsefoMD0URW7
 q0Gd8/cw2W5XymGDWKQnC7SzVOxkQK+rl9z41sC9M9AgwFXdg47UcFcUx0DCba+Tl7Zc
 ko2LcjI3O7767rW6hRJ5ncO7fyWi8DJnkWdDadSpTXNygghRX/vemDtc+qJHPygtpwnK
 hlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lzFtA16LetdYQr69hwWW6HmkTpjJj0vMycP3EfoabOc=;
 b=yFojHH01sbK3/TLY8Z46mZtvjxnwL3r0Rcng9ItTtR+n8foS7w7coGbT5Khc2t4xEk
 CTuj5aGnnoqhHuB29RTldzx6u+v/ldNGzKojP36+Vf5+ewjNWIE2vVnnIymCvtoH8tUA
 WbycTQIO61+A1JbJF1jxPIj3eHo+kAHQ0wmkiyDSOJMHpC+eF3fmv4E3NW0REkqjfbiU
 2yMKZe8VpnmVwnDRAehZN1f/PNi9T4226j4C4c7lDPzj+KQLJQQtkf22yegCSvNIZKuo
 GRM7eW950bXBXrmjwOePJsVJEvDVs0C9K0ACiG6q/CGApO4QPzdfYMiluWocSCQXHiht
 Kuew==
X-Gm-Message-State: AOAM530hktnfPFT1IM5PiESWRfqNxug8GJNDzw5RSKY5X/QmTQdu/+9M
 Pviwv9f/2xdyBhTNam8TEL6Zir2W99Y=
X-Google-Smtp-Source: ABdhPJwzhTah3r572OPXiaN6H8ghNMzmv0cpc8MTKf0k+5qKxAcGDcGG3yg9M33eUKPg9UQxs2539A==
X-Received: by 2002:a05:6512:689:: with SMTP id
 t9mr30313571lfe.614.1636918582380; 
 Sun, 14 Nov 2021 11:36:22 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:36:22 -0800 (PST)
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
Subject: [PATCH v15 27/39] soc/tegra: fuse: Reset hardware
Date: Sun, 14 Nov 2021 22:34:23 +0300
Message-Id: <20211114193435.7705-28-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114193435.7705-1-digetx@gmail.com>
References: <20211114193435.7705-1-digetx@gmail.com>
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

The FUSE controller is enabled at a boot time. Reset it in order to put
hardware and clock into clean and disabled state.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 25 +++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse.h       |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index f2151815db58..cc032729a143 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -14,6 +14,7 @@
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
 
@@ -243,6 +244,30 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 		goto restore;
 	}
 
+	fuse->rst = devm_reset_control_get_optional(&pdev->dev, "fuse");
+	if (IS_ERR(fuse->rst)) {
+		err = PTR_ERR(fuse->rst);
+		dev_err(&pdev->dev, "failed to get FUSE reset: %pe\n",
+			fuse->rst);
+		goto restore;
+	}
+
+	/*
+	 * FUSE clock is enabled at a boot time, hence this resume/suspend
+	 * disables the clock besides the h/w resetting.
+	 */
+	err = pm_runtime_resume_and_get(&pdev->dev);
+	if (err)
+		goto restore;
+
+	err = reset_control_reset(fuse->rst);
+	pm_runtime_put(&pdev->dev);
+
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to reset FUSE: %d\n", err);
+		goto restore;
+	}
+
 	/* release the early I/O memory mapping */
 	iounmap(base);
 
diff --git a/drivers/soc/tegra/fuse/fuse.h b/drivers/soc/tegra/fuse/fuse.h
index de58feba0435..1b719d85bd04 100644
--- a/drivers/soc/tegra/fuse/fuse.h
+++ b/drivers/soc/tegra/fuse/fuse.h
@@ -43,6 +43,7 @@ struct tegra_fuse {
 	void __iomem *base;
 	phys_addr_t phys;
 	struct clk *clk;
+	struct reset_control *rst;
 
 	u32 (*read_early)(struct tegra_fuse *fuse, unsigned int offset);
 	u32 (*read)(struct tegra_fuse *fuse, unsigned int offset);
-- 
2.33.1

