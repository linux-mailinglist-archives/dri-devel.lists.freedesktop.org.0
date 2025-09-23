Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC71B9597F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 13:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D12810E10C;
	Tue, 23 Sep 2025 11:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Vy70/Kgb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8886210E10C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 11:14:46 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45dd505a1dfso38530045e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 04:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758626085; x=1759230885; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=veRQoXTOP5jOH7336MItrAXBwCoB6ZB/LrxpVKH7RUg=;
 b=Vy70/KgbFce8XwtZhRpSqWIe18Fz+qlejvXMNksXKJ/Yw0hf1M3jPK64GyTXi57TZf
 ifQWYPCcPknSigue4GClY19Uac/0a7+6gfMNJBZemjh+ZVACP+NN00X97RtITXGN1OqU
 vUXzWZia8v6T92rIWnol8YMuTIISjJgXXjiRKd15N7HzVUsnnxaq5nFUK3FBv3bDs2tw
 q/L3uZOPemG17FbxTbVZd2UOa6H+K7eUvoHalfQ7ga3eXIkxOtBU78iG9iETJBwX5OQU
 dc0294Sx7nipIx+gau4FXw4b0IS+7g8bSqr98HVykRHZRduOkvhRU2r33pdkJLmGi3Bg
 HGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758626085; x=1759230885;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=veRQoXTOP5jOH7336MItrAXBwCoB6ZB/LrxpVKH7RUg=;
 b=XSNFqHF8bxK/z4Bgz1HEHGQ9ujr+Lpu3f8WbPVR8aDnb47AATE/3iQo7KmVoab7vWw
 wpP/HalKDNEjjq6jQjVd115+QEC5dwno2QSfbhKjYsRWVSHEz7qcCGKtGItvTtBYNUAS
 hVt/C44KHEzFR0/UPr3/IbvAKHliEB1zlxvvaiUaKYUkts+5Pr0RyqdWc3aSEdnB3vcB
 0L4UviV67J70JW3w8ly6khwD32rHi1zN4rkxZCQAi620Mcn5fSsnPw374R6k4Y43MSfv
 C7EkJSxqBkiA1MvfQGDWr6WauFW6ibZ5s4NU9ptpK/tIzdRNEIy+d6kbQawYhnx70WSF
 kiYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWp8W2hribrAKhIXoNClQ/iq/iOEF6cZVBn3HhWs1ULczKyoflWz7yUgV7KQ5FmDilM6gQqefmFbA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNTqge7P47oFFyqy8EL7AvPK8Aoe7Jnhg9w/lpV9nAhelH0pz8
 ftFNt3mNUo8QsiKP0AHM69e2zTaCFZrX8NUzA5ie8Aod37a1CexZ52BunDKTaltP1Yo=
X-Gm-Gg: ASbGncspPCC00bVPlSNMj0YKWt6VfrirqaDR11RSsm4Ctm9XVFv7RT6i2/Sq78gajnp
 VeGgAnXfqEZG/zmjM2yNhQwx5KIUMmHHHU9i6pyyqiZOZ3GskzUrXP1JOrxC5lJrN425OgCbuYI
 r2zmKtDagYYwYgfWy90uBIxoQyyWabtI3zzxdzgtYg9lZUquKxSez/TlAzxhwUOiTAW7TH8Jme1
 BtcSi1p6ZSo6dANObYV73hIFnxT6ZWH7p9OfvYqCQc/WwM6w8XMTuCjdQ1j1Sb6bSAsz/Gl9RKH
 L1SUBBgXVJaErtweJ2CyZ134lkx29hBb0hXVByWuWBvLhLC/LjNP+V3QeFC1Czzjpre6lTKK4NM
 SeP7OU+q25gq5633JRoRFATvtDanZ
X-Google-Smtp-Source: AGHT+IGNA4ZE/G6xv8PAXiFATMi0x7yx2B6IdUPeinnVHdHE221ujk0cX1DYaOF+khzLyUivuysi8g==
X-Received: by 2002:a05:600c:3145:b0:45d:f804:bcda with SMTP id
 5b1f17b1804b1-46e1d9817dbmr22553515e9.13.1758626085008; 
 Tue, 23 Sep 2025 04:14:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-464f5a285efsm270902105e9.18.2025.09.23.04.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 04:14:44 -0700 (PDT)
Date: Tue, 23 Sep 2025 14:14:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] dma-buf: fix reference count leak in dma_buf_poll_add_cb()
Message-ID: <aNKBIcpF6kZRG6Mg@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

Call dma_fence_put(fence) if dma_fence_add_callback() fails.

Fixes: 6b51b02a3a0a ("dma-buf: fix and rework dma_buf_poll v7")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From code review, not from testing.  Please review carefully.

 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2bcf9ceca997..a14e1f50b090 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -301,9 +301,9 @@ static bool dma_buf_poll_add_cb(struct dma_resv *resv, bool write,
 				fence) {
 		dma_fence_get(fence);
 		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
+		dma_fence_put(fence);
 		if (!r)
 			return true;
-		dma_fence_put(fence);
 	}
 
 	return false;
-- 
2.51.0

