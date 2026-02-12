Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLvVEuwujWk/zwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 02:37:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62CA129012
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 02:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EB110E6B5;
	Thu, 12 Feb 2026 01:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="SCW+phRR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8747210E6B4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 01:37:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770860259; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ACyV2YKqSlEP/4oYN3u8nHUlhCn47HvoeJ7ytz2vQaPBfcy5HNwI9vzwZs33M8Xt548CDvuD6LT2VGOwyHWNXZUc+iUm/GcKgiUijo/BfjSjxRv0fTQFqnkYk0U77fShoyxlkJGPxqkPebf2ZJlQrt259CT6e4mGF882mCaeakY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770860259;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=CWm37nCtUD/jg5RR68zFHxZO+Vn5ZYwP9UJe7FtREtA=; 
 b=AXFPAWkliKrevws3f5ze9vwiPWTKWaxr97vSIMbouYhIh03/IUVGgZxnE92daRI+PYpGxRu4qWp79WqJZUiZpTfGaLMhyGNtAxRKK0tJhbtlNBha16hPO/oYUppjXQyOM5aB+Lld2GzSljSFiRL3KgxPfEAJq9FRf5mMCpTgt/Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770860259; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=CWm37nCtUD/jg5RR68zFHxZO+Vn5ZYwP9UJe7FtREtA=;
 b=SCW+phRRx+PV5CfZfDWWPDCcY+o/tTvB90z6nDPvZU93szSf3blDso0mcb4DOaqw
 41tEz+UfJCd/mZXJs7tO/VObrHFJxuGEaNSmJ2zft3idyFqUFVkWyRzRS61oB/VnFc2
 husF8lxfPz5de5viFymrcpJ801S1jmg/zeqg8Z4I=
Received: by mx.zohomail.com with SMTPS id 1770860258119770.7608444313937;
 Wed, 11 Feb 2026 17:37:38 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, beata.michalska@arm.com, lyude@redhat.com,
 Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 04/12] drm/tyr: set DMA mask using GPU physical address
Date: Wed, 11 Feb 2026 17:37:05 -0800
Message-ID: <20260212013713.304343-5-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212013713.304343-1-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A62CA129012
X-Rspamd-Action: no action

From: Beata Michalska <beata.michalska@arm.com>

Configure the device DMA mask during probe using the GPU's physical
address capability reported in GpuInfo. This ensures DMA allocations
use an appropriate address mask.

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs | 11 +++++++++++
 drivers/gpu/drm/tyr/gpu.rs    |  1 -
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index e5eae5a73371..2973a8b3cc09 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -11,6 +11,10 @@
         Device, //
     },
     devres::Devres,
+    dma::{
+        Device as DmaDevice,
+        DmaMask, //
+    },
     drm,
     drm::{
         driver::Registration,
@@ -134,6 +138,13 @@ fn probe(
         let gpu_info = GpuInfo::new(pdev.as_ref(), &iomem)?;
         gpu_info.log(pdev);
 
+        // SAFETY: No concurrent DMA allocations or mappings can be made because
+        // the device is still being probed and therefore isn't being used by
+        // other threads of execution.
+        unsafe {
+            pdev.dma_set_mask_and_coherent(DmaMask::try_new(gpu_info.pa_bits())?)?;
+        }
+
         let uninit_ddev = UnregisteredDevice::<TyrDrmDriver>::new(pdev.as_ref())?;
         let platform: ARef<platform::Device> = pdev.into();
 
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index affca5b0dc6c..b5f11bc96fa0 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -141,7 +141,6 @@ pub(crate) fn va_bits(&self) -> u32 {
     }
 
     /// Returns the number of physical address bits supported by the GPU.
-    #[expect(dead_code)]
     pub(crate) fn pa_bits(&self) -> u32 {
         (self.mmu_features >> 8) & genmask_u32(0..=7)
     }
-- 
2.52.0

