Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3A41F4F2C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A176E334;
	Wed, 10 Jun 2020 07:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3462C6E2D6
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:15:02 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id z206so12448005lfc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lfxRXNNcGA+yEfa6dSr/5fCeUu1kfzCJExeudjlYPeU=;
 b=UU3p0NwtBQlRzm2C4CYjsNrMOlsptUWTED3JTJs0fFLfhVIXey/OwuvRBg0Ws2LFEm
 O7I4o0VUj4F7KwAVSVbDDr7WWmZaxbpe24mcbXfe1PhGBkDVc24GJl1Ct39fGVSf/knZ
 uK7tHBIxwJGbjolLd5w29uynxTLAuxoolMxqcOuJr1nUqPEFKwvageu6h1SdSR6JdHq7
 hLhGhWw7igdfPk6CPLiq5zzK2D8e/SV2WmpkxRmqKCSpH8tCPu5CI0I6NBsFOHxOGvnT
 nDdNh4VT8GmhOanIJJzm9VoSLO+R93RJo+pa8igSUA1sKeMMCB44n2e2h6+t5jtUkIst
 Y0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lfxRXNNcGA+yEfa6dSr/5fCeUu1kfzCJExeudjlYPeU=;
 b=uOFx636XMIZgrjiLUw9bgHsftGwBt6RXku4U4pd8K0r5MuvF1WaF1bUqJr9JL7wmTs
 UFWlklQtRX9XGs5HtYKwPHjN5FY/7BhnsW1iB1O0BRCDBpozDlHfIRe5YSH/1lE316ow
 tguzVIYZG8VmeCZE3VfqRlAvPLuGUGvJZV0xihx6X8gO85rQm+W/Pqu58RCkDRFxIHDP
 GxgkGx317SFpta5VT7HrbQowLmZMdqfStJWEn85E0sAFIBOLtzet13itfZFe6wo5Xrv2
 WDz8wydSbSX5I0usOceNUqqvGmoafEjYeI0V1Q71VA21kjxEmqsi4zkMl5nWl0VVIHJe
 e6gA==
X-Gm-Message-State: AOAM532ZUhz4/iohgL33z3H24lH1/zFdwpGIVGlc0Fc9X8ipctBzG1Jp
 a003ZWnQvhOEmpXwXadHX9s9EQRp
X-Google-Smtp-Source: ABdhPJx/F8fHSj8IPfxRksHOX6Wh3jaEN6hkcvFDfpBoSYwe9VBvwIsqU4aVdIjge+KwKrM50R0YWA==
X-Received: by 2002:a05:6512:60f:: with SMTP id
 b15mr15311465lfe.159.1591708500655; 
 Tue, 09 Jun 2020 06:15:00 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:15:00 -0700 (PDT)
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
Subject: [PATCH v4 29/37] memory: tegra20-emc: Use
 devm_platform_ioremap_resource
Date: Tue,  9 Jun 2020 16:13:56 +0300
Message-Id: <20200609131404.17523-30-digetx@gmail.com>
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

Utilize that relatively new helper which makes code a bit cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 2e310c51c599..507065c2f452 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -689,7 +689,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
 	struct tegra_emc *emc;
-	struct resource *res;
 	int irq, err;
 
 	/* driver has nothing to do in a case of memory timing absence */
@@ -724,8 +723,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	emc->regs = devm_ioremap_resource(&pdev->dev, res);
+	emc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(emc->regs))
 		return PTR_ERR(emc->regs);
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
