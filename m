Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 223D4197524
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683A46E0DA;
	Mon, 30 Mar 2020 07:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797E889F0B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:51 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id n17so16301007lji.8
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1McuIoe+/gchddRsq87TQMJQf8Rp7Vve2u5t5nrquN0=;
 b=b0LrrTZVzfHMBFktbu8bi6guGoeKKYPyscr7FgSWXG8u5NEJwgkgd6Oyd11o9AFkoa
 TJNRZTaOFIj+wksmETf023Gl95/UvNxOrZPZCgJo+CCS13hlTwQqZGgnR2p+FOX++w2G
 dlPcja6KqQNs3by9CFOpE6X3lZkbRcnKld/P5a6ZWBBWV3OSG+oLLBPDh+RmZTrhog6K
 JtlmkEgi4AluGfvdPtX1nbyxza05ITPOLChyv56T6E57hQxG8I6s/vVAcSIczOUFs3t2
 ds7aaFehKmS0wFvsksjfmvjKUKyr15eDGViJUhI2IqTH9tjYelqKLRspXLkgj6WD4qen
 XmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1McuIoe+/gchddRsq87TQMJQf8Rp7Vve2u5t5nrquN0=;
 b=g4otFkAdrIcNMMl9NSJb7BPqgH/ZJLg2WE95fsHKV+7z6Dq18rCpbEkuresnvxgx/h
 FZq0nhpahbeNyp3eZ66y4/Mw8vkwrCGm6wAvJ6y/h8fSPomFfZamBaHYYEASU4VYf1TH
 JlmIyndFp0idaUDFr5dg6QOx+bVv1i6qNJ2xb0jkhIq8hsLztfd8eui1FtKk/k14lOf6
 aK21dC40TVMYuFNyY4kaqzkF8gaqjhMdd7QPW8Kzkx0gd3CnqUaZSaQ5m6UM8Ybi59Ec
 NgT7YBLMI4G6OI8JbyEBRbHDe9qc2ISLXPMBaJVw3AzZtmvEDYMF0IK9u+AKCsSuqLyt
 v3Pg==
X-Gm-Message-State: AGi0Pub1inDgdHSER455Sv0PxQRzJAJc7c6usnt9x+iSjQDzv6tN4Vu+
 QqQ1ZFPWlsqr7roYR2CtqgUPnSds
X-Google-Smtp-Source: APiQypIdK6kO0xOLWty28oV/L6mJHCpdn490Kvca3eAPIUp5XW8mOja7127egPyznp9kVIoEwMooqQ==
X-Received: by 2002:a2e:b04d:: with SMTP id d13mr5775623ljl.278.1585530589939; 
 Sun, 29 Mar 2020 18:09:49 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:49 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 15/22] memory: tegra20-emc: Create tegra20-devfreq device
Date: Mon, 30 Mar 2020 04:08:57 +0300
Message-Id: <20200330010904.27643-16-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200330010904.27643-1-digetx@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
index a2fcff221659..867cd518b32e 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -838,6 +838,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
 				err);
 	}
 
+	if (IS_ENABLED(CONFIG_ARM_TEGRA20_DEVFREQ))
+		platform_device_register_simple("tegra20-devfreq", -1, NULL, 0);
+
 	return 0;
 
 unset_cb:
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
