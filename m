Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36AB245D02
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661FA89CD9;
	Mon, 17 Aug 2020 07:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CAC6EAC8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:18 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w14so8110119ljj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OACUgnIVU65tzsOzScIriTEik4ElupmW/3n4uNknnCw=;
 b=kZL77P19rsPfMMmuxF3UHL/Nw2J9zg9LBziAuYQ3QGHZKN9kRvJK7aiAXbyRYjKZQ8
 /5Wmh0LE201J+xiNAsLVXtEFIHp7BqFJaetac2UzyAmf4fwbF4Hz5y7PQep8vSK0S2yD
 +6g/WwNIulGxYBcNf2zp7lmJCi0+MZqEumQcasLcUhjAwuVx2pC3kyKNxrXDx6YRHGHd
 FZKLo9faGDn8FGsUuvYBT+yQ8b/cTDloITpIriRIGl90pO6Ftvav1FqXrsFGOwBd2hsz
 aOjBHxaHnknr21wkmfTOjJMnHlen/Eyyyg4xWKumXfMyebpvCdNKn6XJOi5Uc2hXVU50
 PRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OACUgnIVU65tzsOzScIriTEik4ElupmW/3n4uNknnCw=;
 b=L1YotEvGLX1MDmp2UggHmp856RhqH+289ZoikLagf+CJ8CCiv9+OmepaIMe6GFXr+s
 JjawmFhX/KT4y8/pqzQ/pSWXhxy0qXisjgkSH80MGTlRb4lYIyngwaR8smnpQSQUI/KR
 zmQaOQw9rCUXNpYKkY3agDc0OwgOt7TD3YSwwZXFDjlni16qKAhmhI8PGEs6rNRCjeKD
 7su3xha4Sn0hd0Uy0D6jT/S+WAjfDuGjsaoZ+LeabAvQef3KVzgDXqsbw+HpM9Q/dzP+
 vLhdkUCNK4BC3Vwn0H7hbTnOaDoK9XqOvAX2Mp3K3oJj/3ed6Ll77QT70j+LgHGAgnaU
 9sOQ==
X-Gm-Message-State: AOAM533p8c9cFHnirySRgqXSqrqPUmURg4bQc6HVoLSPsIhv8GonHkJ/
 a4SdVXAW/IYiUTASSMCwfEw=
X-Google-Smtp-Source: ABdhPJwZBq6RRxfSxs1QS6UjMbi4aAPxYtBEkRmgJlSMBt/bp0JaRodpMylZTYNCmfkGoS/0/xKH5w==
X-Received: by 2002:a2e:7504:: with SMTP id q4mr107843ljc.41.1597363636645;
 Thu, 13 Aug 2020 17:07:16 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:16 -0700 (PDT)
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
Subject: [PATCH v5 14/36] PM / devfreq: tegra20: Add error messages to
 tegra_devfreq_target()
Date: Fri, 14 Aug 2020 03:05:59 +0300
Message-Id: <20200814000621.8415-15-digetx@gmail.com>
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

It's useful to now when something goes wrong instead of failing silently,
so let's add error messages to tegra_devfreq_target() to prevent situation
where it fails silently.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra20-devfreq.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
index a985f24098f5..bc43284996de 100644
--- a/drivers/devfreq/tegra20-devfreq.c
+++ b/drivers/devfreq/tegra20-devfreq.c
@@ -44,19 +44,25 @@ static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
 	int err;
 
 	opp = devfreq_recommended_opp(dev, freq, flags);
-	if (IS_ERR(opp))
+	if (IS_ERR(opp)) {
+		dev_err(dev, "failed to find opp for %lu Hz\n", *freq);
 		return PTR_ERR(opp);
+	}
 
 	rate = dev_pm_opp_get_freq(opp);
 	dev_pm_opp_put(opp);
 
 	err = clk_set_min_rate(tegra->emc_clock, rate);
-	if (err)
+	if (err) {
+		dev_err(dev, "failed to set min rate: %d\n", err);
 		return err;
+	}
 
 	err = clk_set_rate(tegra->emc_clock, 0);
-	if (err)
+	if (err) {
+		dev_err(dev, "failed to set rate: %d\n", err);
 		goto restore_min_rate;
+	}
 
 	return 0;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
