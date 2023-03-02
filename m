Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADFD6A8D74
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 00:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA5310E5AF;
	Thu,  2 Mar 2023 23:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9698410E5AC;
 Thu,  2 Mar 2023 23:54:03 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id a9so952464plh.11;
 Thu, 02 Mar 2023 15:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677801243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MohZmh6ZcfzJn1OmRfs/o8+oM4ZPKLi2FB+4LPpL34o=;
 b=NgK5QtszZ34lTuRCDFR83nPJyn+DB4rxTP0xE2Tk42ck5MrS8xMf8+Res005BFWuUk
 OiuxWxoPYxy985tYupfANAIrsky/jHuQ0bpw0XrNrep1WFn2j77wuC2WfXhWBQrMh2KG
 evUciIFKtkiC5/Hmp/8FmBzb9+e5Vo7L6cnn6JIueIthHxAVhn335lRK8rGh5mGIius4
 Wa8k5qiZYL/4YmTU7abiVzfN5/DUGErsbDi1RVQ8/Tenm/Tt8tNy7WPC+INzuVg/caoS
 m+ubGaCAgoPAqn+oSkkBszkky6JbiZxyGBXxNkFY9Ckw1BDh1V34yYFBDyAdvi6yg4k8
 BRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677801243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MohZmh6ZcfzJn1OmRfs/o8+oM4ZPKLi2FB+4LPpL34o=;
 b=bSKNJiYWJTNzMr6vfqAmxgSjqbD1YQbVm6+dOYYeKIcgTrjyDH7OSHAM1yv9w7L/kt
 XpKj0T4Z6aitx8QvJcZRA2EkXIPwYtQoFZ5hnXJMJbSvYzhW9zixAwfQW4uBnb5cYr79
 aVxbXoDomCgKAkWmZaZ4RvPBqusx+KsKGyTN1OxZA5NXWBdh+OxlR+PLyYgKCCO4tOuK
 b+/i3vGg+4HPTmszMCLR8KViuB1xVlpMjMpPkb9R5BsjxEP695e/HhNK6gjsVpm0R7Zu
 pCXUeZj09tpjUIrkmOnR+D1UkIrKD3Df7RsaV5MCu1rzcchyRWjfBUulmqzlnVlBAbj2
 y6zg==
X-Gm-Message-State: AO0yUKVfypCAVV4n51nVz82pYln+/B+prw1rRLdkdC5fM61NBEywO1H8
 XB385gfgZO0Fo7g/vg1Z2Ys2FGGnfwk=
X-Google-Smtp-Source: AK7set/jeW66C3SIqgDS1jGcRzwkcvjfPVt1xDGPtA139q1orfwZ9smn/0e+p7xdiCiKqaxbrcx5WA==
X-Received: by 2002:a05:6a20:12c3:b0:c7:40f8:73d3 with SMTP id
 v3-20020a056a2012c300b000c740f873d3mr261340pzg.33.1677801242601; 
 Thu, 02 Mar 2023 15:54:02 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 35-20020a631763000000b004ecd14297f2sm227996pgx.10.2023.03.02.15.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 15:54:02 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 02/15] dma-buf/fence-array: Add fence deadline support
Date: Thu,  2 Mar 2023 15:53:24 -0800
Message-Id: <20230302235356.3148279-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302235356.3148279-1-robdclark@gmail.com>
References: <20230302235356.3148279-1-robdclark@gmail.com>
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

