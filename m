Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B29B53453
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22EA10EB31;
	Thu, 11 Sep 2025 13:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FMh2XTW7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE0B10EB31
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:50:27 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e970acf352fso520101276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 06:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757598626; x=1758203426; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMt0VPE9nsvTEazWH1lgiwsk3x9NY1aluOH28YbXegk=;
 b=FMh2XTW7LGDIt4vB5Fm4uStSqgx5N+zujnQJpdGljxA6Dzntc9sE2Bb041FjixuaAQ
 XfQjD3bGnUyqHTPGLFmMufl6tcA8TepYhEnQEwbX8wl2GbsSnSa2SiWfevYgcMcu8W3R
 sj4bs7bXMvo/2iklsO33LQ1UkcIs8jG5IJD9o3wmhrgZsSSHdRN2oeCNFkOtjbWPcjNl
 PS70iBvS6zqWQpDn7TIyw226fwRdI3LTJTml1MhBfdn8Jk44gLgMImwvvtY4au2jcRrq
 RJzm0eGHWYk1Pz28pwoNq62QlN8sgrIzHiNU8uSvDq7CtF3ZCftvKlOtLN6pCTImON/0
 A4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757598626; x=1758203426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oMt0VPE9nsvTEazWH1lgiwsk3x9NY1aluOH28YbXegk=;
 b=EvKMEc0UbsyViBpaJW++osoCAcN9eQN+/3rBYud9hqqA/yrV5dQDJO+E9ristOeOXs
 OTmjINLPIQ4cphxdjAc96ZVxDliIFYVYf4kIl7s2i15xZ7JsfDbTFJFxLQgdnsPrbXMS
 DzZfmUrQByudDK3YVCZe62XUfulxf7p7WWZwtHOfiM3aPtBrzsBRPJJu8pOtvgkO3yL5
 R8myyN56Y60jzXWSBKg7ST9odzbWYbx9t8b3+fIVupZ9tME5TiTh8p9zDtjT7LhzIfHD
 R89vYSI1c5pRxFLqWl/XvwnLed9m9rCNLVVcbs7PGhPVbkzsOZkRumK7mDIG+FqGREgD
 u6+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPgT9Prgghx9TZ+kU+cTsVbwSAfww/aCK3hPaPHZvX9CpfN2/vRRCXoSI+Zpc24MXPh98mlcE05Q0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzg3aEhDcLEcFuvytc0jcLmwtN9vtaCictvQhJBDhuI/1Vu4cJg
 aGp9czTzVn+GWt/mn9972iXrIhhVhChR31n6QmIqtMqOCPiMeT1sACnXgQ4nKLaZmcY=
X-Gm-Gg: ASbGncuRQw5yMOzJWI+UMXvP0EiFea1RwEfiF4Mb+5vwoOLHPkMd5v7GdIgTDKrnzSj
 7Tka/O9t0uNSuBeyAPmeWNtoqS2XWtfyWawjLI3Ftb5TtULlZ7hlcFOoqMI/kI0lr56OmQuPoaf
 rPxA088o7/Kd+vBntlDKaBX3od2AmoTV3U1zuU+MKR7ODHMLBGnyRCqu12kCDvez8qkvgbDvzke
 GynbY2W3Bxpw7aH1F9k47fVr3LzJBxO73v2lK6WqNSbOYtnLcL8B2rskXEYW0Z7tg6HR6SIsC56
 60Bm8US1a1bkWfGj8Yy9yFF7Td01df5XbXuPsNndxjwQkph2uAD7R3UicOC2/mMJzFZxq803ELf
 QKwgp94P49ZcXEg0+xoPRcFUEaElVkJEnAdekAiNsHX+wn96uINkE62fUX5cmj0F0MlgJ5bcXFx
 0=
X-Google-Smtp-Source: AGHT+IG0oRMoou++RsxpxUsUtwpzC5AT+90eCVdw6DARCJFWQoizSSi/Z2eS8ssSBxttr2gzHNfb5w==
X-Received: by 2002:a05:690c:7506:b0:72a:6e48:d7a9 with SMTP id
 00721157ae682-72a6e49273amr160447507b3.10.1757598625802; 
 Thu, 11 Sep 2025 06:50:25 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se.
 [37.123.177.177]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-72f7623434csm3526257b3.11.2025.09.11.06.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 06:50:24 -0700 (PDT)
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
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
Date: Thu, 11 Sep 2025 15:49:43 +0200
Message-ID: <20250911135007.1275833-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911135007.1275833-1-jens.wiklander@linaro.org>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
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

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Reviewed-by: T.J. Mercier <tjmercier@google.com>
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/dma-buf/dma-heap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 3cbe87d4a464..8ab49924f8b7 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -11,6 +11,7 @@
 #include <linux/dma-buf.h>
 #include <linux/dma-heap.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/list.h>
 #include <linux/nospec.h>
 #include <linux/syscalls.h>
@@ -202,6 +203,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
 	return heap->priv;
 }
+EXPORT_SYMBOL_NS_GPL(dma_heap_get_drvdata, "DMA_BUF_HEAP");
 
 /**
  * dma_heap_get_name - get heap name
@@ -214,6 +216,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 {
 	return heap->name;
 }
+EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
 
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
@@ -303,6 +306,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	kfree(heap);
 	return err_ret;
 }
+EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
 
 static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
 {
-- 
2.43.0

