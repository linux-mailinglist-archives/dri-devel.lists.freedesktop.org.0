Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F65A7FD56
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 13:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B6510E635;
	Tue,  8 Apr 2025 11:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K9R9RyAe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCB910E635
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 11:01:33 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so34487675e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 04:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744110090; x=1744714890; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NirbuKEOTyR2moljejzdS649GYkI8qfTa3FOlPaWlDQ=;
 b=K9R9RyAe0S7f5OWhk1G84+RFMYJotPXtV58aQ0UhwHqOkHF1QW1brMaHKpSqh1FrF7
 tO988TP5jdKa89E1rN2JT1S3gtPSGiJfdnhi8VsRGJPtb1hYOcF2l/q0CLaYdt+94ROW
 9o6vEUh5/azvsQxwMCfEWMfO/gSsrKZ0LikTTMCJ8CTONvngAfINKn1DFd+vqZsOjZQ4
 dzSfL3p4Yyq09xvNMnV4Ag4c11a+aQ9Qk3MP58kc/5Y9XhHilXx1JHGgXt+bviXtvQqU
 h7865qfGGUQMOW27035wqbdlsWtF3wV2aK0vz2pxkPiJZ/ekUXmpsYZNndd62M5mA1dO
 q0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744110090; x=1744714890;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NirbuKEOTyR2moljejzdS649GYkI8qfTa3FOlPaWlDQ=;
 b=KwW0zo5J1/mGTQ9mKbPZ2Ne/WXtOtrQr4iN8weYR8n4AZk/27wZFzIO5M0FCdITNuw
 k1nVJZWWSl3IWLDErZJSaDypPDBZ5tC3PS5jfYokUZ9kUJdVptbHdNa7SYHXNjt4QOL2
 xk4kMjHJSYWOCmBC5Y3LRX3638oU+5lhBLYP2woJsQlRv6VNRLxe7z0vz0+UuQ2oJ43S
 YXzj2YuA+qtwEsxiCIxSe49Tr7SzwGKFdXxAKup2KxGzCYuyh54CM3p9/WyHlUIrv5vB
 Yao+bHjhJnJuXZ590bhzN2KAeR4NZE4lY4HHUJVneXNtBll5/iFRlzWMS3eWyaRGCx5y
 Zr/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN2iFyZtTN3jZiRLr7ROKHCswhjkBdM4M4CXvGXVxDHVRyhAgsMh4cxrE/aJaAj5H0mbqb1iSJC6g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqDcrHJUetbVc124nUZWZ9gOEEEedO4s7c6Q7w7SIBhlqZRJIL
 TwRw3tpqGElyhfiXcu/PSxpKD38ssF8CM2GOY3Fa5SbQcA8VH5jm3bjiNOr3ikQ=
X-Gm-Gg: ASbGncvlamra+p+fVZnHiqPUGmueLzrUCKpPJyeujqaK29vtDVPfvqZRw4EUe01emAv
 eWGc5+3NekNlKJie0m03ZnNuSzMQPMFfoLhwNxZspf2aKz/Qqi9fSQrP4HIsOfyYP2rPnUlY7mh
 rk29Bx1IYVPQuftp2MyNBD3O6Sskk63DdmMEsb9bXzlFlYBXnUOyZaisbrgLBzqL/I5WJZBs5tw
 PmZvV0ZkIBaABTa/vdXtjUtV9CnBbqIPJmk+U+j3hbDi4njCCM/hOCO3Rs9K9odLtabkl5eoRNC
 9pIZTPrVA9JMnHm/0Xn2Hf4N5hNLD+lusUMBZKGjnKZ05U1Yd0Z+yYQ0Y6hA
X-Google-Smtp-Source: AGHT+IG1HG474H6q6bPpOt7xbsbQ8wAky1uvAa0teAmjbL304Djm6yn2qTXg3DoixKQK6rupsAkAwQ==
X-Received: by 2002:a05:600c:524c:b0:43c:e70d:44f0 with SMTP id
 5b1f17b1804b1-43f1890857emr4294885e9.19.1744110090538; 
 Tue, 08 Apr 2025 04:01:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43ec169b8a3sm159770715e9.19.2025.04.08.04.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 04:01:30 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:01:26 +0300
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
Subject: [PATCH v2] dma-buf/sw_sync: Decrement refcount on error in
 sw_sync_ioctl_get_deadline()
Message-ID: <a010a1ac-107b-4fc0-a052-9fd3706ad690@stanley.mountain>
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

Call dma_fence_put(fence) before returning an error if
dma_fence_to_sync_pt() fails.  Use an unwind ladder at the
end of the function to do the cleanup.

Fixes: 70e67aaec2f4 ("dma-buf/sw_sync: Add fence deadline support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: style changes.

 drivers/dma-buf/sw_sync.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index f5905d67dedb..22a808995f10 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -438,15 +438,17 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EINVAL;
 
 	pt = dma_fence_to_sync_pt(fence);
-	if (!pt)
-		return -EINVAL;
+	if (!pt) {
+		ret = -EINVAL;
+		goto put_fence;
+	}
 
 	spin_lock_irqsave(fence->lock, flags);
-	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
-		data.deadline_ns = ktime_to_ns(pt->deadline);
-	} else {
+	if (!test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
 		ret = -ENOENT;
+		goto unlock;
 	}
+	data.deadline_ns = ktime_to_ns(pt->deadline);
 	spin_unlock_irqrestore(fence->lock, flags);
 
 	dma_fence_put(fence);
@@ -458,6 +460,13 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EFAULT;
 
 	return 0;
+
+unlock:
+	spin_unlock_irqrestore(fence->lock, flags);
+put_fence:
+	dma_fence_put(fence);
+
+	return ret;
 }
 
 static long sw_sync_ioctl(struct file *file, unsigned int cmd,
-- 
2.47.2

