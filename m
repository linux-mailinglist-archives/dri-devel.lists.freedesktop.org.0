Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D7E43842F
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 17:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD4A6E0AF;
	Sat, 23 Oct 2021 15:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521506E0AF;
 Sat, 23 Oct 2021 15:55:29 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id e10so4843564plh.8;
 Sat, 23 Oct 2021 08:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pscnLJEu2qwqCNNmnoLt+B8mAL+wT7Lt+stuxD0ggY8=;
 b=Oo4Cz062CbmERZh9cQYtnlsjZVdoIWqp2ACOFlujb5+SNCV+N4akytp60NUL9wAfEz
 byOwgGbuhWaJ3W9/eWrrADJv+5SQTdlaLDcmAvV2XfV4altCl4D0FgAlpar8Yu/HaPr6
 194SsLuXKa+niMEdJKtFVZLOPdpf1OJDuZ1Wu+nCnFUM+Kss9Q942Q8+pQVOv6ScBBU3
 9F40BtCUCZ/J3EsLFTNsHHGJTS6iBZZic6sBAVOkkokod383YBpphyAy09b43xpFJZDW
 eJCUz3d92fduswDTbojasGDCKfjFjuaXs+HUXbnn+tCl1OebI86nzIIrQi7IcWxEFAg2
 vPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pscnLJEu2qwqCNNmnoLt+B8mAL+wT7Lt+stuxD0ggY8=;
 b=PRJauL7IJFTXuNq3GypRGWq4jeMcRyZ6GfSWyJbUO/LyIGjUEFoB6sTQrVS1iWIBZV
 wDOV8ZoJz7+MBM+oA5B2HH/qY4jTr3AArKHZHoOfqHnNVRFeAypHrCtJG+U4xykuNNC9
 iX25sQpdFtIWu+CKq7w2+sw2UKICiJ2EElVgfOEQY0rom88Tbpvp+ACOj7PE+XTfWqmU
 LmiBPgbxKNuAq6+TtRp+YsvVrZMoeMesaTfs8bEtxvU1Yn23qA0sC32e7RMQtPUrQiHn
 aOb1qzkg6xK+j+M0uoCr/oD6ziv8iiv65/NGvNnA0ptpZpF7Spao7ydYE8bgT6bFvbBi
 YbDg==
X-Gm-Message-State: AOAM5337F8YYIT55gllGqNPqhB58dxFzu8B1oGpoDJrOd+W1OsSUnaA+
 ib9ixVTOw2h0MoRX5reypEzEk36+nZo=
X-Google-Smtp-Source: ABdhPJwWT9j1dSDtcKbwaRRfAclgDzrk4miF5isQUOQpvRwMPAgBFNwatBSKXrX5LgYc8Vk6BITa5A==
X-Received: by 2002:a17:90b:504:: with SMTP id
 r4mr4662808pjz.157.1635004528186; 
 Sat, 23 Oct 2021 08:55:28 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 f20sm2767205pfc.185.2021.10.23.08.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 08:55:27 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>,
 Jessica Zhang <jesszhan@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <maxime@cerno.tech>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Mark Yacoub <markyacoub@google.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] drm/msm/dpu: Remove impossible NULL check
Date: Sat, 23 Oct 2021 09:00:12 -0700
Message-Id: <20211023160016.3322052-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jessica Zhang <jesszhan@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e91568d4f09a..0ae397044310 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -187,11 +187,6 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
 	int i = 0;
 	int rc = 0;
 
-	if (!crtc) {
-		DPU_ERROR("Invalid crtc\n");
-		return -EINVAL;
-	}
-
 	crtc_state = to_dpu_crtc_state(crtc->state);
 	crcs = kcalloc(crtc_state->num_mixers, sizeof(*crcs), GFP_KERNEL);
 
-- 
2.31.1

