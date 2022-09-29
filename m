Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B737A5EFC97
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D782D10EBBE;
	Thu, 29 Sep 2022 18:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809C410EBBC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 18:01:56 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id l14so4385009eja.7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 11:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=vKrojTcjZlq5ovm1PnlomIL4uPYCEBj7pdWzDdAXuVU=;
 b=S0Ve7O5awQLtxuoHxPScZBKhG0jjkU1ylWU2jel947LK4gh1H/Z8R9mBq0lH7db2+r
 SHYOF25ofWveZuZK+KSB4jZWtMFinIjwXQNQmfHH2VChGOO8SZdBTPI9XgDo0d+hYvbv
 bqwnq9QXiLMRmzL1hJCOIdyFBo6XV0Fw2V9/T+QqNoKTbqalP+JpBlgZxOw2D0ZWG2/Y
 2UyaX7cNr4sGhRpafxDZD4pNGhWlzBv2ig+dY7WFey70nCg60VerGJ5bd6G0wcHsDh/D
 LYBV7xrMdWKdIvN6LEXPVFr7U8/nD9zn9n1R1dGE57/kmONCsbQZnE/DSQCxtwSIGnIW
 4Z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=vKrojTcjZlq5ovm1PnlomIL4uPYCEBj7pdWzDdAXuVU=;
 b=BACtf9h23jTp9ZIymaULVGPHasTnoHw81nzSWi3YYGvxeTtvsM8D5MpTdS8NcWsMO9
 4hnw59AZKYddXnbRlchCL05wwkNnwe6ZUrnJ8BtgC/YcVZVCAWIMy8KoTTI0AKx4H4Lw
 KGfuUcFyzjtWzHmiQiG3rlrUdV2Hgzv6NqT4Bbdug9N2GsNme1j74v4nGryAmXUnNmEf
 gnDuujAaWipeo/EbtGrg7PAVGfNPCqrh9Iqx2ChLO1zo2IrMh8c+7RxFZOPCcdwEofNi
 kAHzDBk61Y6Q3H8HKRj62aiJeNkdsjJ/48XXo1zDboMVXIpBD/a3V6soZmgEhqeKHC8/
 PDTQ==
X-Gm-Message-State: ACrzQf3YvpnfO7ZLUYrIP8nI2615IgjpBk+GmcJgAEVi3N9W97J/18KW
 sLeNap+lbPxT+czZyIFBEPk=
X-Google-Smtp-Source: AMsMyM4agEK4P11sLpEk4lMriKcGrbDCr33apCs3G+q+igvP8lryJyJAolio04D6h/ynis34LI8YVQ==
X-Received: by 2002:a17:907:2c41:b0:787:6d66:b593 with SMTP id
 hf1-20020a1709072c4100b007876d66b593mr3761357ejc.401.1664474514662; 
 Thu, 29 Sep 2022 11:01:54 -0700 (PDT)
Received: from able.fritz.box (p4fc20ebf.dip0.t-ipconnect.de. [79.194.14.191])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a1709061da100b0078194737761sm4255257ejh.124.2022.09.29.11.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 11:01:54 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: steven.price@arm.com, andrey.grodzovsky@amd.com,
 Arunpravin.PaneerSelvam@amd.com, luben.tuikov@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/sched: add missing NULL check in
 drm_sched_get_cleanup_job
Date: Thu, 29 Sep 2022 20:01:51 +0200
Message-Id: <20220929180151.139751-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929180151.139751-1-christian.koenig@amd.com>
References: <20220929180151.139751-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Otherwise we would crash if the job is not resubmitted.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 4f2395d1a791..23e5e8275dc7 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -829,7 +829,8 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
 
-	if (job && dma_fence_is_signaled(job->s_fence->parent)) {
+	if (job && (!job->s_fence->parent ||
+		    dma_fence_is_signaled(job->s_fence->parent))) {
 		/* remove job from pending_list */
 		list_del_init(&job->list);
 
-- 
2.25.1

