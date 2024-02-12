Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71646850F91
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 10:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED32310EB80;
	Mon, 12 Feb 2024 09:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mxC2tp+u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B0B10EB7F;
 Mon, 12 Feb 2024 09:16:43 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2d0a4e1789cso33916241fa.3; 
 Mon, 12 Feb 2024 01:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707729401; x=1708334201; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AxW0bWP9rC9TBnm8nLzYxQGxIyi/0W+4SfDA3jONu9w=;
 b=mxC2tp+unR8RM+aD1zuXV0tJk+gS9N8Sr59W5x0niG9STw+P9tdoP6aM/BkSxhMmcy
 yq+WdYT+u2Z68cZcDne8OYoDgjiDNswNpgje8w0l0dB3zTkNKv99lLwPwlChrywWEs6V
 /OG38wejtkXFqJWnHkMjZcAn1UBG3fWfFy69ihavN6jrETSBPJIXeKNfC6f8C3gFM/Zc
 Jm938D2pB+JvVCFhwh+AY3sA6wFgXyVL6iPlKSa73jAJJTyf0pMMAts9h6dsXLshTcRE
 wgIy/Lt5chHAFUD7rURp9mWjzEImrzKL2N4qOPF51nJaUZpmXJIvAbkERjHuJnvLcO7V
 qxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707729401; x=1708334201;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AxW0bWP9rC9TBnm8nLzYxQGxIyi/0W+4SfDA3jONu9w=;
 b=WmpnPIMMYJLgCXfcyn4kgK3aX3+jLsAC1eTH97ZU0St1LfhqlPiJ3eZf5RcxCNZ6wb
 pDqYXufXuj1CLxSOlPKAfo1oa48HoudWj/icdWsokj6i/ywJW4wIvV62G8tDNtlkQvtx
 +wFpTJS+PWqAdowCHiPvLYPJozJE07hM+Xmq/qP3kHMIfWD7n1Coptt8HPj7mwTQe08h
 ikqZAg2UT0bhH3mbmwi92NAB/SoxxXeO5LgPUIiRmAqY0svEehgIxluzHHYDUgj7S/Xh
 7L9i+TP8HSq1+NyJH8sm+4kbzhZP8OpgDEf1A/yPELR3wmq8Fb7vxxjTJl99Axb41oNr
 YvyQ==
X-Gm-Message-State: AOJu0YyAYgc2fVCsIVxZaVEVHeoDPIZQzh/vVxpuKkoVALOKPlcxgoXF
 t4Nw2OCZHsg4tudWXb/owZXOGMzvY1snWLMeplgic0K+2qJ+FPoyB3wU5LZWBew=
X-Google-Smtp-Source: AGHT+IGMxAeXQ73tEFCKuRljVUNbVHyrutNzbh8cK2XcTkZS6b8oVk1/1ZkV2eKuK/O/B1GzmYXnPg==
X-Received: by 2002:a2e:984f:0:b0:2d0:ef5a:345 with SMTP id
 e15-20020a2e984f000000b002d0ef5a0345mr2416399ljj.49.1707729401109; 
 Mon, 12 Feb 2024 01:16:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVVryjAGIlEjHJv74r/GrMu9mtF/di1P8Kq7huZsrTf966i9h2a8GAHPY0aVzLf+sD76wJMBAWgQPCS98J2eBAJLqhU9xJfD6ex7BizcqXJaNxCV/va751zFHjBkrv4zWi7yMSXtzJzHpwM3skZlxqFzs8fd/I4OSO5qqmFIAh0jTON0Hhn+Pt80h39wjOBFIkR7NabrytaTN9JmHg1Sq7YVh1UB4d0dDQl3DYYjxl0hNdlLSKPxetK4qfvQy1IDhQog546CHYwuo/iI4kTjPpbswVoH9NA8sTFe3tP9x47UG2WKi+gTrVLlbU8r1WU0+CCdCJADgeIaEmMkuFNcqg2us82mJ6bBSpCPJBJauyAX7wjp9PRvOA/6wNpKQJdu/eYPVU+dRWa8aA8blQyu3f0NEvfpsq9k2DZ1kDXobjcjftOL3uun/h2Xp+Kdya0t4PeOX2G75D86Pwe1VWpOndJB6IVuMLEAbB5mQ==
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 cc5-20020a5d5c05000000b0033b75a1e8cfsm4811375wrb.24.2024.02.12.01.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 01:16:40 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/msm/dp: Fix spelling mistake "enale" -> "enable"
Date: Mon, 12 Feb 2024 09:16:39 +0000
Message-Id: <20240212091639.2397424-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There is a spelling mistake in a drm_dbg_dp message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 03bbdf865d26..320f17fce9a6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1409,7 +1409,7 @@ static int dp_ctrl_link_clk_enable(struct dp_ctrl *dp_ctrl)
 
 	ctrl->link_clks_on = true;
 
-	drm_dbg_dp(ctrl->drm_dev, "enale link clocks\n");
+	drm_dbg_dp(ctrl->drm_dev, "enable link clocks\n");
 	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
 		   ctrl->stream_clks_on ? "on" : "off",
 		   ctrl->link_clks_on ? "on" : "off",
-- 
2.39.2

