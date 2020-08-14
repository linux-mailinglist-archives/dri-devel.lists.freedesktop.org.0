Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49089245D44
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5945389D2F;
	Mon, 17 Aug 2020 07:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5CC6EABF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:37 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t23so8128886ljc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SYVrVqyKmi1R5n5EphsB7nCz8XZpBo0lBJhV0Ix8t+w=;
 b=kHD2fNCDU7lJmrFW6dXFuOYm22bBYvr3VdsN9nKcyfb18EcS1FH+7kQ7JrxIqkMhOF
 BULskAMHRRV7KO+7N/NkWA1lQ4nONQz1EILPJD0F2L0kwmo4DHViU8MnUzUwFegY60kQ
 7tbY7ZiTvc8il6FQp/3xToaxFb/uwTQRj91YtVI6iE0fEsjePGJtz2UlAXQ+aegw0Udo
 kTZu3m2DlUeNijlHo9oFblbttVhqM8jjworPOKtJ3GP6mqSoKXBGbOpuzlsz1mWE05H0
 zhtAHSMNb60N9aiUaAf8rCZA4nkWRrHFdDUxAmZjYKgZOAvMJT6wKTDDsW6yBqwZhFoy
 WxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SYVrVqyKmi1R5n5EphsB7nCz8XZpBo0lBJhV0Ix8t+w=;
 b=hjMhvo1+XKC6sVQc9aKoDbJYz84v/x2fuyv1l4ue38h4GnPsZhCmHmsXtnJuUGAFvN
 gPVaD6DnncdzdvVdlu6249/Z22FJz1wdI6BpwqyZ4LsNHqxkqHUjeiN1C0dINRGeTztv
 bR43tkg9pkBfYaz8DMhroveZ6Ba9o4iivQphYg2ZX5OSV8/ALfcgG2a+JHWLprcb2dWN
 DHIlAr5nTIMN6KFENmIIvuf4tpVrxDs7D+dJ7z7aPSqkOeCOjMUvWo8qn7pJ5brWcnxv
 4PANrzzLet2Go3Z/0rUgbPtnaF/LIpweuph9b3+3RUfCcSR4BYdDJyCk+WXbwhT9bdxA
 BRmw==
X-Gm-Message-State: AOAM532c8wTKFi/hMBnblFlD2qUU6Lbi2lZunzOFXnkunIor8lO3nS2S
 4+z6aIvd5/krn6seyVz2y/g=
X-Google-Smtp-Source: ABdhPJwIs4y8aNM38rBL6i83ol6zAmutagnBs98xg1dZ+TNRSEXv4E1FjDzY79vpk5xE4Wzx4pmpiA==
X-Received: by 2002:a2e:9dd0:: with SMTP id x16mr107011ljj.144.1597363655869; 
 Thu, 13 Aug 2020 17:07:35 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:35 -0700 (PDT)
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
Subject: [PATCH v5 31/36] memory: tegra20-emc: Create tegra20-devfreq device
Date: Fri, 14 Aug 2020 03:06:16 +0300
Message-Id: <20200814000621.8415-32-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814000621.8415-1-digetx@gmail.com>
References: <20200814000621.8415-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
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
index 437d9d789941..e603cc0b0341 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -884,6 +884,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	tegra_emc_debugfs_init(emc);
 	tegra_emc_interconnect_init(emc);
 
+	if (IS_ENABLED(CONFIG_ARM_TEGRA20_DEVFREQ))
+		platform_device_register_simple("tegra20-devfreq", -1, NULL, 0);
+
 	/*
 	 * Don't allow the kernel module to be unloaded. Unloading adds some
 	 * extra complexity which doesn't really worth the effort in a case of
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
