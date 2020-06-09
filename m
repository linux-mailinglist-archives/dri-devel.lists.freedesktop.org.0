Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 356D11F4F23
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56706E3F2;
	Wed, 10 Jun 2020 07:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D6F6E2DC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:15:05 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id e4so25009645ljn.4
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gODohnu3Esv2qlUienjAVp66GFOWKMfQEeRzgVApqO8=;
 b=q4s89G5iheCGw9OQAjJe2Zc6d+GgU/j8R0VUdl5NnYbuBl/XK2ztpBsz2Ef3lR4KuW
 JWioKUSN8scZ1jlt622kBg9OsW6EIhozc9XVBh9w2w0xrIYsWIAkJvIMD8+rOFMTftLP
 raRlky6+p1TUfxgB093IFSiTZWzQdPoRUK5PiNfWmeWUh5I9SA1WV2nEgPooQrYiNAlT
 CMRiHzk6L+H5f3CXce7iG1XxWJn+n9VSEOGY19V/u+3GJwljxr04lUnfd8G0cGsWv0I0
 B9CiR099u9pr5P+TANsbtEG9lIsHOYGauGX8i+f/2OxRYOaLmstOwQH4NOHQvDghYIj3
 yrtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gODohnu3Esv2qlUienjAVp66GFOWKMfQEeRzgVApqO8=;
 b=ImD1nGn5w2nWzyGLofo4yqxxcZMfEVXByXWUef1jI5cCHMwa6TDXk1S7J/LqaRpfbo
 cpjMMWVK74Ulq5iNmWI49o0hOKejahiFZZ3xzjLJb5n60ZmXeeGOsXXE8DgDULz+AQjx
 83AWJndM5jnEH1/YmwTk2MFXWHpF3dL/fPxo4Uj7RM2u2eXBaMh1lXg0Rm6gLYqTokno
 0znx+I0kLQ1iQMnb9yS1t7LhzTmvTmGQi7uHbFuv/itmvV6Xml630kwgHjIthhcjYKpo
 moFeMbnfOGe4+U+KKUyUQP6MTYD3HZDTyOMnvbP4aYUn3vE6qk8LSISALVzFfw3w2XOn
 IUKg==
X-Gm-Message-State: AOAM530aXy+Rl2NBcRuilPcbFm6B3OE7I5H5m3SDabMZ1dXcBozqosEg
 M/0YLMV/EY4Ym7xJrwJDl3I=
X-Google-Smtp-Source: ABdhPJzd7UuFrG5+2ucgDJRuP1i8bPa5bf+kKpq/V4rrtNjWPdK7qWtfkrqYiWuUfcb/29MAQnnLFw==
X-Received: by 2002:a05:651c:2cc:: with SMTP id
 f12mr684410ljo.329.1591708504216; 
 Tue, 09 Jun 2020 06:15:04 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:15:03 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v4 32/37] memory: tegra20-emc: Create tegra20-devfreq device
Date: Tue,  9 Jun 2020 16:13:59 +0300
Message-Id: <20200609131404.17523-33-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tegra20-devfreq driver provides memory frequency scaling functionality
and it uses EMC clock for the scaling. Since tegra20-devfreq is a software
driver, the device for the driver needs to be created manually. Let's do
it from EMC driver since it provides the clk rate-change functionality.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index ef0f5a69f24b..59d85e527516 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -877,6 +877,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	tegra_emc_debugfs_init(emc);
 	tegra_emc_interconnect_init(emc);
 
+	if (IS_ENABLED(CONFIG_ARM_TEGRA20_DEVFREQ))
+		platform_device_register_simple("tegra20-devfreq", -1, NULL, 0);
+
 	/*
 	 * Don't allow the kernel module to be unloaded. Unloading adds some
 	 * extra complexity which doesn't really worth the effort in a case of
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
