Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D5B35A9E3
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 03:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB0C6E0E5;
	Sat, 10 Apr 2021 01:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8467B6E0E5
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 01:19:04 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id d12so12434240lfv.11
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 18:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cXbadlhQap92WD3Oxzmo0aIh3c0IVq45U8NgZ/myc0w=;
 b=J1qJfsd3G51VUtZHejH2W0xArwQAEIsoz7Ag3L9pkjuW9XHmrSxPCeCc/ASZnF+sVm
 ao5RvymWUw/ApUSWMZVl6cjcbtbY2hofZkTz5+q4f0F20ggHftxfnxOj79pUZp4JT65A
 eqSvZZmRYJXudweA/UN3bqVjQOwqxvSuPk78zAP07Mb5GGvhPeep9m2Qek4RDmaa3Rhp
 3G5eRSYhob8ZlNUGS9ePi40CfXpSKWDW4BvXvbAbcl1l6vYmBzr2R63UYbOJ80o+mQWO
 M2zVqUeysH85gJUPIBpalHz32PcA+YL72ITBld7kdu4yyKLFZ3TFSQ61ZODP9bAqNs/g
 uCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cXbadlhQap92WD3Oxzmo0aIh3c0IVq45U8NgZ/myc0w=;
 b=txpuPaD5PBUafmz11R4fHFNwGjm1J+kK4vMul+wZfTOYoJQFR9OWf9L++G96fqT+oV
 BNXyYgYdn4nbKvBYdoX6/sckTAUy8Ao5WXvUOCjLTEy/TkeHEPYXqHrh8Q/JplVabHup
 s6Ix9rVez7k3rlfUzJKaDbQ860rjefOJqRTCXbkYCVmIDn3TF6Pjzu3vCC347Qg0Ky8F
 vYkjmjiJx0YZxfT6W3qNCgGF6OV0fV/mMYpLDilM6IxYtqY9CW7IpYrlmSG7VLZU/r3f
 gmPqoXLtRF4XL1E4rameuVxzkYsEkmXtpsTkOrAsORmNQ1GdXbpcQBiUU00cw/eRXStF
 7wDQ==
X-Gm-Message-State: AOAM531PaqBKwzNGHwM1qp3d/9k5GxuWyvMJ8jyX2IwLQwLZfP1FjrWa
 /7OwoQ2wv57KKdeMx94Oyn+254dwUaKWkQ==
X-Google-Smtp-Source: ABdhPJy75C3YoO0lTlpMn1djMnbOvX0ZgTBZhlF04KJLU8PmMSu98lEtJWHvdzOgvsr7y/RLrpboIg==
X-Received: by 2002:ac2:5446:: with SMTP id d6mr11571187lfn.527.1618017543025; 
 Fri, 09 Apr 2021 18:19:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h4sm614132lfv.22.2021.04.09.18.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 18:19:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH] drm/msm/dsi: dsi_phy_28nm_8960: fix uninitialized variable
 access
Date: Sat, 10 Apr 2021 04:19:01 +0300
Message-Id: <20210410011901.1735866-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Cc: kernel test robot <lkp@intel.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The parent_name initialization was lost in refactoring, restore it now.

Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 582b1428f971..86e40a0d41a3 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -405,6 +405,10 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	if (!vco_name)
 		return -ENOMEM;
 
+	parent_name = devm_kzalloc(dev, 32, GFP_KERNEL);
+	if (!parent_name)
+		return -ENOMEM;
+
 	clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
 	if (!clk_name)
 		return -ENOMEM;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
