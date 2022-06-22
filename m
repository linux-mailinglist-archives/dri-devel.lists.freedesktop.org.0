Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26307554099
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 04:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76F410E8F4;
	Wed, 22 Jun 2022 02:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEA710E51D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 02:38:58 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id bo5so14802857pfb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 19:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UGahv1UkYohRmUNftmGc3sECtNNFfGUIAgRvhZC4Bt0=;
 b=LbibEVgq4fVFIL0WpewGwGOEOv3kwfMm6PPFMGEzbGHk5MR6p2sYNX+2rsWvIsywgd
 SijJOw4KdqcFv0Ol6DRWsR3bvMNoBwIOwiUbN4rbyBIjCYUjWug/pGMEvpgnLUsViItD
 YyY62B53YGy2BVv+KApxb0zd+k7ptMSesM6Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UGahv1UkYohRmUNftmGc3sECtNNFfGUIAgRvhZC4Bt0=;
 b=uP+l//X3wLNBKt1LyvGkmezgktsyGBrrkJHWOYIFwWQiv+dnQ2FqFHJgbD9SXQUFvd
 kjBbpZcOgivOpzMcOraa+uRXg+zALuzFT4h7MpGxCbhmbyIYumbeX3oOTB+GzMhF/LHY
 pfXwgC9QaqziDZYNeRdZ97A4hmHCSjjFBMZ27G3bEqu0y15AK3x8INgRO883W4lfsToa
 geWw/BRSbgKqcSoaXVeuyP9tzjsJqocr+Ojs8gq6NJwcV/+eZl/12clcijGvvqqynqQf
 UkhuOm9drigUxEIYqjNnzJIOqV1mE8N//8kYxOm/M1TXU6qd3GtXpFwKbTy13uV02ptH
 KmfA==
X-Gm-Message-State: AJIora9/MlqMUJmbjKCCXKKjt5rnBKB/XQXLJEdGLCwbNoYV+Qm+6+JR
 j5S4gTZd4I8/UXW4WOKnphYXJA==
X-Google-Smtp-Source: AGRyM1u8Xz3E9eBHmOq7oDjE6oJp+zYRzprNRNlxNeOfnsMRr5u7zy3v4JTXzcxNxNrSnPUsPftsjQ==
X-Received: by 2002:aa7:83d0:0:b0:50c:eb2b:8e8a with SMTP id
 j16-20020aa783d0000000b0050ceb2b8e8amr32998039pfn.31.1655865537928; 
 Tue, 21 Jun 2022 19:38:57 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:cfc4:cd7f:b2c:a07e])
 by smtp.gmail.com with ESMTPSA id
 b143-20020a621b95000000b0052536c695c0sm2487026pfb.170.2022.06.21.19.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 19:38:57 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] drm/msm/dpu: Increment vsync_cnt before waking up userspace
Date: Tue, 21 Jun 2022 19:38:55 -0700
Message-Id: <20220622023855.2970913-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
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
Cc: Sean Paul <sean@poorly.run>, Mark Yacoub <markyacoub@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Jessica Zhang <quic_jesszhan@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The 'vsync_cnt' is used to count the number of frames for a crtc.
Unfortunately, we increment the count after waking up userspace via
dpu_crtc_vblank_callback() calling drm_crtc_handle_vblank().
drm_crtc_handle_vblank() wakes up userspace processes that have called
drm_wait_vblank_ioctl(), and if that ioctl is expecting the count to
increase it won't.

Increment the count before calling into the drm APIs so that we don't
have to worry about ordering the increment with anything else in drm.
This fixes a software video decode test that fails to see frame counts
increase on Trogdor boards.

Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Fixes: 885455d6bf82 ("drm/msm: Change dpu_crtc_get_vblank_counter to use vsync count.")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3a462e327e0e..a1b8c4592943 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1251,12 +1251,13 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
 	DPU_ATRACE_BEGIN("encoder_vblank_callback");
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
+	atomic_inc(&phy_enc->vsync_cnt);
+
 	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
 	if (dpu_enc->crtc)
 		dpu_crtc_vblank_callback(dpu_enc->crtc);
 	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
 
-	atomic_inc(&phy_enc->vsync_cnt);
 	DPU_ATRACE_END("encoder_vblank_callback");
 }
 

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
https://chromeos.dev

