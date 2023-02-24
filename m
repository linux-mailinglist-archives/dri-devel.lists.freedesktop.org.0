Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDED6A22B9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 21:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB3010ED04;
	Fri, 24 Feb 2023 20:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0F510ECFD;
 Fri, 24 Feb 2023 20:02:04 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id x34so263436pjj.0;
 Fri, 24 Feb 2023 12:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MohZmh6ZcfzJn1OmRfs/o8+oM4ZPKLi2FB+4LPpL34o=;
 b=gBGdyrytMMtai+cnotBNgRYWcmeJ847XewFJda51kAb8/nryk4VPWYeo6WnGeqr/ib
 Z38zXiOt2/PJaBNCvg4J8afTwkAatILSkWbllJFbchya9js70V1jArUtpb+vMbf/HJQz
 Piksuw8wgQW0HYiOiOjb3ZlarmynmgNYPnVZYSbh+DcSulVoaUJbM4Z1uMon2TM+hM/h
 XUuOhPtP8rFevkNUXLE0ul0iQJsF1f01tHxkpRaZKqPabY8u4JtExrgzG74Uk/xhu4y8
 YsaNjOjrBaQKRI1R46XA9Cj0cGHyVKwC80ge8zynfJ+/CN37pPfFjF7FwmHJO6fyS0xW
 bVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MohZmh6ZcfzJn1OmRfs/o8+oM4ZPKLi2FB+4LPpL34o=;
 b=3JjNDrtJX5w/d1nXKy0cibWudR3w8XC8sxIBKXlw4Q5xH5/ecUV+W6Y8HNbKo2GuF/
 HxP2AwEBNJUs6f4OQgGQtVHQHhYQe5ykR5Gy/hlzBriVI964GXk88H4a5fDxMSJ5j3Dt
 hmSar/11L8Wfyr09Csl6ImYNCoSMaFYjukCocPeIB2ZeH4p6AbXNHOrCR8WzN5zn1dBa
 ODOSx9wIYdg2be6ShEZOMd9K7EkqFAUNV1dKzfPGUVeRov2MACv8zQ9HRdVKRYC2iNK4
 uAumntSkU1m4E2rTfmevNi0sVCZn0DObZh6ZFz9XD74lwZzyJmlSgbIkFn2O2E7ee+3v
 TkDg==
X-Gm-Message-State: AO0yUKWfOy6h39CyZc6/ex5RaorwANZ1sDeoPQhTO5vy5LGeQdGIPdS3
 T389WaQfFXW0pdn/yAOHnK+ixvvSUE0=
X-Google-Smtp-Source: AK7set/Kb1gXpnZFU2Ydyaifih98zDZ6wbcQF//PkQ/+Dlh0wE5fq6Lk5cn+4EktKB1GNubNLYLuDw==
X-Received: by 2002:a17:902:d4ce:b0:19a:b6bf:1e16 with SMTP id
 o14-20020a170902d4ce00b0019ab6bf1e16mr19838114plg.51.1677268923860; 
 Fri, 24 Feb 2023 12:02:03 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 iy15-20020a170903130f00b0019cb131b8a5sm4769703plb.32.2023.02.24.12.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 12:02:03 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 02/15] dma-buf/fence-array: Add fence deadline support
Date: Fri, 24 Feb 2023 12:01:30 -0800
Message-Id: <20230224200155.2510320-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224200155.2510320-1-robdclark@gmail.com>
References: <20230224200155.2510320-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Propagate the deadline to all the fences in the array.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 5c8a7084577b..9b3ce8948351 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -123,12 +123,23 @@ static void dma_fence_array_release(struct dma_fence *fence)
 	dma_fence_free(fence);
 }
 
+static void dma_fence_array_set_deadline(struct dma_fence *fence,
+					 ktime_t deadline)
+{
+	struct dma_fence_array *array = to_dma_fence_array(fence);
+	unsigned i;
+
+	for (i = 0; i < array->num_fences; ++i)
+		dma_fence_set_deadline(array->fences[i], deadline);
+}
+
 const struct dma_fence_ops dma_fence_array_ops = {
 	.get_driver_name = dma_fence_array_get_driver_name,
 	.get_timeline_name = dma_fence_array_get_timeline_name,
 	.enable_signaling = dma_fence_array_enable_signaling,
 	.signaled = dma_fence_array_signaled,
 	.release = dma_fence_array_release,
+	.set_deadline = dma_fence_array_set_deadline,
 };
 EXPORT_SYMBOL(dma_fence_array_ops);
 
-- 
2.39.1

