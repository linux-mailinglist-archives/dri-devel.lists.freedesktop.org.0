Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2990E33F31C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 15:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C0C6E5A4;
	Wed, 17 Mar 2021 14:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E646B6E5C6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 14:40:43 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id s17so3478194ljc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 07:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fvhlkx4xo48Lrm5ulhQx7P9OeXo+UeYdR2FET2xIgts=;
 b=pnTeO43vRrTTIyH/0Kf9thZqUQDzE7amtRzGouGc2QcNAkg3xnnWiA5lgxsBccDHtd
 m89FM+q6AIwCsWRO0YRZko+kyjxwE/5mo7ypDHy4haD1RosVlLBgcTiM/dvqxGcVo+Ur
 Dk2zweHYjDZfH8FdcWhUtScz0I1ZGlALKjRhFZHW5762Bv2pvjjEqVViPYGS3M9ivRR9
 ciY3txcksWbhjRxQ5S6SCmRQ2g45AsYckeWJEnTXb1eRiq0PbyxYUChTl9/cKx+cYsuP
 W2nrulk+YgrZgxg7uNpOCED7WqL2YiQQKDfwCN849UVBbODaGTGCyHfNrdkmJukj8n+S
 wQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fvhlkx4xo48Lrm5ulhQx7P9OeXo+UeYdR2FET2xIgts=;
 b=Dq4Pn+/DwtsTyhWIuUu4YOQqLZhOiRotKMqp5OHonrth/HmQfvjNamuZT/yN4REjCg
 lNCZ/gRfnTcV+pVAkomGlMTTxCQnurrn07iTbH/23Losv+ibNIT6K2FUvks8Ty3oPE/x
 ZaDhrTfZwwDsB0B7P7ug41co8Bfm81E17/Km2aWlf5bYQ4yHd3wggCCkzSWveGrQUP+l
 dwS7d+SaquSBeDhaN4xWTR/6veHFMUl0gRVzwu8mmXyIGMlggeinIMybPCWFmd3brB/J
 gTo7DuvzSIVazZeCQKHfP4JgwZIa2l5v+dFkh/CGhWXAP9qfDpcM/SoNPZvodfhWUHUU
 Q9gw==
X-Gm-Message-State: AOAM532+sEfyVvyH4GCV2tjhFMmIn73l7kc+I+6D6dl6ZV1xsXJ2Yrgt
 jlNUSQVwzr82dbUw75cnOjIIE+zqJrIOxg==
X-Google-Smtp-Source: ABdhPJzmCrc7lv3T+k1mtzhrq65ATRhhEHbFaPLQEu4C6EV5jaGVeVV69aSMLfrvvJH3IkW41dE2/Q==
X-Received: by 2002:a2e:9151:: with SMTP id q17mr2578808ljg.107.1615992042332; 
 Wed, 17 Mar 2021 07:40:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 07:40:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v1 01/26] clk: mux: provide devm_clk_hw_register_mux()
Date: Wed, 17 Mar 2021 17:40:14 +0300
Message-Id: <20210317144039.556409-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
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

Add devm_clk_hw_register_mux() - devres-managed version of
clk_hw_register_mux().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/clk-mux.c        | 35 +++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h | 13 +++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index e54e79714818..20582aae7a35 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/device.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/io.h>
@@ -206,6 +207,40 @@ struct clk_hw *__clk_hw_register_mux(struct device *dev, struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(__clk_hw_register_mux);
 
+static void devm_clk_hw_release_mux(struct device *dev, void *res)
+{
+	clk_hw_unregister_mux(*(struct clk_hw **)res);
+}
+
+struct clk_hw *__devm_clk_hw_register_mux(struct device *dev, struct device_node *np,
+		const char *name, u8 num_parents,
+		const char * const *parent_names,
+		const struct clk_hw **parent_hws,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
+		u8 clk_mux_flags, u32 *table, spinlock_t *lock)
+{
+	struct clk_hw **ptr, *hw;
+
+	ptr = devres_alloc(devm_clk_hw_release_mux, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	hw = __clk_hw_register_mux(dev, np, name, num_parents, parent_names, parent_hws,
+				       parent_data, flags, reg, shift, mask,
+				       clk_mux_flags, table, lock);
+
+	if (!IS_ERR(hw)) {
+		*ptr = hw;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return hw;
+}
+EXPORT_SYMBOL_GPL(__devm_clk_hw_register_mux);
+
 struct clk *clk_register_mux_table(struct device *dev, const char *name,
 		const char * const *parent_names, u8 num_parents,
 		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 58f6fe866ae9..3eb15e0262f5 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -868,6 +868,13 @@ struct clk_hw *__clk_hw_register_mux(struct device *dev, struct device_node *np,
 		const struct clk_parent_data *parent_data,
 		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
 		u8 clk_mux_flags, u32 *table, spinlock_t *lock);
+struct clk_hw *__devm_clk_hw_register_mux(struct device *dev, struct device_node *np,
+		const char *name, u8 num_parents,
+		const char * const *parent_names,
+		const struct clk_hw **parent_hws,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
+		u8 clk_mux_flags, u32 *table, spinlock_t *lock);
 struct clk *clk_register_mux_table(struct device *dev, const char *name,
 		const char * const *parent_names, u8 num_parents,
 		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
@@ -902,6 +909,12 @@ struct clk *clk_register_mux_table(struct device *dev, const char *name,
 	__clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL, NULL, \
 			      (parent_data), (flags), (reg), (shift),	      \
 			      BIT((width)) - 1, (clk_mux_flags), NULL, (lock))
+#define devm_clk_hw_register_mux(dev, name, parent_names, num_parents, flags, reg, \
+			    shift, width, clk_mux_flags, lock)		      \
+	__devm_clk_hw_register_mux((dev), NULL, (name), (num_parents),	      \
+			      (parent_names), NULL, NULL, (flags), (reg),     \
+			      (shift), BIT((width)) - 1, (clk_mux_flags),     \
+			      NULL, (lock))
 
 int clk_mux_val_to_index(struct clk_hw *hw, u32 *table, unsigned int flags,
 			 unsigned int val);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
