Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D019657F3
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 09:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143CE10E817;
	Fri, 30 Aug 2024 07:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J6Ov/KxY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3DE10E817
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 07:04:39 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a83597ce5beso247182566b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 00:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725001477; x=1725606277; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MJjNgUGJenoBaIKVAgwwwsHux2S25WdElfpi6ReEk9U=;
 b=J6Ov/KxYTgY+/ByhfRQf4k9asWk6YWV+AVoejR6bi/4aWSyPHzv9VspwhHveFLDTGr
 Hv+lWIyTzXrxz8Ljo8rRzxtjsfZnwNRlJnaJ+UnvUDvixRqpHg9BSN6NmVR/DCCwCsZc
 Ag+3ZM8vH7PmKVdeKW6vpKjiDHm5J7tc3j4VLJCIterSatbYrg35c7Y20X4C4HAujfzE
 TIX2XDz+nxy6oMRtDwfOxIlgoqEBCmDDVCgPv/Y+IkL524c//QTvnm1U41QfuIXu2I69
 4HBJb/xP+zOU7l7bEc2MaqYXnpjLRQQyvIfn5PwfOjD9djQqOw5CNhdhH1qT8NKuMmVI
 6WzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725001477; x=1725606277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MJjNgUGJenoBaIKVAgwwwsHux2S25WdElfpi6ReEk9U=;
 b=KKmT5N/vhD2eyE2kdHq6R4mg/1qrkvWMYGLLA7OrR5UYw+jnKiREx5dMm8YxDa6Cf3
 EY39pfNvN1zB4AbKDaN6o8BJTBm0QSPz3f44l/JLsN6slVBUh7zX826ym1HaiHWgvT6p
 h53DTo+sIgndjER4shHPx5HeLx8wFb8ib5XLeoGKVWw3dix8TJhH9jV0kZ5GehBvLJQN
 /aijUMDFK2XnyF8akE49iu2hNoP640h2TbUJNFmbSt4uIop21B8nOMIP2SOAExld2FNL
 YkK8O0Gh7Tjc15q9PEtYEboLLERmLdWLDRtVxAN2DAn/Q/JfVpFVyrxJ7/G9s00DKrb2
 Y2oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdE/A97dOGnOoLWKPj9ffMNVfOeG8npQomMIAgK9h4r3u08R9USGhTj3M8W6ACSyC0kBdlmEGt3MU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/iHbQDZdCRCcL/ekIYLTQzzk69nILPIXfvFqUK2M1WUIIK5DV
 RxzOXZ2ker+UI/5yFDviQcVGPk1+hmiDRdtayIHv5LXV+MYPAs9VE+fGpDmy59g=
X-Google-Smtp-Source: AGHT+IH87EkQZslfXd1cN/MuD1B1+tjpJHcDRiz/ebksiuYOXdKRtj8j5p8EyAgrD5jVzjEwQczjhA==
X-Received: by 2002:a17:906:4788:b0:a7d:89ac:9539 with SMTP id
 a640c23a62f3a-a898231fe8emr528271266b.7.1725001477275; 
 Fri, 30 Aug 2024 00:04:37 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89892232c7sm178026866b.222.2024.08.30.00.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 00:04:36 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [RFC PATCH 1/4] dma-buf: heaps: restricted_heap: add no_map attribute
Date: Fri, 30 Aug 2024 09:03:48 +0200
Message-Id: <20240830070351.2855919-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830070351.2855919-1-jens.wiklander@linaro.org>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
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

Add a no_map attribute to struct restricted_heap_attachment and struct
restricted_heap to skip the call to dma_map_sgtable() if set. This
avoids trying to map a dma-buf that doens't refer to memory accessible
by the kernel.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/dma-buf/heaps/restricted_heap.c | 17 +++++++++++++----
 drivers/dma-buf/heaps/restricted_heap.h |  2 ++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/heaps/restricted_heap.c
index 8bc8a5e3f969..4bf28e3727ca 100644
--- a/drivers/dma-buf/heaps/restricted_heap.c
+++ b/drivers/dma-buf/heaps/restricted_heap.c
@@ -16,6 +16,7 @@
 struct restricted_heap_attachment {
 	struct sg_table			*table;
 	struct device			*dev;
+	bool no_map;
 };
 
 static int
@@ -54,6 +55,8 @@ restricted_heap_memory_free(struct restricted_heap *rheap, struct restricted_buf
 static int restricted_heap_attach(struct dma_buf *dmabuf, struct dma_buf_attachment *attachment)
 {
 	struct restricted_buffer *restricted_buf = dmabuf->priv;
+	struct dma_heap *heap = restricted_buf->heap;
+	struct restricted_heap *rheap = dma_heap_get_drvdata(heap);
 	struct restricted_heap_attachment *a;
 	struct sg_table *table;
 
@@ -70,6 +73,7 @@ static int restricted_heap_attach(struct dma_buf *dmabuf, struct dma_buf_attachm
 	sg_dma_mark_restricted(table->sgl);
 	a->table = table;
 	a->dev = attachment->dev;
+	a->no_map = rheap->no_map;
 	attachment->priv = a;
 
 	return 0;
@@ -92,9 +96,12 @@ restricted_heap_map_dma_buf(struct dma_buf_attachment *attachment,
 	struct sg_table *table = a->table;
 	int ret;
 
-	ret = dma_map_sgtable(attachment->dev, table, direction, DMA_ATTR_SKIP_CPU_SYNC);
-	if (ret)
-		return ERR_PTR(ret);
+	if (!a->no_map) {
+		ret = dma_map_sgtable(attachment->dev, table, direction,
+				      DMA_ATTR_SKIP_CPU_SYNC);
+		if (ret)
+			return ERR_PTR(ret);
+	}
 	return table;
 }
 
@@ -106,7 +113,9 @@ restricted_heap_unmap_dma_buf(struct dma_buf_attachment *attachment, struct sg_t
 
 	WARN_ON(a->table != table);
 
-	dma_unmap_sgtable(attachment->dev, table, direction, DMA_ATTR_SKIP_CPU_SYNC);
+	if (!a->no_map)
+		dma_unmap_sgtable(attachment->dev, table, direction,
+				  DMA_ATTR_SKIP_CPU_SYNC);
 }
 
 static int
diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/heaps/restricted_heap.h
index 7dec4b8a471b..94cc0842f70d 100644
--- a/drivers/dma-buf/heaps/restricted_heap.h
+++ b/drivers/dma-buf/heaps/restricted_heap.h
@@ -27,6 +27,8 @@ struct restricted_heap {
 	unsigned long		cma_paddr;
 	unsigned long		cma_size;
 
+	bool			no_map;
+
 	void			*priv_data;
 };
 
-- 
2.34.1

