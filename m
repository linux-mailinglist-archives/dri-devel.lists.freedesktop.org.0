Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E93EBD38E5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D8810E468;
	Mon, 13 Oct 2025 14:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mlSozhbj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D0910E0D7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:35:08 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-62fa062a1abso8036411a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 07:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760366107; x=1760970907; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IMqpKkdL6ZBRa5OiGdzGfwCdJ5Bw5+ePeaPQokiKa3M=;
 b=mlSozhbjaecRzOPoFLtXeWaKkzTnpg8RuNov1BHfyyEtrjI6TmKokeoU2mNzi4EtAI
 JWHIcKOmu9Ul2FiO2cmpkP8GmTO89+TYdKGIush8B9FSAX4u8HI2Tr8h6jwnC9JD5z44
 MtAiHXVURwZ9rsg2d9TXCz/fsMzOKu+xDN7k0BpasTN6PxEc5Ci8wsmPi9wmn3dZwzQa
 uzoVolxJ57OWZFXGTHVSxRAwcMnkx1WKCt6j39eZM0gkqDo763Z5tp/KGYEF/V+8HYXL
 UlSasNLuVrxOqT5HjXAu3QW8q0hZ/HrgxYnMyQ7wQkFlerWsCwf5P0Vay8ee0rl0dsds
 jZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760366107; x=1760970907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IMqpKkdL6ZBRa5OiGdzGfwCdJ5Bw5+ePeaPQokiKa3M=;
 b=NT1mYxj+xB/nZfyum4psllg/fQtvvmS2mD67Uf/b89OLi7AEZhjRY5IbCt8YHwf020
 2Hl2xcfVeUQ2I353uJHtVG2HH2XvoBS/6Vtd99d+H9IWOfTw2I0hqe6qiSCD+u6bM/MC
 Dwp3it+YFSTF0dBpB14eVWvYjkY+WoBosg5+WsjpyOAgne8Pox87SYhfLe+0J9uwT4es
 9wKPnF97R9wmVwdCrkCvPf0nS7G+RZxKG7/ZR4r2JxImWiLuHs5bqV26oquVhKY+FcdU
 cNzLSx0eebe8E5uXfDcCYFH3M0GwYfRzBucBnugG4NTMEnzt6UeuUEiU76xjbXvnv/Yn
 Vf2Q==
X-Gm-Message-State: AOJu0Yw9K/CAv3xbDGj6NTuE8ZAn+xWjr9e5/4UxAWsWQA+UU3otkGUa
 5zpVsrfQ09bFd6Qh3B5s5uCXLL9qzkVe5P11TyhRWEX4nGqU0RGjNFOq
X-Gm-Gg: ASbGncu8QGl11Ja4Pto1iI/KczBUqalaBFAC5b7ak5aVygOs2ZMduCxfzLGdtBT1jW/
 +aYfvM1EkOkeIRsQjdmRpy1Tea0PQ+JAISIm4d/D4aXxHVjc25gTaL2VdMp1GpFbNgJAmU9Or3Q
 m10z4G4Cjn0qpPfeVcqAKleZA7lP3Rx7+Ln2k66DTC8G4DMyR+Vdq33WohiV44Pn0HbOAP+7B4H
 y85bDSCJdhpPTi67yLL0Z5Oh/BOOvpAT07LAk15FGpTFYEdRhRvAgImKIq3MpNAt3ddjDEbzCSK
 y+GwXBIKkSB4p1RVzsM6jgFmtu5EWqaUnsQEc5sd7R+bceVb8E9O1rJb+WzVSTGcKcHWYb/zVmO
 MB08dmf+KB/mzh/gyr0vBiqjWtXR+I6qmGq1JkojjIEbxlL8a+/9no/vNyVv2K9RO3bSBOCmJvG
 CT
X-Google-Smtp-Source: AGHT+IEV48NzA+YJBNB8eWl6C5nP0fMs0kn0nxEPC7hBgx75AXDeIY4WUcq0HKdMM9yQ6ZUNqABFyQ==
X-Received: by 2002:a05:6402:518c:b0:62f:67e0:55 with SMTP id
 4fb4d7f45d1cf-639d5c371demr20012302a12.24.1760366106514; 
 Mon, 13 Oct 2025 07:35:06 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:151b:dc00:15d1:ebc5:76e6:730f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c321453sm8942037a12.39.2025.10.13.07.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 07:35:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/15] dma-buf: rework stub fence initialisation
Date: Mon, 13 Oct 2025 15:48:29 +0200
Message-ID: <20251013143502.1655-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013143502.1655-1-christian.koenig@amd.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
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

Instead of doing this on the first call of the function just initialize
the stub fence during kernel load.

This has the clear advantage of lower overhead and also doesn't rely on
the ops to not be NULL any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index f0539c73ed57..51ee13d005bc 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -121,29 +121,27 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
 	.get_timeline_name = dma_fence_stub_get_name,
 };
 
+static int __init dma_fence_init_stub(void)
+{
+	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops,
+		       &dma_fence_stub_lock, 0, 0);
+
+	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
+		&dma_fence_stub.flags);
+
+	dma_fence_signal_locked(&dma_fence_stub);
+	return 0;
+}
+subsys_initcall(dma_fence_init_stub);
+
 /**
  * dma_fence_get_stub - return a signaled fence
  *
- * Return a stub fence which is already signaled. The fence's
- * timestamp corresponds to the first time after boot this
- * function is called.
+ * Return a stub fence which is already signaled. The fence's timestamp
+ * corresponds to the initialisation time of the linux kernel.
  */
 struct dma_fence *dma_fence_get_stub(void)
 {
-	spin_lock(&dma_fence_stub_lock);
-	if (!dma_fence_stub.ops) {
-		dma_fence_init(&dma_fence_stub,
-			       &dma_fence_stub_ops,
-			       &dma_fence_stub_lock,
-			       0, 0);
-
-		set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
-			&dma_fence_stub.flags);
-
-		dma_fence_signal_locked(&dma_fence_stub);
-	}
-	spin_unlock(&dma_fence_stub_lock);
-
 	return dma_fence_get(&dma_fence_stub);
 }
 EXPORT_SYMBOL(dma_fence_get_stub);
-- 
2.43.0

