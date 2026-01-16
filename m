Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956A2D38679
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 21:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138C010E921;
	Fri, 16 Jan 2026 20:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Dg0U2ryx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB4710E921
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 20:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768593997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=twwZ6029cLkDAYezw98Z3f9QT2dYne/kukXgOmvL3oQ=;
 b=Dg0U2ryxpEGmD3kaDOKxWNF8Q7hthcuBEJNS8dJvtQKUNKgc86O+u5NkH2xkGed9UWFbU2
 VHSADqBhY1joSzIpNX+Iclu9BPmra+dR9gPUENYyVrhl5Bc79edtub0Fv1JkpzdEX3cPZI
 htI/bEa932lajUWcjKABfVYe+R0USZE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-j22e5WMuMyerP-4iZ0O0sQ-1; Fri, 16 Jan 2026 15:06:36 -0500
X-MC-Unique: j22e5WMuMyerP-4iZ0O0sQ-1
X-Mimecast-MFC-AGG-ID: j22e5WMuMyerP-4iZ0O0sQ_1768593996
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c52d3be24cso342959485a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 12:06:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768593996; x=1769198796;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=twwZ6029cLkDAYezw98Z3f9QT2dYne/kukXgOmvL3oQ=;
 b=NhO4zZwdBrdx1r4d2dBujnl4nJ4tjtmPiIwuDRsetfjSpSAKW9gg2pcIwjbm9d4BhN
 jbmL8AOfh1dryM3zRZy2SExfV+kWyimPAriuU7WnXzGPxgHtL+1AL15oPs8lQ6pcJUIZ
 HIjhgdlIN7uAEBTfM3ozvVhtz0cyaMjsWyl+/hl6KnIuw/HbirmSBXsEF8fquUPuXZgW
 T4soH+obZNwbVzgmi2Zk52DYNGV2Jen8cgzLZbol9jg47f4nWkTE1OmAjbwfePpODmiM
 KISiw3o/eP8tpOpxLdt8XEPmV69QiP0HH6sd8881RevPhzEDn3bs4E0IMkeEF0+MWpkA
 QZ2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnzCLyPZ9uV0fEfxg0/7SQAg0KNFbWgSK8EmYz4TI7bR/eKFuPS0Dl/ZpxsOXinlnSKRqQGpB6FtE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdISVGndk/BC3jB4Ae7Wjrgo1ZLw3KUPI/+UZRGu7fNKjgdIu1
 D4KdgEWhpULSPq7oW8C5e9/01I3xfZPhWtXNOBB0EBaudJAxhfbpT1tRCTkxb1mQMqGvC5iDSrN
 LoVthEDZxPchsCGoG29DAt19yVGfFWgs12oYsdmdmnLxbZ7i/PKYRe9z3WEQ+RmKo6RpKuw==
X-Gm-Gg: AY/fxX7ag8KuYbWbmE1OxkeaTdbXCPHI4DdpBUHi62ktqIT83/a0DMn3EvXpdmp71Da
 F3kJZAhmRLdKUAJWc1Uqsg4KBkRtA1mp0tRUUj3pQhP/RkcbNjswjrT/Cc1rkyBRO1gtOYpgpbe
 QjLAkVVr5zmk5JWYUV7xTmERhtwed9xSU1dRkVIGFxhymiOv/J2IiqH/LnX+5QgrYI9Q3kib0mh
 gWHetwt0GguTxdngmlvHB0+AD77W90D5FSumsnrnOLuDyKyl4Dtww3Pyki0oi1gDKJs5kLP2pEv
 21l7n06u2yYwA6HDpAdlmgPdXsuhjSccQzf14QR0iXa+3T+b48FxHV2CRSJl3Ie7HxGuUeZG/MD
 fGXfMHNWdsPpO2I6bsgGZTXO192+4yxtr0rhZ0B2HE/h5k5i6MgU=
X-Received: by 2002:a05:620a:45a8:b0:88f:e620:21cd with SMTP id
 af79cd13be357-8c6a67b093emr567595785a.62.1768593995557; 
 Fri, 16 Jan 2026 12:06:35 -0800 (PST)
X-Received: by 2002:a05:620a:45a8:b0:88f:e620:21cd with SMTP id
 af79cd13be357-8c6a67b093emr567588885a.62.1768593994868; 
 Fri, 16 Jan 2026 12:06:34 -0800 (PST)
Received: from localhost (pool-100-17-20-16.bstnma.fios.verizon.net.
 [100.17.20.16]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71bf2b0sm297117485a.12.2026.01.16.12.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 12:06:33 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 16 Jan 2026 15:05:38 -0500
Subject: [PATCH v3 1/2] dma-buf: heaps: add parameter to account
 allocations using cgroup
MIME-Version: 1.0
Message-Id: <20260116-dmabuf-heap-system-memcg-v3-1-ecc6b62cc446@redhat.com>
References: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
In-Reply-To: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@redhat.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i0uz9rgdHInT4dAGUKdHHg1OgalWh1Lu7n1jmUme5ik_1768593996
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

Add a parameter to enable dma-buf heaps allocation accounting using
cgroup for heaps that implement it. It is disabled by default as doing
so incurs caveats based on how memcg currently accounts for shared
buffers.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 drivers/dma-buf/dma-heap.c | 5 +++++
 include/linux/dma-heap.h   | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 8ab49924f8b71a0272dc89a609539a429feaf6c8..d230ddeb24e0fa1f2d51cb5d2868ec54fc8376a8 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -49,6 +49,11 @@ static dev_t dma_heap_devt;
 static struct class *dma_heap_class;
 static DEFINE_XARRAY_ALLOC(dma_heap_minors);
 
+bool __read_mostly mem_accounting;
+module_param(mem_accounting, bool, 0444);
+MODULE_PARM_DESC(mem_accounting,
+		 "Enable cgroup-based memory accounting for dma-buf heap allocations (default=false).");
+
 static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 				 u32 fd_flags,
 				 u64 heap_flags)
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 27d15f60950a2093e592be1b961c02e672826e58..648328a64b27eaf25c8b18809a02c6410cbbffde 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -46,4 +46,6 @@ const char *dma_heap_get_name(struct dma_heap *heap);
 
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
+extern bool mem_accounting;
+
 #endif /* _DMA_HEAPS_H */

-- 
2.52.0

