Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C15769BC23
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 22:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AE310E245;
	Sat, 18 Feb 2023 21:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87DD10E009;
 Sat, 18 Feb 2023 21:15:51 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id d4so1457677pjc.5;
 Sat, 18 Feb 2023 13:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MohZmh6ZcfzJn1OmRfs/o8+oM4ZPKLi2FB+4LPpL34o=;
 b=JKPBLpJuYtLP9cldFiCcQBESYKJDPCCdxK2p8Ufr/e7ac14X4XAWa/I6jS0fPcj37e
 mhzcsytchZq64j98/Us4f7wzBg+VXTi9kp+Pj/z+xtBTZuKHhnwMzlDgvm0NGFuD54vP
 mmQswfaDmO6rYjuZSDKBgBjdq0vsXkie19jhYNv5i1BGWHBWM7NX/4ETw6yeOF7xB3GN
 FrwTqOjuiorsAywFwh1DQOYvaS+co3s4W2mzUtcHg0bSQVy1W3TUeSCSkuPmMlttZ+Wr
 hHNWbwf4g+DyHKjq/TFRzJ377BMMdS4VH1igUJ9gBhzQOBjfsepQgOj3FLty/WL/fu7f
 v+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MohZmh6ZcfzJn1OmRfs/o8+oM4ZPKLi2FB+4LPpL34o=;
 b=XlLlc3+Cf1ld39ARMGseZlVuUWHGE5Zt8MIKaH3jT/g0JJ+cBdqZGgPUgUyMi2WYAk
 3JjTfMq5ThAbVeQfwpNtslI/3W9uiMs+o7rsYbiMpc5CzYZDdcy6GgZO700H2TLvzvgw
 MxHMOZIStibdP/VT8hgcJ2gmKQ0KoTeN6jdX4qB/uuWPyg3oYdjGxRlAILWWGTjX4+P0
 LIwzmTUxhswZP89epNimEqYoKRwnJV+BOaedI1WGoMMKWUfWBVUjBytwHTw65Kj7qCV7
 sTjr1V4GjNoywv2rsPsR96aNVuQRlZOyIIsJbRZSMIJzsRvXeVBfQGrlbge/TJkeybMU
 jEAw==
X-Gm-Message-State: AO0yUKUim0HzYW7LUvZ9Mep+Y6U1bnj0fIMxtsbEyOqM20ybFDNLfYO8
 yZce+IzOpaofj08FM2v5ipXzkt+MgmE=
X-Google-Smtp-Source: AK7set+pq4QfLfFdfKgM6Wa+2NuPdUfpQy5kKDnaTLTht3wfRp9ww2c0n1JEFd40cSQfgefDzy4Kyw==
X-Received: by 2002:a17:902:8601:b0:199:e58a:61c2 with SMTP id
 f1-20020a170902860100b00199e58a61c2mr4201310plo.29.1676754951096; 
 Sat, 18 Feb 2023 13:15:51 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a170902ea9100b0019a6cce2060sm5104473plb.57.2023.02.18.13.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 13:15:50 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 02/14] dma-buf/fence-array: Add fence deadline support
Date: Sat, 18 Feb 2023 13:15:45 -0800
Message-Id: <20230218211608.1630586-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230218211608.1630586-1-robdclark@gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
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
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
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

