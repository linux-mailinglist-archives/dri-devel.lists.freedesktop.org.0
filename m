Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06939965895
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 09:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DB910E83B;
	Fri, 30 Aug 2024 07:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E202710E83B
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 07:32:03 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Ww8wf1cSVz1S9VF;
 Fri, 30 Aug 2024 15:31:46 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 844751A0188;
 Fri, 30 Aug 2024 15:32:00 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 30 Aug
 2024 15:32:00 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2] drm: of: Use for_each_child_of_node_scoped()
Date: Fri, 30 Aug 2024 15:40:09 +0800
Message-ID: <20240830074009.3539757-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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

Avoids the need for manual cleanup of_node_put() in early exits
from the loop.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Split out from the PATCH set.
---
 drivers/gpu/drm/drm_of.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 177b600895d3..41d9288c97a7 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -304,10 +304,9 @@ static int drm_of_lvds_get_port_pixels_type(struct device_node *port_node)
 static int drm_of_lvds_get_remote_pixels_type(
 			const struct device_node *port_node)
 {
-	struct device_node *endpoint = NULL;
 	int pixels_type = -EPIPE;
 
-	for_each_child_of_node(port_node, endpoint) {
+	for_each_child_of_node_scoped(port_node, endpoint) {
 		struct device_node *remote_port;
 		int current_pt;
 
@@ -315,10 +314,8 @@ static int drm_of_lvds_get_remote_pixels_type(
 			continue;
 
 		remote_port = of_graph_get_remote_port(endpoint);
-		if (!remote_port) {
-			of_node_put(endpoint);
+		if (!remote_port)
 			return -EPIPE;
-		}
 
 		current_pt = drm_of_lvds_get_port_pixels_type(remote_port);
 		of_node_put(remote_port);
@@ -332,10 +329,8 @@ static int drm_of_lvds_get_remote_pixels_type(
 		 * configurations by passing the endpoints explicitly to
 		 * drm_of_lvds_get_dual_link_pixel_order().
 		 */
-		if (!current_pt || pixels_type != current_pt) {
-			of_node_put(endpoint);
+		if (!current_pt || pixels_type != current_pt)
 			return -EINVAL;
-		}
 	}
 
 	return pixels_type;
-- 
2.34.1

