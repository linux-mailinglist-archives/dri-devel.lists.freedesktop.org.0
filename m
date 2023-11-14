Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9DD7EBA06
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 00:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BDC10E404;
	Tue, 14 Nov 2023 23:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9ED10E404
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 23:00:33 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-67131800219so36473026d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 15:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1700002832; x=1700607632; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/GFqO4G/MklaH9jw4JV/Pzz1KPVstRySwUanh5xWC0=;
 b=g3M4RqkLjuhZ10uqJARdmTzHtANaeZp9p5r8ct/dPxgv+Wk+MSLqdIaQCN7NQqDgh3
 blq40+OIJbxCqB22b6qcw9PbeY+E7fjYKQgxHbOl9V4YYkxaWO/+OmuU7FNnJstIDy5d
 L0f4nPIvfm52LdScvNTisydRv+nO6ekfkMyJx6mPgd0S7AN85451XkrzS6QugJUV4e+z
 wGjSi09pDp6fGx0dq/Q2qHxscUuwjgu/yxcPOWZmz7GgNi5/fpanGyrL+QOXHEu6p8+C
 hc0bRVD1bYWVJaHvsAqBf4HMu369ghHdLaz4ByEhmFMZNdtKu5SJh/01LvwGcauJnBi0
 uj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700002832; x=1700607632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w/GFqO4G/MklaH9jw4JV/Pzz1KPVstRySwUanh5xWC0=;
 b=R6y74Ld0njdatrsMWUxVjzEEu9yRl0rOGHkwjDwawM3/2iFOqSHfpnfIMguYZWUMfG
 +XQvYlRtAydcyzoMDKXnb4h+5lMe/zk0K+OsuAYNomx5WpTI34ezKIu1i0rjyfXDEOjh
 mTdZN+X18H/HC51wVBNi0KtmUFPp+eObX/4/0HT4zq1URqQxd/wdPTmjZg44iDSarSDg
 cSzXZ3aP/IxXHQvEO4hlEAQz+mLLtjA1ivZGCzDdWoGXOVwKmdKt/QQM0cyJjMQPjITA
 zmehOWdct9O9LPnewVfEhiAmeP3ajkSj8Pq4tlHcbUBYH8MAI0jtwPNorKMYtY8n4YT/
 RdLA==
X-Gm-Message-State: AOJu0Yx8EOcSllg+rkt5B3oAFRXtCFd60NOQZSLkCbPsU69YSdyd8EiF
 F2UcWrxV1YZhynTh691k2B2VKQ==
X-Google-Smtp-Source: AGHT+IGs8pOHCMY63Ix8FFyLk36FFEv+XiIXC0agrgFQ+oxUKW/tRhs6EBRxYa3gRpVrFgUGoNzaIw==
X-Received: by 2002:ad4:5987:0:b0:677:a0a5:c226 with SMTP id
 ek7-20020ad45987000000b00677a0a5c226mr3522207qvb.19.1700002832113; 
 Tue, 14 Nov 2023 15:00:32 -0800 (PST)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a05621411a200b00674a45499dcsm25274qvv.88.2023.11.14.15.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 15:00:31 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm/msm/dsi: set video mode widebus enable bit when
 widebus is enabled
Date: Tue, 14 Nov 2023 17:58:30 -0500
Message-Id: <20231114225857.19702-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20231114225857.19702-1-jonathan@marek.ca>
References: <20231114225857.19702-1-jonathan@marek.ca>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The value returned by msm_dsi_wide_bus_enabled() doesn't match what the
driver is doing in video mode. Fix that by actually enabling widebus for
video mode.

Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi.xml.h  | 1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
index 2a7d980e12c3..f0b3cdc020a1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -231,6 +231,7 @@ static inline uint32_t DSI_VID_CFG0_TRAFFIC_MODE(enum dsi_traffic_mode val)
 #define DSI_VID_CFG0_HSA_POWER_STOP				0x00010000
 #define DSI_VID_CFG0_HBP_POWER_STOP				0x00100000
 #define DSI_VID_CFG0_HFP_POWER_STOP				0x01000000
+#define DSI_VID_CFG0_DATABUS_WIDEN				0x02000000
 #define DSI_VID_CFG0_PULSE_MODE_HSA_HE				0x10000000
 
 #define REG_DSI_VID_CFG1					0x0000001c
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index deeecdfd6c4e..f2c1cbd08d4d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -745,6 +745,8 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 		data |= DSI_VID_CFG0_TRAFFIC_MODE(dsi_get_traffic_mode(flags));
 		data |= DSI_VID_CFG0_DST_FORMAT(dsi_get_vid_fmt(mipi_fmt));
 		data |= DSI_VID_CFG0_VIRT_CHANNEL(msm_host->channel);
+		if (msm_dsi_host_is_wide_bus_enabled(&msm_host->base))
+			data |= DSI_VID_CFG0_DATABUS_WIDEN;
 		dsi_write(msm_host, REG_DSI_VID_CFG0, data);
 
 		/* Do not swap RGB colors */
-- 
2.26.1

