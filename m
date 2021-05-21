Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 943B338CF43
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 22:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DC16F905;
	Fri, 21 May 2021 20:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E35E6E878
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 20:46:01 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id e17so5169858pfl.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 13:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qc/OISeLg533se0Ov/+qOFnvI05ew7O5rEcNf/rVX1Y=;
 b=nC0UhFlm212CnyrWNvtpu6kE4mWwHySnKzDUPQtf26R7PkPF3sEaIawFgxiZDnjE5+
 XuCnVcokB8yonlU/uLTQRrsmuDfyHP3LsE6xgP46I7yj2qYekBw37sqpR1BXXO1wtp/5
 nD7wVwtKmtqaU23+De1xsc0EeoyHYNqvlPD0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qc/OISeLg533se0Ov/+qOFnvI05ew7O5rEcNf/rVX1Y=;
 b=NhO8iP9QN0U9a5QaMHtA9qL4IKzDSQFfuZFJVwTw9UrljwpyrTePHufup9LhwZ5jb+
 SGjDCX3ae9Spdb0KzF6+B/Fn59TBqyn3bTBKQU0xpvuB7v5SnsGTuWAcfJurcPG1HfCB
 XTTe9IOp5jmeWcofcvSvuCJdpYJrI8gDaFJcbF6URw04OLafE94/Fvui8XbyFNKvQ1OF
 XEPAFFsAw435rGpRmLejEWBxDIRMIqptih+5ewRsT6okh8/retJKlySDRTNDyd1E1Sce
 Muo2slhWUs+t1L9vzWj2c6HK45odUHBIrUaEy55VhHV0UTVXNny1OrBy2hJIVBbjyL6p
 NODg==
X-Gm-Message-State: AOAM5301FSAerRo8ZCAbOBcyHea36AhLTJml9qQBkw5tFc2Md6bdxVWK
 baB90MfcCrGInEIfNmSM2XTBJA==
X-Google-Smtp-Source: ABdhPJyuVEaAW1PGylYq3ioVKFB2/Cb+DhaAneOsAuDfXLhYsdtUdaTbycQanmvelf0UhoTAzWM3vg==
X-Received: by 2002:a63:ed41:: with SMTP id m1mr616385pgk.252.1621629960856;
 Fri, 21 May 2021 13:46:00 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:10e9:a6cd:727f:561e])
 by smtp.gmail.com with ESMTPSA id mv15sm4839635pjb.25.2021.05.21.13.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 13:46:00 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH v2] drm/msm: Use nvmem_cell_read_variable_le_u32() to read
 speed bin
Date: Fri, 21 May 2021 13:45:50 -0700
Message-Id: <20210521134516.v2.1.Id496c6fea0cb92ff6ea8ef1faf5d468eb09465e3@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
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
Cc: freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>, YongQin Liu <yongqin.liu@linaro.org>,
 swboyd@chromium.org, Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's use the newly-added nvmem_cell_read_variable_le_u32() to future
proof ourselves a little bit.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
The patch that this depends on is now in mainline so it can be merged
at will. I'm just sending this as a singleton patch to make it obvious
that there are no dependencies now.

Changes in v2:
- Rebased

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b4d8e1b01ee4..a07214157ad3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1403,10 +1403,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
 {
 	struct opp_table *opp_table;
 	u32 supp_hw = UINT_MAX;
-	u16 speedbin;
+	u32 speedbin;
 	int ret;
 
-	ret = nvmem_cell_read_u16(dev, "speed_bin", &speedbin);
+	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", &speedbin);
 	/*
 	 * -ENOENT means that the platform doesn't support speedbin which is
 	 * fine
@@ -1419,7 +1419,6 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
 			      ret);
 		goto done;
 	}
-	speedbin = le16_to_cpu(speedbin);
 
 	supp_hw = fuse_to_supp_hw(dev, revn, speedbin);
 
-- 
2.31.1.818.g46aad6cb9e-goog

