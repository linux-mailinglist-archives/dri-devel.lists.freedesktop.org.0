Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1825F1F4F05
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200376E088;
	Wed, 10 Jun 2020 07:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742B96E0ED
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:27 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y11so23348057ljm.9
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o4M3bTUDA74h1lwoV4T2HnrphCh8yThUo/f/7p0LEJQ=;
 b=WubWCnlkgI26pfDVw0Ep1IhBhHdHzkVOBYEPckyx1O/SSzugmHx8umh0venYLUw/Ro
 mfDiF91/57n9ZKeX48nhhr3xmtVLkLmP8/aoMTjbmywRLYKaZeSd53ZXy9mqDLnhedCH
 S3lBChQtwGUrZlKCvD8arJfsrruaX7nvAAwH5PLSoA1mNy1OqZCTFKZxW6Zk37QKK3So
 yd3LTmHTyJXjSfb8Uc+4nUf1bGJUVgEGZJ7gr/nNpjwmINI2yKy2tVqq5QS43LkptZ8P
 wCbHInI+KPaGs9kvstdV2zsM+mECcDcGDHnppOC73x608s71jfurL6wgGky/aC7rcNm0
 d4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o4M3bTUDA74h1lwoV4T2HnrphCh8yThUo/f/7p0LEJQ=;
 b=dRn0eh3Eso/zTAjffcQKTfUi5H6bT+uK01aQfyi3WafZLRusN0BHifT4Ib/2j0BKIU
 ioEHQIWXb9eGRNgyJt4PFqjjIXDM2EdCZHRHAmmI7ZRFNqGCwxmpmOwEkijwthfGGfup
 O6Xkd7HGGMIkfl2npnFwM8JYgwv6TR87bXqeO28SYt8GIqsqRIgMp/i8DBEUT3EO/zrr
 5YtZKaQtG4mvF7qaVavBCBwScscv+AA3DlJgFBMZlnoXHIo20VHv8Ebc5GxQsGQy2nCf
 KVROFUBAj3QF8NOoFe/dVH3RIRM7F/DMt2SlVJc5hkpd2ZAKmyuN4jRqxMgAFxeguKTC
 KoOA==
X-Gm-Message-State: AOAM533/nojBUVWBXCaZFZZ1sIP4gIvmXNWt/MSMNPaX4aoFB60ZaLkF
 h07HrL58HwJfMVZRIlMcFXPsA+4s
X-Google-Smtp-Source: ABdhPJz0i8282/FJQIGDuc8pcHuZXMNEm+kWgDf2nK40LNBw6s1gDJI5NwQ3Sx3CyiBJD1F+eVni3Q==
X-Received: by 2002:a2e:961a:: with SMTP id v26mr3973130ljh.296.1591708465781; 
 Tue, 09 Jun 2020 06:14:25 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:25 -0700 (PDT)
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
Subject: [PATCH v4 01/37] clk: Export clk_hw_reparent()
Date: Tue,  9 Jun 2020 16:13:28 +0300
Message-Id: <20200609131404.17523-2-digetx@gmail.com>
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

We're going to turn Tegra124 Memory Controller driver into a loadable
kernel module. The driver uses clk_hw_reparent(), which isn't an exported
kernel symbol. Let's export that function in order to allow modularization
of the Tegra driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 3f588ed06ce3..2fa6394d9a1b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2439,6 +2439,7 @@ void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent)
 
 	clk_core_reparent(hw->core, !new_parent ? NULL : new_parent->core);
 }
+EXPORT_SYMBOL_GPL(clk_hw_reparent);
 
 /**
  * clk_has_parent - check if a clock is a possible parent for another
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
