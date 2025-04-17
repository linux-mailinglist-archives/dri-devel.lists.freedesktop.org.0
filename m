Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61919A9118E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 04:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B780010EA11;
	Thu, 17 Apr 2025 02:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DiemEVFq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A5910E154;
 Thu, 17 Apr 2025 02:13:54 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-39ac8e7688aso139482f8f.2; 
 Wed, 16 Apr 2025 19:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744856033; x=1745460833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F5DHHgrjGd2rCCjwjWpNQeDoT3BghQC1sBR2u4Y5ESY=;
 b=DiemEVFqvHc/QMGUA2v81G/0bmUg+qcZ7nQ0qC9u7K01BOpV2VeaWtI1Hm9mAxua9n
 dOTNfJ13oQIJJ2xJA1YL8dUqN7q6Q/DuAeD9mx/+zvAWYtl9j0UWqMFkcDXufaehTWe4
 x0FmC+WMSXk1M4Gy8eTOGOlGJzJF0YGseIVudb1kZptPjvqc8+PTh5cugbG1EXrkcAEK
 0p+TXhhI3LSP1rvI8ifL/2NHGcyadoiNNtTj6fFaX5EOtueqbRzJtZom9+GVe0q0s2ps
 E4xsfAySnPKDrWMu7uMrdNw+nMEvcRA7SynW0X6ZVnpDfX7vIpD9I7oLGJBQ7xFClB8s
 Xc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744856033; x=1745460833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F5DHHgrjGd2rCCjwjWpNQeDoT3BghQC1sBR2u4Y5ESY=;
 b=RnfD8UUH3tf2lBih6AvCeB0WvKDSr7/EAolhoMSBeQzg2ed+N7wBCki0oqvH93nNor
 EuUWECMcgn75t1qUoAo30U7D2A/JPkCdlLl1Wd2Gm3YSFHSGztX3ww7Ec0AONsrXl/4f
 aBr7awVl+QGESOtWIJjNA2n2pHiZ4XNY7E79fbSDkPlzCqiYeitUtEYMDgMI1fsEzOPb
 z/X4VOYcd+GC9kLVtqXagm194Ht2+khWGNkypqr35JrmNvhPYb1bC4Mwj1YtvracGm2N
 toieQsZfK5XPPol3XiInfJpAjtVSmVEdi4kw5Hnh69Cvc16TUJUvY5/7YEEuhyF6tX++
 aLRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz6URRlERbgHMoRwwH33DvtcqsQXsE4NPq+lj0E7PKd2VqMyxdS9tlI0y7Wwn5G+awu6I/B+udvHw=@lists.freedesktop.org,
 AJvYcCWzBClpMls7BtICAbsHuxWznQAu92QM1wCfntCTZXXbZd23PHPFf4it4zGcA3vuT6lOsUhMbFf9XC5J@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWc/T82DGRAlD+j0OQddEtsIL7iVLXXt4Ksf70zh9VSc8yZOpy
 5cSDnZO6DZW0BaZy2V9kWMIeKpa1hafSz2/AgC3WW8Da2SVD3gY=
X-Gm-Gg: ASbGncsS0BkWnso9aeBGNnuJOcjNfRdIDYcG2aJsJE9+2GwLNPtwLsPkzMGdjUoSrpU
 Cf96D7HC+WANfQXN30gn/L4RpaVoyDCs9bwPl5+w/rtiJQoUzjw0Y92hXMffnFBObGQWsdu7yxN
 4tb/vXwQDiPe+d/o+rPjG8cJ2MKZQwR/MGi+N21dDKt5pZayQQG05IroXRAwsfeIprkqK24T88/
 DfMXUIBQbw61zFADQGdIrsDawSiWjDjwlATum9KaUWaohmaUj6n7Q+3qSdCHmJTqugcCmG4k8vN
 xYR/lVBCNFENipdoTqyZgVS7ST2+8tj+7b4t2SRj4A8vuw==
X-Google-Smtp-Source: AGHT+IGzrdbDSFpnoAxT/1N2SrlSqLje5cfHVitMqyyo32g8ydOGWS+ibmmSo/GsALjZ4OmYeGNfPg==
X-Received: by 2002:a05:6000:1acf:b0:39c:1258:2dc7 with SMTP id
 ffacd0b85a97d-39ee5ba050emr3472141f8f.56.1744856032524; 
 Wed, 16 Apr 2025 19:13:52 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b4d1236sm36940485e9.13.2025.04.16.19.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 19:13:52 -0700 (PDT)
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
Subject: [PATCH v3 1/4] drm/msm/dp: Fix support of LTTPR initialization
Date: Thu, 17 Apr 2025 04:10:32 +0200
Message-ID: <20250417021349.148911-2-alex.vinarskis@gmail.com>
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

Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
(re)read DPRX caps after LTTPR detection, as required by DP 2.1,
Section 3.6.7.6.1.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bbc47d86ae9e..fc07cce68382 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -367,12 +367,12 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 	return 0;
 }
 
-static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
+static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd)
 {
 	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
 	int rc;
 
-	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd, lttpr_caps))
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dpcd, lttpr_caps))
 		return;
 
 	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(lttpr_caps));
@@ -385,12 +385,17 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	struct drm_connector *connector = dp->msm_dp_display.connector;
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 
-	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
+	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
 	if (rc)
 		goto end;
 
-	msm_dp_display_lttpr_init(dp);
+	msm_dp_display_lttpr_init(dp, dpcd);
+
+	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
+	if (rc)
+		goto end;
 
 	msm_dp_link_process_request(dp->link);
 
-- 
2.45.2

