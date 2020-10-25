Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A336C2987BC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0D46E837;
	Mon, 26 Oct 2020 08:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62976E214
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:29 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id d24so7706017ljg.10
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v6ur3FMhIFe8KvuxQxBkljzFbdkKufNSmZGLKBtZ/Ro=;
 b=BodnatAiw/VKmtLioaT+neJet4GwmMhSrvQOmSWb1dBrf2P08gTcaOGU1uurLGXRxE
 lGXcv57rEDS7EiB7mldnxCE+2vfBzzp4zayubegNwxxpzyWPLuMAQh2TlmdfgfCR4T8k
 uxhWvqKrubngEgoCndecxTbFXI0MbfNe0MlVkh7BZMCmfRZBtfwyX+qvHirQFB9Tslxq
 GEPI3vYHdH6pFo3ehTUEk82FitfIKVO6BH8XF9oL7tiIKQdAXsb1C4q6+MzwZr1qdMKa
 /kCa2SoiMZCMAe6gUhf4JU2gyP5noYwf1hbeWI0ggx80umHA6r6/0u2Yj66wQ+L8dhNU
 UDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v6ur3FMhIFe8KvuxQxBkljzFbdkKufNSmZGLKBtZ/Ro=;
 b=SyUWMqVpiazvHnJiQk4A+3C8JhnlkU/mXi1E58TDW/4z569lgTx51d6CKW+NZWllRI
 A/lzEgSsybJr+6+JlQBLTM/Ny3f0fVDdG1kxf+NpZjOsu8RpylORM20riREFbSLL0z8i
 KE8kmfeGW0k85FILtqIZCmcZk4cp8UObVYtMqOrdbNBYxuVKjFniZsOx/9Son2pFF8P5
 Vm/6g6GwZ/9jGkgIJ/o+wQJDovAn9y+tHYxL4fgjPVjv2ucd0/FWvQBIJFKLedPN07nU
 I6JDZHmJceicFcVMMG2sXALbTWwTJ1G58s7iJ3Sf8c304TpvOUKtd/sqS6ih6F2/pdjA
 MBCw==
X-Gm-Message-State: AOAM530MQ4SSSM1CLhrmVi3lGpsV7sVJwfPOQq7W6clffE6iSeDqdP3C
 AxbSS7hLCOIk4g6Q11/YmeY=
X-Google-Smtp-Source: ABdhPJyJrFTPUr3OlEv3PM6r3URpRj9d4p8+2HogxPn86GPceWkk33M9WYAtiheFrzdPsx3wQks5Ng==
X-Received: by 2002:a2e:9a17:: with SMTP id o23mr5025831lji.242.1603664308300; 
 Sun, 25 Oct 2020 15:18:28 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:27 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 35/52] memory: tegra: Add missing latency allowness entry
 for Page Table Cache
Date: Mon, 26 Oct 2020 01:17:18 +0300
Message-Id: <20201025221735.3062-36-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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

The PTC memory client misses the latency allowness entry and this patch
adds it.

This prevents erroneous clearing of MC_INTSTATUS 0x0 register during
of the LA programming in tegra_mc_setup_latency_allowance() due to the
missing entry. Note that this patch doesn't fix any known problems.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra114.c | 6 ++++++
 drivers/memory/tegra/tegra124.c | 6 ++++++
 drivers/memory/tegra/tegra30.c  | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index 48ef01c3ff90..ed376ba2d2fe 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -15,6 +15,12 @@ static const struct tegra_mc_client tegra114_mc_clients[] = {
 		.id = 0x00,
 		.name = "ptcr",
 		.swgroup = TEGRA_SWGROUP_PTC,
+		.la = {
+			.reg = 0x34c,
+			.shift = 0,
+			.mask = 0xff,
+			.def = 0x0,
+		},
 	}, {
 		.id = 0x01,
 		.name = "display0a",
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 0cede24479bf..e2389573d3c0 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -15,6 +15,12 @@ static const struct tegra_mc_client tegra124_mc_clients[] = {
 		.id = 0x00,
 		.name = "ptcr",
 		.swgroup = TEGRA_SWGROUP_PTC,
+		.la = {
+			.reg = 0x34c,
+			.shift = 0,
+			.mask = 0xff,
+			.def = 0x0,
+		},
 	}, {
 		.id = 0x01,
 		.name = "display0a",
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index fcdd812eed80..b1990b4133d8 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -36,6 +36,12 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 		.id = 0x00,
 		.name = "ptcr",
 		.swgroup = TEGRA_SWGROUP_PTC,
+		.la = {
+			.reg = 0x34c,
+			.shift = 0,
+			.mask = 0xff,
+			.def = 0x0,
+		},
 	}, {
 		.id = 0x01,
 		.name = "display0a",
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
