Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C57BC254F3
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C487710EB77;
	Fri, 31 Oct 2025 13:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FXALBBYo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2631E10EB5E
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:45:00 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-475dbb524e4so13733855e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 06:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761918299; x=1762523099; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=meQ/lUtaRBcsedYV5hXQfaVQTPQRiVGI+spurVQtjks=;
 b=FXALBBYoqg6knpXWqLemt5Q/WKKMVSEcrmlczq2DTR0eHg1ktcooCepmME8QvwbVwv
 MWZq7yZrbwkHyaYh5m7ajgNBocCjxL3vYIZoUMjWQPvA8Qb2NOUG+6lsbbWI1rPuQEGV
 QDgaBXK0cpE4nTodX5MPd6jZlTQEoQUThUQ2dXwRGiOhOUaqTja+gtiNV7EU/DG5UZNy
 O1CRdCznDujlxedUFibeU5u1F1V2kKZhT4Clf2hvEyiCLoi8JmsO1agU+HbQSuK6mt0H
 zpZhDSnEwDTJSrKvtoMEnYXv5WtNvn+c6pellLJlJPW9OU6xkjDTw5nLn/oKMCRCO9mO
 F4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761918299; x=1762523099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=meQ/lUtaRBcsedYV5hXQfaVQTPQRiVGI+spurVQtjks=;
 b=AGamWTa6LJK/Z0VwBgNCBAl/PUScnyW9iNck5QGZMr3Y1kTVHnJp7a/o3KWqDmhry5
 kdn1irLl4BP4DwVPwFsBjrnRgMpfjtFcCaceIv2eVCbR9CMqusXrHdWa2Yz3S6ZVu/1g
 mMcr0HLusDjz4wpCTyK8pBV+dvijVPNwjY7UqXFCVGj+QNbMCD2HX/PzZAr+mjTPxf9B
 EMIECMzFsYT81RRKSjrv3X3do9gTtfXRfakt/Sv8OdTZ1/Z6LQXRQLD9wmQ1Tfjs/S/c
 RGiqsgokNTWJi0TEOBVAor7y7AKpm9oPDEhoxliGQkqEKDf+yoZ9q+T9jdJF7ZX++WLH
 M2XA==
X-Gm-Message-State: AOJu0Yz99jak+uXAa/GWG8T1kA5DzAoiKuf9tL0cO7AM/7hDVE4p+foO
 FfItSlCS/Q7J8Du+yy8wMbLe691JhQVS94ir/WsOBfssM1DGyc7aE6Nc
X-Gm-Gg: ASbGncsPeXllcJqCpX//Y7mCYzu2kMbk7WJRWWGfxepkUyB5QG0GoGoQ5PHlDhDlGHM
 5hQn4W60TbncxtS/+2KMl5mXRvP2Lg2ohPamqo3ZWip8yLg14hH1VRI6HLLtTikDJKTKsifsgLC
 AmmxKxE9oIoMZBCAdY/0X5NNC/UR2SDibTVuSgiwELHwgltMEs7ecmfXYo81yFoNaD60p43DBGQ
 a6Da8EOR1/jDpj2PLjwx/sKrTKyni1UPXUIOToytzzv/1am9LngebDPXevNjVyDzg5M5x/IjN7K
 0hzYfH+/14c2AqiY3Q2r9DWeoq6FSDSX+5rVz3O1rXjjrCO5nOnGoYL6IwUs6DQoIEimu1FnklZ
 /gL2Skh6KcV+wjRrFdznajqKDEjnIruwNT0qYnPMZd+Ny45pnl4lp4yZpbXnpH1sNbYTKLGpD76
 xs8Xv+2e0BNAoitGKot6zv2ZKK
X-Google-Smtp-Source: AGHT+IFFRyJUxaAjl37wW1uC1IN4ighJedEFg50RORpq/yrPbiQXSAvoCpaaPc+ile3/7D8vpLOLfA==
X-Received: by 2002:a05:600c:6304:b0:477:be4:7a52 with SMTP id
 5b1f17b1804b1-477308e11bfmr30870035e9.39.1761918298283; 
 Fri, 31 Oct 2025 06:44:58 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1599:7d00:73cb:d446:bf90:f1c0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732fe119bsm34502635e9.10.2025.10.31.06.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 06:44:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, felix.kuehling@amd.com,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 06/20] dma-buf: use inline lock for the stub fence
Date: Fri, 31 Oct 2025 14:16:40 +0100
Message-ID: <20251031134442.113648-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031134442.113648-1-christian.koenig@amd.com>
References: <20251031134442.113648-1-christian.koenig@amd.com>
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

Just as proof of concept and minor cleanup.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index f9d7439275d1..0dbd2f641f37 100644
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

