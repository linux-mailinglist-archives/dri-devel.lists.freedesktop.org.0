Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB01F496BB9
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 11:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3487510EA88;
	Sat, 22 Jan 2022 10:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1357 seconds by postgrey-1.36 at gabe;
 Sat, 22 Jan 2022 08:41:58 UTC
Received: from zappa.azrackspace.net (zappa.azrackspace.net
 [IPv6:2602:41:65b8:d100:0:5a:4150:5041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E1510E339;
 Sat, 22 Jan 2022 08:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=glowingmonkey.org; s=default; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:To:From:References:In-Reply-To:Content-Type;
 bh=YUhLV1TxOoojK02NbEFT1+1m1Eg+U9q+F0pj/Qb+75g=; b=zFEJw97zWLVytLmp7e7HZ+zuLl
 4cbgGbqJDGpUMhqISODYLuYvDM23vG2LM1RkipRLkkRHngxQXEa1mlVlXyFYNHFXPRBpnm12zbCeD
 g/y1WmJW6aq8E5LyyJw+PxgWe;
Received: from localhost ([127.0.0.1])
 by zappa.azrackspace.net with esmtp (Exim 4.92)
 (envelope-from <github@glowingmonkey.org>)
 id 1nBBcF-0000vO-Kv; Sat, 22 Jan 2022 01:19:19 -0700
X-Virus-Scanned: Debian amavisd-new at zappa.azrackspace.net
X-Spam-Flag: NO
X-Spam-Score: -1
X-Spam-Level: 
X-Spam-Status: No, score=-1 tagged_above=-100 required=6.31
 tests=[ALL_TRUSTED=-1] autolearn=disabled
Received: from zappa.azrackspace.net ([IPv6:::1])
 by localhost (zappa.azrackspace.net [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id LLWHomNwZY_P; Sat, 22 Jan 2022 01:19:19 -0700 (MST)
Received: from [2001:579:83b8:2b90:644c:afff:feec:42cc] (helo=mythbob.gm)
 by zappa.azrackspace.net with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <github@glowingmonkey.org>)
 id 1nBBcE-0000uJ-Qz; Sat, 22 Jan 2022 01:19:18 -0700
From: Nick Lopez <github@glowingmonkey.org>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: fix off by one in BIOS boundry checking
Date: Sat, 22 Jan 2022 01:19:06 -0700
Message-Id: <20220122081906.2633061-1-github@glowingmonkey.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Jan 2022 10:44:23 +0000
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
Cc: Nick Lopez <github@glowingmonkey.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bounds checking when parsing init scripts embedded in the BIOS reject
access to the last byte. This causes driver initialization to fail on
Apple eMac's with GeForce 2 MX GPUs, leaving the system with no working
console.

This is probably only seen on OpenFirmware machines like PowerPC Macs
because the BIOS image provides by OF is only the used parts of the ROM,
not a power-of-two blocks read from PCI directly so PCs always have
empty bytes at the end that are never accesseed.

Signed-off-by: Nick Lopez <github@glowingmonkey.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
index d0f52d59fc2f..64e423dddd9e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
@@ -38,7 +38,7 @@ nvbios_addr(struct nvkm_bios *bios, u32 *addr, u8 size)
 		*addr += bios->imaged_addr;
 	}
 
-	if (unlikely(*addr + size >= bios->size)) {
+	if (unlikely(*addr + size > bios->size)) {
 		nvkm_error(&bios->subdev, "OOB %d %08x %08x\n", size, p, *addr);
 		return false;
 	}
-- 
2.30.2

