Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98D12987F1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2CD6E976;
	Mon, 26 Oct 2020 08:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0326E192
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:38 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h20so7721862lji.9
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=34s82dziDgtjgE1mmga3CEGdzqBry8pDI5SpO3RIz5Q=;
 b=O0TjVomy7sTec0JSEBoEoVOg72u5g//g7ABf6m+HRcY9USmUYh5ieyO72yyyqWhriR
 Xd0KeoMs7hkj5J4QuFiJeA37EKd/eFS5Bq185k9XAsFBl+keaKGarO0TFJB7PjzYo0VY
 cvFK5gAadN1SA3GKiO0hLAriiNxHIFI+tqWYsVkRRkv/TCrlTXeD8vLyI3SS6ZoX5xUz
 +opgDp0u8XpB7qNmjiXcTzpHtjg0SV/HLqfN2qUcN9Vwdlc5Er2PZRF1AzdqHS4Ykud2
 KDsE+edq7eMFDmWws9UIx4qC6C67fDGxn+n7MuPrFcGpQ/dvfMO+gWUXRH0HhaZNl46S
 HHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=34s82dziDgtjgE1mmga3CEGdzqBry8pDI5SpO3RIz5Q=;
 b=Cm8+CQ4IYfGAc7Ixa0sgVBudxj3ZBxJCSnCux3CkXdmFRBbGhzBrHqi4UBIu/SSdGe
 9pxTJiuPXiRwoSOTnevAC6oVtSJMwxJV5wkjJnIkC8yXCi31YZgSV1mFlmOrBan69L9Q
 y/U8FEa2DHasiDbZ1CkkNrg56XKDwwVdJ/Bbbw3QSsFlsqjeOQaKvcZ0sbYHR9bzBn9J
 2cpEQVxUBjCov/VJQHlA/E3JjCm2sgfVZTiwwhfYJeVKaF2ERkuy9FZAHX+n3wf7B//A
 v9zYp6nviRtlu6iXBshjzs4suJTeOWfJUkDGh1KLaSEAgD6GbqwWW2m617TES9LVGDoe
 J4rA==
X-Gm-Message-State: AOAM53178vztMh4vtZhDhV+33Cy9jSrorXSDjBa5to6fetPd5b2bfFBe
 64lHIH+GA1rQ1IBDPFQ+fiQ=
X-Google-Smtp-Source: ABdhPJzpGbxU3dxTzUBB9eXcGkorGydSItojnxwUzoP1UK7n046ygK5N9HVGnibcbtno/Us0LjqKVg==
X-Received: by 2002:a2e:8108:: with SMTP id d8mr4756026ljg.96.1603664317268;
 Sun, 25 Oct 2020 15:18:37 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:36 -0700 (PDT)
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
Subject: [PATCH v6 43/52] memory: tegra: Remove superfluous error messages
 around platform_get_irq()
Date: Mon, 26 Oct 2020 01:17:26 +0300
Message-Id: <20201025221735.3062-44-digetx@gmail.com>
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

The platform_get_irq() prints error message telling that interrupt is
missing, hence there is no need to duplicated that message in the drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/mc.c          | 4 +---
 drivers/memory/tegra/tegra20-emc.c | 1 -
 drivers/memory/tegra/tegra30-emc.c | 5 ++---
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 15589bf8f5b6..4a3bf08495c9 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -837,10 +837,8 @@ static int tegra_mc_probe(struct platform_device *pdev)
 	}
 
 	mc->irq = platform_get_irq(pdev, 0);
-	if (mc->irq < 0) {
-		dev_err(&pdev->dev, "interrupt not specified\n");
+	if (mc->irq < 0)
 		return mc->irq;
-	}
 
 	WARN(!mc->soc->client_id_mask, "missing client ID mask for this SoC\n");
 
diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 27242659dfd6..1519d6ce9b28 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -844,7 +844,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		dev_err(&pdev->dev, "interrupt not specified\n");
 		dev_err(&pdev->dev, "please update your device tree\n");
 		return irq;
 	}
diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 66eae944ca6d..d2515d7f3c0b 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1472,10 +1472,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return err;
 
 	err = platform_get_irq(pdev, 0);
-	if (err < 0) {
-		dev_err(&pdev->dev, "interrupt not specified: %d\n", err);
+	if (err < 0)
 		return err;
-	}
+
 	emc->irq = err;
 
 	err = devm_request_irq(&pdev->dev, emc->irq, tegra_emc_isr, 0,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
