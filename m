Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6071125F42
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3996EB03;
	Thu, 19 Dec 2019 10:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CF06EB03
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:37:20 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27F7AE3B;
 Thu, 19 Dec 2019 11:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576751838;
 bh=KI+4z8RAj9hiMjLA6cBPoppMaXInsK17FOoGVi1AOuc=;
 h=From:To:Cc:Subject:Date:From;
 b=ewfFghggkuA7KkFRmibyUVadfnfHLhd46A1ai//iBLBw5MMd9IXeDA0VQ56nYn4dk
 o3FeykrXsLgH/+9E2nO/L/J47nAUJTvoc/xLCIZlUsuqMFy3pUcRqDrhb4NfkDae7p
 jwHuXQdIcHPbCuOAMRVAEf+lskNYRUmnLO9RnDxc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: of: Fix linking when CONFIG_OF is not set
Date: Thu, 19 Dec 2019 12:37:03 +0200
Message-Id: <20191219103703.8547-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new helper drm_of_lvds_get_dual_link_pixel_order() introduced in
commit 6529007522de has a fallback stub when CONFIG_OF is not set, but
the stub is declared in drm_of.h without a static inline. This causes
multiple definitions of the function to be linked when the CONFIG_OF
option isn't set. Fix it by making the stub static inline.

Fixes: 6529007522de ("drm: of: Add drm_of_lvds_get_dual_link_pixel_order")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
This fixes a link error in drm-next. Daniel, Dave, would you like to
apply the patch directly ?

 include/drm/drm_of.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 8ec7ca6d2369..b9b093add92e 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -92,8 +92,9 @@ static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
 	return -EINVAL;
 }
 
-int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
-					  const struct device_node *port2)
+static inline int
+drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
+				      const struct device_node *port2)
 {
 	return -EINVAL;
 }
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
