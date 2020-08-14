Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F79C245D01
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8F36E426;
	Mon, 17 Aug 2020 07:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994006EABF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:03 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m22so8090598ljj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9G5w7c/hIvGiVCDrZTknQQZfa/cldECq9uSATZxh3c4=;
 b=otxEOoePlNJwWzSvhtqw8dV7okkDaXfkHFp6nD3FsIzs4ZEU1R6d8+gxFI8ZYiTOkp
 C0qBppnBBwCBUZeNmxY83awYyFy/mhxtD99Of9G23/KMnQLBGH+PaMoLVSgR4ZkOLdZQ
 8qMVQH4Yg9CFb/FTgoMJgRTRmTDv3I96TTqIJU+jjLT1mfgrJq8E5IvAuAuPa7fyY1ws
 310KCnzBMNJzlnQ7jHP1bV+0mB20ODMm54GZlx3pYn/CLbKMWg73wrX/TVosHglZdO27
 kTSgg+Zb675q5H9ox0zGBI56MqeL1XSJ7KlL0I+53ti2GayBrOdSsvzk2EtRJswiAQ94
 GG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9G5w7c/hIvGiVCDrZTknQQZfa/cldECq9uSATZxh3c4=;
 b=nT5fpMc96UJXlnSlROraND92eIlVXlIyQqUXffdZ7wyzq3JTroWE6bbKbJ/fNQktyd
 7nN0JCsdmxD7D+5wf7lBdCgjMpJZ84MZo2hZU6YrTJwWGM6o52zCdHVFdSOrVUF3c3Z/
 VIoiKXKcgXj9BzrgyT3jcwnjmW7nCBPMNCVTY74JW1Z5vjFd2r382zDnUYleovMLc6Jv
 ZCMuUdFW68Edu1PKDhvPAgyhWZ5T8zHmfajZf2jsryfmcJE2GIxOhhZBKC5xEZnjB4qT
 7bCUBQZQDZ385PeRyb5F28JjhKhT6wYeyxYpaFE1NdFGnstK7kQnBKkL5OL52csDNlem
 3XWA==
X-Gm-Message-State: AOAM530HkDNLNhzEWBijL2V8r8cYR+XpvRHWcOwvhG44qR62wbAg3fwu
 SUkFbmTqUUthAhxVsjQ+kG8=
X-Google-Smtp-Source: ABdhPJz4FEc4x+4JcBBa0eyimwEiNT6FBFi7MpO0vixFhxFCJuQWpOqfcbh3HRTEGm17m7Imhl4bKQ==
X-Received: by 2002:a2e:9d17:: with SMTP id t23mr105543lji.456.1597363622032; 
 Thu, 13 Aug 2020 17:07:02 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:01 -0700 (PDT)
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
Subject: [PATCH v5 01/36] clk: Export clk_hw_reparent()
Date: Fri, 14 Aug 2020 03:05:46 +0300
Message-Id: <20200814000621.8415-2-digetx@gmail.com>
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

We're going to turn Tegra124 Memory Controller driver into a loadable
kernel module. The driver uses clk_hw_reparent(), which isn't an exported
kernel symbol. Let's export that function in order to allow modularization
of the Tegra driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0a9261a099bd..2cbaede80fe5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2448,6 +2448,7 @@ void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent)
 
 	clk_core_reparent(hw->core, !new_parent ? NULL : new_parent->core);
 }
+EXPORT_SYMBOL_GPL(clk_hw_reparent);
 
 /**
  * clk_has_parent - check if a clock is a possible parent for another
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
