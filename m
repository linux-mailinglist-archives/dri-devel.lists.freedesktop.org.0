Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38D22507F5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 20:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168CA6E438;
	Mon, 24 Aug 2020 18:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09EB6E3F0;
 Mon, 24 Aug 2020 18:41:45 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id i10so4997158pgk.1;
 Mon, 24 Aug 2020 11:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fFdgtfwZrc/kVc+fLHaAXwOBlYLh1Scshg8PrDPV2cA=;
 b=JMBfFYqJssdNSpKeUnYwIYl16ci2D3KflwOOxfvM3CU9HPQiYllCH5sZjJPFSv7cRc
 1fmivhMx1dEE/3e/XzIlSNWneWOqC/cCvVnVehH+9VJW3f5N31ucofST7kI3KW1XQgdB
 XiVWya9r4ICUQOX0+77Xay6fR0AFrkVucVF5OuTzI33dNbktUe5Hebd1IK78Ddv7K0IA
 r7LUfRXepbKvcNwNwlw/U1uBZVkJDUrROyPnBnj5pJvPHyQFrEl4PjqHT/hYiP/4sZTq
 cb39WH8a6lTBuxtGkHAJ5OuHyeEqK5qDSMvNljF0qeTrTb0JeWGON4CMxhGVL+tnWK7m
 EGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fFdgtfwZrc/kVc+fLHaAXwOBlYLh1Scshg8PrDPV2cA=;
 b=FKQmjVls3veSzcmE+O1m6Lmk6Bm/MQRRMjCyBEOjmOIC05/UNR9n6ABSHJ6TqfUgZy
 xfS5a3ApMunqIZLo1RKNORu0egjpv+GktUGZAvvBcZxGuPiG3UhKHoWN/KLI1FyBWeJT
 XnWRlmcrXPke5yiRAVjo6ETJY4xwfMy/cXsHkNBm3UcRq8fqpZiad7C6S1HMfq/SCJpc
 bG9hZVZ9ktIH5rkH/norfmHlUEVc9ytvxQqWSteO8GU6Gci2qLUxj29rlBFNiLpJZAvC
 gamMTf/elC0+FfTUiJ+4RbPTn5n+0gJ6mvkz3VCAeyVhR4wkUzSSc0wizg+rP7GcjQgK
 cAbg==
X-Gm-Message-State: AOAM533ogQyxtfvT8L2hUWsgd1HtsBjk6qiiQAPcjCh1s66E22yZ1nb3
 RzR701jZZDxC2KYbRdhVbmF2a4Ld1bq3Nw==
X-Google-Smtp-Source: ABdhPJzrk/w8HSHD4F2CriYbzO3IkcbXkvduywKAs1ONUCGEOtsuxUrphk9jrVQS3ajL5jYLaF+wQw==
X-Received: by 2002:a63:f44d:: with SMTP id p13mr4124438pgk.363.1598294504582; 
 Mon, 24 Aug 2020 11:41:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id b23sm11949461pfo.12.2020.08.24.11.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 11:41:43 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 01/20] drm/msm: remove dangling submitqueue references
Date: Mon, 24 Aug 2020 11:37:35 -0700
Message-Id: <20200824183825.1778810-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200824183825.1778810-1-robdclark@gmail.com>
References: <20200824183825.1778810-1-robdclark@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Joerg Roedel <joro@8bytes.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Sibi Sankar <sibis@codeaurora.org>,
 Brian Masney <masneyb@onstation.org>, Joerg Roedel <jroedel@suse.de>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
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
