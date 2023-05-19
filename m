Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79070708DF5
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 04:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DDE10E5B2;
	Fri, 19 May 2023 02:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E611B10E5A7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 02:39:01 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2af2602848aso167781fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 19:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684463941; x=1687055941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MawV/aylOA8R8XcD5L27Eb1AoElurGv+lqie52FpoZQ=;
 b=XoC/J+kF76dsQ9eomhbLCXsMVvobpp66Rtzi4uJHvt4B7kxUnFgr19RqJZT/GR17rN
 I2Wzy9NyYtIuIxfoYOTG3hQnTx0U5b/UBuN6aDJEI8cPrHYhhQazU8siy+3SPRnELDyA
 R1t416veztkvO0aV/ezwrZE6YyGe3VkWd42billPaIWcGwOqE5GwYvjIKr93eIrE18mK
 tMlUG8iDwbHcKOwV6PF3eUgnRICzwX9Yp4uNPjX6Q0G5iWC+QnMy0paSIo/yph4YNsV7
 ghmtx3EY5iBt+vyJ3MYH3yXjO8ClmJtNPD+hVR26ka6dgNQM3Kq5bhQFKlMx4+CHUMNF
 CKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684463941; x=1687055941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MawV/aylOA8R8XcD5L27Eb1AoElurGv+lqie52FpoZQ=;
 b=aXEWaQWD3+fiKmq9MgH++XeBy9Q7+d6xfSbdU5mmNc7EbCz9h9rDGtiQb5B5nQHt7Q
 EtzGGhzah9XRoPgcbCFE2eHPlrW/+AmVrR038v3IiCx1M9nRMReonsvki3Xlgad31ar5
 4/DRsgrv+hQn6JGsoDAR2ewGOUjGB2EjLRw3BhJnn6wzTo2gI4C8NyBVHrIWT3RPuixy
 1RYstH36FQaLbZsn3usGc1ru5JlIIZzlUcgE0Z023X01J+u5eip9xRFTye7m0iue+Del
 17LecvpjZo6gQNgqKulTQ9DkLLjattvsxLLkIe+Cvu9pk5tKZTcXPRMyvxTRQDJ+ImNP
 0d0w==
X-Gm-Message-State: AC+VfDxHvrStWc3kN7xDywDaqSq1xvArw+FheubFA6G/+38xAuUguIeu
 gDJai7Y6IQkAcghLu5vfIC5m5Nr4lTpd/djDZoE=
X-Google-Smtp-Source: ACHHUZ4xWQ57d2FDVq/qwKgaZ3g8Q+d+InbTKrtFotgKXJPjTVGgQnA4T679EwiJZf/UTAAYjnFxWw==
X-Received: by 2002:a2e:9c06:0:b0:2ad:ae71:4f21 with SMTP id
 s6-20020a2e9c06000000b002adae714f21mr97912lji.48.1684463941500; 
 Thu, 18 May 2023 19:39:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a2e2c0f000000b002af25598ef9sm25906ljs.0.2023.05.18.19.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 19:39:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 6/7] drm/msm/dpu: drop temp variable from
 dpu_encoder_phys_cmd_init()
Date: Fri, 19 May 2023 05:38:54 +0300
Message-Id: <20230519023855.3840907-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to assign a result to temp varable just to return it
two lines below. Drop the temporary variable.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index bedc8d0316c6..d4685e0a3f8d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -759,15 +759,13 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_phys_cmd *cmd_enc = NULL;
-	int ret = 0;
 
 	DPU_DEBUG("intf\n");
 
 	cmd_enc = kzalloc(sizeof(*cmd_enc), GFP_KERNEL);
 	if (!cmd_enc) {
-		ret = -ENOMEM;
 		DPU_ERROR("failed to allocate\n");
-		return ERR_PTR(ret);
+		return ERR_PTR(-ENOMEM);
 	}
 	phys_enc = &cmd_enc->base;
 
-- 
2.39.2

