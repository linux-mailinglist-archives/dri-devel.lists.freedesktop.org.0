Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FA073D085
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 13:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A1010E093;
	Sun, 25 Jun 2023 11:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDE910E163
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 11:42:28 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b4636bb22eso31787601fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 04:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687693344; x=1690285344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ee9qxsINn9dwQQTKQ6s0E4UzFdKioSthINPfeQJg8Jw=;
 b=EX3L88htawlQqvILyXJ3NkaBf8+4RX3uLTbwY6ggROilZVg3QNsi83qC7aea/4FwJx
 1kduiYtVxYe6DDoAfb8ah6w4NKjtQ3lphfqvPdSaAAl+X0LHsHtlx4v3I/N0uMtOfXYv
 Jd69X7vrB5w4zgGMB6bxjz077t/mrBO8Ep0xoU3pe5AZryR2oyszzWBO+pDQm0pWl8eM
 QItULxfTJ88ud2/Ib1AK+fOlkUuYtv7QlG53C4FY+vtE+h7D1sBbYQPs4fRGIyFThr4a
 LR4H36/JFXDkiSlgSGyMZK+1B+xsfBqy4yS1Mvjc0QwjOnNV0G6wcoIL9iYDhZpV6CbJ
 H5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687693344; x=1690285344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ee9qxsINn9dwQQTKQ6s0E4UzFdKioSthINPfeQJg8Jw=;
 b=dZbrX7qUU4r5V9rRby0YjgkQj0DOUfbTGnHoGfagTVr9b1CcA61bJdoCK0z+nqwLfJ
 t0YG/tOu6doY6jXZS4CZlL7H23r76Qo8CC/v7F9trPvYNH9BmVPic4XIO8t2QZbVhTE2
 HqQp+mzQwa0+Ygkh0i9rajd+mawB8AQItn/D56USGGWEa1n0ITB2sm2GaiYY8fGwSyFJ
 zu88ed2tE/jyHYLgGbFS/M/0a9ujOpyDcZdNO/yHNnt9R0tB3Y4gsYXujk+MjEZ+HBA/
 zaVzsJDtkNKCExDcMUYVzeOpt0ssE3PCl5YWaL2POTHY9ft/RjJmwH0DfByBE+byPqGx
 hm4g==
X-Gm-Message-State: AC+VfDzW4PgHSp+lwyq/dqp4EJmIEWA8Am7Sn46vksUpOaA2qtirSiDq
 5a/l2xF7LmVa4tsNoVuhHM9ScQ==
X-Google-Smtp-Source: ACHHUZ555Vzkh7bREew39vbOyVZgxBDGUFOF+66ODdO4RvcbdyQSw98yjlLT7ZpaHEjp121HCoTPWQ==
X-Received: by 2002:a19:5e48:0:b0:4f8:49a8:a0e2 with SMTP id
 z8-20020a195e48000000b004f849a8a0e2mr12908480lfi.16.1687693344498; 
 Sun, 25 Jun 2023 04:42:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b23-20020ac25637000000b004f87893ce21sm637323lff.3.2023.06.25.04.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jun 2023 04:42:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH v2 01/15] phy: Add HDMI configuration options
Date: Sun, 25 Jun 2023 14:42:08 +0300
Message-Id: <20230625114222.96689-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
References: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sandor Yu <Sandor.yu@nxp.com>, linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sandor Yu <Sandor.yu@nxp.com>

Allow HDMI PHYs to be configured through the generic
functions through a custom structure added to the generic union.

The parameters added here are based on HDMI PHY
implementation practices.  The current set of parameters
should cover the potential users.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/linux/phy/phy-hdmi.h | 33 +++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h      |  7 ++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/phy/phy-hdmi.h

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
new file mode 100644
index 000000000000..73a32eb535b0
--- /dev/null
+++ b/include/linux/phy/phy-hdmi.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2022 NXP
+ */
+
+#ifndef __PHY_HDMI_H_
+#define __PHY_HDMI_H_
+
+enum hdmi_phy_colorspace {
+	HDMI_PHY_COLORSPACE_RGB,
+	HDMI_PHY_COLORSPACE_YUV422,
+	HDMI_PHY_COLORSPACE_YUV444,
+	HDMI_PHY_COLORSPACE_YUV420,
+	HDMI_PHY_COLORSPACE_RESERVED4,
+	HDMI_PHY_COLORSPACE_RESERVED5,
+	HDMI_PHY_COLORSPACE_RESERVED6,
+};
+
+/**
+ * struct phy_configure_opts_hdmi - HDMI configuration set
+ * @pixel_clk_rate:	Pixel clock of video modes in KHz.
+ * @bpc: Maximum bits per color channel.
+ * @color_space: Colorspace in enum hdmi_phy_colorspace.
+ *
+ * This structure is used to represent the configuration state of a HDMI phy.
+ */
+struct phy_configure_opts_hdmi {
+	unsigned int pixel_clk_rate;
+	unsigned int bpc;
+	enum hdmi_phy_colorspace color_space;
+};
+
+#endif /* __PHY_HDMI_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index f6d607ef0e80..94d489a8a163 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -17,6 +17,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <linux/phy/phy-dp.h>
+#include <linux/phy/phy-hdmi.h>
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
@@ -42,7 +43,8 @@ enum phy_mode {
 	PHY_MODE_MIPI_DPHY,
 	PHY_MODE_SATA,
 	PHY_MODE_LVDS,
-	PHY_MODE_DP
+	PHY_MODE_DP,
+	PHY_MODE_HDMI,
 };
 
 enum phy_media {
@@ -60,11 +62,14 @@ enum phy_media {
  *		the DisplayPort protocol.
  * @lvds:	Configuration set applicable for phys supporting
  *		the LVDS phy mode.
+ * @hdmi:	Configuration set applicable for phys supporting
+ *		the HDMI phy mode.
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
 	struct phy_configure_opts_dp		dp;
 	struct phy_configure_opts_lvds		lvds;
+	struct phy_configure_opts_hdmi		hdmi;
 };
 
 /**
-- 
2.39.2

