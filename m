Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87BA8CE601
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 15:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0615210F16F;
	Fri, 24 May 2024 13:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dZZTyRFe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1179210EEA3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 13:20:06 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6f8e859eb20so804660b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 06:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716556805; x=1717161605; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O7X6X7Xg0a7P3rLwok0YLujXGrmUyMxWDQ/9AezaVG8=;
 b=dZZTyRFefHm2VrSGdc/a8xQZvH5RzVMGECRRX9GUCVimeMaoHTR3Jzw0heZslagL0X
 X0yZSBxcHQXzV/sZVtTWPEzY6H7N1VMNm7i1Lg1RhnXNFnhmR2mPdeEtnDkcUHtLOzRl
 nMvVH8sONpsARWv+fIlfTjZ3Z6qNQNZ+AdofUBX9v+0x8BI9owPSRnd2mfFxhhYh0LvJ
 5heMxvzgjmouf/0N2yxrLPp52LFi2hB3FlqlZWqnYHw2+CwKtiYW10hU6vXSijRlDFf+
 Hl3w8O876K75WxwVrXp5YDgVg8EIJYXSplJQ2c8cBaN45w58HAcSBmV0i9IduP9Bp8wO
 M5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716556805; x=1717161605;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O7X6X7Xg0a7P3rLwok0YLujXGrmUyMxWDQ/9AezaVG8=;
 b=QeABrKPBLkL8zAWTdsbg86Yn4+LOaMGh33EwalcfK73F3NCU3rQ+04/2Yu6u/m6r2v
 5attt5l2QPSbkJ+JhYWPFfsFrP3CbCyFq/CPY04RZVCnajPvLmCtrDCIu5V1UypiPu7i
 YlH3Efn0JTVLR6zTkY876RmrSTEBwzy9L5+i3GtmLJ7rj1du8lScaPzqQp3A/g+JGxK/
 GVsDA3rh8LRu+FuKxXnnqXHnCSKCwlH8aLS5P1cA731470MCI/HZYvQwc4eQiGiYwEQt
 2+jZX/72EkCjgreQIOgcxZlL3z/OoTm5BQW4eIGIWrusIFft4AMyohp9BJTxAWe/stUz
 vHLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuhpCR29YWOJtGTfxzbhTZoMiIhvO2TwPtju1fcYGCHB2vs3eRqLT6tRqI2Cvj6Ds0ijy8pjlKxhVgdX4Meh4XiJcXwIYSYySCr28xC0ag
X-Gm-Message-State: AOJu0YwNwhSAxJBK+s4wVKYbYn6/0t48uQ0Jx1PA4057GVXcTLeroTH4
 WD17L1Z2i052dBNixlaEkSdBTUq89RkYyA0ioi/CdZN4nQnUrA18/ulnwsiOFUo=
X-Google-Smtp-Source: AGHT+IEaF2Y5Q7PpzxWxDlSpCPw29IB00sbmr5EJBez/e+fhZLJRTYl/6p9AjxbjhfA7ASd7c8riaw==
X-Received: by 2002:a05:6a00:1c83:b0:6ea:f392:bce9 with SMTP id
 d2e1a72fcca58-6f8f3185033mr2206294b3a.15.1716556805523; 
 Fri, 24 May 2024 06:20:05 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fd2d492csm1117852b3a.179.2024.05.24.06.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 06:20:04 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 24 May 2024 21:18:23 +0800
Subject: [PATCH v4 3/5] drm/msm/dsi: set video mode widebus enable bit when
 widebus is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-3-e61c05b403df@linaro.org>
References: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
In-Reply-To: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716556778; l=1644;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=myYBVxgRS2I/E3QUdyhnLOjWSeM7jzrWqz2ABozlocE=;
 b=acTSUbISIJX/UiCq8kqoDO4+D8/1oY7QOyQNkEU/pl4GyuyGinhAF/uix6W7YgXHJteo4QthI
 m0ghV/Ena4ODZ7iitRZjSs3qclPIVQxtybpusCBTC4rAOs/QHAWOOs5
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

From: Jonathan Marek <jonathan@marek.ca>

The value returned by msm_dsi_wide_bus_enabled() doesn't match what the
driver is doing in video mode. Fix that by actually enabling widebus for
video mode.

Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a50f4dda5941..47f5858334f6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -754,6 +754,8 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 		data |= DSI_VID_CFG0_TRAFFIC_MODE(dsi_get_traffic_mode(flags));
 		data |= DSI_VID_CFG0_DST_FORMAT(dsi_get_vid_fmt(mipi_fmt));
 		data |= DSI_VID_CFG0_VIRT_CHANNEL(msm_host->channel);
+		if (msm_dsi_host_is_wide_bus_enabled(&msm_host->base))
+			data |= DSI_VID_CFG0_DATABUS_WIDEN;
 		dsi_write(msm_host, REG_DSI_VID_CFG0, data);
 
 		/* Do not swap RGB colors */
@@ -778,7 +780,6 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 			if (cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3)
 				data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
 
-			/* TODO: Allow for video-mode support once tested/fixed */
 			if (msm_dsi_host_is_wide_bus_enabled(&msm_host->base))
 				data |= DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN;
 

-- 
2.34.1

