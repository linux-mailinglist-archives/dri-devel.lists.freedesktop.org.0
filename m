Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2E8A76374
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 11:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6743C10E3B4;
	Mon, 31 Mar 2025 09:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pSRENAaH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851DB10E3B4
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 09:45:15 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso40579495e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 02:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743414314; x=1744019114; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aKS0Fboa1dtHIDG4S6gLCYTAz2lAP8mKMrYFIOMeSw4=;
 b=pSRENAaHj8LWOSytswu+gcqJHnC63LcWchjJWGLHBZyJNTgOk9QEY0csQGZVtEG3an
 LumP9cQvSbKY33+WFrDGua+hZudEK1sXOlAXbcw76rUJi9lzG9Di1QoaU7DrKpOWYLjD
 NNBJYcDD/m+aIZIMmQA9rzz2Ieiyt6ivNGaHd/3RZsE3VCnoGAShvAXMaXiklcpB9pRO
 LqSIpmO2A49OMSb0SVShTRIMwyVS7NsJtERLgGvneTH72gHjVsOONOCTDqE8/Ubeq1tG
 IDVhnfGjqr4EXOIbzxYBuni9rLl0GeXRx0UjzgXgq1GPVSpdTO3BcDr78WG1qWR29t4z
 wbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743414314; x=1744019114;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aKS0Fboa1dtHIDG4S6gLCYTAz2lAP8mKMrYFIOMeSw4=;
 b=ofv7QszLNQtPYOCRCNn/pz/EhhH26kmbGI4mD1bXT8OJWjSdaunkoni3ikSG6ciBtW
 GAvgZJjHDXmuZRd4is/dC1FD+VaNpMG45RBK6PO/+uVvspHU6pVXRXucY71pdIkW5cUv
 NYTISmPCRNs4aEA6cp15IjXrVDxVjtxWT8fqe1SVqPqFQElDplHt82zBMpKvQlugrz84
 qw7Rppv7Ipe50hBI9l4Vl+MUtMGGjvbxkm4k8mk67rFcND0D3TU6ZveoAQmGLJWYp3AV
 qqlEICSabr5psWjIL5daZlSeioab8UWmP1BbHG5a7TwOzSrnuVXPsiKRKvp/WZgUOaGf
 kksg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi0w3rZDKnbCBrRJwFLtwwlSzrkKPekkChqM1OxXHwnMvyx4cMm4SDWcUwVHMmOHijbHURcuM3dZ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPTCCIU9JFHl5syGkD4c1kZ65fbR7ikFJ7TYdXgiQjP4tJFGHe
 ioHAe3v7BjoNaDKaW85zK1DWbcdqf9dHSO/FowxQfKSA1/XM3kLDiQyXtlUx+xH36tPfCu4lhvo
 Vn78=
X-Gm-Gg: ASbGnctfrmoiRbjBAIbWKmp1RWpr9vncPeG2TJ1feFf61uOVgXbf2KCCjRLaT1ifHYT
 lTRKMDoz6UuLbmtpKemTMlZaf3VSLcg3sgDzrdUmDtA1fEDmB6xcCR9JWVwEtPKVFQH1KvEvh4w
 b/2IeNjKz16xZmXbp+aAe1mPrl9I9qY2I4v8hSUz+UmwKfcmqNEYLyIaY8WXm4QQCQP4dLgBmjW
 z969ORc1Gq/a8PjoiES6DhIPP6cbfC0dGcekwAnn5F7n4MWFIGEu1wWAypPk9CORf9jzFR1EwgS
 eVeFrUTcS4FBW+/FJyDS9MfNhHagpQSyBoYJUN6+wyLJIgOevA==
X-Google-Smtp-Source: AGHT+IFVzFpYmKBAGEXWi3zw7wUU5N+0+BO4pZCgxv4I35ZkC0wJP7yiqMMStfAjpc9DsFCTgkEtog==
X-Received: by 2002:a05:600c:83c4:b0:43c:ec28:d31b with SMTP id
 5b1f17b1804b1-43db62283d1mr102074565e9.10.1743414313954; 
 Mon, 31 Mar 2025 02:45:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43d8fbc10e1sm115778485e9.12.2025.03.31.02.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 02:45:13 -0700 (PDT)
Date: Mon, 31 Mar 2025 12:45:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@chromium.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] dma-buf/sw_sync: Decrement refcount on error in
 sw_sync_ioctl_get_deadline()
Message-ID: <5dbd6105-3acf-47ad-84d6-2920171916ac@stanley.mountain>
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

Call dma_fence_put(fence) before returning an error on this error path.

Fixes: 70e67aaec2f4 ("dma-buf/sw_sync: Add fence deadline support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/dma-buf/sw_sync.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index f5905d67dedb..b7615c5c6cac 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -438,8 +438,10 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EINVAL;
 
 	pt = dma_fence_to_sync_pt(fence);
-	if (!pt)
+	if (!pt) {
+		dma_fence_put(fence);
 		return -EINVAL;
+	}
 
 	spin_lock_irqsave(fence->lock, flags);
 	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
-- 
2.47.2

