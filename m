Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6306E49670E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 22:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BFC10E6A4;
	Fri, 21 Jan 2022 21:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE3B10E69A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 21:06:23 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id m1so36391007lfq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 13:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gbDYfYkXzgmiEZGNTQVBb6LTE3GRv8HVsbajZEr2dIk=;
 b=vdcnX1xS5hTwnCvfbiEqPJiR77PcyU1Y9bya0cA8O52sBjiDPfjXG+qIm2DBrhszyt
 Zy2tK1s9rXxBYKa+s7kskeK4/yC09B4HogYMlmQp0rJ/Pt26yNC4Vx8geszM0uYcKaIt
 vKUyGs2Sm36c+5IqxsVoWWQVfzN7uV9G4pV0Bh+IFsoFHcOivw3Iq3Kfexg2+sQZDqj1
 XY1bTpwYtonMuD8h3Tnvdm9tj+UsWWdDo41L0MvuNpIVT/D049wsInMqTT8g5qwQHpVj
 JPoBLb31wSJX/tkXxASNof9ctZaLd7KZ6oRoX/bI/TVDMEK1OzAS5DZ35dYtrWmFaUFA
 hGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gbDYfYkXzgmiEZGNTQVBb6LTE3GRv8HVsbajZEr2dIk=;
 b=b+TzMr0pZExXxtlRVEW6AoJSk3T6Jfat90ypBsIMz8rS7OaQP0g4qYMRXC+6myVCy9
 ZAWUmJzNJTjNhBnRIzRvkMpk6m9RXRdB3khewtlQtI0ZxKZLxwKCYyk9G5wHRcpJ6Ii5
 bvUGHqDUn/2Vp7PWpeCDz1LIfTIXr6nEMIXyi318AvNpuSlsE5GS3UUIMBmiAzccI2T4
 qisfAW39g9VFv9AY/PtL0a8CCP39jSjBjGLDsR0qtJ27cUAw8X536RweR6bLGC5oH67E
 T9LtAPUuh4UK+ePqQnNwXpLyEdXY/5O+rp5Xn19G+qpJ1gBeCB3EnP7GOJPXV+LNOXuk
 /MkA==
X-Gm-Message-State: AOAM530OmRh/rGhzyysMj37kirXvA9WaFYQ6Gnm3izDw6bYrn4iFmzGM
 3s0hNut+NWUVs4N7fYa9nV5vog==
X-Google-Smtp-Source: ABdhPJxWdxw5YmwlxYgYXx5IYmFhk/j/OaZLrLiihXTr1uY50tCWFiUyjjGiGQOVCo1AGiJMRKIG0g==
X-Received: by 2002:ac2:424a:: with SMTP id m10mr146163lfl.361.1642799181923; 
 Fri, 21 Jan 2022 13:06:21 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v10sm279125ljk.44.2022.01.21.13.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 13:06:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 2/6] drm/msm/dpu: add DSPP blocks teardown
Date: Sat, 22 Jan 2022 00:06:14 +0300
Message-Id: <20220121210618.3482550-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
References: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing calls to dpu_hw_dspp_destroy() to free resources allocated
for DSPP hardware blocks.

Fixes: e47616df008b ("drm/msm/dpu: add support for color processing blocks in dpu driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index b5b1ea1e4de6..63ed0d7df848 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -35,6 +35,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 {
 	int i;
 
+	for (i = 0; i < ARRAY_SIZE(rm->dspp_blks); i++) {
+		struct dpu_hw_dspp *hw;
+
+		if (rm->dspp_blks[i]) {
+			hw = to_dpu_hw_dspp(rm->dspp_blks[i]);
+			dpu_hw_dspp_destroy(hw);
+		}
+	}
 	for (i = 0; i < ARRAY_SIZE(rm->pingpong_blks); i++) {
 		struct dpu_hw_pingpong *hw;
 
-- 
2.34.1

