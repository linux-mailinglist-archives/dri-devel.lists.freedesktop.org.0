Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B626A4B00
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 20:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0E610E3D3;
	Mon, 27 Feb 2023 19:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960CD10E1E5;
 Mon, 27 Feb 2023 19:35:53 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id i10so7899760plr.9;
 Mon, 27 Feb 2023 11:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MohZmh6ZcfzJn1OmRfs/o8+oM4ZPKLi2FB+4LPpL34o=;
 b=X/q1O+ZjV77fFoFmlutTEvpBGJueKF62goh9oezUzKs0YuCwyml4JbObsSCKbJT7JJ
 Ui2mwUw8xWQ5zAfkS8BdHCASqtnYmQkZXr/bJed/zVD5wE9mniBdhWRVLkle/VxdlecU
 EYBRwij8IxedCpNP6P8fBKe0OxTQeT6uksuCmf1kLP2B0/+VLWcxVR3r9hf9HstT29wZ
 NRbPkx+hAiOd2Ot9e6+DDrHanEKhBYQjZqGn7kUviCnLWtHhYm8bUrnS+Nyr9cHEFBRD
 L00cCCQln0V7zr854vwSpgsMzu6N3GTblVnUK03+zodB8MxhMlB0d5BP1fJZFRj+eSqq
 l76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MohZmh6ZcfzJn1OmRfs/o8+oM4ZPKLi2FB+4LPpL34o=;
 b=TF8mFNAyZbFqLvdwLBpkrEQoUI7riWwX5+8XPrKBEWzZUu1PX/fnfV3IPsmKYv1m9q
 yFwOlcLguOJjbBFXYE8b3CeETYo/hhHts4kI8tU6G87LwpbxvLSU/bG1aUV7QQwRieoe
 FjdC3pVdtHxQ+iHJPrBo88E2h+XeObMWVLRRkIpvOQZOlcrleNgyqNsFyX7NeVgPrgHE
 tQbZxVt1fVF0u4NmWZBeNn9Wq5aIOXAIOyVMnsVToyxEmhMYco574hDKmFHND0N8n2ug
 N74OjFu7GlM09JoW0xKAXj+iuup2mBf08nrt6h4rQ3le7EARgcw/XPeR2FwDY3JtbzkF
 Jk+w==
X-Gm-Message-State: AO0yUKUBeaQH4vmmzrIPnDJQ80gJVcBDxl1xCq3RABTxSc1VthyfOqKw
 s2iZ5rgXx5hfg6BmHkoZQsEtjBux4ko=
X-Google-Smtp-Source: AK7set9N4lsFjy2RVODKG+NOcQZxVca6+ZqrLKo0+d5nuJz3ER974n1Njl6HYvE9R2QPaFG+ddOexA==
X-Received: by 2002:a05:6a20:12ce:b0:cc:1996:9828 with SMTP id
 v14-20020a056a2012ce00b000cc19969828mr538145pzg.34.1677526552835; 
 Mon, 27 Feb 2023 11:35:52 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a656109000000b004d4547cc0f7sm4322113pgu.18.2023.02.27.11.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 11:35:52 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 02/15] dma-buf/fence-array: Add fence deadline support
Date: Mon, 27 Feb 2023 11:35:08 -0800
Message-Id: <20230227193535.2822389-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227193535.2822389-1-robdclark@gmail.com>
References: <20230227193535.2822389-1-robdclark@gmail.com>
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

