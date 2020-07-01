Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 377EB21147A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 22:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A026E9DB;
	Wed,  1 Jul 2020 20:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6B66E9DB;
 Wed,  1 Jul 2020 20:35:29 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id j12so11479704pfn.10;
 Wed, 01 Jul 2020 13:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HJ9TTMafjAv2n6VF7CyukcttktdVGJm2gJrszfZ6yf0=;
 b=eLGWVeTElNhUAoI1bkt1Q/YJF+W9Y/Hj92NiYYHjzJ7FEnGOfAZ5vU0qxI12qZ5uAE
 pTqPszrGg4gMawg+/HY/3BmpMvqa9tP16eqWJoFiQ/YOKEr4IVhcikEAeAylh+Vs7VBl
 Mh+iaDh+l2PJuxj8p+ulSBQwNW4YH3FnuSfSv+g2iXed9wknURQdO5lXe3gPKUlecsIJ
 QhNq+F/2OLLNVmR94Qfr1Wno7ZnCTqViWaTrNoXX++ZgS7F8a05Ynqes8exHMMkao+G2
 ekiGg0CZk/4OD1S1w0xiJBatcngizTOKVe+AgZIzs78aPjOcMcoD4yh738b3UXKXMKdT
 YnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HJ9TTMafjAv2n6VF7CyukcttktdVGJm2gJrszfZ6yf0=;
 b=OVXwzEE6lk3v2UPrnJDqL/Jgxvx0PpymyZGa44Ynpj0hkei24pGf4ATxZynp+IkXh6
 5lWia2XrB19KI9GeHRY8+kCCnQ1H7Cek9mK4EP1z0wQgy3GZ/fep9+83+MCl0cievAE8
 DzivsMz4LwS9V7qUy4ypQT7bTQNZ15Cbm84CsMJBw/9fQBYbnJ5itGJPxEGP41CgLvph
 s5SJJd6nXYRhLJswfELaVBSRQ88q4GoSMchrY5MU2y3u9o3Jeify19HdOmriZgNuBNnP
 67eFV+aPz7PVreb0bKwLFg5HipjvA9o2ybK5D3YxOMBkNgg0q4sc3h1t5hXJpL3qbh0/
 0R4A==
X-Gm-Message-State: AOAM531oDLWfEa0czxBbzpsjDPe1DbfFY6JtwxiWCpc8KB2GrVN0bCgL
 /GS8doicHD+P3Ge/Dg3H1CLgsPg8RFQ=
X-Google-Smtp-Source: ABdhPJxUoiCn4AGn+fNLW0zKG5dEHRnT9pCAwHcIWzYq8IHBBFjU9ONd0ScleoT7eOV/MMwBuRTZBw==
X-Received: by 2002:a63:4c08:: with SMTP id z8mr20807693pga.201.1593635729136; 
 Wed, 01 Jul 2020 13:35:29 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 e3sm3195919pjv.47.2020.07.01.13.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 13:35:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: ratelimit crtc event overflow error
Date: Wed,  1 Jul 2020 13:36:00 -0700
Message-Id: <20200701203602.1272157-1-robdclark@gmail.com>
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
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Hongbo Yao <yaohongbo@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This can happen a lot when things go pear shaped.  Lets not flood dmesg
when this happens.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e15b42a780e0..969d95aa873c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -389,7 +389,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
 	spin_unlock_irqrestore(&dpu_crtc->spin_lock, flags);
 
 	if (!fevent) {
-		DRM_ERROR("crtc%d event %d overflow\n", crtc->base.id, event);
+		DRM_ERROR_RATELIMITED("crtc%d event %d overflow\n", crtc->base.id, event);
 		return;
 	}
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
