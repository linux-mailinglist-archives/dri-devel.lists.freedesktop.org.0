Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C8DD3C654
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69D010E5BD;
	Tue, 20 Jan 2026 10:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZBVSSPIR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E8110E5B7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:57:06 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4801d7c72a5so26840865e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 02:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768906625; x=1769511425; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Gle1rSCrgOdmOiKTLZAKAartjs2E9YbHLm7AYnBWog=;
 b=ZBVSSPIRbl3tXMWEFgpzrAGYDUjr8WYfbLyC9SSyXSCmh/T6yKpL76B2regekuXv2L
 oqJ3bXfglUMsHZlLeNnU/fW7Js6IupGQmXVK7UFvOLZnCmR2nxCPzfFABHXiRJynTYQ8
 GMIQCbErsflbU38+YZ2RO4qcGjcohiaXFjxTxzMn1IoE+cNgUu4rWaluwzNPfpZdf31I
 MKRMLSXvSR+fRKRqi4FJtcHp+nlMvtKcc+dyBeDYpf0E5JqzDyows1i2rZPfHVETruOq
 ws/LW0jxWmYaKZIicD2Br7mlyOPdNiy5CUfY+alfIqxJ8PZ00H89vVPYh85s24i5TPsZ
 9Ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768906625; x=1769511425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8Gle1rSCrgOdmOiKTLZAKAartjs2E9YbHLm7AYnBWog=;
 b=np3+H/Df2zWJIKPW4tK/X+MrdbcO0SuwQUzswM5JsK004VGsdWjXbNu4tj60oxzETb
 VF4bIoQ5XanR5/uAukxrppC2BUB8Tx7Vf+qoK/rJz3ARtAPZYXqyjjLUgwr23JCC/Pzm
 5Rtp5I17yxi8pQ6AHNqUkDMe2RSsC6yd+gnvAOSl3f8X6Wy8I+hbZMZpRtGEDi6RzSfX
 7a2tPaZgigD5OfvznjyphB2DPKdlvBZX/0GJKY/A82XFGLV3lkLJoV4z+xDFFALKTRKl
 U8KecCQ0QiXlyVkO4KXVe6r4aeknaHqLHY4AdOyUd2vfySnZilhWb9Du0mObdEU5lzn4
 hCVg==
X-Gm-Message-State: AOJu0YxMF5PpJZuaHbvMe1WyJaF35AyxpSfQwO+seSim6rqcd4zu3Qkq
 4E6UL3xfk5MYd04nrq9/Q2f6GrNlNnfUbFP1EHyovSYQOOgfOtpci/qI
X-Gm-Gg: AY/fxX59BMlXrZBYoPlUrO+z8/6thYQMvepKcRsq1VCwwrDooyuRaRZKZNhJ1ia/pn9
 3Dxn77M29RIxEhYM18TP+JjIti84VRmTHGB0CWc+aIDwLjG1T22CN8T2H+Ju8Mio83LkMSRxS1v
 yrr2LqHfH8vjjwsyXUhk9PhAOWj0DD1dGPMU/o9idpHfQVgs5hA6x7MhCazGbvQJ2OIs4nJ6nS2
 rZSRWNg8uEQqGaq6viVQDyROyJ1kaPE/O7kTIHR4tETTR+Xi5x+3I8/5CVx79NEl0jyyiZomoZX
 4kQ7bB2+aIH6BiBCY48mSVq8D86y09PjWOqid0Sd6aYCXHptPGsdP5xcLjOd3eswIFThL+dVyjm
 bwTTiDv4S2pz1ssTbvYcbNNisKioFUL1ki7qrgOgg8/Wbj/rYccFTbXq9Wy0gDQPcN/RgA+gRhW
 bKXDMBso491CJBJiGky3O2e7XS5k/Tw2gAq8A=
X-Received: by 2002:a05:600c:a009:b0:475:dd9a:f791 with SMTP id
 5b1f17b1804b1-4801eb0ef0bmr149442675e9.28.1768906625125; 
 Tue, 20 Jan 2026 02:57:05 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1563:d000:1067:f6c4:3bf8:ea8a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fe67780sm99418105e9.16.2026.01.20.02.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 02:57:04 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 8/9] dma-buf: use inline lock for the dma-fence-array
Date: Tue, 20 Jan 2026 11:54:47 +0100
Message-ID: <20260120105655.7134-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120105655.7134-1-christian.koenig@amd.com>
References: <20260120105655.7134-1-christian.koenig@amd.com>
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

Using the inline lock is now the recommended way for dma_fence
implementations.

So use this approach for the framework's internal fences as well.

Also saves about 4 bytes for the external spinlock.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/dma-fence-array.c | 5 ++---
 include/linux/dma-fence-array.h   | 1 -
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 6657d4b30af9..c2119a8049fe 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -204,9 +204,8 @@ void dma_fence_array_init(struct dma_fence_array *array,
 
 	array->num_fences = num_fences;
 
-	spin_lock_init(&array->lock);
-	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
-		       context, seqno);
+	dma_fence_init(&array->base, &dma_fence_array_ops, NULL, context,
+		       seqno);
 	init_irq_work(&array->work, irq_dma_fence_array_work);
 
 	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 079b3dec0a16..370b3d2bba37 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -38,7 +38,6 @@ struct dma_fence_array_cb {
 struct dma_fence_array {
 	struct dma_fence base;
 
-	spinlock_t lock;
 	unsigned num_fences;
 	atomic_t num_pending;
 	struct dma_fence **fences;
-- 
2.43.0

