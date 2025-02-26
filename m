Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416ACA469C6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 19:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996C610E9AB;
	Wed, 26 Feb 2025 18:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="c3E8mzj3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D26210E216
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 18:31:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1740594662; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Q2BWvuDK91v5pAYlhgQ3R68ijrVK7tp6x9GZ1Q/tg59cnU8I2ISurwv36gMbJm90cq4/TurUVk42dvCng+W+z9fe8cT2/lQeg60kKwXTBWGUVr3YmKVLVUmCDC23ZH75Mp9ukF+Gm62EzzOrJA9ZVfyixBoXPcUT+yaaxOMbdAc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1740594662;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=spHL9DChNsuSuJujNgDcb0Loo1Px9GacjVAT9YjIB/U=; 
 b=jrZ8RTHjNVau5iF/di6DVQjO1X4n6s0HlPjZRVKBeXergR8Fio35bmkD2ZbigMlkyGVP4yV3Ze0YyrznGpqjVhWdAVENEu7/Ej23RPvdKCtZVHQxVOMTxbkvWctl7cWn4P65wN2K9DCJDld2b8TT3XjKewhy9PKcyxMD6bnP8BQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740594662; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=spHL9DChNsuSuJujNgDcb0Loo1Px9GacjVAT9YjIB/U=;
 b=c3E8mzj3Ngexvafdh6DfpgeMOnyQxQpzv/c0J4CywtAhcSVEW/n+z/OJAmy/b65I
 bizeV+2vlerIoY8oPNX7UuxfpQkAMBe9zN3Tack0CZHk4714Kho1lbEhulrw5u8Ehdd
 NnWumHzFFGfTlKOXW2vlNXwcrgMdPjXzbLmETYVg=
Received: by mx.zohomail.com with SMTPS id 174059465987479.41071816976432;
 Wed, 26 Feb 2025 10:30:59 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [RFC PATCH 2/4] drm/panfrost: Split LPAE MMU TRANSTAB register values
Date: Wed, 26 Feb 2025 15:30:41 -0300
Message-ID: <20250226183043.140773-3-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250226183043.140773-1-ariel.dalessandro@collabora.com>
References: <20250226183043.140773-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

The TRANSTAB (Translation table base address) layout is different
depending on the legacy mode configuration.

Currently, the defined values apply to the legacy mode. Let's rename
them so we can add the ones for no-legacy mode.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_regs.h | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index b5f279a19a08..4e6064d5feaa 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -317,14 +317,19 @@
 #define MMU_AS_STRIDE			(1 << MMU_AS_SHIFT)
 
 /*
- * Begin LPAE MMU TRANSTAB register values
+ * Begin LPAE MMU TRANSTAB register values (legacy mode)
  */
-#define AS_TRANSTAB_LPAE_ADDR_SPACE_MASK	0xfffffffffffff000
-#define AS_TRANSTAB_LPAE_ADRMODE_IDENTITY	0x2
-#define AS_TRANSTAB_LPAE_ADRMODE_TABLE		0x3
-#define AS_TRANSTAB_LPAE_ADRMODE_MASK		0x3
-#define AS_TRANSTAB_LPAE_READ_INNER		BIT(2)
-#define AS_TRANSTAB_LPAE_SHARE_OUTER		BIT(4)
+#define AS_TRANSTAB_LEGACY_ADDR_SPACE_MASK	0xfffffffffffff000
+#define AS_TRANSTAB_LEGACY_ADRMODE_IDENTITY	0x2
+#define AS_TRANSTAB_LEGACY_ADRMODE_TABLE	0x3
+#define AS_TRANSTAB_LEGACY_ADRMODE_MASK		0x3
+#define AS_TRANSTAB_LEGACY_READ_INNER		BIT(2)
+#define AS_TRANSTAB_LEGACY_SHARE_OUTER		BIT(4)
+
+/*
+ * Begin LPAE MMU TRANSTAB register values (no-legacy mode)
+ */
+#define AS_TRANSTAB_LPAE_ADDR_SPACE_MASK	0xfffffffffffffff0
 
 #define AS_STATUS_AS_ACTIVE			0x01
 
-- 
2.47.2

