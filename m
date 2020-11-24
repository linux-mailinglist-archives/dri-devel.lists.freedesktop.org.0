Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D48562C1B61
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 03:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8766E1AA;
	Tue, 24 Nov 2020 02:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E926E1A7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 02:19:07 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id l17so5623676pgk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 18:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Bv13npSpfF2TWRCs41hxa8CIfpSwBxXtLVE6tC1RsQ=;
 b=WDQhoXPo+SH8cNLOwIzSIMIyRAT5bADFNZFcvg3+4Bhqp30VrjMwEAB1/65FLe9geh
 I/RTw91KAfU4OYzQExx2lZMfCOT/7Kg5co0Z9UuDLhrhQOB+wDiiCyvbKUBaR+mn2h/c
 lgkS8DaDIhPgFhLMuDk9LxOPOXgVMECB+NoyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Bv13npSpfF2TWRCs41hxa8CIfpSwBxXtLVE6tC1RsQ=;
 b=XmQEN2bfM20xqi4G8ux4vcRGC6XsfBaGt4NFjMYZljEWLHPxHeLaqusRzo6oUKCC1U
 e3B/7QNExzOj2hhXAjb4R04AdKYS3YXXMHMHD6x8kGrYRa04+51+IsbX8oDwbL3s5OGW
 Mas1cy9uQ2Z8OWoPQUAkmx91WsAAd7XjJdceB+5J1IYbm79WAzRMloJgmZ7FYyY5cNX8
 e4Bod/ujtYoC/JW+gXtagv5ViBPvH9xTEx0pCNwEgGSEHkfKxx+7Ni3AjJo27uyPJJgB
 7sP+1jxHbjDrAqz0Gxxs3Lg3pfTKtwnYrraFscI2NMrhE1bPKJRO3SSxz4TjVRcQHfUg
 Nquw==
X-Gm-Message-State: AOAM533epnu7tYjf5zeToulwUAiQb7iyncwaovSlhU0sLo+ew318FxkN
 DD2e21Pv8IhKBGFJpLm8scxDKFKoIK779A==
X-Google-Smtp-Source: ABdhPJwJCRok80IeNGPVKtG3DTNdc6dU+7k7HjdS4BF6r9QqSdWwo37g37idL5c9rtwkBimjVaAL5g==
X-Received: by 2002:a62:4e96:0:b029:198:1080:5bc6 with SMTP id
 c144-20020a624e960000b029019810805bc6mr2078050pfb.26.1606184346567; 
 Mon, 23 Nov 2020 18:19:06 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id o198sm6209642pfg.102.2020.11.23.18.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 18:19:06 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/virtio: rework virtio_fence_signaled
Date: Mon, 23 Nov 2020 18:19:01 -0800
Message-Id: <20201124021902.407-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201124021902.407-1-gurchetansingh@chromium.org>
References: <20201124021902.407-1-gurchetansingh@chromium.org>
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
Cc: anthoine.bourgeois@gmail.co, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtio_gpu_fence_event_process sets the last_fence_id and
subsequently calls dma_fence_signal_locked(..).

dma_fence_signal_locked(..) sets DMA_FENCE_FLAG_SIGNALED_BIT,
which is actually checked before &dma_fence_ops.(*signaled) is
called.

The check for last_fence_id is therefore a bit redundant, and
it will not be sufficient to check the last_fence_id for multiple
synchronization timelines.  Remove it.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_fence.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 586034c90587..b35fcd1d02d7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -42,14 +42,10 @@ static const char *virtio_gpu_get_timeline_name(struct dma_fence *f)
 
 static bool virtio_gpu_fence_signaled(struct dma_fence *f)
 {
-	struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);
-
-	if (WARN_ON_ONCE(fence->f.seqno == 0))
-		/* leaked fence outside driver before completing
-		 * initialization with virtio_gpu_fence_emit */
-		return false;
-	if (atomic64_read(&fence->drv->last_fence_id) >= fence->f.seqno)
-		return true;
+	/* leaked fence outside driver before completing
+	 * initialization with virtio_gpu_fence_emit.
+	 */
+	WARN_ON_ONCE(f->seqno == 0);
 	return false;
 }
 
-- 
2.29.2.454.gaff20da3a2-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
