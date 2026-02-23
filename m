Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIDhDDMjnGn4/wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:51:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73251743BE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB4210E2D0;
	Mon, 23 Feb 2026 09:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="02w6FyZ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED6010E033
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 09:51:40 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so50787355e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 01:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1771840299; x=1772445099;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jZyzh76/vi/WA0Mw21DKfbc+O5VrV1Ds2EV/BZWk6NE=;
 b=02w6FyZ+DBckTjEwplxe3NNEdXzvJcbx5a47K0KKNUznF7vlZogDJebd1Ala1AhF5V
 zxUq3/6gqR7duH1h+T2SR9GFsRC9qMcz0h9FyFYWFhK006x1vpahnp+Vbg/k5qaM3tXX
 Pukp7q3/gDoqQwf+TAtZtMVwOQ8zWdjoubI1IlZvfBY45PV5RGxlpNraslb1SebGrL0B
 sTYE3bXy+qj4+vJq9MtxA+MNtVuuPPSXbMrSvBIpGnofSWA47VmLy+D/F9DP0atnP0yX
 UA66mAegRR1ZY0wDp57Qf+jNXrx6mYC7WP4o0BlI+DpADoARL6DPvQCRNdhARBKk07F9
 gcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771840299; x=1772445099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jZyzh76/vi/WA0Mw21DKfbc+O5VrV1Ds2EV/BZWk6NE=;
 b=EOAzwAh8LwufAFLC5YcVL/nDZg45oQo5iJKtM8BwV0huHqW8Q8OLzlPhiC42erl3b2
 poNlSAwyTLEVc0oSFHbQ3y9ZOGMycleD0f2Qxv3QfszlMxexPNGuyDpk7PAyyC6enLEL
 qK3BNzp4qwCLd3QBZbh0bg5Dt3pIFqXitl3BmslVSAwNUH0hlEuEFI53ojM4N8hPiUVA
 o/QJRcd6Iyo54ZXXSaMVBDvLLTgSkdMsGpVV9MuZiBY8m1Mt8eRAzKteFlnYjYqK6EOA
 E7zgTqyPBW692QkiNKI/B9xKp5jeD76zbTcpHb4Cz3v/VwHzpRMX/NMpExPZJBQAYDI2
 nclQ==
X-Gm-Message-State: AOJu0YwHBZ8DksegPbrHq74/BW+Ar0+S8N74cRWNXdimsc0Re6Wi4GwU
 MnOECFZBET9JECa9YYEc4F5b765NcaDNa4ogsuHzaHWhoqc8Z8iZSPNkV60zqzdr3Kl9/Z8P23n
 HP4uH
X-Gm-Gg: AZuq6aJ3NR9CT4TxedJaqmSUzCltiMuGJpZ8+Bov4GE03GDYuNPCjXLU4mJaR8y33X0
 CbqNNa5UhsNnNdvbFRgcgGTflPtjN7g3KpvgSK+UuZnKfd0ssfCIqjmeYRnlmmgcuYHushDCbrq
 jytne41H3pzaunzVu5/I2tB1VONin153nBx4U3jJU46qB/3/AgHR1HCgazer66cc9eWr2RRMWau
 T33w8ApngeV2OeiKF8EaF2oz1Rz20j+WGkgkK9aOkAkGC6QM47ie/nxslVDvC+8qYUSAIMcnrWJ
 lmTH+5VyhL4+iXIYaey5x4JNG19RuvZWEP65Gjfw6Df0bo6QJ3g+XkKJBnt0GYteVCJSnoFHvA7
 NfzwOAQ9Jri1+VQ/IaEL34HenzmArml1pE4dBqNwcwlxeetJgwbQAz1ZzeAoS4s6JBmyYvU4u4P
 ic6ojnx228RKWgmN9JD10boMSh
X-Received: by 2002:a05:600c:1e1d:b0:483:456a:514b with SMTP id
 5b1f17b1804b1-483a95befe5mr129473145e9.12.1771840299027; 
 Mon, 23 Feb 2026 01:51:39 -0800 (PST)
Received: from localhost ([85.163.81.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31b3e0dsm397848795e9.1.2026.02.23.01.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 01:51:38 -0800 (PST)
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
Subject: [PATCH v2 1/2] dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for
 pre-decrypted memory
Date: Mon, 23 Feb 2026 10:51:35 +0100
Message-ID: <20260223095136.225277-2-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260223095136.225277-1-jiri@resnulli.us>
References: <20260223095136.225277-1-jiri@resnulli.us>
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
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D73251743BE
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

