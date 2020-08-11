Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A542421AA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 23:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AA66E844;
	Tue, 11 Aug 2020 21:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496F06E844;
 Tue, 11 Aug 2020 21:08:59 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id f9so57714pju.4;
 Tue, 11 Aug 2020 14:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MndcDzC/7AcUJRluxUgqjFCuSvCxnzh1AGFXbovDx5M=;
 b=noltbly0zKrpOk/SZeDEHs3VqJnIemgq0K4S5/hbOHx1rrIgo5711lTz2awSjikBfz
 5SeO5QIt37qI7/qXsIKttKFObQpZ1LN/725Z2XqnFj0Gtgt7bu2OfZ/D0g8VjAD9RyaI
 UJLvwVf5hOGPnlYzVJPWdvpD7Wlmvn88hYBOVs9ynTEDRhglJdmRnBt+yNadEVFRZepo
 r1nEmHabYv/7cBf2Vw8G5rdFHnYOZmdMLHlGOojo5CBs9FUqJAdsrG1TUJGmBJ7wf/cY
 GZ0O7It4V3Rd66hTUvL4kZq0ZgEZlp7MWNakNS46uDYsjN45EUplATuK2iBPhJAB0k9T
 O8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MndcDzC/7AcUJRluxUgqjFCuSvCxnzh1AGFXbovDx5M=;
 b=nKk/6Io9RdMdUsclSgmzr9fJck0Y2jcmUcmPfG42xwm206fJKLmYewwAqjGpZI3CCv
 EXztwLp2qYVIu0PUC5lH7O4cnhWhvLT7nQuVj1GQ67mk9085QOevz+2uu4RrTSSn4745
 VvvdQLKwovifctyG5qQpWn2gp2WDDGMsPK82LpuMYcA9gV8PwK/+JvWPCuSIRKR2CYnm
 CYLjTxmWbSiKv+fCLBI6W/MMEj1h7PiJwHlPNT+w8fKN4c2Jyl8PkOKVywHFgSxFbHE2
 qJ3j1/bCZm3nPurJ0J46jQm+XmqXsYSkfbytjKW2x64to0X6bTJPaHPiBvdBgTK00HXZ
 uyGQ==
X-Gm-Message-State: AOAM530+HwOT5cMlWhEw3GVlXBdWPwgqtcO6c8MN//gwVvIFlaiJPUHl
 OqhrqE5uT6nhlB/mV57SxchHTFa7ZuM=
X-Google-Smtp-Source: ABdhPJxQYo13BOHv9SR2FnAADb18QXpqroXf/pda53QGuHBM1XL/wjykqI6CGbWG6k9YJwfLrhDjWA==
X-Received: by 2002:a17:902:b18b:: with SMTP id
 s11mr2646637plr.211.1597180138472; 
 Tue, 11 Aug 2020 14:08:58 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id b63sm6060pfg.43.2020.08.11.14.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 14:08:56 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: fix unitialized variable error
Date: Tue, 11 Aug 2020 14:09:35 -0700
Message-Id: <20200811210938.552939-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, kernel test robot <lkp@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Bernard <bernard@vivo.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Hongbo Yao <yaohongbo@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:817 dpu_crtc_enable() error: uninitialized symbol 'request_bandwidth'.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index f272a8d0f95b..c2729f71e2fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -827,7 +827,7 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 {
 	struct dpu_crtc *dpu_crtc;
 	struct drm_encoder *encoder;
-	bool request_bandwidth;
+	bool request_bandwidth = false;
 
 	if (!crtc) {
 		DPU_ERROR("invalid crtc\n");
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
