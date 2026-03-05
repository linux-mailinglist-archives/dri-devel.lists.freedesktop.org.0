Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMrPNOF4qWl77wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:36:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18781211C63
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C8610E295;
	Thu,  5 Mar 2026 12:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="m+eKwHXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70D110E2A1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 12:36:45 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so66156145e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 04:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772714204; x=1773319004;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jZyzh76/vi/WA0Mw21DKfbc+O5VrV1Ds2EV/BZWk6NE=;
 b=m+eKwHXYDCZ0ujQn9ntUnQGGW4vxizn5wFD3XGoqxEwaQHlH/F10LPsR4ipkvsUuuv
 7TaD3D6eBZOjKzpfxbLdjClSMM6s9eARy/eVV8mTnXY1ENCTAxiPUK/7/rH3gH7nXjPJ
 riKX237ysPmLTzLSjDlIYZNwJHjHCFmusZYQ3eK1nAShpLWTt54GlK4hF2q2VE86rgTi
 5zaE3CSFhc64kid+en3Ln+M1KOoLJPGwDQJENCO3VpLD0gHdQD2xJQ698mw5Uh4cL3jm
 mbcp+/9h3KJOIGyqNP5ZBu8Ezh25XUh5HSeOk6KIJwFSo1/UU0zyWylMk2KHh4hfJCl6
 d9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772714204; x=1773319004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jZyzh76/vi/WA0Mw21DKfbc+O5VrV1Ds2EV/BZWk6NE=;
 b=siTEhi15nOX4uGgKZ/2qFa/nJiRKNsW7MArbp8pHxQeyhC5FsttfRruUt7kGKZPpSu
 Rh8jyo/qh3g70Sf7IajghWCyOV6qEzfu5pQpg8JrdgsNtUAaxoH8GgJN+1Oh2/VcU6c5
 AQHZ3Mcv1enj7DU/Vf4nUJ0YT1x6AeMsdoNYZjybR+KnnTGurYrwCeGIYOeh2Mice4xC
 gWC5ieeHaxrdgVQqO1kGX4Vz8rfX2Zxpnp0Or97KPCK2O/OAa6Mlq+Y6W9DVma/s4HF8
 5HJKi8gHnTzOya8f2+n0QaQ9HontyRhe0xjTqrzmBUeZPXFERJJYiab+/OzXEuSr+Po9
 tXkA==
X-Gm-Message-State: AOJu0YyNEeluyE4kqNZgNV26BvBP3X+5Jfp4uwTR25+qybJ2yERcw36t
 FSFyin9r0jZYVkVt21sc+7yDE92psxiBIqT7J1gEkZ3CYOMB/ZSmBx1/aS9ZqIn/XMzc91twrG8
 qhzDlINVYng==
X-Gm-Gg: ATEYQzwltwh/Aemgk2lT8mj5llaLpWROa75nChUd7N8pBd7SuweVW2eYZXCdPlw8RYw
 mY+CB2ZYnR8BsRcWNy3eCGlorbFpqypf9OKvD9uh4CebqD4f7GfYx3oIyT0WlzbMSckPYEPq5/Y
 FNrQ5BVEYM+KP4IWyIxbxZ2ilfPsy8Vaxr0Nr/Ax44XCToFv6SFywl23LFyfJ71S+JmZvMg+3Ng
 QWb4PJqDj62G/Oub2a8x4nmFVFN7FGf/6AcaZG4fpZINkX9Veh+bCdL4w+NQwlG1ecwsTA3zFTC
 uSmS929lGaS+oeLwOurMSrEap9JPrIdaDyO5s8chygsucNNqSBojIZ9h9tGaypeJxLMe+eDlrP9
 GzqVb9VGOqzJ1475D1dHBtj/+pv711NozXmxHMVJhcioHkFuufa4O++nvE2hkvOoEO9VGzRk1LY
 UjMs1YzmOZnTTNmA==
X-Received: by 2002:a05:600d:15:b0:477:9a61:fd06 with SMTP id
 5b1f17b1804b1-4851ee7bfc7mr38207005e9.8.1772714204144; 
 Thu, 05 Mar 2026 04:36:44 -0800 (PST)
Received: from localhost ([85.163.81.98]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b55d15besm37523468f8f.30.2026.03.05.04.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 04:36:43 -0800 (PST)
From: Jiri Pirko <jiri@resnulli.us>
To: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com,
 jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com,
 catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
 linux-coco@lists.linux.dev
Subject: [PATCH net-next v3 1/2] dma-mapping: introduce DMA_ATTR_CC_DECRYPTED
 for pre-decrypted memory
Date: Thu,  5 Mar 2026 13:36:40 +0100
Message-ID: <20260305123641.164164-2-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260305123641.164164-1-jiri@resnulli.us>
References: <20260305123641.164164-1-jiri@resnulli.us>
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
X-Rspamd-Queue-Id: 18781211C63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[resnulli.us];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,resnulli-us.20230601.gappssmtp.com:dkim]
X-Rspamd-Action: no action

From: Jiri Pirko <jiri@nvidia.com>

Current CC designs don't place a vIOMMU in front of untrusted devices.
Instead, the DMA API forces all untrusted device DMA through swiotlb
bounce buffers (is_swiotlb_force_bounce()) which copies data into
decrypted memory on behalf of the device.

When a caller has already arranged for the memory to be decrypted
via set_memory_decrypted(), the DMA API needs to know so it can map
directly using the unencrypted physical address rather than bounce
buffering. Following the pattern of DMA_ATTR_MMIO, add
DMA_ATTR_CC_DECRYPTED for this purpose. Like the MMIO case, only the
caller knows what kind of memory it has and must inform the DMA API
for it to work correctly.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
v1->v2:
- rebased on top of recent dma-mapping-fixes
---
 include/linux/dma-mapping.h |  6 ++++++
 include/trace/events/dma.h  |  3 ++-
 kernel/dma/direct.h         | 14 +++++++++++---
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 29973baa0581..ae3d85e494ec 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -85,6 +85,12 @@
  * a cacheline must have this attribute for this to be considered safe.
  */
 #define DMA_ATTR_CPU_CACHE_CLEAN	(1UL << 11)
+/*
+ * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
+ * (shared) for confidential computing guests. The caller must have
+ * called set_memory_decrypted(). A struct page is required.
+ */
+#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
 
 /*
  * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
diff --git a/include/trace/events/dma.h b/include/trace/events/dma.h
index 33e99e792f1a..b8082d5177c4 100644
--- a/include/trace/events/dma.h
+++ b/include/trace/events/dma.h
@@ -32,7 +32,8 @@ TRACE_DEFINE_ENUM(DMA_NONE);
 		{ DMA_ATTR_ALLOC_SINGLE_PAGES, "ALLOC_SINGLE_PAGES" }, \
 		{ DMA_ATTR_NO_WARN, "NO_WARN" }, \
 		{ DMA_ATTR_PRIVILEGED, "PRIVILEGED" }, \
-		{ DMA_ATTR_MMIO, "MMIO" })
+		{ DMA_ATTR_MMIO, "MMIO" }, \
+		{ DMA_ATTR_CC_DECRYPTED, "CC_DECRYPTED" })
 
 DECLARE_EVENT_CLASS(dma_map,
 	TP_PROTO(struct device *dev, phys_addr_t phys_addr, dma_addr_t dma_addr,
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index e89f175e9c2d..c047a9d0fda3 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -84,16 +84,24 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 	dma_addr_t dma_addr;
 
 	if (is_swiotlb_force_bounce(dev)) {
-		if (attrs & DMA_ATTR_MMIO)
-			return DMA_MAPPING_ERROR;
+		if (!(attrs & DMA_ATTR_CC_DECRYPTED)) {
+			if (attrs & DMA_ATTR_MMIO)
+				return DMA_MAPPING_ERROR;
 
-		return swiotlb_map(dev, phys, size, dir, attrs);
+			return swiotlb_map(dev, phys, size, dir, attrs);
+		}
+	} else if (attrs & DMA_ATTR_CC_DECRYPTED) {
+		return DMA_MAPPING_ERROR;
 	}
 
 	if (attrs & DMA_ATTR_MMIO) {
 		dma_addr = phys;
 		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
 			goto err_overflow;
+	} else if (attrs & DMA_ATTR_CC_DECRYPTED) {
+		dma_addr = phys_to_dma_unencrypted(dev, phys);
+		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
+			goto err_overflow;
 	} else {
 		dma_addr = phys_to_dma(dev, phys);
 		if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
-- 
2.51.1

