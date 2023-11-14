Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4F17EB5B6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 18:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF3610E220;
	Tue, 14 Nov 2023 17:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451C410E220
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 17:44:02 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-7781b176131so304267585a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 09:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1699983841; x=1700588641; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=thGoIvnqITUJB7IQaQsWGdMjOXMrq/akRqtI22GpJyQ=;
 b=hnzmqmTbMed8e+88re6xjyvPjPszDKFkJjN9C7SLStw0E7v2EjWklTfDAinGnlHdDT
 VqbYANQ+TYPrpWxpx9v9Iw6njO0wu+lRohqDDUhI142IPjlewe6BoqzJe5OaReVmbehi
 xShKxttq2YMF/aCjef5sC1GZ8XtfLp5yHNwdJt9H549SMpnuURUfgfV74tqL+X59GXyv
 mYHjWGhaMUOOIUxf1MAsoXX2A/SRUNZg4uJ/Qqx5qybqvmQ8nic5fK0X92xVU2QBV3rW
 GjLgdnSjGdSh7KS6Tbmq/egRH/LYS7/dI6Ay9kngW3qDxOuYzupCoprkRRBIQhlRxunl
 Ofaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699983841; x=1700588641;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=thGoIvnqITUJB7IQaQsWGdMjOXMrq/akRqtI22GpJyQ=;
 b=SGBvLOFK/2xgaRPDFMl/s96ZnkgesTLAMTnlLyzj4UO9KytvWM6PG4F08zhLcmTFsX
 +EfJSrrIrLtS6Xu3UJTsGahda5heAYGAWcGJ64mtoOpXgOye2zFiuNHEvYrDs9+ADiRP
 jpTOBmKwQrosCk6vFokxuFKV+vpHfv3+qR1NKB0jAwABmKWS3+Rd5sX+B7iUGYGNrACt
 wfcyy1asUFbLz1W1iQPOzL1s+ciGvA0c36f/jfCj8FwVHV6InUltFDvQVQbkfX3HheAt
 4xdWxLNxq5RMCvYY2LQ5/tLl43KixuAh4OtCxAMHNNMxdItdpyiQnso6maodSFvEzRH0
 GRtg==
X-Gm-Message-State: AOJu0YyG2Ycw68SzvS4duDFD34E0WX/UH/GSfPSdx/Aa9TtSs8IiYt+0
 Wje6QSgwj8abRKl+2b8aElN70Q==
X-Google-Smtp-Source: AGHT+IHcVT+p/7lEFZr3H2gf88K+Xif9L02wc8rJZEdi8qlawjVvm/vlqEVvJKZyXLD4cXnfklItEg==
X-Received: by 2002:a05:620a:8c0c:b0:775:7e16:2cdf with SMTP id
 qz12-20020a05620a8c0c00b007757e162cdfmr2232672qkn.39.1699983841236; 
 Tue, 14 Nov 2023 09:44:01 -0800 (PST)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 bi8-20020a05620a318800b007671cfe8a18sm2833350qkb.13.2023.11.14.09.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 09:44:00 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 1/4] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC (fix
 video mode DSC)
Date: Tue, 14 Nov 2023 12:42:13 -0500
Message-Id: <20231114174218.19765-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
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
Cc: Vinod Koul <vkoul@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
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

Video mode DSC won't work if this field is not set correctly. Set it to fix
video mode DSC (for slice_per_pkt==1 cases at least).

Fixes: 08802f515c3 ("drm/msm/dsi: Add support for DSC configuration")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 9d355cdc3ec1..bddc57726fb9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -847,6 +847,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	u32 slice_per_intf, total_bytes_per_intf;
 	u32 pkt_per_line;
 	u32 eol_byte_num;
+	u32 bytes_per_pkt;
 
 	/* first calculate dsc parameters and then program
 	 * compress mode registers
@@ -854,6 +855,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
 
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
+	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
 
 	eol_byte_num = total_bytes_per_intf % 3;
 
@@ -891,6 +893,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
 	} else {
+		reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_WC(bytes_per_pkt);
 		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
 	}
 }
-- 
2.26.1

