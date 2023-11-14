Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 455127EBA0A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 00:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D8D10E405;
	Tue, 14 Nov 2023 23:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E4210E4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 23:00:35 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-6705379b835so37069596d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 15:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1700002835; x=1700607635; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3bXNM4Q60WzU91mEPZf4VyqZpLI234VBPPnXZJAmol4=;
 b=ZcSNWng+1qS+yVfnLfo1DHZ/T9autJXP2CXxE4co7Hm4QBLAx29umyjVpeox5A9Swg
 ZfJOI1eOVo4knDa1o+uTuWNKF5Qh0QNDbhZO93pPgBGmX4TzS6t6sZlLBw0LBxIC/pa1
 GMEA7y2CPrJTSvhwAgfbXnzTGxrD5GboTnrojlJTRKdqyrXp3zj+0Gf92HMUcoE2cBzR
 3SHnGAE2k1/d14NSemo64sgkdInAHozjv9bJ/jNd/N7l4JIVsV8V7H3Braoz50NWqnnQ
 GpsddM39qLzklgeSGsQpvTzBrhFYaXFDMkxnbTv8IVrH++nfzFeZds/Qfro1Zga4lwAv
 DfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700002835; x=1700607635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3bXNM4Q60WzU91mEPZf4VyqZpLI234VBPPnXZJAmol4=;
 b=BSNDgBbqkiV8zcdUwDEn0nmyUA1ukyknGtgp3rRlBo23oFP4HbYwq93WXJpFi4daGw
 mUFmZPdPY4SqMLKuGQpeKgLPoQNJkOUILyFw9GvMDfKyPWXG9wWbdJkEI/Pml7smE8xk
 hEVXa38CfsHZewAOB9o9H5dOMVxJfipGPHaf9m/Y/4/NwXNdCtSSMLdw12Sz386bIpWS
 zqggBjlXdMv1jZEoqD+qJf/KaE0q0QB500a2U4yHDcH3FdQaXIFsfK+m5AMxmR5H4/55
 UrJwTN3MDSq2GItX2UE6z5M7an+7bhYvN8DNhkKp66nx4TD5bh2wCx/e0taUzpTW74bv
 1IMg==
X-Gm-Message-State: AOJu0YxEuE7Hd7IhLDQyy9a24fotozWUbRZbEYGd5k4hAmFreUIZ5UX+
 7jDACWv37OOz2HB4p3iqnhklNA==
X-Google-Smtp-Source: AGHT+IHCQG3eL93xOKOvyP2tHydGdXl7lNnMKJaAkchLjAmxahJp9qdvYkmh1PrCIEgA8PmuVIkUJA==
X-Received: by 2002:ad4:544b:0:b0:677:af51:da43 with SMTP id
 h11-20020ad4544b000000b00677af51da43mr3858770qvt.0.1700002834910; 
 Tue, 14 Nov 2023 15:00:34 -0800 (PST)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a05621411a200b00674a45499dcsm25274qvv.88.2023.11.14.15.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 15:00:34 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/6] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC (fix
 video mode DSC)
Date: Tue, 14 Nov 2023 17:58:31 -0500
Message-Id: <20231114225857.19702-4-jonathan@marek.ca>
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
index f2c1cbd08d4d..66f198e21a7e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -849,6 +849,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	u32 slice_per_intf, total_bytes_per_intf;
 	u32 pkt_per_line;
 	u32 eol_byte_num;
+	u32 bytes_per_pkt;
 
 	/* first calculate dsc parameters and then program
 	 * compress mode registers
@@ -856,6 +857,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
 
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
+	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
 
 	eol_byte_num = total_bytes_per_intf % 3;
 
@@ -893,6 +895,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
 	} else {
+		reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_WC(bytes_per_pkt);
 		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
 	}
 }
-- 
2.26.1

