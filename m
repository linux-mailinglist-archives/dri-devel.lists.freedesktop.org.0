Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C16AD389E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5A910E54C;
	Tue, 10 Jun 2025 13:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V4DD5jSb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C835310E550
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:16:14 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ade5a0442dfso377398666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 06:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749561373; x=1750166173; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8BDcE4876d7+lQswV9isKuNGeIH7ZLPwvjK7CukY8ng=;
 b=V4DD5jSb+YmZcH0eJhoFg5YDiVWFTgrI2NRE3LaVRMGylevD4F37xq181vLVLgZc2o
 b8BH6tyXO+8uvtSJkWoTAptG8iy+CKK5bQVUnQMW1HtYfZx9VyTKfY1+o/MJbZOzBrSc
 8TC2/L4ggMt/xWpylAyKj5pGsYY1zNxgjBWjBXu6AIejxQauE0xaMROnYpkTD0itCpZ7
 z3BwXdjDvQ13X1LOMg79DJdOVwXzV2n6D6JXT73bonM6n+aMc5GCiS1J79K545B2nfpa
 tSdlMwaVrPxvve0OmPsrskHOu92H64d9V/Wul/gbyn24jZ+DM4TUgdLfaTDz4x6rRfXv
 TVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749561373; x=1750166173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8BDcE4876d7+lQswV9isKuNGeIH7ZLPwvjK7CukY8ng=;
 b=J5042RQjyIw6A0zBEE56wRIa64vVlK8J+RCs3rv/PN28iyDAN4JVXGF0BCowryPyNJ
 275NWtl5jMv+EM40Ra7cAE+uOnarOjK4sca1e0REDXOgMQjWuDHGWOAqQs6imZ+Gy2BO
 aBawgCbNLNc0D9kvgVwMYCrWDkdqi64nHr0TlyPX2r5+mjYBaDGoAK3bSNRy2jkWeNrb
 ECYS5u8DFjhstMIEoJVoy6kseSlfjOq8r18Hyk+dWwRj87sgT8h6ZEINdec5Vg+VkzbZ
 Fzuj+hRuJHVjWJrjbPMXFY72LGVZxmjUO70XEtVSbCujY/9HLaFc+u5op98zbzj16hTd
 3trg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsiDQAQMJTfUl3VA9uEU8EB8BjxP9qtfMbzr6RE8Dq6W0+cKqsWx848q1ATZUlv0GvInphwjJOGwA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjB/MGa6EDYpVhcarHMANPMnPxT+VaCYzLLVBIK+3TzlmRMn3g
 WNcA1qlXckkyqddxwjX0J4HbkosmKDXbYCeiY6WJWbQkw9PpCRNu/H8GiDELrXRWRwc=
X-Gm-Gg: ASbGncvxYkJC0ZmuWFH4sazDR0KIxHTIlqRVuNWknM/xU+bKE6+QT4Y+7pCnueGROG4
 6jSwI0kKfVbBB3b4CDmt3xKrhx+m/WOY7tCrhGbpMTCXMkfGux07OhWhM90BeOuqfGWtaxJngdd
 6lK8ZwCZKdXxhitYRWhnr9sl+aNW3JFOgRUp6Arw29ssinT2CbKN4Wiqt7WgTSpHlYDfeixNlw6
 x9zOIRwYWKhCrt+QhxT7k+liNI8i1SWkzKWVZIemcQttDsZwjImcsEOwP0ew5VKeg3msXZE9JgM
 Lk99g1EJZD5D/fYDadT9cdeqGznxEQ3/SG1SHwUn9tD8BLcwkID4CZ1Fk0Otpsb0mHGoal1uR5u
 NW+JAscAMNGTz3xZ83++cxGQOSCFyaHd0dfv/vuI=
X-Google-Smtp-Source: AGHT+IFOBF4P1tAbssgL5dehUIWLuQRa8S7VHpp+Y5ehx9RZ7YktqSDlhzjcJArhhbW8+ISbCVgNJQ==
X-Received: by 2002:a17:907:9720:b0:adb:413e:2a2f with SMTP id
 a640c23a62f3a-ade1aa0fbdbmr1346195566b.9.1749561373268; 
 Tue, 10 Jun 2025 06:16:13 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade3206a1efsm643651666b.67.2025.06.10.06.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:16:12 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v10 2/9] dma-buf: dma-heap: export declared functions
Date: Tue, 10 Jun 2025 15:13:46 +0200
Message-ID: <20250610131600.2972232-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610131600.2972232-1-jens.wiklander@linaro.org>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export the dma-buf heap functions to allow them to be used by the OP-TEE
driver. The OP-TEE driver wants to register and manage specific secure
DMA heaps with it.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/dma-buf/dma-heap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 3cbe87d4a464..cdddf0e24dce 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
 	return heap->priv;
 }
+EXPORT_SYMBOL(dma_heap_get_drvdata);
 
 /**
  * dma_heap_get_name - get heap name
@@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 {
 	return heap->name;
 }
+EXPORT_SYMBOL(dma_heap_get_name);
 
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
@@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	kfree(heap);
 	return err_ret;
 }
+EXPORT_SYMBOL(dma_heap_add);
 
 static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
 {
-- 
2.43.0

