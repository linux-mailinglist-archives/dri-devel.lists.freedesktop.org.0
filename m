Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CADD51F4F15
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45F96E37F;
	Wed, 10 Jun 2020 07:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3AE6E2BC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:35 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z9so24951814ljh.13
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eQ3h8Ane+DGwk19e9LoUjeH+6kuRPH+cvxzXdTjxJoI=;
 b=sr9smtd/X2TAtj+jB9Xt0hR75GzF+z9QEMDVwFu/VhYMicUKng0kG80Vs+otUE3E6e
 OT8MlEj7ng0+A/YXa3upxyT1+xitxML7CL1pmQ6sFiJsHTRufjHjBdSWzIIJupI/2LwM
 iAcSajC9XDB5SXxSpHwLyK9wuRp8kIMiL0V3TP7aCn4UZrMyagGowSfjZtIeX+5+T3Em
 CgFnf5kKqegdAD1c4a9gT62gxmFaVxuInAEi52qng/n86OURvvDTdan7p6rHgNCmhXyk
 y9gZJUiePCLkW1ueC+0ds06ZdHKlOImsS0Hht/TYCkie+SgGDM7IBDTY3WFlIBoGLGjJ
 hKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eQ3h8Ane+DGwk19e9LoUjeH+6kuRPH+cvxzXdTjxJoI=;
 b=JB0fbsudnToJiKp/fs1t1DWBv49oOVlbN9ZYBIvyElHn6ewKB3PCgl1vA/3wWTvc2N
 AT+hgu3JjWu0oFf4Bj3MOjOUEI9Fyaqlh38RaPa7LAAlahgcdAp/x18WlzqBRgclYVp0
 SbwY9xIpRwwVbbs+jAVi6QZY8mH3iggU4rvPs6LVEHqZ2MirEyzHu921gor2IRHNoI9Z
 WZ+BIu095zcLZrRu5Kz/jtg5dlA6nvZN7W9ag1SgRWQvUtPu1pbB57onravgrvQphinJ
 jX3jtxHTxehDlm6DyfCYvAo8uJWOFQudKARTAHNRB6zIhqYdvNnVs2waYWRTga/zmwtO
 g7uA==
X-Gm-Message-State: AOAM532Vzduxzje0AuK8I1ldIFzpq76eq88shnKYDCHe3147SxI8c/xC
 Bs1JiN0Qxz6+En682LA3+6w=
X-Google-Smtp-Source: ABdhPJysLy/ytBXckY4POgNUQGKQ4QlbcnhjoNkfFQXjUOYkxP+flvZczjNtCZMYL6RWbQxYJYhw5Q==
X-Received: by 2002:a2e:9c1:: with SMTP id 184mr14667970ljj.241.1591708473574; 
 Tue, 09 Jun 2020 06:14:33 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:33 -0700 (PDT)
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
Subject: [PATCH v4 07/37] memory: tegra124-emc: Use
 devm_platform_ioremap_resource
Date: Tue,  9 Jun 2020 16:13:34 +0300
Message-Id: <20200609131404.17523-8-digetx@gmail.com>
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
 drivers/memory/tegra/tegra124-emc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 98d98d09b00c..6d2897d4dca9 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1193,7 +1193,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	struct platform_device *mc;
 	struct device_node *np;
 	struct tegra_emc *emc;
-	struct resource *res;
 	u32 ram_code;
 	int err;
 
@@ -1203,8 +1202,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	emc->dev = &pdev->dev;
 
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
