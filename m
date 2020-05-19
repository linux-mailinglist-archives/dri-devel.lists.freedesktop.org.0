Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AD11D9084
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 09:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB126E10B;
	Tue, 19 May 2020 07:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346516E093
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 03:09:00 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id t25so10050183qtc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 20:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mQJ5GEq7PDJ+xmAy1f1Vg4ydmsBKJSVL7rBc7e/vN0Q=;
 b=tuU+WBq+N01erbYivv1k/19CTmRAoPPA+gTWI2uPJpN5ra9HL7KDI0EOkRqal8XT5+
 UmJu47AJ0w83pu/+rzwUJjZyXM2l5j1yzJctHB7SWyjyUZ7SdmyNTCw6ef5eVpdmNM8Q
 cJXVx8QHLckBAxV+yRAtLeDXOIlPb0doargDP1sxtACXPLZQSRwvWgcrwm/cCmCHi4rH
 pw5KH+asQZ/FEyXaRkStMrXR32n09Ee7EDVH0FIzpDyGoWd4hqRqaU/vkfutWmQX2PLX
 UqDYLDRo/4/rFsP80YDtdPPeirV7Azpe9aKEiHmNQPGsjSrpLOh6Sn0sAwYDQMZ06ky8
 dUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mQJ5GEq7PDJ+xmAy1f1Vg4ydmsBKJSVL7rBc7e/vN0Q=;
 b=e8GX+5XJUOaTutHeu3Rg2VH5Ilu89VOnkUEw+SXheVUiM8cy+xoydrrczHQgS9mEVJ
 s7hFmScGDhp1sPYmVX60QLWlNRspWLmkjwl+zbuKTNzzlv8TMum+4jipLIyfb00bda4n
 5A1DnKG707ueHqUbQZE7JgLmzkRSxOVwJ200sv2QVoMEUT9HcJkI4UX4A2L1wqvPIGfh
 w804DXiOQFWbAXzj94YSC8m6lZ6QZFKHMtrKBVQeMdsdkG4CMzhD0uQf8STB2n5NS8Xn
 Tw7FNxWOqdtY+fWrApFvFusUfIY3q2OKW9zjpgUKWQLOe3CFL67YcFAm8Y+8BBuTFPuy
 DgAA==
X-Gm-Message-State: AOAM530vrS3k6AYUFbMb6urmtn/TMu4j9ywbwIR02xJsNm+3RG+UuQ7Z
 rPQx3eDwcO3Ro0GzAE0ViTKeXA==
X-Google-Smtp-Source: ABdhPJyqNsHhYZbp5yPpTg7RdDlSSku/gcOTr/4QKk3jwHyz0DH+TNY+8xf4dnxg+M92BBjHTCB5Gg==
X-Received: by 2002:ac8:37e6:: with SMTP id e35mr13537025qtc.310.1589857739104; 
 Mon, 18 May 2020 20:08:59 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id s74sm9941014qka.54.2020.05.18.20.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 20:08:58 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: don't try to set GPU frequency when GMU is
 suspended
Date: Mon, 18 May 2020 23:07:33 -0400
Message-Id: <20200519030735.24713-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 May 2020 07:00:27 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes changing the frequency in sysfs while suspended, for example
when doing something like this:

cat devfreq/3d00000.gpu/max_freq > devfreq/3d00000.gpu/min_freq

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index aec54cde8534..9498803dcad9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -151,13 +151,20 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
 			break;
 
 	gmu->current_perf_index = perf_index;
+	gmu->freq = gmu->gpu_freqs[perf_index];
+
+	/*
+	 * devfreq may try to change frequency target even when suspended
+	 * this can happen when changing frequency through sysfs
+	 * don't try to set freq when suspended, it will be set on resume
+	 */
+	if (!pm_runtime_active(gmu->dev))
+		return;
 
 	if (gmu->legacy)
 		__a6xx_gmu_set_freq(gmu, perf_index);
 	else
 		a6xx_hfi_set_freq(gmu, perf_index);
-
-	gmu->freq = gmu->gpu_freqs[perf_index];
 }
 
 unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
