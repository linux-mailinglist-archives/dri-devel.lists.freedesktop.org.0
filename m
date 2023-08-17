Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0F77FFF9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 23:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CDB10E03D;
	Thu, 17 Aug 2023 21:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720A810E03D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 21:37:37 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1bdc8081147so10072595ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 14:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692308256; x=1692913056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VfBSoWR2VMdVe94DeOrM4dJxlWeWi9hCbvQq6BP8leQ=;
 b=ooeNolDTQvVzWf2zo5DcjLo0zaFOj4KtaIyw06AM53glPonl3hUVxydutbt3d/H9CJ
 f+vxbqJFtntaTuU4CzGcyIYDH9p+VwmFwMTTTDvjtS8v5FbxAJqMTczSApyRPW16HBnp
 RgMFZYVwwgdE6AO9PSpytdCh18VA2I/IVKdcX5EppaTF1O3Gu0nWlFyyNFNca/eZFLyi
 pw/BmMOH3uysAn/ltjoXjbR7KJj9xe5slf5Wxb2Kkz6WlRT0xqHOdaHRTdzYjQDoLdBV
 /pMO4wLh9pQn/bQ77zyhrLPhMVAxCodJoQT6zkN1h0AtseHP4mU35GIY4zCkeM2kIhXt
 ig1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692308256; x=1692913056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VfBSoWR2VMdVe94DeOrM4dJxlWeWi9hCbvQq6BP8leQ=;
 b=ApEuNrgm21IjjemGM1+x1QI7KBqgAWALfpsFiNyET6DYKeqebtuohqIh40T91Pv03N
 pAVrAcxWzEsMQRlKnOQXCpczd+3CWfREbmQb8J3T1Wp99a8ZdBYDGZIUPTCZu0sbb/WU
 FuUzVvjTmM57G+jqQzZC8E46P44hXWQ6ECYBHnNlgzEQRwX9wq3QxHXR/TAL4fyVymZ5
 OtBZ1cw9gCQSv2FU2/nhf8O2PpofOUh7B1FTJZWkHm5tDnbYZbDgYQFZlU9c0nB2YFOS
 bsLvEOJXiWokGX04Gem8U3GSpy2sCm7jVBibtJ8SVGfislYtZ+vTab3XGUc6OLhi+iqJ
 LLjw==
X-Gm-Message-State: AOJu0YxPKQIy0Ly8yQv1x0N+TExPQUK9Z1aKeqrKkqmUtwJqCSIdhyN1
 rMwfjEvpWn3iilCLFV7XulnIG2MiJgY=
X-Google-Smtp-Source: AGHT+IGhCNZ1M6WxLRZDhHgvhRaLi1UoeCIe3iYoAIHvyaW8/IAW6HFIhufDJb+oEn3k4h34lVliew==
X-Received: by 2002:a17:903:44e:b0:1bc:210d:6365 with SMTP id
 iw14-20020a170903044e00b001bc210d6365mr715384plb.2.1692308256327; 
 Thu, 17 Aug 2023 14:37:36 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a17090341d200b001b9d95945afsm232379ple.155.2023.08.17.14.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 14:37:35 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf/sw_sync: Avoid recursive lock during fence signal
Date: Thu, 17 Aug 2023 14:37:28 -0700
Message-ID: <20230817213729.110087-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
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
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If a signal callback releases the sw_sync fence, that will trigger a
deadlock as the timeline_fence_release recurses onto the fence->lock
(used both for signaling and the the timeline tree).

To avoid that, temporarily hold an extra reference to the signalled
fences until after we drop the lock.

(This is an alternative implementation of https://patchwork.kernel.org/patch/11664717/
which avoids some potential UAF issues with the original patch.)

Reported-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Fixes: d3c6dd1fb30d ("dma-buf/sw_sync: Synchronize signal vs syncpt free")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/sw_sync.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 63f0aeb66db6..ceb6a0408624 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -191,6 +191,7 @@ static const struct dma_fence_ops timeline_fence_ops = {
  */
 static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
 {
+	LIST_HEAD(signalled);
 	struct sync_pt *pt, *next;
 
 	trace_sync_timeline(obj);
@@ -203,9 +204,13 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
 		if (!timeline_fence_signaled(&pt->base))
 			break;
 
+		dma_fence_get(&pt->base);
+
 		list_del_init(&pt->link);
 		rb_erase(&pt->node, &obj->pt_tree);
 
+		list_add_tail(&pt->link, &signalled);
+
 		/*
 		 * A signal callback may release the last reference to this
 		 * fence, causing it to be freed. That operation has to be
@@ -218,6 +223,11 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
 	}
 
 	spin_unlock_irq(&obj->lock);
+
+	list_for_each_entry_safe(pt, next, &signalled, link) {
+		list_del(&pt->link);
+		dma_fence_put(&pt->base);
+	}
 }
 
 /**
-- 
2.41.0

