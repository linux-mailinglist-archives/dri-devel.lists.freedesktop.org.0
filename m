Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366685221BF
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 18:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF8910E7A8;
	Tue, 10 May 2022 16:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC40A10E7BC;
 Tue, 10 May 2022 16:52:20 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id s14so17267631plk.8;
 Tue, 10 May 2022 09:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GlbUvuuWywK7r9IASaNCIAQVNurd9YpTqewxFeLD4Rs=;
 b=eAksJ5ZwCS6JUF2s47IELsBUbuSOqioFvb6MBBDzupqY9v71HGtPALLBQdHly+Q4Fh
 DShJbrjkSQIb7jykbW/iyKoL2t8zf5ENw/mG8nt94ygLj8ongvXhTPpdzRtPsoY7kJ6V
 mX8KaQXsxzDiE18YMgbJgBvw2Ctwrd9I2WbpQuIXTFnvUoJjYPAxdkyBUVboE9ts76AJ
 FacBL5YkyyFO+PSjs0yjsiTjP3Yz0NIQJOhkouL8zuRxNzedFRafbtFdMgOYXfkGGFRo
 77GAI3ARWhvuQ0JxQ/XQ4G3SyOR3ZyVLzm6N19EwoHIHz9egltmUj6Up+YZTV8ukpIE1
 nVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GlbUvuuWywK7r9IASaNCIAQVNurd9YpTqewxFeLD4Rs=;
 b=JK5zRNXEIklsdAOwzdWrEbNrU+Sd+ncmZ69BF1lKTCf3Yjoq1wRElPIq6SAOZwIEgh
 yf+S5bXfJdtwq5UMssw4BrQ3v/wz3PSHdN6+DJl8bsm0c3a9OkE6WNqo8hxFQpF7pVjv
 PR61ZDAnSKMRaGO+yU/n58iquWpoUgrxnTgeroyXLdmSKYrbz2AC0JfDL0O8TdeY5Ytn
 5ENx6Nf4oGVaDKFfTx887sV8ltnRDACTZ2yo6cUoGO8pE2rAC2KfY6BWLQhIQYP5QWCn
 Vct7FVQSS2/SRkzHIvdvJFVi8z4RLyXxBKcLgcPnqWEtjIVFGFpkUF845wrABSG2Ja0b
 rYgQ==
X-Gm-Message-State: AOAM5306X2W7MIHgXZqvHmJBybDtLahOnpNOH3TWt1Ns2pzvhRZTy+lX
 ft2VMyjDioztyh7ga4YgmKXCJBTXdiY=
X-Google-Smtp-Source: ABdhPJwmOOWFZJFiV5ZPMNAWyXasCIh2GiEs5APeA0AQgt/pqcBNlctje9oW1aHg3VNdud72TsDotQ==
X-Received: by 2002:a17:902:d4ce:b0:15e:90f8:216c with SMTP id
 o14-20020a170902d4ce00b0015e90f8216cmr22171600plg.65.1652201539771; 
 Tue, 10 May 2022 09:52:19 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a170903110a00b0015e8d4eb20fsm2296636plh.89.2022.05.10.09.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 09:52:18 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix fb plane offset calculation
Date: Tue, 10 May 2022 09:52:16 -0700
Message-Id: <20220510165216.3577068-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The offset got dropped by accident.

Fixes: d413e6f97134 ("drm/msm: Drop msm_gem_iova()")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 362775ae50af..4269da268a4a 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -118,7 +118,7 @@ uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
 		struct msm_gem_address_space *aspace, int plane)
 {
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
-	return msm_fb->iova[plane];
+	return msm_fb->iova[plane] + fb->offsets[plane];
 }
 
 struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane)
-- 
2.35.1

