Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5930029CEA0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0BB6E49D;
	Wed, 28 Oct 2020 08:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7652A6EB62
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 10:23:09 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r127so1560041lff.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 03:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zCnAt3Ufpnd8qDbD+eSLDRky0zifegBLynE3fwmlgnk=;
 b=oq8XdJgwY33aXp0n2GrQDQSAwWGWnzcqqi3/5sSrHBhsrCE4hn9+Kk9Na3ypkP+MKg
 ag8ZfJQEJ1BhEMtGYYZVXisWeaimoqFjFjShC97cm4igo4PgLVzgTlFq9qBeyjdCXTz1
 dgLkhfyXfHooLHjcQhVN/G4si1mLKTlAX7ApKsuwP47g2wrgC/YIPXSi8XfbW+ikUuZI
 hIMc5e1LxCeRHIqVp0bpXHR92VfNQW/a6bAvaW3Nq2lLwlLdti9vAoORe5vERzbFU9Sr
 eOwXtCZWGA8TwQwgz0Y7z1Uui09DHdTUUIt/e23yVLBmSzvar4EI/h/l9YMTqtwCkxzw
 T75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zCnAt3Ufpnd8qDbD+eSLDRky0zifegBLynE3fwmlgnk=;
 b=PxZ/PAEMoExgkoirOZ2zRMovVllSR8g16E9gJ72nCFqxIxmUhwULTWtkQm01+BHDfw
 MMRCaQsQDdd4ubRbhyrQ54rHaunf5oB6vH93giLbRB9tKZgVbhhfaJVjRLMnZfqiGDDK
 vIPUS8d+hJYhVysOfv/wNQ4G8tvXniy51Vy9/hZr2N7T7NdjdtUYpLY1Vljc3SHZb9CL
 trZ+EmwpKXxao6ZR3fZ4Ib+S0lgu6W7Qt67aMfo4Y20A6m9j+qhUdBnBZl3NB+/qwwlZ
 hfQt401u2OkO/VvJr1I+8hoxJOb8dTGeK4sWUTQDjKkzqqpkBI5RZ53EbppIL52w1BM0
 AIUA==
X-Gm-Message-State: AOAM531vbd4VAeAiX8xMpQix4AmNoMUnUTrWmOBSFNqQU39DeHDw+l8q
 pmfHXXtkiL8fdTo34gj9zx4IwA==
X-Google-Smtp-Source: ABdhPJyLMOnr5LkkVIrfKPzhut//bBvlIxsF2Uhz6k9PUSL+0zZ+iGQhqxrS88DLYpePA1A4urntGg==
X-Received: by 2002:a19:2d15:: with SMTP id k21mr652619lfj.276.1603794187857; 
 Tue, 27 Oct 2020 03:23:07 -0700 (PDT)
Received: from eriador.lan ([188.162.64.248])
 by smtp.gmail.com with ESMTPSA id h2sm127327lfd.82.2020.10.27.03.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 03:23:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/msm/dpu: fix clock scaling on non-sc7180 board
Date: Tue, 27 Oct 2020 13:23:04 +0300
Message-Id: <20201027102304.945424-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kalyan Thota <kalyan_t@codeaurora.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for
display") has added support for handling bandwidth voting in kms path in
addition to old mdss path. However this broke all other platforms since
_dpu_core_perf_crtc_update_bus() will now error out instead of properly
calculating bandwidth and core clocks. Fix
_dpu_core_perf_crtc_update_bus() to just skip bandwidth setting instead
of returning an error in case kms->num_paths == 0 (MDSS is used for
bandwidth management).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 393858ef8a83..37c8270681c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -219,9 +219,6 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	int i, ret = 0;
 	u64 avg_bw;
 
-	if (!kms->num_paths)
-		return -EINVAL;
-
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
 			curr_client_type ==
@@ -239,6 +236,9 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 		}
 	}
 
+	if (!kms->num_paths)
+		return 0;
+
 	avg_bw = perf.bw_ctl;
 	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
