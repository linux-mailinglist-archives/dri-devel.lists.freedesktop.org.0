Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BE86F05BC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 14:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8F910E1BD;
	Thu, 27 Apr 2023 12:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E6A10E1BD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 12:27:31 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-94f4b911570so1317143266b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 05:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682598449; x=1685190449;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XcXkQ35VzuXmktFSlr3XbBQskfJ38OEp7gZXdpTt2tY=;
 b=j6uq3kVXW2gmh9hfEYbfBajlfYv7aRAAgKPlnvGWyqN8KhVWmrvKPPSN+gSX2YzCLn
 RsUAiGP0Fu8jfBSVHEPrXrQlFZU4+87hajNxZRTG5grkJbGc0jryfFiGvXGbIi8qXoDR
 tTi6Xq/ZGYUjebdavcqyeli9+ObS0Gbw45sKbEWxhzcSb7v/y8PoPll9xoDXV2JIZTxP
 2sJLBjxL8HtA/agup9f6eLh9badzjQOLmMz1CH/FLHyV/VLXM5zCMLhRplTi7Tc6Pb6f
 gKHXMZ8T2o9WapoIJXYEH8OUBGaxiO98ERaXpu4uzVIhCLdMqZQlAHb0dei00bUU5SsN
 yLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682598449; x=1685190449;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XcXkQ35VzuXmktFSlr3XbBQskfJ38OEp7gZXdpTt2tY=;
 b=CR4SkCEkUHSbJkralnYb+/PRfJnowf1qNavw/Oj7FUIQ64PQx6mtc8M1RHOl9vNjHg
 QPXn44ZmmoeT0DLjjYz6ijhjAgnwhj5QkZChv8/q+bGdjFeYWnyq814Zod9NK9DTKl54
 nRyelvPux5jNC97Tnvg0QPdvi5jlm9bSHYgWRYCuIkwyGPaiZLS+7vNU6c5JQgyv02hy
 HqlkBYPktizL4N6x4WGAyYBrF+DTzkyPfTB817t6ySRtgdMO+9HzkjxGSuQzClq3LKnK
 Ozav41AtYH8/7iMBrE51Wyt2PrMBR5lpm5GbVRbSv1WzCyG5+ceNGXKtale8XFIGeCWR
 BxzA==
X-Gm-Message-State: AC+VfDy6pdogc+ceZuk2lsLQRUqSHeagHwL4SYH2PPhRGW28+yNX3Pyk
 hVmlaAVdBOlezfxDcmWT+kMdQtB0ou8=
X-Google-Smtp-Source: ACHHUZ6HnzDdvEB9MK8EIIhEqyLXlCL2ElHiNEswztvbsWAR4iNFg/4RBOn7TLNTPhd4j+Qr6dkaBw==
X-Received: by 2002:a17:907:94ca:b0:957:7551:38c0 with SMTP id
 dn10-20020a17090794ca00b00957755138c0mr1574286ejc.7.1682598449159; 
 Thu, 27 Apr 2023 05:27:29 -0700 (PDT)
Received: from EliteBook.fritz.box (p4fc2092b.dip0.t-ipconnect.de.
 [79.194.9.43]) by smtp.gmail.com with ESMTPSA id
 28-20020a170906225c00b0094ee88207d5sm9516642ejr.191.2023.04.27.05.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 05:27:28 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/scheduler: mark jobs without fence as canceled
Date: Thu, 27 Apr 2023 14:27:26 +0200
Message-Id: <20230427122726.1290170-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

When no hw fence is provided for a job that means that the job didn't executed.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7849e2d7780e..b09cdacfd062 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -542,7 +542,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
 					  r);
 		} else
-			drm_sched_job_done(s_job, 0);
+			drm_sched_job_done(s_job, -ECANCELED);
 	}
 
 	if (full_recovery) {
-- 
2.34.1

