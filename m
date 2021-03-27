Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515F234B674
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 12:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669AF6E3EE;
	Sat, 27 Mar 2021 11:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8156E3E3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 11:03:14 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id b14so11488716lfv.8
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 04:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fsZHMjpcpMRNh50aSCQG6toWuDuQmBAyzcA/aBJD+oM=;
 b=C4ABTjf+1I+oVNozkaZuGs+wKMKgrnOVc+PKX/BfFGajdOSkWjvqPvBmhPv8Yy/E3P
 hWjfTA2BLyrci+Pnkp31bvXgNRqeHgOqKyg2mVyBH+pIma/GibqXa0w0JuXqwHlprh8V
 PRBtTbLFT6up/l5M+eFQOASguL0/ixCfVHTH6fTeX3Myl+4X1QWMDGNVHGy/KnXj3wmi
 rcvBoA922Kz0Um+aw7Gl+n3FqcJL3szQ5AQ7Z40fFkTmBd9Ay1Ep8mid6EwUKQFAeAZG
 bsod4m4tSzFVOIpiRkEfc/O049rw2eEhTvljAn6IBgmHyn7wD2AmvVgn//wFjGTyjpB5
 VZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fsZHMjpcpMRNh50aSCQG6toWuDuQmBAyzcA/aBJD+oM=;
 b=XyMJlQMyVZH/aJ1PTXzS1WLLVWNEPcjfeP5WCCpHgtJWSfr2lN8k9YW6jTf2jnFN7D
 D7ucTdw2rVvyf2E20hJJXhZniYp5RY/ReHfPnLDMyW+isES2cDNHqda6QW3bP+VU7gpR
 0MNlMopwbpEWdC4lUnm8YxitIbC3gednd3T5sn+DXcx99xTICY9+BQQPECFY4Rw45LLy
 4baBT38escxRDN3EEaED0rjQqNxmbiDqWNdWqJGeR8/HS24/wAT87HHUz2sXJ8Qs8JnA
 2mLHPDfu29xZpWh0iVnJIfqUE9BC3VyJkYdoqLbhkFId5fFEU0mlIlYeV73eknjHXL+B
 xNMw==
X-Gm-Message-State: AOAM532hdKqeMbor/is9wDNIFBoyNZA+VNJ6A9uE57P1tkEPVRvqMbZg
 irLUaSuvtDzeZbXbA/iD63Ao+Q==
X-Google-Smtp-Source: ABdhPJwWbbznHAterTYKDXO9HEln7JYxzDLt5iKbWUyH78pxBQKVlPWB3d8mqM1sKP4I5tFTFC6Jxg==
X-Received: by 2002:ac2:4c85:: with SMTP id d5mr11456182lfl.503.1616842993422; 
 Sat, 27 Mar 2021 04:03:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a8sm1513801ljn.96.2021.03.27.04.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 04:03:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v3 03/25] clk: divider: add devm_clk_hw_register_divider
Date: Sat, 27 Mar 2021 14:02:43 +0300
Message-Id: <20210327110305.3289784-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
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
