Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105BC73D09E
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 13:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849D410E1BE;
	Sun, 25 Jun 2023 11:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2020D10E161
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 11:42:32 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f954d78bf8so3012847e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 04:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687693350; x=1690285350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lwdtqkDXqK7iZxcIX1bEzs8baolumoX7/30733m/ZW8=;
 b=csRNaQVYcN5FlY1KPPmbQ3DhS2yDIluczA9prBJjlEis0hj9zyLOJ92+3vWSG3wDPH
 aJXwYnwBhB7nfZ4ZU/BkYzjQow5FL+ttw7WQzRVTWRsWovgYQMYPWJNsEFH1shm9DxEM
 MRw6m6BbZlxeDAAkVWzXRx1B7TtkNNicfCrLeAjQFowxLo1TM0o/L6IUFsH668ogcEcf
 aaKuM1FSW1r5X+W9WZNu7KY0FB/zb4yo/pEvgO00Rvrt/C0Ne7l4AjlelDBp7hA97/c7
 1/LSkEId65dBAiGKPtDbLGQZ3rVH/fWZDpYriqPbjBCZNoKJ1rwoB+GNFbMT4msiXzFo
 x9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687693350; x=1690285350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lwdtqkDXqK7iZxcIX1bEzs8baolumoX7/30733m/ZW8=;
 b=V+iAq43/ZG+3aoj+3PnWwYx1zgAI1u6s0KMEDBxRdCY4GwDLNgLu6yDDgXgMvPb/KS
 +hBPHVfsIn9gzak3QmiOcdESVDldFnvpwdx3Ma3SYdZAmt5xVzXpM8r+fFAebrvojN40
 VKOyXXOTi4oF5DlJ/LBWIlRKp/sCPDkUWszQ8PWbwlTN7qlnHd8KpuUGSylpsH3cqQ1i
 5lM6xhwPfEc1pMuU7Sk9McYrRD0p8TcgjPQfz+B57dh23eI65ljsE5EjQOivduDVUL+z
 Z3fvYlD3mzg+gmGMqWB45chCxRvSzCud3AYLkDTj92uzW4RsLcD34Iq0u96py+gnMFov
 M4Yg==
X-Gm-Message-State: AC+VfDwApfpSZO7nPWkiLuEXYCuEOXFqo01mne/Nlj3tu8NbkNwIgzYX
 9LhcZNOk7jVkxs/3j3mo59p1Xg==
X-Google-Smtp-Source: ACHHUZ6JBYjRhM3xUtGku0UohCxWUXppP0M1khuC54BjHXVyboGxygUTxDaw7zl/dBjjx5nQpMp90Q==
X-Received: by 2002:a19:e348:0:b0:4f8:48f3:f06 with SMTP id
 c8-20020a19e348000000b004f848f30f06mr14544063lfk.48.1687693350508; 
 Sun, 25 Jun 2023 04:42:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b23-20020ac25637000000b004f87893ce21sm637323lff.3.2023.06.25.04.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jun 2023 04:42:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH v2 08/15] drm/msm/hdmi: move the alt_iface clock to the hpd
 list
Date: Sun, 25 Jun 2023 14:42:15 +0300
Message-Id: <20230625114222.96689-9-dmitry.baryshkov@linaro.org>
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
 linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to the vendor kernel [1] , the alt_iface clock should be
enabled together with the rest of HPD clocks, to make HPD to work
properly.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 3132105a2a43..0fc3df43aa70 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -248,9 +248,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
+static const char *pwr_clk_names_8x74[] = {"extp"};
+static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-- 
2.39.2

