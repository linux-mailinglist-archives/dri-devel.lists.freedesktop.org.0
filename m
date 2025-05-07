Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258D6AAEEE4
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 01:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CB210E894;
	Wed,  7 May 2025 23:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MpwBqRXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EACA10E2B7;
 Wed,  7 May 2025 23:01:22 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5f7ec0e4978so646600a12.1; 
 Wed, 07 May 2025 16:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746658880; x=1747263680; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d29g+oKQGWaixqIeAK1Ckbfb+nM3h9Ahj4fH0G4rL1g=;
 b=MpwBqRXu8oMzdqIXaFifZ++6TpzA1DhKuI8rWUjgAWq6qONLMZu6GtbwO2/XXXg9C/
 C6txctLUXfGM9jbeWagea7pCN3aSYjJy3tRlXY3b/h7Ys5nahygJS8BjBnDY8yQwPgg8
 T41CY3SygA7VGTzD1OvTWvUHPIlYHB0+052pQLh5dj8G0KboVORj8m10Q2edCStasc9t
 5nKYEBf8xncKn1SsLg80y4vyz+Rkkz5zBcrrTOUyLmereZrw2xZUwxOCNRIvL6xhC5k1
 BhE464erC6IW3WfBjFgI5Hlc4zpdPq0Ja+B0Z8S0p+W43sE/Q+RD3MZSKlT86Aj1eLIt
 T0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746658880; x=1747263680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d29g+oKQGWaixqIeAK1Ckbfb+nM3h9Ahj4fH0G4rL1g=;
 b=Qg7gsSyHjLomx0UIgPG1TsqRJsvtF4Io7AVBjg0w4SibnhG356dgDB1G+DG9HrHG+6
 M1UY1I7eQxx+qhqIT37b3QYtrkMFyPXQVKk5S+IOnmGeqbcIFwQ+BK9kzG5wyYzch/KW
 GZcrxv2UEtZbYf5ZnH5iseFkOoL+nLVRs3AXtrpJ5vJToQbFlkWMGfMzG3K2M/VG9xxL
 GDUg4etRYhYTbIW1XRN/emIQIUsG69YXukMH2TAQhR7bYhaAzI4QAyOVLWSSAasukv4N
 x4feLaBnQaPvbW+3IDEylyRSQ2zh+gX2M/HIWendGO4aXO0/F2iXifL/5tHkkRTWsRCm
 Qx0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7k/AWJZdHEHsXxA/FquJV+QCNuXRMzTJQ3aX/++YfbFnn+dDmTCmsvFo8edIjpHPbf9wsMR5VVAv6@lists.freedesktop.org,
 AJvYcCXd4pUJfoebueKaIJiEM/0iSZr86XBHUM6zZ60RLytixinn0i4XPuO5+uuNzXMABs/NtkgjIBtGy18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3qEUeme8p3+RDv+JVLtq3YCkFstcrexgYxFUYJgmNYkbA045b
 9cfs9wPdnfejCUE9U/01WAractZsLVXAvLKyx98MOIi2EYTzSq8=
X-Gm-Gg: ASbGncvh/wxZGtp/JIcXlQTjeuccGfJ9EQStlRbUZlzWXLxE0ci9bZDmkQS5iJIrOzL
 6B1QKWXDX1jOyAzCPAo7DIQ4v4pwxV4oGg8WCCkUOLdrsRn+N94KRXRW2FZfmPKfyQxuTmCR4s3
 K3C/F7+x5L0sgPhE/UmJ88chT77n/KkkE4cl3agLYMrjflEPQBir4kMoMrROEYNJXBmPTY1QuHl
 dHApiZqxP9r2ebbymx3tqi4W9NJu3L+24GLYlLv9Av4w/8S9DgMzJJqWkV0Z1QiiYd82bF9TabI
 zRLkSKvhkvzDv1cPWqI2emkymnvEWr3oFXqTRKIDfi79lvM4MXXeUHjr
X-Google-Smtp-Source: AGHT+IEIfm5RN/LToCmwcsXr0u+32oBo8dQ4kyit6fh9zoBiJPeVih3IpeDTTICh9ZavlCdXci5edA==
X-Received: by 2002:a05:6402:5c8:b0:5fa:a635:481c with SMTP id
 4fb4d7f45d1cf-5fbe9e51d2dmr4345754a12.17.1746658880134; 
 Wed, 07 May 2025 16:01:20 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa777c8b12sm10507906a12.24.2025.05.07.16.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 16:01:18 -0700 (PDT)
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
Subject: [PATCH v5 1/4] drm/msm/dp: Fix support of LTTPR initialization
Date: Thu,  8 May 2025 00:58:59 +0200
Message-ID: <20250507230113.14270-2-alex.vinarskis@gmail.com>
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

Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
(re)read DPRX caps after LTTPR detection, as required by DP 2.1a,
Section 3.6.7.6.1.

Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SA8775P
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Rob Clark <robdclark@gmail.com>
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

