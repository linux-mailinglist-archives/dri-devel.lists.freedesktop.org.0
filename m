Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D48CA33F31F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 15:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7EC6E5A5;
	Wed, 17 Mar 2021 14:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FA76E5C8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 14:40:44 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id 20so3301616lfj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PBXzeZeDyvQyLPoNa1KGeI/poAISjCxdb5q3SKcFJsU=;
 b=Jme4PgXEb5C26U3C0VZay05pzwR2f++881i12NWP9OmLS+yrpY+dGp+2SpnP/iYbiq
 WqL0tw3A38pYCKyhK7bRQLU/XXUtlz+gmQ4jxzec2xfTXIpXTPueAKMOjx8+SxqN9RrU
 KKhUJ44KvLwyytMJd9/j6Nq2xns2ECjn+WtQ9uoviLd0TsDRY1vbfMEnniuO8mOQ7XIf
 G5cwe27Rgq/1Z/cjdWdIWIFjUmtDkzUAKZGvD+b72Ggp/YuDhDAYW3qlKNCwFJGnPqNV
 fPWhf5kZRHi/O7pgB/WTfSdNWkh5/3jacaOMxqsqZHrTOVeyXKkqWTuTHxLO9Skf4f1z
 JrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PBXzeZeDyvQyLPoNa1KGeI/poAISjCxdb5q3SKcFJsU=;
 b=kKin3mV/bXsgYH/1XAfrZHE5HfoX+hV7AYB7zlSeZ3ZeWBhTmo1ixqsgAFeTXnevWr
 6foyVyNK9GoHZgXtQV8wHpE73g1A5RBiKXNves/L191S6Y8JbdkJxIESn4Qf6cIrHBzd
 u1wGscjYrSm3fl5GglV4jKSc18D2oo1KX2goV+RO8U9BgKhURfpNoyIAHOvndE5Z0BLQ
 DnTRtQmC+yJugH+0tfFTwxrfG1UnzPN5ds4qNOETaO8pUMKagd4Mj5VGeMm3RJyEuaTs
 SUvcRaGqzxMJEtlJL/s3vcDL4hrmhxnTw7V7QFQFpyoCwnly+Xhu9R/EM4c64P9Ws8Oz
 qiyw==
X-Gm-Message-State: AOAM533YSBCztpeEv6UH+PrRPzXzRCrLPcaD3AIg0/BIMZKHdr/PxsbA
 4VdgLpqDcBjoE6ZRILXgL0I3AQ==
X-Google-Smtp-Source: ABdhPJy+ESHie2qqCcI7ASd44IVF06jPayvgNlXGLpeNNO7XiJ6dZX5kUUMb4jBIDhs8YOxjhW633g==
X-Received: by 2002:a05:6512:328f:: with SMTP id
 p15mr2543462lfe.628.1615992043074; 
 Wed, 17 Mar 2021 07:40:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 07:40:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v1 02/26] clk: divider: add devm_clk_hw_register_divider
Date: Wed, 17 Mar 2021 17:40:15 +0300
Message-Id: <20210317144039.556409-3-dmitry.baryshkov@linaro.org>
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

Add devm_clk_hw_register_divider() - devres version of
clk_hw_register_divider().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/linux/clk-provider.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 3eb15e0262f5..162a2e5546a3 100644
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
