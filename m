Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAD117EDB4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 02:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C276E7DA;
	Tue, 10 Mar 2020 01:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A436E7D4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 01:08:34 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id b72so2089882pfb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 18:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZsJUbUNfiESRLuYlVmUT7nhSudXoWYkiShdhs0IArls=;
 b=XFuZgQI6L8AD8ZC+wJcMMlOpNhRPxKuZmIDUI2Dp7pePszq0+psnLUZcWLxHzhjkLF
 cqmX4g/KD529guet6IQgap1svMGkP1vVFKGY83mrwc6CIEWa0x8VJCm+SgBiIAIhMRh+
 49uuYA/BnPQCbbsstNRnaqX3Xte/zMhOMxnjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZsJUbUNfiESRLuYlVmUT7nhSudXoWYkiShdhs0IArls=;
 b=HzPoP/i75Tz8TI42eK8tv7lSkB6PpwpW6QVmWB+XSVGSRRikCao+4yYOGDd6p9C9bz
 9dyThKLSBMdEcuv0oQ00rgM5yX0S4wbpgXX6Ty8OYGzLtc10Z8nnXTxXalNcIIqW1hOB
 ZFM4ob1/VYF7b0phQ2wgcaO3Pjov1+nIyCfYtvBglwnE5dDomicOQX1HDLHLNg2XpguL
 wrCqypUoVxnCRS4NcAhnCsDynIQO6yYd1qf5WrGNlwi8FEVNcC4ANfIlsU36pqBoQd9B
 9GTNVJIB+VFBOZOpKuKMqxBF+Fknd+DvpqSQfi3EgVBe9ocsDStkpj5oQ/UH8/KT5+/n
 usoA==
X-Gm-Message-State: ANhLgQ0TQIh0YNc2eBsfUxsXS9ziBnXehSON91qzKC1s6Kix9UT9nvLL
 ohdj3AmAWuEXwVULVucwriPP9em+ez8=
X-Google-Smtp-Source: ADFU+vvmr5q0OOEvFpwogpGPH2Yy12Jt7Uqeh8fQH2kGqEa8LQskkrSPh9Hx6Q3D13gBP58mArOVQA==
X-Received: by 2002:a63:7a5a:: with SMTP id j26mr19134630pgn.447.1583802513598; 
 Mon, 09 Mar 2020 18:08:33 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id s126sm22864070pfb.143.2020.03.09.18.08.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Mar 2020 18:08:33 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 6/8] virtio/drm: rework virtio_fence_signaled
Date: Mon,  9 Mar 2020 18:08:16 -0700
Message-Id: <20200310010818.569-7-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310010818.569-1-gurchetansingh@chromium.org>
References: <20200310010818.569-1-gurchetansingh@chromium.org>
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
Cc: chadversary@chromium.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 kraxel@redhat.com, jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We signal the fences ourselves in virtio_gpu_fence_event_process,
shortly after we set last_fence_id. The window of time is small
enough such that it may be possible to return false in this optional
callback and rely on DMA_FENCE_FLAG_SIGNALED_BIT.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_fence.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index d63848178a58..a63a383347c4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -43,13 +43,10 @@ static const char *virtio_get_timeline_name(struct dma_fence *f)
 static bool virtio_fence_signaled(struct dma_fence *f)
 {
 	struct virtio_gpu_fence *fence = to_virtio_fence(f);
-
-	if (WARN_ON_ONCE(fence->f.seqno == 0))
-		/* leaked fence outside driver before completing
-		 * initialization with virtio_gpu_fence_emit */
-		return false;
-	if (atomic64_read(&fence->drv->last_fence_id) >= fence->f.seqno)
-		return true;
+	/* leaked fence outside driver before completing
+	 * initialization with virtio_gpu_fence_emit
+	 */
+	WARN_ON_ONCE(fence->fence_id == 0);
 	return false;
 }
 
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
