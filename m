Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A1D41FDB6
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 20:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDCB6E842;
	Sat,  2 Oct 2021 18:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37576E5AB
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 18:31:21 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id y23so13217757lfb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 11:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0TOsxY2C2gcID0yo/4ltic8viK9R7xT9wFfMMcLu9ro=;
 b=YOZy7cFDGr/Q/xTYZPKmmixJVhBWywFG98Onlmyb/fatkVb6thgrG7xrC/G6DTr4lE
 7RAQRmQIajpd14yBwouwaEq5K9Y0tX61rbBLEW+VSBtJfDF6Rr+a6JDdBmiqrq0yUHJc
 iuJU1vwngQ6iSW4FS2uYv9yHorF460tj3v2HQW/dgJTnfBS36pKNsxsxUl26Eh1IE07T
 3/fKkiYZ7ml/AR0HAEBsfvQdKdMMDBjZjs8KTzJTsSnLIXA7+O8YZwbA//t/cdMYc0ZK
 22mY2T+uE3Wu4jZRz4Cr70IzcodFnbEFsTHRthkktNHmqDQOIy5Y0rh8PJtalS7fmlHe
 vCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0TOsxY2C2gcID0yo/4ltic8viK9R7xT9wFfMMcLu9ro=;
 b=5S6RQTDozSjB8g44ii4ry8eQANWdZY0bwTqjZn72aD2dvVjCFsBIOJDwFaeJIr8nkM
 FeYtqppri2y+kFqP80Jr3RHGbFS9/f1waZEp/A6WxkWmdmOL12/VgVQOEe9CgzZeEmax
 1SUc29ouSaFRKy7JlOilu7hQER4ltME7yNztIfLMBao6+mhWMOnnUCc+D8kw/5mDM1sh
 HPpWVB4N8HlOQVVzqlg7Feq5F3tPV1+TeY8qPtdhCUTGGuQxecqiPXkbQm2ZFl4YIeom
 wtslynhAyxDdtK+tA9vFsQAR0qZgtfweJwtJ7XjUpMvBFZz9iESBQoPus1CDD2ls9vmP
 YJDg==
X-Gm-Message-State: AOAM531byVvr8enlb2vrCpxOKfE90Pnvurbrt3Ymqn2TxPMb9YPbTTQF
 7k7e4heHObSxmaEcYX17aB6qQ6RY4DWcRQ==
X-Google-Smtp-Source: ABdhPJy8m4i2Oku6/vsJU1h6QPiGIK/uE9SJIhSZqadR7hSfSSI7MhWm6lisY30xU9zxBX4GAQDOkA==
X-Received: by 2002:a05:6512:3082:: with SMTP id
 z2mr4916664lfd.657.1633199479933; 
 Sat, 02 Oct 2021 11:31:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id bd7sm1020419ljb.20.2021.10.02.11.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 11:31:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: correct cx_debugbus_read arguments
Date: Sat,  2 Oct 2021 21:31:18 +0300
Message-Id: <20211002183118.748841-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

First argument of cx_debugbus_read() should be 'void __iomem *' rather
than 'void * __iomem' to make sparse happy.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index e8f65cd8eca6..7501849ed15d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -180,7 +180,7 @@ static int debugbus_read(struct msm_gpu *gpu, u32 block, u32 offset,
 	msm_readl((ptr) + ((offset) << 2))
 
 /* read a value from the CX debug bus */
-static int cx_debugbus_read(void *__iomem cxdbg, u32 block, u32 offset,
+static int cx_debugbus_read(void __iomem *cxdbg, u32 block, u32 offset,
 		u32 *data)
 {
 	u32 reg = A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_INDEX(offset) |
-- 
2.33.0

