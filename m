Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE33695671
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 03:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB50710E7C7;
	Tue, 14 Feb 2023 02:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7D810E7C2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 02:10:01 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id g28so8963041lfv.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 18:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ac3xQ5ZUoVSKxTI11AHh9uZyaZAnwe6vnehDNppWK68=;
 b=trrt6/rzH5bHCCxtVqo0krY9ns1kGhbfaJh9zTU677RQ5y1eGUkCSE2QbdQWQj6FyE
 atxz4ErFcYGGXmWkdzf9fe7Xvc51BA+sQTv/ArTafUfpRYcMJWUEjX1BKvjSdy29xAnN
 pfBwX7vzKSzLnnPIeQkQ3vyYAJUWHTwsMcIOkLUSA+sRj7IqVG+jAgvPRYmDUTpNY9AG
 7CsD70KHC2OuPa2pAGwBmSNQJOwdvAepGjJ2jGs9Cj1AXpq6ayZ6T4MfFYnGRYW/fEi7
 sBK1/2SjhGLo1XRyMz0TnBn/YYekI4M4WqDxtg3ph+7LCm+bLBSpRnYH12BPnfMI/f6Q
 hNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ac3xQ5ZUoVSKxTI11AHh9uZyaZAnwe6vnehDNppWK68=;
 b=SZPWMyScI/2jJpeYChISmYNHZxKkbGtY3qaCRmPTVCHbudZYeNyjF3EY4+/7fQNKgi
 PsVOy62WsybocPqJff2ooYyvCxkm5IcIfL+mHMInOqb6h5yTGQSo8/7Ppj8M9G6rGfqP
 RXMSy0bPM4kNuDKUYntLBiRHDSnN4XGVSt0YO+tpvN3yaDb2EPxKpVTDhEX53BxRxgaV
 A1lNX3S7gFP87MySkFVtwYckFwmyV5RcXifmFl4VGjLsbxndxwSjsEoRTai89eFi1LpG
 HebNc0d52b03F3NWAVabT18JgMeGiv+cQlQHNBEy1/xDJIa8nVEuasl1qNOL3Goga+Qx
 QrqA==
X-Gm-Message-State: AO0yUKVJgS79v395btL8o4sdZWQ2awIU0cj9LJVn0W9LnUbmU5ieMycX
 FBE+7M8wwmEFm+gXSDO16MAvyw==
X-Google-Smtp-Source: AK7set959ogo8tDxOu4t+CSiHvfxWQJKZfjF2fsph3mmtEVLZirFn08L0gODw8a6jK2UBm8OogMFFw==
X-Received: by 2002:ac2:5df2:0:b0:4d8:584c:a6e0 with SMTP id
 z18-20020ac25df2000000b004d8584ca6e0mr138279lfq.14.1676340599157; 
 Mon, 13 Feb 2023 18:09:59 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a2eb711000000b0029066c8906dsm2239518ljo.23.2023.02.13.18.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 18:09:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/4] drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL
 register
Date: Tue, 14 Feb 2023 05:09:53 +0300
Message-Id: <20230214020956.164473-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
References: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Jami Kettunen <jami.kettunen@protonmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than writing CP_PREEMPT_ENABLE_GLOBAL twice, follow the vendor
kernel and set CP_PREEMPT_ENABLE_LOCAL register instead. a5xx_submit()
will override it during submission, but let's get the sequence correct.

Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 660ba0db8900..8b2df12d8681 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -151,8 +151,8 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_RING(ring, 1);
 
 	/* Enable local preemption for finegrain preemption */
-	OUT_PKT7(ring, CP_PREEMPT_ENABLE_GLOBAL, 1);
-	OUT_RING(ring, 0x02);
+	OUT_PKT7(ring, CP_PREEMPT_ENABLE_LOCAL, 1);
+	OUT_RING(ring, 0x1);
 
 	/* Allow CP_CONTEXT_SWITCH_YIELD packets in the IB2 */
 	OUT_PKT7(ring, CP_YIELD_ENABLE, 1);
-- 
2.30.2

