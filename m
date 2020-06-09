Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ED11F4F09
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716BE6E330;
	Wed, 10 Jun 2020 07:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47B16E2C7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:43 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n23so24970282ljh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AmHb/qTFiuR6DXvA/ffC/nHLs0yGE7r571S6zKct1lc=;
 b=SEopFD6WA6X0oE0yMZuxwxvYBQFHQJCCJua3OwUoX/QqrQlqZ3M+GzRG9yCFrFseZP
 KZ+VpLlPociuyizoUcEgoYDc2D/f2f8RlMbG1zK/GokjMg4umvEjcEmwl8hkk4TLK6IM
 tF61xjPihOqkZaHBYYLssFhno8KgX92dIUtIiLfVbo7+JTImobm6iXLX6gfB3RtJ5DyG
 XKkEb75lI/cBFh6PztCCh/B2uQerDExyOHECRoi7sA+VgHSYD7KRAvCeDqt0GOgOcVFJ
 6NtBgNT9LVFusNmYz3wZSuJN11UhTRhKjbre8gvBXoW09blWoxZd16ni/P2Vt7/5xtgS
 eQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AmHb/qTFiuR6DXvA/ffC/nHLs0yGE7r571S6zKct1lc=;
 b=GqGB1kqyVBIpFcVO/sfr7R/NMTOEcFK0gO4kfTMoAfYEhwTpbUi6xvWzLA7LnRnzRy
 bgKZa0BAwjCnGGOQCusOebRO3zwDmAyl94+jJ1Nt3pvQ21Rs646yi9IIAL+eSO9AAqNe
 zH1tQjzXlDrgG9UsV9PZPdcDSkgOAWgHsphAeLbE7m3qHy1L0AzHgbrSTHCErTfPQ/Cw
 Qi27lHfNao24UOSbxMhNBLDEM3H234u093MUhh4BpLKhUNKZ2JiWFapZbljCUF/SXG9/
 H8AucJWepTeU9g0fNzmDDP5jJEu/IKQ+q7L3CmZneCUPjWtCr+NIL/fqI2Ut8JnL8MJO
 o3RA==
X-Gm-Message-State: AOAM531M7kD+jCW3FF7Os6FdmoYozpamzViIcY4qjbjqiyH/0zN4E40h
 6M3pd4plQV8oIl9MBm0sEVQ=
X-Google-Smtp-Source: ABdhPJyyEojgVqUPpi4CNo4lhcaSGa8eRgXbgLQjT8AsOnF95049pCzOGKyIKTvZUwaIiCa8veiYMQ==
X-Received: by 2002:a2e:9f57:: with SMTP id v23mr11785142ljk.324.1591708482389; 
 Tue, 09 Jun 2020 06:14:42 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:41 -0700 (PDT)
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
Subject: [PATCH v4 14/37] PM / devfreq: tegra20: Add error messages to
 tegra_devfreq_target()
Date: Tue,  9 Jun 2020 16:13:41 +0300
Message-Id: <20200609131404.17523-15-digetx@gmail.com>
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

It's useful to now when something goes wrong instead of failing silently,
so let's add error messages to tegra_devfreq_target() to prevent situation
where it fails silently.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra20-devfreq.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
index bf504ca4dea2..249d0dc44f6c 100644
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
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
