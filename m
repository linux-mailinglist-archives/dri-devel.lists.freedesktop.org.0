Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A952987E3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6976E889;
	Mon, 26 Oct 2020 08:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536656E0DF
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:43 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id a7so9394174lfk.9
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1PH48KfFXPwOSFrtxH/nqQ6/PkMkkNmgzsjXGDZ87+I=;
 b=NU8o04tLt1lEwiomFhKoT9cvrlR4P/69J4LCKbKBeOq8ftqqFhtH/wKXbuKi+IREf+
 PbE/lmPcNo3gCjHGaWDSZX4LEcIv1u3oG2PQqB3X1KW3pR92MMZ8rYE9u9gxmWXoEDIS
 /Rdfeh4QSXZxtV5Rp1E029mhH56g9IAgUI1nozGp5tos2vVxy7iaTJlKn3V7I1ZDJK+W
 iZ5IWBC77EqAxZ8XzcHeHMJT32SVAGwMgKwkbI9+MSx/1L15bQm3JGdSXVDFBCBYndAx
 rbeUE+H9T+xIgto1QwDRnY0eE2kySXok2xwho32fMe3VvEzNs53FKm+1Mrtke21+FmKf
 Dotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1PH48KfFXPwOSFrtxH/nqQ6/PkMkkNmgzsjXGDZ87+I=;
 b=oEwXAzul2tSWBuSQtP/zmqX6sTeYemYfMp1hMF/HI0uM9xfjNJYsMz0rgHowPIz85d
 /XTaKKmdfJwBdmh2/XpwQDYvFTks3Y5A8bBVfSw0iv+wNIbMgiPke+GuKNxN+0N8VABN
 V2X9t6blVFbyPC58MV5ZBio3qiOUIt5pygF9I4GIrQ7zkwnYYhG7qWFK+gJnZA/io8AD
 6OCGRXKDWqohsIP2gVdhF9SvJ7vPvWHiYSJp/mv+3IiwEkCgbcb6RKFBytojAC1tFZr9
 7c/Up/pJuRCAaIKL6VfpufE9JHMGTPlgrArTslRDho3d83dEzpTNCzq9vxW8hlZaJJcR
 Sblw==
X-Gm-Message-State: AOAM532l4WXrJ9UkMM+JhQqN+2QH+JXgy3UWvMy4zYEHg5z7F7FmRWEW
 4SXmwCtPkyekeFjOcO25OXI=
X-Google-Smtp-Source: ABdhPJyCump6Q8GEh7VpGfsg/snta/sTN25f5fywvrLs7iGoc5nw2s4PlMJvhieIjbEaatJQrUpZTQ==
X-Received: by 2002:a19:957:: with SMTP id 84mr3699671lfj.342.1603664321823;
 Sun, 25 Oct 2020 15:18:41 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:41 -0700 (PDT)
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
Subject: [PATCH v6 47/52] PM / devfreq: tegra20: Silence deferred probe error
Date: Mon, 26 Oct 2020 01:17:30 +0300
Message-Id: <20201025221735.3062-48-digetx@gmail.com>
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

Tegra EMC driver was turned into a regular kernel driver, meaning that it
could be compiled as a loadable kernel module now. Hence EMC clock isn't
guaranteed to be available and clk_get("emc") may return -EPROBE_DEFER.
Let's silence the deferred probe error.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra20-devfreq.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
index ff82bac9ee4e..fd801534771d 100644
--- a/drivers/devfreq/tegra20-devfreq.c
+++ b/drivers/devfreq/tegra20-devfreq.c
@@ -141,11 +141,9 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 
 	/* EMC is a system-critical clock that is always enabled */
 	tegra->emc_clock = devm_clk_get(&pdev->dev, "emc");
-	if (IS_ERR(tegra->emc_clock)) {
-		err = PTR_ERR(tegra->emc_clock);
-		dev_err(&pdev->dev, "failed to get emc clock: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(tegra->emc_clock))
+		return dev_err_probe(&pdev->dev, PTR_ERR(tegra->emc_clock),
+				     "failed to get emc clock\n");
 
 	tegra->regs = mc->regs;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
