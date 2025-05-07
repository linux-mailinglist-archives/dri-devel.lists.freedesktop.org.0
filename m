Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB97AAEEE9
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 01:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C88110E8A6;
	Wed,  7 May 2025 23:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CXeAMfff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AE310E897;
 Wed,  7 May 2025 23:01:25 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9eb12so522417a12.1; 
 Wed, 07 May 2025 16:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746658884; x=1747263684; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dxQS7tOaIlzd4BMqHG01qmudk8XV5+9z00a0W+A4Kng=;
 b=CXeAMfff7q+ynZMA8U3pxQfz2Tedz1ESEyL6HwEiONYVPMdd18dID2J9vYR/ZDvFlW
 B3gH+TRjHPNBsv5el4CjnVXJY3ymV7V9MbW/uYsMfJOld9+VYM/ImvlOhlRNm0EkRsSX
 r55AjGSkc1yuQp6VG/z8iQfxSnkhuIVbWUoHqNtzYsEIlx/HXvukNhBWED95MGFCuSQt
 k8y2NYzN9RrY/nuO0X8MkPqmfnfHaM6fRy1DgHB2rt2FDhcpAGdsSVSRAzL/kpPr9IUE
 0/HkZ/hrECBqzjsDjcnTL5cW9UbDyLrBPfhKeZb+5GLJTygWd8rzLUBTPtxih7u67ehk
 eygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746658884; x=1747263684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dxQS7tOaIlzd4BMqHG01qmudk8XV5+9z00a0W+A4Kng=;
 b=hA50vUisuAkgOZ2vIstgmKBjwBAIf7697J5WOswIfccHjpFizhfSA6/sQfcb6hjS/x
 FE84tqjZCvWTPp7HQWGsSUYCD4LppjTyB65NotJ/ClHsxANljnuoHqhwJi8XWSHmRt66
 MQ3UUxUXqJFic9PEDf6iHMpa1kGNiaoswiuLCLdlwDR2sHUyyUCzUki0Vw+D7c/wfWIk
 pkjTE+ivgQS33Cut8Bd+Uy3c4y+Wap261FywMkoSPjElL0mBdz/tXEVw1nJU8Osy91We
 rdAwoqWzZUlpTQvHmFQUp17mImuyccLcjBZU7vNW9njybtGgR5N4nlAqTO4524Bm+R0Y
 MbQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS3sI+l7WH9le+vIdrqeHpdrDv6dwQHknVX5ZwalbgBkTVAIBUDXxzQqbmLc2yYgGd+m9sir5sHdjA@lists.freedesktop.org,
 AJvYcCWkyFA9uA3oH4AZprq6saVuwRFrhLkjDjk0vMbeBrAfw3dv15moPW8rBHeKSc6xuTtdz+xmW0wVsSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzE9wzoD3M5rVju3Sm1twKRkKXkNdZB4UvTDlRxKcUjy3GY/8yr
 VBi6oEtAH+5ulnKtQgN3IU0ikw+lYLjievNl6DeiuCc+xoZdPC3pYaekNhorJg==
X-Gm-Gg: ASbGncuS6V3vvJkqi+cAcP6Te4dq8E2Gemf1EMVO4JnKjPSU8cf9SZdveGMIVu2zuNO
 GWyr+3sWBGQeH4ePHiIE/KOR7xmYObh83EkzfkHyUDR6pgVi1LREwnHomxafHU1J6MN0fGFRE59
 /9Eg7FNkkE6c81b1TjSuxkjDOXDYdtUsRjs/Y5xZbt/P6Q3s+mXG3AbFklOcgfEp5iK7KzPyimL
 vB7mNethaQJGzl/jx1QD2tTggypTNDDQ2MCXb3keSLZ/Vz07Z+HpU8SD2wJAFqePuZO6gxMvouN
 6kkFKCzuhUojduC0g8YRNYG6Ns5HIGF0ZLPSFQqzM6eyiQ==
X-Google-Smtp-Source: AGHT+IEyX/wcOP+2S5z9Ne55o2Yz4W9nj5lYP3VfA39BdFejfpDFFTAzXqQjqXit0YuAUi1TM0lHtw==
X-Received: by 2002:a05:6402:1e90:b0:5f8:357c:d58c with SMTP id
 4fb4d7f45d1cf-5fbe9fde8d8mr4538375a12.34.1746658883762; 
 Wed, 07 May 2025 16:01:23 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa777c8b12sm10507906a12.24.2025.05.07.16.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 16:01:23 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v5 3/4] drm/msm/dp: Prepare for link training per-segment for
 LTTPRs
Date: Thu,  8 May 2025 00:59:01 +0200
Message-ID: <20250507230113.14270-4-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250507230113.14270-1-alex.vinarskis@gmail.com>
References: <20250507230113.14270-1-alex.vinarskis@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Per-segment link training requires knowing the number of LTTPRs
(if any) present. Store the count during LTTPRs' initialization.

Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SA8775P
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++------
 drivers/gpu/drm/msm/dp/dp_link.h    |  1 +
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5c57c1d7ac60..ab8c1f19dcb4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -367,16 +367,21 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 	return 0;
 }
 
-static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd)
+static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd)
 {
-	int rc;
+	int rc, lttpr_count;
 
 	if (drm_dp_read_lttpr_common_caps(dp->aux, dpcd, dp->link->lttpr_common_caps))
-		return;
+		return 0;
 
-	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(dp->link->lttpr_common_caps));
-	if (rc)
+	lttpr_count = drm_dp_lttpr_count(dp->link->lttpr_common_caps);
+	rc = drm_dp_lttpr_init(dp->aux, lttpr_count);
+	if (rc) {
 		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
+		return 0;
+	}
+
+	return lttpr_count;
 }
 
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
@@ -390,7 +395,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
-	msm_dp_display_lttpr_init(dp, dpcd);
+	dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
 
 	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
 	if (rc)
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index c47d75cfc720..ba47c6d19fbf 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -62,6 +62,7 @@ struct msm_dp_link_phy_params {
 
 struct msm_dp_link {
 	u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE];
+	int lttpr_count;
 
 	u32 sink_request;
 	u32 test_response;
-- 
2.45.2

