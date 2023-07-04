Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D7D747603
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 18:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC7810E2E0;
	Tue,  4 Jul 2023 16:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCDD10E2E0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 16:02:30 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-766fd5f9536so425214485a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20221208.gappssmtp.com; s=20221208; t=1688486550; x=1691078550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vGounWSX2Ta3v2i79JYImPXzwvWuhBfpeJNjehKi004=;
 b=rc0Z7y7TRSX2d+1KPwiGFAhYt8WzwvmJqI3TYwOtVT7uvUJyHaeN5LaGt1mKP6LKnC
 uKq/8vW9itima9B31SpAz2mexuJEkJdzIMVLK3cmvR/s+Y7cz9KbMRjSAgMJ+7VFtPVG
 dIJu6aXSkK+O7myNN/V/OfAmFqOzWcohTDSY287Ugp/Fag9pxnuwih1IXXP6cNdp9XKK
 lmXRumrxbC3Uemv/foXY+rq8vEePWATO3BKLYjB3LRWaqrVZhwfReNd4+XXK5P6fmFHk
 ikG+Oh3DBXvPMPhfFoQHTQiPEtlhp2z93JMi/J6KDiEtY7ZJC7WpFdzK/n0WaokgzzGA
 kRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688486550; x=1691078550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vGounWSX2Ta3v2i79JYImPXzwvWuhBfpeJNjehKi004=;
 b=Gc3OaIvuLAc1uzGQuk11Kmco0XINmX4y1sCJGQ4QkLggpWOYysAOBCC/4MkgCTjcaD
 MXMpVPnJApP7+8VcqYR8+TtIU3vxB8UUeF8co52ZZKt9ush6PjUbJc/RGunIiMVvpL7/
 xV4Kfvf0ZZwt7w6SnRFt7M/bsLDgNDjNooZ9BUHv6w+Dj6xI+tewC5K0o5kUVQMM54SW
 P72msPo/e8zypqDokkWru0jF9vDNV+a02AW2FwinYX69raBZhQZUW5ZKiNvVoD8vueBb
 FukhZfcRClwTF5VgH5aGruqUL0Al46SokyPR7LrQAm0IJ+xKoDsJjEYz+RcjpeQAw4Dj
 RdeQ==
X-Gm-Message-State: ABy/qLYXl2VCV++LWFpM7TLStNqyuwAsPYtU7QIM82osI514yzA3w2UA
 Qt2zsf+3X3XR0nfGNsg7Wu/vdw==
X-Google-Smtp-Source: APBJJlE+NmKZaXt8xrhE1cfKOONdr0uQa7f/tA9YGQWR7rwjnOqQDPa3QaGrSLMkEeuqZM5bZwMHBg==
X-Received: by 2002:a05:620a:4096:b0:765:575b:415 with SMTP id
 f22-20020a05620a409600b00765575b0415mr17754462qko.24.1688486549669; 
 Tue, 04 Jul 2023 09:02:29 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 l15-20020ad4444f000000b0062439f05b87sm12659236qvt.45.2023.07.04.09.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 09:02:29 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: add missing flush and fetch bits for DMA4/DMA5
 planes
Date: Tue,  4 Jul 2023 12:01:04 -0400
Message-Id: <20230704160106.26055-1-jonathan@marek.ca>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Note that with this, DMA4/DMA5 are still non-functional, but at least
display *something* in modetest instead of nothing or underflow.

Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index bbdc95ce374a..52222af5975f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -51,7 +51,7 @@
 
 static const u32 fetch_tbl[SSPP_MAX] = {CTL_INVALID_BIT, 16, 17, 18, 19,
 	CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, 0,
-	1, 2, 3, CTL_INVALID_BIT, CTL_INVALID_BIT};
+	1, 2, 3, 4, 5};
 
 static const struct dpu_ctl_cfg *_ctl_offset(enum dpu_ctl ctl,
 		const struct dpu_mdss_cfg *m,
@@ -206,6 +206,12 @@ static void dpu_hw_ctl_update_pending_flush_sspp(struct dpu_hw_ctl *ctx,
 	case SSPP_DMA3:
 		ctx->pending_flush_mask |= BIT(25);
 		break;
+	case SSPP_DMA4:
+		ctx->pending_flush_mask |= BIT(13);
+		break;
+	case SSPP_DMA5:
+		ctx->pending_flush_mask |= BIT(14);
+		break;
 	case SSPP_CURSOR0:
 		ctx->pending_flush_mask |= BIT(22);
 		break;
-- 
2.26.1

