Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70257AD386C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518C810E547;
	Tue, 10 Jun 2025 13:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PFCyjpHg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D9510E10B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749561171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lW5Zu8Mwjs06+WvYwa96tsCt+Qd1PG+1Iig01KCwGYs=;
 b=PFCyjpHgroK+V280aariT3dDZiyvLW7CTqbqtggZQe4ndY/zd3xf0BZAfuUiSfuBu6U8BE
 H3G+9Y7WvONCB8Ytl1atz1SbJhNRZpQGVF05Usb1rBm354R3U7cFFh/vNHK43XAaXVWy23
 Coe2nZHLODDomuG9wYY0P9AI6rbJvhM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-bKy0arr7OSiOmTkmUQIQvQ-1; Tue, 10 Jun 2025 09:12:50 -0400
X-MC-Unique: bKy0arr7OSiOmTkmUQIQvQ-1
X-Mimecast-MFC-AGG-ID: bKy0arr7OSiOmTkmUQIQvQ_1749561170
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6facb96d553so90984966d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 06:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749561170; x=1750165970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lW5Zu8Mwjs06+WvYwa96tsCt+Qd1PG+1Iig01KCwGYs=;
 b=akxH8SUFKBZBqAbMRCTJ+a4pOPefl1FAbd3tWPOU273QEEW3WUYpz0Zy+XX4SyCpzj
 0yjYZjyyiJDNsT+mYoTi4Ac1dFNBcPlAKdMPNtsXnFpHQOdjJ6smyQrHVyUYAhkVY255
 VUb5HuhU0RRFq7dZe9wGiT4k66MpBWFcXKqraORuquAfvXG2GMxXkcFNlGVG65R+amd9
 3MAlJqghEiZDxeUtQxcIvkaZh+3jSENYVtajHWDBEMSp4RUdGdORXyFTuE0Yllkh9ETF
 sNVTOGxCtLs8CyWKeVSTiI++gozs9OSjNwbIuzfQbAM1IgdtjuFoATBHxExwsvUhlv9f
 39Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7UmvcfmLADOxEVq8RagsQVrb1ONgMZ6ycFd0UONQu8VxXAHEaTGIgdskRBvOerEoyzY1nDgkNndk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOOME1xFNUhCCXf3q6oCG9hbPXD1Y4oINDc3W2Q3pSPg0eu6B3
 mekpeET7+08dXFAbOIfsQ2C46WUxeBD7V1HlN9cFKuNFgFuuemOi2vM4Bl4l4tDARtiOhS2k/3O
 3zuvprTbrjKJBqNt1/u5ETa4E34tFMkjN0N5NMT8TeuElLoc973zgkaQnrSesYBBhrJOHcw==
X-Gm-Gg: ASbGncvVSgLohnpFya+iYITlk+PX3WIu6LrLNUqs6CCx+R/i1ozgqYTMRv+pHP8q4h5
 ZVqgdTQ76/eZv4x6sLRP847Dy8RWVp7C1OgS6kDfGLImgELgLeR0XMnSJAIEI91mdbcHcH8O0+8
 frej43RU6PEgEUVEH3+iWg8ubnZwxUKqU/UkCBM/XQ0kP9TQoXjy/TNdQa3YXDp5k+iK+rGUdvx
 dN1xmTek3R3VHewcMPV8gJvd9CU5HkJAbCq0sYsolj/hvamf6ADxF74uLZQP6v4i3tTZD58+lfK
 H3B208+nDNR/GoNAxSIN0Icpwh08neNY+mTM4xWbiymx5hFBKdT8MA==
X-Received: by 2002:a05:6214:19e7:b0:6fb:265:a2c5 with SMTP id
 6a1803df08f44-6fb23985764mr50853096d6.17.1749561170094; 
 Tue, 10 Jun 2025 06:12:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWpUl5UmfIgKGDaJZjXVnPslFU8IB+su1QpZ8kf5RQSpb3U7fmC4kUy6BTQuOtse6w0v5xhg==
X-Received: by 2002:a05:6214:19e7:b0:6fb:265:a2c5 with SMTP id
 6a1803df08f44-6fb23985764mr50852596d6.17.1749561169668; 
 Tue, 10 Jun 2025 06:12:49 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d25170615bsm696832285a.9.2025.06.10.06.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:12:49 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com
Cc: mripard@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v4 2/3] dma-buf: heaps: Parameterize heap name in
 __add_cma_heap()
Date: Tue, 10 Jun 2025 06:12:30 -0700
Message-ID: <20250610131231.1724627-3-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610131231.1724627-1-jkangas@redhat.com>
References: <20250610131231.1724627-1-jkangas@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8tpn5mpX3Ix2ja358tHsAbGpatQOMUX9JMeosjyZ9WE_1749561170
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Prepare for the introduction of a fixed-name CMA heap by replacing the
unused void pointer parameter in __add_cma_heap() with the heap name.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 9512d050563a9..e998d8ccd1dc6 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -366,17 +366,17 @@ static const struct dma_heap_ops cma_heap_ops = {
 	.allocate = cma_heap_allocate,
 };
 
-static int __init __add_cma_heap(struct cma *cma, void *data)
+static int __init __add_cma_heap(struct cma *cma, const char *name)
 {
-	struct cma_heap *cma_heap;
 	struct dma_heap_export_info exp_info;
+	struct cma_heap *cma_heap;
 
 	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
 	if (!cma_heap)
 		return -ENOMEM;
 	cma_heap->cma = cma;
 
-	exp_info.name = cma_get_name(cma);
+	exp_info.name = name;
 	exp_info.ops = &cma_heap_ops;
 	exp_info.priv = cma_heap;
 
@@ -394,12 +394,16 @@ static int __init __add_cma_heap(struct cma *cma, void *data)
 static int __init add_default_cma_heap(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
-	int ret = 0;
+	int ret;
 
-	if (default_cma)
-		ret = __add_cma_heap(default_cma, NULL);
+	if (!default_cma)
+		return 0;
 
-	return ret;
+	ret = __add_cma_heap(default_cma, cma_get_name(default_cma));
+	if (ret)
+		return ret;
+
+	return 0;
 }
 module_init(add_default_cma_heap);
 MODULE_DESCRIPTION("DMA-BUF CMA Heap");
-- 
2.49.0

