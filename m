Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A4B32951E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 00:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907C46E8AE;
	Mon,  1 Mar 2021 23:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630536E0AF
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 23:26:17 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id d3so28281998lfg.10
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 15:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FCdCz8+kn4V5QKXXXD/ARjJCsuFIBX7KqWzFuKY8PO0=;
 b=yo/3McSVkxn1OFMAlEq5GdxzZQPKgg6PCIIAuvxTu8psvsR0gckfE8oF9D3n8Jrg/S
 wyU9wURoOpvYQ++7Bs3S3EQHpa13z/BvHxbBYDK78BVd5/1jBaOJOTteGk0xwHa37Etk
 bs6rZMNKTKWiqRNXbAic7wUz9+gyA+JINWMfdijpKlUf4irTbEngTV9YTQB5Cf0g18hG
 4gYqWEdswJPxMEPyPw3GwaFO8QbHzR2Tjd8JVnjhxo12SssS1d3vbpBRJV507P/RvBhl
 L3HhFb0rYGOPNidpzE+KyL6IsE1xbrn8A1bfVmMsTpwOhYBjZv4AC47Msz5Ym/Ooaymz
 JLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FCdCz8+kn4V5QKXXXD/ARjJCsuFIBX7KqWzFuKY8PO0=;
 b=XJjC/gPzaMKriVshiSU88f0lCeVyiFerL68w6en/ohQYJCX6VZg8sqi7+RDJh8fImE
 FI6/gju2GzhvUdydctaohI1QCqsbDSI7tijguNC8DNvzNLcSmJpLYR9Qjzz5FoPzRPHe
 hiuFnX5rRSjZYeB5wsFUattfEpMTunGisnpLMEb87HBLPEAmzJehn4aUEl28al1q2vy2
 MJIs7F/W8Pt7pO3wvYOvKxsRRrPl0iSwVJbazM92reIRRdbB16etWQlBKwYLqp3Sn1nK
 gH5Lg9OxPmneLgCXiozmA0x+YpyZlEhbAnyJnyR3DSQTsVe/AXw5F+PBlYpbdxXLJpMM
 3TRQ==
X-Gm-Message-State: AOAM532pb3pkrEXkYIvQX9soWBvyL25/HcJ3ci0oHHOvPLvhdVtT/jP5
 d1DsPtgyNPmWD9Xv6YCpzbo4XQ==
X-Google-Smtp-Source: ABdhPJylO5AdzKF1vpb9qMP82/3Jhay0MgHR1Y/+gfLln3OGlr3Fxl/r+1JS/trnemXPOfW4gnicfQ==
X-Received: by 2002:ac2:57cf:: with SMTP id k15mr10308998lfo.609.1614641175829; 
 Mon, 01 Mar 2021 15:26:15 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 15:26:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [RFC 10/24] clk: divider: add devm_clk_hw_register_divider
Date: Tue,  2 Mar 2021 02:24:53 +0300
Message-Id: <20210301232506.3057401-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
References: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
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
 freedreno@lists.freedesktop.org
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
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
