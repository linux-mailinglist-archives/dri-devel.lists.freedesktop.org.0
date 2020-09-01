Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F932599FF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B089D6E897;
	Tue,  1 Sep 2020 16:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE97F6E88E;
 Tue,  1 Sep 2020 16:46:20 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id s10so364516plp.1;
 Tue, 01 Sep 2020 09:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7KAgNczSpcXSENE7I7HLjPQLwLd/js6kuYT9gLzGMrc=;
 b=MeCm/VYIOe9iYCLfeugzAyL6okJVgG4svLLFNAlw6jwgFSHyxPJTfOhTGLcz+3lmt8
 4Nqb/t7ulGZyBaw+FLZqWnrRTKBHvyy8wk23mtc6mtN1c8ky08w+sHTi6lVuP3a6fRMa
 z6AU4iKXMyPFlrW+d0VSVrr0seFt//Be6gxXDKFsj9k7weplTuaHXFwZvzNqYacw4zb1
 MZoK6jiacE9P6k33ODJiryhUWGzVv8aO5rd2g9ZTMVvwrNpOnaIIPLlHwcAo2RlyKhpw
 d+n7xR/mD2Z78MSBOTKNGKlfBllUivdl7eWaHPAFceBf1i0d+ImM8e50nQfOJw6qsL7c
 0JaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7KAgNczSpcXSENE7I7HLjPQLwLd/js6kuYT9gLzGMrc=;
 b=LqROk8llvxirnqEM6I0anmFSZS6oYMF+nKZZ0boamfaMLdrshJEr8NLV1/LbdRNGui
 qrICQQeXFKbMSdfvtWD9Hk4d0fP4jNvaGhach654Plcqfbz1eKvdkmxR1eR5cUMwLcXQ
 vCGpi3xEPvAFIYlv1SObmA9YaoZHewMw1BLcD+0yBs/E7DNiaCtDuYGk9ul9ZB48ECQ0
 219bJk/0FG76Hr4Tu2b/7w4gcpZ2iP3WHV+xoxJmy/7dCSvYLjFgcyAP4IBseQkZXpLS
 58WRXIPn8kyieLKOzsO8PQWJFrZZBX2LeIYWCRcAyQgtA0A6/EoBlgYS9QVKrC/A7tJQ
 1Y6w==
X-Gm-Message-State: AOAM532z3GB2O0Nsa+zEcPL1x2RS7Uu7j3eaNpwahNM0mPKeos5TjhjG
 zeSE1A/PaeR1tE0j0+WXS6hRhjn353sEVQ==
X-Google-Smtp-Source: ABdhPJwjrPAmB1IlUhm3/lAYNFCsGsLfWotZDUGXrh1rk+DjB79F8gK6EHU9pv/Qpy7KR0JW5A12Mg==
X-Received: by 2002:a17:902:8307:: with SMTP id
 bd7mr2134655plb.159.1598978779659; 
 Tue, 01 Sep 2020 09:46:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id p20sm1967660pjz.49.2020.09.01.09.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 09:46:18 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v16 01/20] drm/msm: Remove dangling submitqueue references
Date: Tue,  1 Sep 2020 09:46:18 -0700
Message-Id: <20200901164707.2645413-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901164707.2645413-1-robdclark@gmail.com>
References: <20200901164707.2645413-1-robdclark@gmail.com>
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Currently it doesn't matter, since we free the ctx immediately.  But
when we start refcnt'ing the ctx, we don't want old dangling list
entries to hang around.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/msm_submitqueue.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index a1d94be7883a..90c9d84e6155 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -49,8 +49,10 @@ void msm_submitqueue_close(struct msm_file_private *ctx)
 	 * No lock needed in close and there won't
 	 * be any more user ioctls coming our way
 	 */
-	list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node)
+	list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node) {
+		list_del(&entry->node);
 		msm_submitqueue_put(entry);
+	}
 }
 
 int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
