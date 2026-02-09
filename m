Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLt0Mmv/iWluFQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 16:38:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7781F111F7E
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 16:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA08710E41E;
	Mon,  9 Feb 2026 15:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="HULoymcN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FA110E41B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 15:38:14 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-436309f1ad7so1886356f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 07:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770651493; x=1771256293;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=10eo7Xx3UsXznodXP/t6JgtysFzGllvuxfjnxVYXEzw=;
 b=HULoymcN7dtcuddup6tunDBvPqPvxHikW3601pwmluqHcyGc1zhRKlW3Mx55OZt1LW
 PNQWO24pyX/il7MLcYEpmzKz58W0GZNoeAk99jKQh1GSiA+qFdPEXjJpjgLCCKblgMWj
 sjqubgz6PrMzFGTB991YdpzUwcbZVazyuOceQHx16WtD+hwtBwctLIHXmmseBS6lr+s5
 OOhZdwA+mh7jIg3ei2LXwIs9fRQRh7lAQYxzjbzFzu47JhR84hjAmDTj9sIaiarvNvKQ
 KGXg9TJgOBgg+PHJtlDwb7BQLATJV1VbETHuIEPEYQknO9FBBGLr5X5/fYqVYBjKEMbw
 9AdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770651493; x=1771256293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=10eo7Xx3UsXznodXP/t6JgtysFzGllvuxfjnxVYXEzw=;
 b=Jv4sK4DNYv1++UPWZ3AovtqB3R2emEJBdTobM8hsOmN8neX66cgjPPn30uTv697EwI
 QMU13wTkUiIvBYzdHiiXxMENLPOzQoYR+MertVw7e26ysiD6TwDTpiNKS6dPrnAe6MfZ
 Fnrk82kH6brPiNZCFm0kGAiVgA+8W4wEN2EgMSL/f2zRBbVDFsrFf1y36hbFXSLLcZ7P
 kCuTnQwHlD9x1WRo7KlW4GEoKpbFzm5x54c78QI1R5z6jPdXvvp4Vpcqr+QcPMx6Io1o
 NwbSPRBThy3XN/je0A0AF7S0KyVqfZrkJztzBDIfQXhQIXnugDdoSMvkd3VVc11jBFGd
 q5Qw==
X-Gm-Message-State: AOJu0YywUclXU0ra6l0T1eOFxik342AexlwJztycXuX/sRArVFnNA4IL
 iVFZfo47QmBg+I5C1BbderbrdIV2ExMvVOrBbWEltiYfKy/+sCkl6Kj8SUbBbSw62OY6L53v3dV
 ATb1s
X-Gm-Gg: AZuq6aJaDAiQKzFusu5Z1DkhQ5gPdhjUwtEoPvQeH6TOEtrceVeeUnLp38jDUBik6rq
 6xw30gCKbmeLXplktfzM/DuScsHBnDxMVe/hCn1NR6ifZNokZMjebSFNNkCvvh7fsjYKgjZbsdC
 ObLp9mMjCcJHG4jLWTIZ7rmjEFHNePrMAAdEkWxrbZo1UrIBpQ1MUDPr4InJxMoZ6TQ/v34wCat
 K/0M/K54izRR6EOoPy0IlwiHyzE3+1vJ9//aMEuhiK+rWFdWwkN7KX6wxwCzSNeDlelsSC7h4yl
 RAZnm8PvfW+rsP6y6gHSilPgdLt2D8N1cgEL1fB7z2ieGGJ/KLzbTB4JUBtJo3Tyz8+xv7Vi3V4
 AULUJuQPXwNv8Ar57O5zYijr+hrEewCkB3QexibLGOquSBFv7HmQpIIADsThz8krMh8mVA8KgHZ
 19/w==
X-Received: by 2002:a05:6000:4211:b0:435:b755:c67e with SMTP id
 ffacd0b85a97d-4362938a453mr16934813f8f.49.1770651492550; 
 Mon, 09 Feb 2026 07:38:12 -0800 (PST)
Received: from localhost ([85.163.81.98]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296bd4a1sm27481147f8f.17.2026.02.09.07.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 07:38:12 -0800 (PST)
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
Subject: [PATCH 2/5] dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for
 pre-decrypted memory
Date: Mon,  9 Feb 2026 16:38:06 +0100
Message-ID: <20260209153809.250835-3-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260209153809.250835-1-jiri@resnulli.us>
References: <20260209153809.250835-1-jiri@resnulli.us>
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[resnulli.us:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 7781F111F7E
X-Rspamd-Action: no action

From: Jiri Pirko <jiri@nvidia.com>

This is only relevant inside confidential computing (CoCo) virtual
machines, not on the hypervisor side.

Current CoCo designs don't place a vIOMMU in front of untrusted devices.
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
 include/linux/dma-mapping.h |  7 +++++++
 include/trace/events/dma.h  |  3 ++-
 kernel/dma/direct.h         | 14 +++++++++++---
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index aa36a0d1d9df..052235feb853 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -78,6 +78,13 @@
  */
 #define DMA_ATTR_MMIO		(1UL << 10)
 
+/*
+ * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
+ * (shared) for confidential computing guests. The caller must have
+ * called set_memory_decrypted(). A struct page is required.
+ */
+#define DMA_ATTR_CC_DECRYPTED	(1UL << 11)
+
 /*
  * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
  * be given to a device to use as a DMA source or target.  It is specific to a
diff --git a/include/trace/events/dma.h b/include/trace/events/dma.h
index b3fef140ae15..b3c2cee8841a 100644
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
index 62f0d9d0ba02..ae5bc1919e1c 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -87,16 +87,24 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
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

