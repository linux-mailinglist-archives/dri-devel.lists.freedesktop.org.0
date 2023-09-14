Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FC679F9E6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 07:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385F910E50C;
	Thu, 14 Sep 2023 05:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9040D10E506
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 05:07:18 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2bcd7a207f7so7796411fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 22:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694668037; x=1695272837; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P+ElypKjl4wELftF/izO87eGZQ97psAyEtB73ZqIcSw=;
 b=iK6yChlETdb+65rqwjAcQ9h565ItKidE/j4bZtOJwSabHAkYBhUVE96AUeOlnW5APJ
 7N6MCCNMUTa+RtuuSvEYeFYcDUAf0npz/6F2ExkvrGhq6lFuSfkccS9VkYYLPv+bD1Jy
 VndYY8xNYsFzyZsxciVR4+i+sNE6q9Cl8BzEwBRGWRzmVQK2ianlG0wHjmpxgUev+ZHG
 J0BdwN/10mlGqcl0loR9a8waGKLAqfjOYQijqVTAEqbWTyUPCvYZgpiTU228N34GabUu
 yyV6OIvVzUQq7/BEf/am+dwDW53cAWXSR9T0rZoyrGpgwbmu8gooNfK/oC6OWVb3fTx8
 wR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694668037; x=1695272837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P+ElypKjl4wELftF/izO87eGZQ97psAyEtB73ZqIcSw=;
 b=FYqs1XMvfB2s8Y4Mgvai/q+JWN2kKn6XVE2LI1r4P9oCXcNwXVg83GULWiAZNULKik
 /bN2NHEc0/gFSQBxM1qixQLf/uk4EKqL8fBo4vO6bON+yJCRm5dQIuvytksAY4PQ1urP
 1Gh1vLw9cmUi9dy/96BoC35QixNsgu5LF8R4TS2a8XwWYWzhNqnAUVkMKBynWHtRtuus
 1Lf57x6KtHeF6i1pqfNc/Lcubgipd6qyelrClDsUk6sB40+8t5PDP9NddZSsBY+kXxhk
 aSisKAiCnnwxsGOm3/ybqUm8ulw87OyEzaoQuhwewZi668JXyGcjJ3EtDvgj50QCCDyi
 ro4A==
X-Gm-Message-State: AOJu0YxHuTt+BxVqU3gyQChddDjLTPLWlc0ObpVF0Jyc/d56Nm1w7BH8
 /5j4ztS8sYg0OxbTxCpdiXjyXw==
X-Google-Smtp-Source: AGHT+IEDvGPbRT0zik7IRli68fky9NvvKjzdqsnQ+BZwMjAN/mQsiDTBxTpnFEPlqykiPZEsZjgGjg==
X-Received: by 2002:a2e:9dc5:0:b0:2bc:b557:cee9 with SMTP id
 x5-20020a2e9dc5000000b002bcb557cee9mr4196700ljj.43.1694668036891; 
 Wed, 13 Sep 2023 22:07:16 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 22:07:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 12/12] drm/msm/dpu: include SSPP allocation state into the
 dumped state
Date: Thu, 14 Sep 2023 08:07:06 +0300
Message-Id: <20230914050706.1058620-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
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

Make dpu_rm_print_state() also output the SSPP allocation state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 1b0166bc9bee..e7c142bebab1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -773,4 +773,12 @@ void dpu_rm_print_state(struct drm_printer *p,
 		else
 			drm_puts(p, " -,");
 	drm_puts(p, "\n");
+
+	drm_puts(p, "sspp:");
+	for (i = 0; i < ARRAY_SIZE(global_state->sspp_to_crtc_id); i++)
+		if (rm->hw_sspp[i])
+			drm_printf(p, " %d,", global_state->sspp_to_crtc_id[i]);
+		else
+			drm_puts(p, " -,");
+	drm_puts(p, "\n");
 }
-- 
2.39.2

