Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AE834FE68
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 12:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7736EA50;
	Wed, 31 Mar 2021 10:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209BF6E1EE
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 10:57:40 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id d13so7508094lfg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 03:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=81aVn3cgKmJwkahVoYGBOYGXWnu3CXfAkBhhOdfG2tg=;
 b=dowG8r//ltSsk5+GxENoi2CH9y5XFUg1fBKh/cDzr7m7mvxVuq9jmTm5RWE/aMR+bK
 aP+hTg6AaPOiNyPCy0iOcU932h7ZulujBB1ejURrh2EaKTy+UHRGS8OrbCwT7505prsQ
 NQ3DuW+3exedbLIDbcMrjpMmYR2fuBRkbfkac5rN1rGgrK3PzNBGJNkN92kxOI9lVeUf
 Bj7l2sBVK4QeyAxbsUcsIhzDS5qczI/MLWEQGjCZEmCu3lDI83Lu+Vi1islbzINi5fZM
 QOE6/0VTC+Jkvs3v2wDWWMlacPKW5ob/z8NEwgOL6IZ+f+tEZ0T6MjLeQsV8KNelNcRm
 xoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=81aVn3cgKmJwkahVoYGBOYGXWnu3CXfAkBhhOdfG2tg=;
 b=r4NzGVtdCaZ9DyFn7QdhtEYennErUE6nirzItnimrkGzkS8KgmovqhCF+CUtdfKcFf
 yEgHyD6Fmn4wH5yZ7BbpqQK1mpQTsYzsSTNnJ3LKzhSLR7m6wbZh8+vB9YPzfgcOsvrn
 sDjmCXVWV9OShfIEoIx0/iVkno7NAEgnD+Z7R3d3zDSh53EJpgcobWUYdkPtb0QtSJa5
 8+SroocWkjyvIYPLxq0/rzjPqgwWzzhNXlk1PS1js2d1NAzBLJeqhJ0rkVLAlfZEMU5q
 E2F5ZbgUXBYX9/MHhaBNbhUHwvwbBR51R96mCSg5RhwogKF7MRBZO7d9OwLrNpb3sb02
 PRWQ==
X-Gm-Message-State: AOAM531X7lZ6oGD1729iI4PzOrnkL5RpR0Di/b+WnMgiuCrcQ+uMz2Yz
 681jWYwORcFthPpEXq/Zp0UeTw==
X-Google-Smtp-Source: ABdhPJzYPwkY1k+8eDMII6mlVm082SsnI1RnEiwqTWsJls8rtTQpyK22Nh1lAk5IN+wfm3h19AmW4Q==
X-Received: by 2002:a19:7dc5:: with SMTP id y188mr1911348lfc.309.1617188258457; 
 Wed, 31 Mar 2021 03:57:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 03:57:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v4 02/24] clk: divider: add devm_clk_hw_register_divider
Date: Wed, 31 Mar 2021 13:57:13 +0300
Message-Id: <20210331105735.3690009-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add devm_clk_hw_register_divider() - devres version of
clk_hw_register_divider().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 include/linux/clk-provider.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 9cf7ecc62f7c..6273a841f51f 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -785,6 +785,23 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
 				  (parent_data), (flags), (reg), (shift),     \
 				  (width), (clk_divider_flags), (table),      \
 				  (lock))
+/**
+ * devm_clk_hw_register_divider - register a divider clock with the clock framework
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_divider(dev, name, parent_name, flags, reg, shift,    \
+				width, clk_divider_flags, lock)		      \
+	__devm_clk_hw_register_divider((dev), NULL, (name), (parent_name), NULL,   \
+				  NULL, (flags), (reg), (shift), (width),     \
+				  (clk_divider_flags), NULL, (lock))
 /**
  * devm_clk_hw_register_divider_table - register a table based divider clock
  * with the clock framework (devres variant)
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
