Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C7D260159
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 19:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659F06E508;
	Mon,  7 Sep 2020 17:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000826E108;
 Mon,  7 Sep 2020 17:03:51 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id d9so2612575pfd.3;
 Mon, 07 Sep 2020 10:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cBoeCpJIsgMagxrNvwqBCO9DZhUD6cpLapF30icLvGY=;
 b=rIDLXekWW5zsnDsZr9rwwnGh7AcQsXpJmtxOGLnaYEaXJ/7Sz6Ets68fQu6vR6NDRT
 bwJ03F4A8BzzUQbMMGeTQxqkNxfwrAgutSh4utFVl1D1DE9A/ODV+mnBppSqgNlzb+FR
 XZ8eLkzwbRQ6piUSbAQELVuV5vVJ43hENOahvDVxXil873iSxkXI0UgDW4XNZEF2SHo8
 LTC2bYDGLqTqPy1+T1ebpGf4nMO1sUv2+QHOBzQV+PtBW6eOBk4FMgGOm1sFnlmbKhvr
 hwD0P3TADu3J7n7WZ4MP+3cmlYiqrgsUaiFdWTmDuiIU8Bl9dAuJTGcfZi/0u7J8FYXE
 F3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cBoeCpJIsgMagxrNvwqBCO9DZhUD6cpLapF30icLvGY=;
 b=nAqylndO+S8s4c9uxHsEpXQ9auiWTysuhwyWrcWLefhNzb4XHfCte6Ipazymk67aW2
 2+w8RHkaHSeyhYMcluhCmrXObV47dnplaHMuwXohMv6bw+00n1/wjx2EIjGAMt/ml+39
 3KrtADt3s6iVxS2Y2W8gdUXzt5ng61iVwsBr6k+qVS4tn8+oZgQ2UrXxTgJZO0ImBnJx
 2og6ilB464WbzszxRN8/2VNadkPLC+olwwvgwWpzdQyapxbmi0JxEgwhUVWh4ElOFRBm
 nMN0eUQvf1dQD5+eKUr4xSebU0VAzkdey3pGeOVNMa59LTX+wWBNMFZQkLd1hnpuXDVg
 yoew==
X-Gm-Message-State: AOAM532Xu2FOEGoS7NPyFbW13OSgPTpexaowNa76axxUAj/ItDo2fwfp
 BmtDQwf/btWdvSpo2xXWh4/bmF3PWpQD6g==
X-Google-Smtp-Source: ABdhPJxYfflcUtF+3SNgySp6Wk6HAI2DtYQFui4BIRaT7wEocOLQuuQWImDHVlvC2fujq7/dzSgg9Q==
X-Received: by 2002:a63:6e01:: with SMTP id j1mr17237015pgc.147.1599498230690; 
 Mon, 07 Sep 2020 10:03:50 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 j18sm13027030pgm.30.2020.09.07.10.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 10:03:49 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/dpu: move vblank events to complete_commit()
Date: Mon,  7 Sep 2020 10:04:47 -0700
Message-Id: <20200907170450.370122-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Hongbo Yao <yaohongbo@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Bernard <bernard@vivo.com>,
 Sean Paul <sean@poorly.run>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We could get a vblank event racing with the current atomic commit,
resulting in sending the pageflip event to userspace early, causing
tearing.  On the other hand, complete_commit() ensures that the
pending flush is complete.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index c2729f71e2fa..89c0245b5de5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -297,7 +297,6 @@ void dpu_crtc_vblank_callback(struct drm_crtc *crtc)
 		dpu_crtc->vblank_cb_time = ktime_get();
 	else
 		dpu_crtc->vblank_cb_count++;
-	_dpu_crtc_complete_flip(crtc);
 	drm_crtc_handle_vblank(crtc);
 	trace_dpu_crtc_vblank_cb(DRMID(crtc));
 }
@@ -402,6 +401,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
 void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 {
 	trace_dpu_crtc_complete_commit(DRMID(crtc));
+	_dpu_crtc_complete_flip(crtc);
 }
 
 static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
