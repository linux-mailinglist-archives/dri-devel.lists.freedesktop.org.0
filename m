Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3288FA9118B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 04:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053C810EA0C;
	Thu, 17 Apr 2025 02:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ILq1q4mU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9386410E154;
 Thu, 17 Apr 2025 02:13:56 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so1722195e9.1; 
 Wed, 16 Apr 2025 19:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744856035; x=1745460835; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pjqs00K/es5vuuaBVD8LAsqW6UPYNiv4vD65jbm2oo8=;
 b=ILq1q4mUy6G3sgzuZsG0rI59yR3oJKsgAijCFxX+dZZQwqQBFjb5IxZhS6c6uprB71
 2JJ5tXicAh+MBvb846mvhNQ1Egm42e/X3jPNiMFATOIbvbRDNt8adTaC8o7Bc1UQWiHd
 RfOvhW5lL8NQQwsHbiMzfyub4gEQCTJruk0QCWdqgYF10EntFwLArWcSpMFv7i8MuayN
 E63wHEuFYzSpLi2dhsIHV6yT8hkUABdyVxjEYZDKUi9W6JlppA4QscST96F9z6piCnWm
 WqJVtRN/QD1sTqlA2+R2bYkgEhYFEQwA5Q7g9Exa+M/VGc1OgmCv2Dotty/DStHk/Lyg
 plog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744856035; x=1745460835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pjqs00K/es5vuuaBVD8LAsqW6UPYNiv4vD65jbm2oo8=;
 b=ItRvHbNebgRsJ60N1IyRSZb538mCGsTX6FYTKRHGJGARnfzy4BjznTddAY9bKmo+4o
 oUvLBLuiDMI0T2HLmJwPZIDYInJ81DTg5gfT0jkza2V7vXbYthHixJNZq/zTe0PqF5sr
 Bu2M0MMmn307ssjbT82E8koENbw21/XOrb0v8x6jreUzsJkQtTx9PkIt5dDf4+fCV2jg
 1oqNW26faTDHoL35CqB5icnScVo7sw5THY+h0kmqU6hRpeIe0EqlncFpncCr/taZ7rVO
 VHFVXThNKU3okZsE2eRrg0jyU2MwH8DU56YiJLVJ8XNj0nGhgkuKb18dC0lHn3JwyUjf
 NZgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGkLoSAqC6a6u3tGHo9LL0jkaMQ9wOaPat70DEkHq5hLDfTZg7CPByGlY6fT7lov9JQsl/QqE4Kee4@lists.freedesktop.org,
 AJvYcCWvvUpSAxUcUFdEQ/jW4zCyyviJ/MuT/Q2nF7fB394FaXiWFxcrinaxzRVZliVnCOGR45LSCB5zCHI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUXXOiktVO7Bhe9jdtscwf2dQHO1/NQqKC4rkC02IBGRSvBbLT
 0hgAiVouhqiY1shLOFMgVcpH0hwkefa4ZsLvoO1sasR9WT/SSOsl3nBk1XA=
X-Gm-Gg: ASbGncuG/Lt2vGklsr9M7IGGiH+V2v46kyBw1Hc3juNThKjgaTPqFtdvTOdS+92vnwy
 QD0pt94rj6DjyaZc+psPuqq5UlwDP7XxobMHcZTv4f8TWHgm+fHQxOu69dqXz2J/qHU7jZKjFwN
 uRAETxs1BOErUJ6OnqHB1tjq/ePzXrAjNCs0dngc1Vbe6s7K53x3XSBGmD4TnzjnOp9n/PZ/e2F
 O0PGEzSzDNdV9NDRbMjRSacBlkINUqpEvv5OSUDu3jXPAMrPxBbrNjqSpvv6yon3KM7G+HPMcIz
 pUeGnykbxh6VFzUu91HXo8s16cze2bhldJ1P5+w1PUyBM5wjX868eWQI
X-Google-Smtp-Source: AGHT+IEr39c8D55+uEn9FSHRIQHSmdOqsYNb7pAPfA4vFCRFkBK/jkVX9f8a5d30XVrtd+wA46b93g==
X-Received: by 2002:a05:600c:4e45:b0:43c:fceb:91a with SMTP id
 5b1f17b1804b1-4405d616b5amr38046265e9.11.1744856034620; 
 Wed, 16 Apr 2025 19:13:54 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b4d1236sm36940485e9.13.2025.04.16.19.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 19:13:54 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v3 3/4] drm/msm/dp: Prepare for link training per-segment for
 LTTPRs
Date: Thu, 17 Apr 2025 04:10:34 +0200
Message-ID: <20250417021349.148911-4-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250417021349.148911-1-alex.vinarskis@gmail.com>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
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

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
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

