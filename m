Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 572EE27C331
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 13:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50CFC89C28;
	Tue, 29 Sep 2020 11:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF8A89C28
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 11:05:24 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B9AC5221E8;
 Tue, 29 Sep 2020 11:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601377524;
 bh=5LskZOh2pD9zg+8IVR0T9t1IBdkFEYbOnCrQ+2yn3kE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hxibLj5+1UeQgJ/9HU+knOUxLMOXCRWBsX3cU3S1GzKosf+Qfu7jU/49C32Vw/9u5
 TYPsyqPSL93bW1IEXKL19s34EexF/rBRHulo+d0EvnMjKXTLo5ToayH1XZ04ewAS3f
 r8qJO+5B0b4fJx55QqC/NAY9nyqzHbg5FIxuQthA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4.4 36/85] drm/omap: fix possible object reference leak
Date: Tue, 29 Sep 2020 13:00:03 +0200
Message-Id: <20200929105930.038056887@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929105928.198942536@linuxfoundation.org>
References: <20200929105928.198942536@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mukesh Ojha <mojha@codeaurora.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, stable@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Wen Yang <wen.yang99@zte.com.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wen Yang <wen.yang99@zte.com.cn>

[ Upstream commit 47340e46f34a3b1d80e40b43ae3d7a8da34a3541 ]

The call to of_find_matching_node returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:212:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 209, but without a corresponding object release within this function.
drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:237:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 209, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: Markus Elfring <Markus.Elfring@web.de>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Link: https://patchwork.freedesktop.org/patch/msgid/1554692313-28882-2-git-send-email-wen.yang99@zte.com.cn
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/omap2/dss/omapdss-boot-init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/dss/omapdss-boot-init.c b/drivers/video/fbdev/omap2/dss/omapdss-boot-init.c
index 8b6f6d5fdd68b..43186fa8a13c9 100644
--- a/drivers/video/fbdev/omap2/dss/omapdss-boot-init.c
+++ b/drivers/video/fbdev/omap2/dss/omapdss-boot-init.c
@@ -194,7 +194,7 @@ static int __init omapdss_boot_init(void)
 	dss = of_find_matching_node(NULL, omapdss_of_match);
 
 	if (dss == NULL || !of_device_is_available(dss))
-		return 0;
+		goto put_node;
 
 	omapdss_walk_device(dss, true);
 
@@ -221,6 +221,8 @@ static int __init omapdss_boot_init(void)
 		kfree(n);
 	}
 
+put_node:
+	of_node_put(dss);
 	return 0;
 }
 
-- 
2.25.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
