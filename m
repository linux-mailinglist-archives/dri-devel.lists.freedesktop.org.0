Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3709AE533
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 14:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0420B10E92F;
	Thu, 24 Oct 2024 12:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QhOlARTO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7964410E92E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 12:42:11 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5c94a7239cfso432419a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 05:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729773729; x=1730378529; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LYQP74pAccaxp/bWVaRuhS0QTdY30Bf36SGERpSHwKs=;
 b=QhOlARTO1zFfR7F0O3YoJGDIZtfRw7EZDl/UZUlsqRiB5BIvqbaZwwKCdeUhMjScdR
 5gsATnKHtkF7Tygz5QFmT+i8PKgt1Gnl4lN2GI/dP1to2LiCAbFazJwmN6TnwnsYbGcU
 kw4Lh9Kf9GIydVTraO+nfl8yY4W3rbTCamxeByM0VmQR5HFEh3lQEIkgoYqXiDyYEFHz
 Z5cNkngIXCoAeAZvqT5ZByfaeK7W+MbaMyPZBTX/dd6V9xctqYvie5mBSEloG0XCDxP6
 AFx/0m/9/gcvhAJPg0hgC/GrzK15RUir9FANVSYyjDUDO9RKXLcuopT1af87oKT40KpI
 cVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729773729; x=1730378529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LYQP74pAccaxp/bWVaRuhS0QTdY30Bf36SGERpSHwKs=;
 b=vABACwo4tsVC20Jx4tBIArGntiD87iimnZm9Ta2b9liAUbaKFG7BBZUizQydMgLORw
 iUpEPUTsVvV83qVcluuiYQrpBBzGYTSEFKLgwC5l/7psn+izlhjLKsio6c3iXUvGeQTy
 Hl6a/pVAUV6HmUxMo64MimqQfwBXXSPj07GqGruooQ6RUV1xG8CNkU+JppVKDFS3yDnj
 D4TzoPnFwIIj5Zpo9KilPy1c5J42Y5HQsKcafkaBFm5pXuW9XWAJ4eNpVe6ZpoeVcAeD
 /gUsUyEilZ4zgMuB/b/j92hCNkCvRrYfEjLVGzuYEIAIhW2pp4dViAzMtV8FPQ3tQlWD
 lUFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW93piNse0eu/Y9seYVuHekm9mWiyZd135MfUbqIbxnUwlSGFR6zBd3lrUkuOTbhBcs88Y9SP8v3Yo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz17nf3tkszjDeGBu8AASwtWK7gAFE8P1u4ODf70n+c7zB6v8dR
 PClGfyA/ufj2NVsBSRGIpDnXyTHHfUXFytxASyATRGmUfjJjUXFj
X-Google-Smtp-Source: AGHT+IEilgT2WydO1IHCnafNNt39ENQJ3H3MKCDUHgc+VjYTRmF5GAqFBuV0eTODjlNsewSKNthecg==
X-Received: by 2002:a05:6402:43c9:b0:5c9:5928:970 with SMTP id
 4fb4d7f45d1cf-5cb8b1c2410mr6786177a12.19.1729773729421; 
 Thu, 24 Oct 2024 05:42:09 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1550:4200:da3c:7fbc:c60c:ca4b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66a65419sm5623026a12.25.2024.10.24.05.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 05:42:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: friedrich.vock@gmx.de, Richardqi.Liang@amd.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 3/3] dma-buf: add selftest for fence order after merge
Date: Thu, 24 Oct 2024 14:41:59 +0200
Message-Id: <20241024124159.4519-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024124159.4519-1-christian.koenig@amd.com>
References: <20241024124159.4519-1-christian.koenig@amd.com>
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

Add a test which double checks that fences are in the expected order
after a merge.

While at it also switch to using a mock array for the complex test
instead of a merge.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/st-dma-fence-unwrap.c | 69 ++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index f0cee984b6c7..876eabddb08f 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -304,6 +304,72 @@ static int unwrap_merge(void *arg)
 	return err;
 }
 
+static int unwrap_merge_order(void *arg)
+{
+	struct dma_fence *fence, *f1, *f2, *a1, *a2, *c1, *c2;
+	struct dma_fence_unwrap iter;
+	int err = 0;
+
+	f1 = mock_fence();
+	if (!f1)
+		return -ENOMEM;
+
+	dma_fence_enable_sw_signaling(f1);
+
+	f2 = mock_fence();
+	if (!f2) {
+		dma_fence_put(f1);
+		return -ENOMEM;
+	}
+
+	dma_fence_enable_sw_signaling(f2);
+
+	a1 = mock_array(2, f1, f2);
+	if (!a1)
+		return -ENOMEM;
+
+	c1 = mock_chain(NULL, dma_fence_get(f1));
+	if (!c1)
+		goto error_put_a1;
+
+	c2 = mock_chain(c1, dma_fence_get(f2));
+	if (!c2)
+		goto error_put_a1;
+
+	/*
+	 * The fences in the chain are the same as in a1 but in oposite order,
+	 * the dma_fence_merge() function should be able to handle that.
+	 */
+	a2 = dma_fence_unwrap_merge(a1, c2);
+
+	dma_fence_unwrap_for_each(fence, &iter, a2) {
+		if (fence == f1) {
+			f1 = NULL;
+			if (!f2)
+				pr_err("Unexpected order!\n");
+		} else if (fence == f2) {
+			f2 = NULL;
+			if (f1)
+				pr_err("Unexpected order!\n");
+		} else {
+			pr_err("Unexpected fence!\n");
+			err = -EINVAL;
+		}
+	}
+
+	if (f1 || f2) {
+		pr_err("Not all fences seen!\n");
+		err = -EINVAL;
+	}
+
+	dma_fence_put(a2);
+	return err;
+
+error_put_a1:
+	dma_fence_put(a1);
+	return -ENOMEM;
+}
+
 static int unwrap_merge_complex(void *arg)
 {
 	struct dma_fence *fence, *f1, *f2, *f3, *f4, *f5;
@@ -327,7 +393,7 @@ static int unwrap_merge_complex(void *arg)
 		goto error_put_f2;
 
 	/* The resulting array has the fences in reverse */
-	f4 = dma_fence_unwrap_merge(f2, f1);
+	f4 = mock_array(2, dma_fence_get(f2), dma_fence_get(f1));
 	if (!f4)
 		goto error_put_f3;
 
@@ -375,6 +441,7 @@ int dma_fence_unwrap(void)
 		SUBTEST(unwrap_chain),
 		SUBTEST(unwrap_chain_array),
 		SUBTEST(unwrap_merge),
+		SUBTEST(unwrap_merge_order),
 		SUBTEST(unwrap_merge_complex),
 	};
 
-- 
2.34.1

