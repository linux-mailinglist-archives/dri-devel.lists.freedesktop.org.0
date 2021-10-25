Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01751438D4F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 03:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EBC899C4;
	Mon, 25 Oct 2021 01:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D191899C4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 01:54:05 +0000 (UTC)
Received: from dggeme755-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HcydP53Rfz8tt5;
 Mon, 25 Oct 2021 09:52:41 +0800 (CST)
Received: from huawei.com (10.67.174.47) by dggeme755-chm.china.huawei.com
 (10.3.19.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Mon, 25
 Oct 2021 09:54:00 +0800
From: He Ying <heying24@huawei.com>
To: <hjc@rock-chips.com>, <heiko@sntech.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <seanpaul@chromium.org>, <gustavo.padovan@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm: Fix wrong use of connector in vop_get_edp_connector
Date: Sun, 24 Oct 2021 21:55:50 -0400
Message-ID: <20211025015550.66500-1-heying24@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.47]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme755-chm.china.huawei.com (10.3.19.101)
X-CFilter-Loop: Reflected
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

From the comments of drm_for_each_connector_iter(), we know
that "connector is only valid within the list body, if you
want to use connector after calling drm_connector_list_iter_end()
then you need to grab your own reference first using
drm_connector_get()". So fix the wrong use of connector
according to the comments and then call drm_connector_put()
after using connector finishes.

Signed-off-by: He Ying <heying24@huawei.com>
Fixes: 2cbeb64f6c70 ("drm/rockchip: use drm_for_each_connector_iter()")
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index a25b98b7f5bd..469922ad29fa 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1581,19 +1581,19 @@ static void vop_crtc_reset(struct drm_crtc *crtc)
 #ifdef CONFIG_DRM_ANALOGIX_DP
 static struct drm_connector *vop_get_edp_connector(struct vop *vop)
 {
-	struct drm_connector *connector;
+	struct drm_connector *connector = NULL;
 	struct drm_connector_list_iter conn_iter;
 
 	drm_connector_list_iter_begin(vop->drm_dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
 		if (connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
-			drm_connector_list_iter_end(&conn_iter);
-			return connector;
+			drm_connector_get(connector);
+			break;
 		}
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
-	return NULL;
+	return connector;
 }
 
 static int vop_crtc_set_crc_source(struct drm_crtc *crtc,
@@ -1614,6 +1614,7 @@ static int vop_crtc_set_crc_source(struct drm_crtc *crtc,
 	else
 		ret = -EINVAL;
 
+	drm_connector_put(connector);
 	return ret;
 }
 
-- 
2.17.1

