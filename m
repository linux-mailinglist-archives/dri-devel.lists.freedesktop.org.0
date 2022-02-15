Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7244C4B621D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 05:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E7E10E191;
	Tue, 15 Feb 2022 04:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E6410E191
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 04:31:43 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso21819256ooi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 20:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D7WsWCRqMLz25vENb3RcLmuP7khzK1rVK0lqIZnKd40=;
 b=qErQvLRHn4lNi32tmw38jEAFNYywB5rAnIRozMJp3Wu3QmiUz3kavqhSmwRx+OyGdY
 LtFC0T6uamzGnphHeZAlx2E1u/X08Qdv0rSQVmPBMCw/bxC7HPu1UmcuD1XhaM4JDvYX
 I4bDSc2FY1CS/fmpYAxzwSHegdZOpTn3+JHe4HYhGhAAJvYYWrMeR1jB2KswbOlvhXRY
 vcBCpFE2SKQZI0N3AJjoxA/7iO58Xne2M4Qub/qxrwYEplfa7J2L9DwvSjOrBF9h5Knq
 N7E5+9wOTrS8FWn7D59QuP6De+aGmzBjM7fKCSdus9AG6+5zH9nefOBQushQwXNqnQi9
 6HmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D7WsWCRqMLz25vENb3RcLmuP7khzK1rVK0lqIZnKd40=;
 b=Dv6eL8fhyigamwzUG4WvewYQhto9AXhMfQ2q+oHqJJLrU6dzzlpHmPp/2SLDcIS06t
 6WDc0PCXD0TueIyzIZCOluVRWo4jiCMxeOg7RQSWPnEKLM/zsh1dYZj4ON3FlixFCDoM
 dSZDkTyWvTR+zLgwlUPX7nsRc76+vkbhxkIOxwNsuotEUIszF59hM07PKF3ha8y7IRXV
 eKTZMi1DucOlfPZWsm87lntXun0h67zlhmW7GvHjNS7E+RvFHBLQyXQAZbhLUVouKbUO
 pBoi8MhHZNIoS1ePhNVOTFt8Yp8EWwbYXKA3SAjDl4Ue8ajI6yQjlI8zGc3cAExLXAGa
 aRsw==
X-Gm-Message-State: AOAM533W12LTjLkxnR9PnrmA8iYtQyjggn8oWNo1e+kq2Z8wAIKpgq8i
 z3jMxauBRACIiYcHNQ1lgiu5uA==
X-Google-Smtp-Source: ABdhPJxYZ98hSXj39qS4Lid82RoCU1bJQMN1rQR1NrXEQZ6QwcOrw3ie1V58t9SRMlck6xKqEZOWcw==
X-Received: by 2002:a05:6870:6296:: with SMTP id
 s22mr800654oan.338.1644899502683; 
 Mon, 14 Feb 2022 20:31:42 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id z4sm12926964otu.24.2022.02.14.20.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 20:31:42 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 1/2] drm/msm/dpu: Add INTF_5 interrupts
Date: Mon, 14 Feb 2022 20:33:52 -0800
Message-Id: <20220215043353.1256754-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SC8180x has the eDP controller wired up to INTF_5, so add the interrupt
register block for this interface to the list.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index a77a5eaa78ad..dd2161e7bdb6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -23,6 +23,7 @@
 #define MDP_INTF_2_OFF			0x6B000
 #define MDP_INTF_3_OFF			0x6B800
 #define MDP_INTF_4_OFF			0x6C000
+#define MDP_INTF_5_OFF			0x6C800
 #define MDP_AD4_0_OFF			0x7C000
 #define MDP_AD4_1_OFF			0x7D000
 #define MDP_AD4_INTR_EN_OFF		0x41c
@@ -93,6 +94,11 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 		MDP_INTF_4_OFF+INTF_INTR_EN,
 		MDP_INTF_4_OFF+INTF_INTR_STATUS
 	},
+	{
+		MDP_INTF_5_OFF+INTF_INTR_CLEAR,
+		MDP_INTF_5_OFF+INTF_INTR_EN,
+		MDP_INTF_5_OFF+INTF_INTR_STATUS
+	},
 	{
 		MDP_AD4_0_OFF + MDP_AD4_INTR_CLEAR_OFF,
 		MDP_AD4_0_OFF + MDP_AD4_INTR_EN_OFF,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 1ab75cccd145..37379966d8ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -22,6 +22,7 @@ enum dpu_hw_intr_reg {
 	MDP_INTF2_INTR,
 	MDP_INTF3_INTR,
 	MDP_INTF4_INTR,
+	MDP_INTF5_INTR,
 	MDP_AD4_0_INTR,
 	MDP_AD4_1_INTR,
 	MDP_INTF0_7xxx_INTR,
-- 
2.33.1

