Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D548ABDED3
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 17:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1B910E674;
	Tue, 20 May 2025 15:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EAew3Yde";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D802410E671
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 15:24:45 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ac2bb7ca40bso957894266b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 08:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747754684; x=1748359484; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t+mAUVqOxIXjZijXnkHFZmAFDQtFJ4Kh5PO6PLUJhLU=;
 b=EAew3YdeKJSGb8ODfLimhFVMrGiugCKETJomKzBIUc8SNMVioQkUyYPxPow+mjtN/S
 8hsUJSuyQ8pi72xJmEHjZZopBLXKTuSjRpD5e8X3AoC5XOk8JAAkJo0VbB4rRERLsex6
 CoxmddZ/YXKWV+Ot/Yx9ZmM7RxfLKgwhmDWsz3eSa9PQZ0ZQR4uLkSY1T1gn0zl58q+a
 ZcVJzlLCGitUquM+t4zJYVtinLm9OZAnwGp6nD/YfnKOi24lOV90qEWTjvPNefOWj9F5
 pHt616ljRbDL84p5ChM7TH4cZAOG6ZeU+clHndC0hPZeCqsNvCphy6NjGG2xj32iQdPW
 PcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747754684; x=1748359484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t+mAUVqOxIXjZijXnkHFZmAFDQtFJ4Kh5PO6PLUJhLU=;
 b=p46uAlhPeFxNpuyKVQum8BpfilGQJd+W0hTVhxGAEviZ7qSCVfyz/d7Sc2MN6ZRCQ6
 +83vQV1+2NQdh4CU00566X+1AS8GvGihJbLoDKniL8p6nG3gfwY6Eozl8YNYQCfk18ob
 4iQ7jhxqKRZ561gorLvjiQ/bqeVgN9SVe8CDvo+E6mEeb212fUe9mWSwIoYVNULskGRw
 vX7ezKWtvhzSgKmvpWFPvDnn14ze1FGAzu5WSHdcVXT4pY/iuIUzSGZMUd8tIX7hoH4G
 EZw61K4RY2sara0LcyRq2a93r0VJWP7yFUd2W4hacraHWPvcQl4kDIzLqemUQmUBlr/4
 mHgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm2UPywEcBOnMLQ5lbrnuUKarPt4ncwyHc/WUVmXcnDJdjGlzi6dpo4vpC6YwQd6TJ0CfDHKSNciE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhsWhKyJTwxljwqWeCW5rveIXXSCKrtOksoMo9KU/AxxkwiMXZ
 kVDvgCJa3J0sZNJf4+6wd0hu/FHvlRtXmiFmAGACoYRf8ocPDZz8mNoMQG17upKvtaw=
X-Gm-Gg: ASbGncteWcS2ZYToZBFdvVeec4FxnxraSfW6/8zT+9AB5nq5tu0xaFwZCC9PeXKGbWi
 r/A0IHKkFMAQI4zrriZYsf6147Pv9eaW2YpRc5Q5P8f5mcnqUR8MaTKUre5XrpyH/sPumoaOzQs
 PPlLKTEBGfoTjyybc1aacVY7k6UqBE2vVfVQdhyYeE6xjGH2nUMUlDg/A5sfG7sqHgQmzp7aIE5
 CEeI2Yt0ztk2XmBqnqn4k9O79EN+62dFZ0QC3ZqqbxZxjW/+CP9/jeeVucd8DzvLsfVsVkQWhQI
 An2k/cMj49/Vj0X+B/uTz+xJrDv+8wG6WYqOUyg04kuFcBa0aQqKoduxh6q11AbCxu990/UfWXv
 YDo3/E2RiCv4rxxPqCspLn23/JGp2
X-Google-Smtp-Source: AGHT+IHJnNS8PsiFV8EVtrc16G9fq8ki6tRPk/s/IIABC/OTj/P3BcTFh9xpStaXrxgzCYdbyyVt2g==
X-Received: by 2002:a17:906:22d1:b0:ad5:3055:784d with SMTP id
 a640c23a62f3a-ad53055f81cmr1041003666b.34.1747754684274; 
 Tue, 20 May 2025 08:24:44 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d278257sm742608766b.82.2025.05.20.08.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 08:24:43 -0700 (PDT)
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
Subject: [PATCH v9 2/9] dma-buf: dma-heap: export declared functions
Date: Tue, 20 May 2025 17:16:45 +0200
Message-ID: <20250520152436.474778-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520152436.474778-1-jens.wiklander@linaro.org>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
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

