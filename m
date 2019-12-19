Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 472B6125FA8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010A56EB18;
	Thu, 19 Dec 2019 10:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A096EB04
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:45:54 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2F161313;
 Thu, 19 Dec 2019 11:45:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752353;
 bh=R1cS/iBmrHEn0aBmLAym8zwxzXeDF4Q8czMI4UpL9Ig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R2pjhT2pWcUtZ4sD++fHd0vU7dI/xJ+C5mLvbORq9C6bAzoFV7Lb3aVfyayfaN/GJ
 lFK/bY0ye33twMR5M2H6HsuLie8zfFK+RKkFUm7rkq3uV97tVRV7ZZehxrGpFK0dez
 h5yG8bssXR4LDFI0sx5bb/i3xO9f92hapxsivzVM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 17/51] drm/omap: Fix possible object reference leak
Date: Thu, 19 Dec 2019 12:44:48 +0200
Message-Id: <20191219104522.9379-18-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
References: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Wen Yang <wen.yang99@zte.com.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wen Yang <wen.yang99@zte.com.cn>

The call to of_find_matching_node returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:212:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 209, but without a corresponding object release within this function.
drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:237:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 209, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
index 31502857f013..ce67891eedd4 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
@@ -192,7 +192,7 @@ static int __init omapdss_boot_init(void)
 	dss = of_find_matching_node(NULL, omapdss_of_match);
 
 	if (dss == NULL || !of_device_is_available(dss))
-		return 0;
+		goto put_node;
 
 	omapdss_walk_device(dss, true);
 
@@ -217,6 +217,8 @@ static int __init omapdss_boot_init(void)
 		kfree(n);
 	}
 
+put_node:
+	of_node_put(dss);
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
