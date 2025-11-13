Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44C6C580B7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA5110E835;
	Thu, 13 Nov 2025 14:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XfAho2e/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CF210E823
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:53:37 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b728a43e410so138889666b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763045615; x=1763650415; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RPR3UfrNYxFDjh6mqln5EMxB6otbdQrc1I1BewMqrEE=;
 b=XfAho2e/nX+bRY8iMN4A4VOZcFlVc8Jfnt2m9ROi3WNuU12aWNImah5pquy0k3jHW0
 oZoip1NdEHaYKrUcnZf7Vz5s1eJ34hnJaWxWKTGtvjtrG4MZN9iYo8lW6IKDaBon1dVC
 vtEY/M/PdeloeAMClHQewjHmgrmQQYGwYx5I3xoIcyVm6AxZA0Ux6C++IyuD9sJZ81mS
 e8rhO+eP2aCbqUyPUuBX9+5mjKEdiUbpuKFLCHrzuLgy+PPfwkEiYJBlRyYlEj0MRlxl
 Y1k2wyjpuL9kHRLotQAsTA1HvPgHmNZ2auP833xEJmqwme5Y60Tx4Ox4rvL6l4fzTSV6
 W1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045615; x=1763650415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RPR3UfrNYxFDjh6mqln5EMxB6otbdQrc1I1BewMqrEE=;
 b=sC1OTXPg8JB4h3kxy5tBZqkSsKcq+TKbJHbXPflXJAvgI6dSufU6oezTtpdjl0xCin
 68KrAiBD+mQXfcZIenPaWGDvwsu9W0haHRA5V8/Jbym3qqiCUEz6DUsrk72edjOsvEM4
 Zi+zw3FHwmXyqpitUq7ftMMp35js4vxM9KJ1UPF0jB1lLTRmCCWAfBXVfwe6F5I5mO6I
 CcjDgGQy/T4hdu66AUmDsWQ5UjZeNzXBuM2DmV1cIkzWEVSvUbbFpKn84JtX5mVPxuCW
 5UOd12nP+sPePBOCeh7moioq2NZSE4ASISu9vhxMF3jgDKT/kM188dstNXRWBfUsP9Hk
 hl1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9VTLrSvNPTl1o+foBA1mJwsW24Lh5eWQb8gwmXftYJrtrbdfTLE3i2mv8yOd3Mc0cxi1IUPNtW2g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkzSHPRxVM0n7XXC62lmzmmQsDmOytKG5AOZIbV5EwvvVro5YN
 X64BsZHllULRK7afEo+KYBr4q6fYyrCSGNkfhTjUvEuzgkQUf26t7hKJ
X-Gm-Gg: ASbGnct2qR6Db6nsX4haZS4uxyvYwQG3exrTnyheMrueH73pJphwF/kJ6m0hnzew9hG
 bfB8K9XroIRKvSEuBCOW5w5zGkHaN/WZo4UyZB5ZA8qyXJkJIcy03zU5cAY35d/iRPHNdaFnit5
 +EDnqstNWQKJ3uv9ELQrx8uRhiacJFNUhOOeR/4XY5Mw2PoydhWwevoVQ5ijv7H4urIr/LgKhHH
 SkduTErDlCvQxdy/WWWRAwPOAxwCOyJTHP2JDZWB/C5JKwjo7h9sp/RN29phJwf6gn65RhE7nUN
 YxOEpfc77WJCYx2VN3D//J/4g0/uj21bggL+dhb4FYp1bphWnCsoj2Eb/JQmnMjm4stnO/LAl8B
 nMlz8jUkJ99xfSzqqbX0uzoyZfMMa4978KlM7fkiIzPkVMHawBwXBsT7fiaIS2tm1KCMTHNyrrP
 ifRomdUqfo2qkjbzdrJ0S7eA==
X-Google-Smtp-Source: AGHT+IH3EaxLSnCv9gLMHoWsafC+66G7Zf4PqH9YrKbECxXDf49gDk8XCoLQwGvA4IfFvykHWqo2Nw==
X-Received: by 2002:a17:907:60d1:b0:b73:21af:c0e7 with SMTP id
 a640c23a62f3a-b7331af147bmr800895766b.53.1763045615330; 
 Thu, 13 Nov 2025 06:53:35 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15aa:c600:cef:d94:436c:abc5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm173747166b.1.2025.11.13.06.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:53:34 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Subject: [PATCH 01/18] dma-buf: cleanup dma_fence_describe v3
Date: Thu, 13 Nov 2025 15:51:38 +0100
Message-ID: <20251113145332.16805-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113145332.16805-1-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver and timeline name are meaningless for signaled fences.

Drop them and also print the context number.

v2: avoid the calls when the BO is already signaled.
v3: use same format as trace points for context and seqno.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index c5d1478b28dd..b4f5c8635276 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -997,19 +997,21 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
  */
 void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
 {
-	const char __rcu *timeline;
-	const char __rcu *driver;
+	const char __rcu *timeline = "";
+	const char __rcu *driver = "";
+	const char *signaled = "";
 
 	rcu_read_lock();
 
-	timeline = dma_fence_timeline_name(fence);
-	driver = dma_fence_driver_name(fence);
+	if (!dma_fence_is_signaled(fence)) {
+		timeline = dma_fence_timeline_name(fence);
+		driver = dma_fence_driver_name(fence);
+		signaled = "un";
+	}
 
-	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
-		   rcu_dereference(driver),
-		   rcu_dereference(timeline),
-		   fence->seqno,
-		   dma_fence_is_signaled(fence) ? "" : "un");
+	seq_printf(seq, "%llu:%llu %s %s %ssignalled\n",
+		   fence->context, fence->seqno, timeline, driver,
+		   signaled);
 
 	rcu_read_unlock();
 }
-- 
2.43.0

