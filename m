Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A42931F0F0A
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72986E41A;
	Sun,  7 Jun 2020 19:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3C388FA1
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:54 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id n23so17764641ljh.7
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/l7+vPYH5EAd2WIrcrF+WV/TlTdD/VFXDpsYjNZO6cA=;
 b=dVsgERA8EoMvfU/i/6FPKu7i1+I5nNoKaAZEtWAWmOQTfEbO3SsXfIyLO6ZsbnXF4d
 kQqBD9tsHztUpMIttlX8B1qjzGnD8F0wvyG0DXltz1gt02GCZ1Otbke+dcj+89LxiUvz
 nV7JT1V+EPVS2ZZqy6DP1TmKV5MkdtI2X0K/XaQOKiw8/XwxZADP3g+wdFy8qXb0uPCc
 SwgkVqtlwztpiCb7yj1rlquOoYg+FHsfOWarKvcywUtoKaxDSINfU4C4XjwmmQjhzxZe
 A129/zRtYWe+cVGVa1sGOnPS0KlG+aYkbdLRKpz6WRjTl2EQSgUEI0vFbJz6H06bcpFn
 B4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/l7+vPYH5EAd2WIrcrF+WV/TlTdD/VFXDpsYjNZO6cA=;
 b=KMo/YF38Gpp2IuzWDP/Cm68yA9+1ZIGcNknvtwCl1Z4KimXhOMzO/3rDZSDaMABq8Y
 I74Vda2rkym2zT5BqkulOXmNgujdWleCmXAh/0jJhT0I1wqS/2st+r4FT8jmOsB56dgS
 6ZzI9XaIJovxF00xcOes8g1fgM5FgaxYFUqk/kuIpQ8M48SlGf/KPHySe6E1s/EaaW2V
 19/1fPJfGRmHqkW9enlPjJDbjeG3SyrGVW2YTR2Y0+3NWnT+5j8KNELxe95sjKwBxKk+
 MenWj2WlJcgr8YjaJLGhY3w7LWbKi8r+JGTydbNLdiR48LcgMbq3ncH3NtzcXgyvVEFo
 apnQ==
X-Gm-Message-State: AOAM532lUcnSXsb2/8Yc4AL7GAOTfOfE4b8m9GOV863O1st6YjxZQOfY
 NETDyRXE7rkq5Nkd3rSWhxAdflAJ
X-Google-Smtp-Source: ABdhPJzD+LEVvvSpdeGXtpL+iBegUzavLwLLbh0JeGHk01OuI3UWdFgXAchY/h+rdfr36Bw76q1vXg==
X-Received: by 2002:a2e:97d8:: with SMTP id m24mr4442488ljj.166.1591556272788; 
 Sun, 07 Jun 2020 11:57:52 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:52 -0700 (PDT)
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
Subject: [PATCH v3 32/39] memory: tegra20-emc: Create tegra20-devfreq device
Date: Sun,  7 Jun 2020 21:55:23 +0300
Message-Id: <20200607185530.18113-33-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200607185530.18113-1-digetx@gmail.com>
References: <20200607185530.18113-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
index 2281bf9b784b..6dfd9807e042 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -882,6 +882,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
 				err);
 	}
 
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
