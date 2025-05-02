Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62171AA6E9D
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 12:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61AD10E8DC;
	Fri,  2 May 2025 10:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vTMt9asb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35F710E8D7
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 10:01:03 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ac345bd8e13so303797466b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 03:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746180062; x=1746784862; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t+mAUVqOxIXjZijXnkHFZmAFDQtFJ4Kh5PO6PLUJhLU=;
 b=vTMt9asb4KZGyXpXayz6f9zqYLLpy79ThfZOIytLCTXNWTtzOqMPU2Q1zPBC2EaSSD
 ZDibmfM8gR95NhlIrmlowpLfxS793+9832wpxXCFc0PLQltU8Jw2MnBYEJmU8BEP7PUz
 w27uYbkI0dN/ragE67Ihz91e6K1V89o338+TYbvo97tZRF6Jz7yFhrga9UnI+Ldvwog1
 Vny1PhmPufr+h2kd7wxch/6SB8L/yR2Z4ms49IrJ9Bq5HpVjH012ebTduO92P6xzxZDw
 8MK+4+UYyzRoT5L9gc9ieKQszpiwaD+HrjEF0Xk4OtCvpjdYiL90gClTnXAU1suW94u/
 HeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746180062; x=1746784862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t+mAUVqOxIXjZijXnkHFZmAFDQtFJ4Kh5PO6PLUJhLU=;
 b=IWPBL5O/gNAwAvOx3Ty4Fu5sxiXWHLhfZ3MyjT0vQ1deiBl16Dg9D7n9U5p3x5ufFK
 x4cqytlcEiJ+VhwVZwKsrE2mxHqupigthDJRug5bm4ZPi54ZtbvSKgSYxmBaYSQdwhIt
 XQ29uDfOtt3hIfyIEkqgiGbJHyTAoTekiSTwhmQk1udgDDcUzwskL3lnECVygQBDp4tt
 QGg61IPzjU6JkNF+SVeQ7pLgL6JZpanQQNqumgtLIoi+J03tj+6S9VZ5CC5XJ57SH4A8
 qy+jHeIMW9TDIjtdiurjxorxE9C+tBI7uEgQ8zQxwm9EBkKHYZ4jMbu//NK8KZ5MRi3R
 FUCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIyLQWYz/UCEXn3CrPNZz72QNBnTmruQEHcsfrXNzsSS0BWrbrRdux6nxRJkoFehJlcHWo2LoqxLU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrzOko0NELtMq6ateTU1PkTkoouBSd9PvrxKQVnciVYfVS+7NB
 xjRYMwiIfDof/JOaY8xuO3Bb6Cu2ZzszYlp1Oqud3M3C9ZqhHYq1h4w14auLAKQ=
X-Gm-Gg: ASbGncvOLEl/soJla4ZpLkFXyyEhwQhmqBMp6cWWknHHHko6PjqbNYW2zmbof3tzB3E
 rCpbv8hGObag7rWHypO2zUQW6LFSKp4k3z44n0cdYw3WwLbqah05ir4QiCN4qpJ+yvvRKbHhla8
 xsilNVai3k0aNt753lDtv6eolLInaWmB1xnBMVY0fXNn0tCUXup6etCh5YGyWHPdWqdHenI3KPk
 55+Qj9cUch79DJ6r2n6tvrehPW6bB1X1U8o2vNNAWq+3otd6QH1qhd+rDVMpDy4TQkO5N9wG6Sk
 YRiVzWfmORwHvsuPcVRgDVMt/Jtf/m4HR2SqhcsbdGCSULzP125kzESNzq366Nq9wB8vJXLgAGx
 x4eQlbAhFFABtJlewXQ==
X-Google-Smtp-Source: AGHT+IF8JUCWliZjcbeUSHN6uSsFMCJc6NTPRM+5qGy9ZTGCC1yXzVdzLyehffDilJirBntp5oHCOw==
X-Received: by 2002:a17:907:9411:b0:abf:fb78:673a with SMTP id
 a640c23a62f3a-ad17adaee50mr226144666b.29.1746180062402; 
 Fri, 02 May 2025 03:01:02 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:01:01 -0700 (PDT)
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
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v8 05/14] dma-buf: dma-heap: export declared functions
Date: Fri,  2 May 2025 11:59:19 +0200
Message-ID: <20250502100049.1746335-6-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
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

Export the dma-buf heap functions declared in <linux/dma-heap.h>.

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

