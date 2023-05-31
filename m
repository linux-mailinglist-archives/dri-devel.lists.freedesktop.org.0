Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D96718284
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 15:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F130F10E4D5;
	Wed, 31 May 2023 13:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FF410E4D5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 13:43:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B899C63B05;
 Wed, 31 May 2023 13:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AEABC4339B;
 Wed, 31 May 2023 13:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685540626;
 bh=awNbbUrZKfXcgaKH6JhIK8hfjJtLZGaowOiSziy/Zt0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ar4pY7unJHLUqcosybnLa5sNKYyDkm+3YwSzVSsR7EC3Uax/8YJSYnpXjfwQ40Y/M
 WK2T/fuzLFPY80dGSQRztJd/EWmvHHQrl3PsGmJVH1K7OuEdZRDfGtlHN6y9vWS8G6
 KeplUwPdjvu5OebWfrTVHT97YUp+Hx66ItfJ/3vVuXOMjt7bIf0xkkqLXtJGXrVaei
 6Yg3NfwI7QIQCpyZTcX5aUlejNCh4eTuQfyuSocTWw7eiL21Ki2H9HtAgZM4hfeALh
 sImN5/h+VucLipG4Ig5x8ym3awPGbryB3iIou0L51LwGRWvQQ+WkaWQ+97V9ozcy/n
 m9uwGor8I2g9w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 16/24] parisc: Flush gatt writes and adjust gatt
 mask in parisc_agp_mask_memory()
Date: Wed, 31 May 2023 09:43:12 -0400
Message-Id: <20230531134320.3384102-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531134320.3384102-1-sashal@kernel.org>
References: <20230531134320.3384102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 James.Bottomley@HansenPartnership.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Helge Deller <deller@gmx.de>

[ Upstream commit d703797380c540bbeac03f104ebcfc364eaf47cc ]

Flush caches after changing gatt entries and calculate entry according
to SBA requirements.

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/char/agp/parisc-agp.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/char/agp/parisc-agp.c b/drivers/char/agp/parisc-agp.c
index d68d05d5d3838..514f9f287a781 100644
--- a/drivers/char/agp/parisc-agp.c
+++ b/drivers/char/agp/parisc-agp.c
@@ -90,6 +90,9 @@ parisc_agp_tlbflush(struct agp_memory *mem)
 {
 	struct _parisc_agp_info *info = &parisc_agp_info;
 
+	/* force fdc ops to be visible to IOMMU */
+	asm_io_sync();
+
 	writeq(info->gart_base | ilog2(info->gart_size), info->ioc_regs+IOC_PCOM);
 	readq(info->ioc_regs+IOC_PCOM);	/* flush */
 }
@@ -158,6 +161,7 @@ parisc_agp_insert_memory(struct agp_memory *mem, off_t pg_start, int type)
 			info->gatt[j] =
 				parisc_agp_mask_memory(agp_bridge,
 					paddr, type);
+			asm_io_fdc(&info->gatt[j]);
 		}
 	}
 
@@ -191,7 +195,16 @@ static unsigned long
 parisc_agp_mask_memory(struct agp_bridge_data *bridge, dma_addr_t addr,
 		       int type)
 {
-	return SBA_PDIR_VALID_BIT | addr;
+	unsigned ci;			/* coherent index */
+	dma_addr_t pa;
+
+	pa = addr & IOVP_MASK;
+	asm("lci 0(%1), %0" : "=r" (ci) : "r" (phys_to_virt(pa)));
+
+	pa |= (ci >> PAGE_SHIFT) & 0xff;/* move CI (8 bits) into lowest byte */
+	pa |= SBA_PDIR_VALID_BIT;	/* set "valid" bit */
+
+	return cpu_to_le64(pa);
 }
 
 static void
-- 
2.39.2

