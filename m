Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F1D1F0EEB
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D590C6E392;
	Sun,  7 Jun 2020 19:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C816E181
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:12 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y11so16107325ljm.9
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o4M3bTUDA74h1lwoV4T2HnrphCh8yThUo/f/7p0LEJQ=;
 b=CkMC2yyRk6883zqpAxX3D1mm05jiHYAU2va3Na9qiT6EcqhE+YCtxioloddd5gIt7f
 kOwDXEteEPBfWLC1auewBMLUK0rtXuKeZSXs7Q4LnRgB/zcp1jsInTnUWcvh+rbJo9B4
 gXnmvVRGMUm3XxXmbdtOxB2BTHlthJlo1eH3rShxEIdvw8xUOo4xKq0hSJLg+c4K9u9d
 AUp0UIv4qrSNp0u68DZjroN1XS0HGXzPqW9TXc3mg3tjUMwAM80UbGiUyoV4mvOIccwl
 Y2l/g88zwG8WC+DPQ4R+7JjgYJ4XgeM3CN7yu485J5ir2ZVC8fA1l0m9gUupKOwbn0ok
 0sAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o4M3bTUDA74h1lwoV4T2HnrphCh8yThUo/f/7p0LEJQ=;
 b=sdpaIga5nLw5pI+VEA6iPw8BJerJR5IS0ysq7+a3zF5g4fbtPN+73d/s/Ry5t5jJa0
 8MlUcwdFQklPwiAhs4CGQGSOT/z+IewGbMixeOBIB/vFIs4rJsXDQ6FKNnz887C42jnK
 uTyNw8Jski/AbHXmBo/Z9atHMP0mLjb5iOae1SuimIJTrrBspXzIZDdKYNR8vDz8wyYW
 he5FLOvi8zpsg0reSQC8xkrNBS30VcsqRgEYA7h6GkBIR3leWyDh0OjTsQcI1jN6341w
 fBvPCiX3CQ+RIbyiec7Jjo+xgWpL5cyEXtRQiPKcJnbrm18QmmgQ/wVUFJrWZWSpaROt
 wiDQ==
X-Gm-Message-State: AOAM531yXXNUXYA8fvPpob7cEAj86kJDH0EI/8IWzGZOFiVrBWIy98v4
 1a16oyFMIu5ljVmbxq4f/mo=
X-Google-Smtp-Source: ABdhPJxETMF3Q1N54rcAMjLTroZSTX4jtV3H9y1r8OIF+OopgvIIuIM9/RNrxzek11VHQAuD0bGIog==
X-Received: by 2002:a2e:8115:: with SMTP id d21mr9773311ljg.167.1591556230516; 
 Sun, 07 Jun 2020 11:57:10 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:09 -0700 (PDT)
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
Subject: [PATCH v3 01/39] clk: Export clk_hw_reparent()
Date: Sun,  7 Jun 2020 21:54:52 +0300
Message-Id: <20200607185530.18113-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200607185530.18113-1-digetx@gmail.com>
References: <20200607185530.18113-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
