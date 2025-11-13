Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA13C580BD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6628B10E838;
	Thu, 13 Nov 2025 14:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="blCMidlA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539D510E836
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:53:40 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b73545723ebso124990166b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763045619; x=1763650419; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Kf5nUbmsJlQk2pLkhNRD+8n7Z/+gOPuUpYrxnOVZvxo=;
 b=blCMidlAFfD93KPu1pe7sRP3lf9ciC9imE3fZ/qCyWRImD9xHtUmFmKThPvJLLsypQ
 frQvScSpcX94A1fNrKpzZ1+6RoV/0hQrKF4XWFdc+tgAxPnpvKVx36YvaWZt940XJNvi
 o/st+m9f3iW1lECmrrCVkeplTSvTAIO6tWorA8qcJirJaoEopG5uu7ZWES1aSX0D9Cn3
 gVVmaPRoh4iZn35IfumwUG6x4fszL1ekt8GjW2juZrTKNXiOzdUQtFmeZS9BrELNW9Zj
 1Yhd8ZWl7q9Eie0VmQ9ict7n3nXNv4AkJUdtKmQokYs3OtBpYt8aWmropXT8EFmqZTJb
 GoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045619; x=1763650419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Kf5nUbmsJlQk2pLkhNRD+8n7Z/+gOPuUpYrxnOVZvxo=;
 b=nT1YXYIaPPQZTwJEO++BGiVyb8BNtlv98iKs/Z15SObDjJWasIhQD5SDsWzx7D6cPD
 XM5/TubXFRqtpR9+9SGogekPZXQw08N5nQ1iuJWF6/b/GLOuB5qys3UAqm6c+aDeB69w
 cjs7y/B8pTQj8D12Pd5jEwOXGitMD6WHmTkm/H5qGx78KvjcL5LSdyvC9UQL3s2+o81L
 Rba9k1/2sLqIG4jZE2U1b++o3k+43PJ2bNaOx7gJg10x85q7+WyW+KrpwbleQhDoF9+N
 59WGUn3rY0tQItilwcLwfX4KXMNcs7k5oDxaEzRyxB559d8O5E3mkgEZAZ1SvqzpZe+K
 cPAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZrX9OT8B7fAk86I5/DnRFp8B6bgJJTBhnHXzAlG1dWBePEWBQezdi588XUpTB8sMdAVYZ0saUQZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+yTQEzUe12WywO/Poo8F/2LEATqPd2o0TWDkt74wK3ZEy2Fm5
 H3vWFHlFLIUJA3sjmQD5nbOrgitpKiJKhRHGVCcnjfDswV1OxwCcE8ev
X-Gm-Gg: ASbGncvo4um3pwMFMfSH/BzskvIUdv4ZjlsXoKCc2Kd99ngjuZAbeU72pw3cXFjsWJw
 71XDMhYuABiwsnvp88jhLRjsin6rltzXoqmWb8mXavFt/fYR0BGxtzz+ccdF8zk8VeUxFaY8nws
 Uq9ipAKFG8PWoKaiKurYzX5UcW/w0FhGc7JN6aKu0B9B1/bbFiSDU4QnZlWCOmDsC3QzbV/WBUx
 Uf8ntNBAEjtyvTk09QZrnxmZaUwzCZrOezjaYJ3mJj83Sa9bJqmV1efHz6ZmLoC6vmdU1I15oY0
 GzkmX9prvfiqLkBmG0jH+642qIt4H20V+MemXZSmjjUPa+KUyZjgBr2z5rbWCp76gfP+618i1De
 czq3pvDKrkOISaimqd/SkDVwlmUDIecm/0o4r81cZ8KyevaR9X5f39wMl9ervenWftnUwjwHIq5
 rAmXKNj2tf5wU=
X-Google-Smtp-Source: AGHT+IGFi4syHFjqiuoZ0USYNWW31Yq7gTAM89aYi7X38qHdJnJn/ojNMUB0T9kSadkfKYlQFb0oYg==
X-Received: by 2002:a17:907:60d3:b0:b72:eaba:aac2 with SMTP id
 a640c23a62f3a-b7331974fa5mr762979966b.26.1763045618777; 
 Thu, 13 Nov 2025 06:53:38 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15aa:c600:cef:d94:436c:abc5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm173747166b.1.2025.11.13.06.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:53:38 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Subject: [PATCH 05/18] dma-buf: use inline lock for the stub fence
Date: Thu, 13 Nov 2025 15:51:42 +0100
Message-ID: <20251113145332.16805-6-christian.koenig@amd.com>
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

Using the inline lock is now the recommended way for dma_fence implementations.

So use this approach for the framework internal fences as well.

Also saves about 4 bytes for the external spinlock.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/dma-fence.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 9a5aa9e44e13..e6d26c2e0391 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -24,7 +24,6 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
 
-static DEFINE_SPINLOCK(dma_fence_stub_lock);
 static struct dma_fence dma_fence_stub;
 
 /*
@@ -123,12 +122,8 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
 
 static int __init dma_fence_init_stub(void)
 {
-	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops,
-		       &dma_fence_stub_lock, 0, 0);
-
-	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
-		&dma_fence_stub.flags);
-
+	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops, NULL, 0, 0);
+	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &dma_fence_stub.flags);
 	dma_fence_signal(&dma_fence_stub);
 	return 0;
 }
@@ -160,16 +155,9 @@ struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp)
 	if (fence == NULL)
 		return NULL;
 
-	dma_fence_init(fence,
-		       &dma_fence_stub_ops,
-		       &dma_fence_stub_lock,
-		       0, 0);
-
-	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
-		&fence->flags);
-
+	dma_fence_init(fence, &dma_fence_stub_ops, NULL, 0, 0);
+	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags);
 	dma_fence_signal_timestamp(fence, timestamp);
-
 	return fence;
 }
 EXPORT_SYMBOL(dma_fence_allocate_private_stub);
-- 
2.43.0

