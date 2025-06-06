Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BB2ACFF9E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 11:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB0710EA0C;
	Fri,  6 Jun 2025 09:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="DZAz/sAs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2696 seconds by postgrey-1.36 at gabe;
 Fri, 06 Jun 2025 09:47:32 UTC
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BD710EA0C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 09:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References;
 bh=B5+6GNo+Kjy0W/tpeCAop2tkJ19hyv2rEwEglFG0DkA=; t=1749203252; x=1750412852; 
 b=DZAz/sAsbPhhZ5Gu50tNEZY8U4DJGi8cM5+dJx6yMbVwoo9JURtHwTRY5BEx7FMmXOvnCarLzFe
 qcP7upVQTi4molq0Cm7weh+GjX4UF3zGzUOG5hxLM/Ahiv3sUS2fJir446ZWiKVyISHno0aTdflke
 Ep5kOwu0KJHcIo/ejoDfl4auyYgY2wqhPSPz8zwoCboDYWqrJg77u0AZFYqadJRUndJjgtn+2SzMv
 KrG31PQiammR5xClWYAAkg+a+wZOUNeOGYYHfnFJYEp2At0ZxWsXxjvp6+YTXtTLOz2S+ojsliPkE
 2wKfdUruoy2eo1aB/7JjiIjYKqXyjdYvpDag==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.98.2) (envelope-from <johannes@sipsolutions.net>)
 id 1uNSxx-00000007YlN-1iap; Fri, 06 Jun 2025 11:02:21 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Antonino Daplas <adaplas@gmail.com>,
 Helge Deller <deller@gmx.de>, Johannes Berg <johannes.berg@intel.com>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] nvidiafb: fix build on 32-bit ARCH=um
Date: Fri,  6 Jun 2025 11:02:19 +0200
Message-ID: <20250606090218.15826-2-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.49.0
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

From: Johannes Berg <johannes.berg@intel.com>

Now that ARCH=um no longer has IO port accesses, this driver
can no longer build as-is. Make the IO port calls not just
conditional on i386 but also !UML.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 drivers/video/fbdev/nvidia/nv_local.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/nvidia/nv_local.h b/drivers/video/fbdev/nvidia/nv_local.h
index 68e508daa417..93aff35305a9 100644
--- a/drivers/video/fbdev/nvidia/nv_local.h
+++ b/drivers/video/fbdev/nvidia/nv_local.h
@@ -80,7 +80,7 @@
      (par)->dmaFree -= ((size) + 1);          \
 }
 
-#if defined(__i386__)
+#if defined(__i386__) && !defined(CONFIG_UML)
 #define _NV_FENCE() outb(0, 0x3D0);
 #else
 #define _NV_FENCE() mb();
-- 
2.49.0

