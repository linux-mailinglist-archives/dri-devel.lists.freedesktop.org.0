Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76854B2B940
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 08:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B861110E52B;
	Tue, 19 Aug 2025 06:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="muHF6STs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB5E10E4BD
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 19:01:13 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IEtnB4030306;
 Mon, 18 Aug 2025 19:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=corp-2025-04-25; bh=9mI0l
 FKwyp53gFKvviW08JnOdUm+IPOCrtiJ8Jlz3H8=; b=muHF6STsct0UGkBKdb0Ha
 7/CK2ZUNwlvGcGEOxoWNFpvR8GEK2auA6Oo+5wBVpdPNlS37AdzNqzX+XaaQeyls
 DX8kffGZ6lWu0ueFzIz1gByLnAFWvRltm0mCr4VQrXaawuS/XshUeGH39g0eplAh
 cIxcXlw8xbmMr63CZslbLp2djFeflPe3odJmrUEx2n8K8V5VjrdXKpHtNCQ29h6Z
 Q9ETv5uijPQCLeeN1Oarjm+rs3/woO8MqtkcaHIgls9Qo3OlHNpojyk/Ut+tunU8
 yexCOcLswNDMP2iOE9JeCbH/xd0r3rufEPsAgjfOOeWOZLMeUzRM560E6IRTlBCg
 A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48jj1e3tth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Aug 2025 19:01:06 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 57IICQcg016749; Mon, 18 Aug 2025 19:01:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 48jge9d87n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Aug 2025 19:01:05 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57IJ0sZf035076;
 Mon, 18 Aug 2025 19:01:04 GMT
Received: from sidhakum-ubuntu.osdevelopmeniad.oraclevcn.com
 (sidhakum-ubuntu.allregionaliads.osdevelopmeniad.oraclevcn.com
 [100.100.250.108])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 48jge9d7p3-7; Mon, 18 Aug 2025 19:01:04 +0000
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, willy@infradead.org,
 sidhartha.kumar@oracle.com
Subject: [PATCH 6/6] drm: Convert tile_idr to XArray
Date: Mon, 18 Aug 2025 19:00:46 +0000
Message-ID: <20250818190046.157962-7-sidhartha.kumar@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818190046.157962-1-sidhartha.kumar@oracle.com>
References: <20250818190046.157962-1-sidhartha.kumar@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508180177
X-Proofpoint-GUID: 53vPTNC4LRGXFiS6C5lLqIIujzul0BQp
X-Authority-Analysis: v=2.4 cv=dN2mmPZb c=1 sm=1 tr=0 ts=68a37872 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=2OwXVqhp2XgA:10 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=EcGSMKKx8drgTz_rwpoA:9
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE3OCBTYWx0ZWRfXwFdeX1dny7Q4
 pLdT2+Oe0Pt5D4+zk4gvcs6YWqS9pc+G9fTC5MHmbc6syLXtmXx5LnDXfl2VA6I1DEMtTFN7Q13
 ozy2t3MGpGfzGfKFIUWUZW1pWLnhyTQKIUwY5LenkVS1Gqtb792+S+CPMFb3gHv5jXi0/jTTy2v
 pfmcXQ1h0e/3fTBDf1wZQKmx+P8Zqt93Z7NzrYmc+iURAOXXEr1NvNHvoy+qJULh0rGonysiWjU
 lKs5Qz7H/bGxWqzJo9y8VcgdbhF9ZF9r/Edmr8PdJTYLxm0KZ4lEzfg84XcnkgTVPmLsENYKFx7
 jg86QPcQZ45cjfp2B0yGh3EzUAHF9ZacOve8Ko7keTJjJ8/TlqZAgDYIHX1MgAdg6HR2USwIp4Z
 VqIcNT8wyb31XF8OSWxLx3J33YubzYWLwdB+73g6T+WrZMJveYa5wmbikia41/wZypPu6ZpH
X-Proofpoint-ORIG-GUID: 53vPTNC4LRGXFiS6C5lLqIIujzul0BQp
X-Mailman-Approved-At: Tue, 19 Aug 2025 06:15:29 +0000
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

From: Matthew Wilcox <willy@infradead.org>

Convert tile_idr to an Xarray.

Signed-off-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
---
 drivers/gpu/drm/drm_connector.c   | 26 ++++++++++----------------
 drivers/gpu/drm/drm_mode_config.c |  3 +--
 include/drm/drm_mode_config.h     | 12 ++++++------
 3 files changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 48b08c9611a7..91cfe06ca199 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3489,9 +3489,7 @@ static void drm_tile_group_free(struct kref *kref)
 	struct drm_tile_group *tg = container_of(kref, struct drm_tile_group, refcount);
 	struct drm_device *dev = tg->dev;
 
-	mutex_lock(&dev->mode_config.idr_mutex);
-	idr_remove(&dev->mode_config.tile_idr, tg->id);
-	mutex_unlock(&dev->mode_config.idr_mutex);
+	xa_erase(&dev->mode_config.tiles, tg->id);
 	kfree(tg);
 }
 
@@ -3523,19 +3521,18 @@ struct drm_tile_group *drm_mode_get_tile_group(struct drm_device *dev,
 					       const char topology[8])
 {
 	struct drm_tile_group *tg;
-	int id;
+	unsigned long id;
 
-	mutex_lock(&dev->mode_config.idr_mutex);
-	idr_for_each_entry(&dev->mode_config.tile_idr, tg, id) {
+	xa_lock(&dev->mode_config.tiles);
+	xa_for_each(&dev->mode_config.tiles, id, tg) {
 		if (!memcmp(tg->group_data, topology, 8)) {
 			if (!kref_get_unless_zero(&tg->refcount))
 				tg = NULL;
-			mutex_unlock(&dev->mode_config.idr_mutex);
-			return tg;
+			break;
 		}
 	}
-	mutex_unlock(&dev->mode_config.idr_mutex);
-	return NULL;
+	xa_unlock(&dev->mode_config.tiles);
+	return tg;
 }
 EXPORT_SYMBOL(drm_mode_get_tile_group);
 
@@ -3564,16 +3561,13 @@ struct drm_tile_group *drm_mode_create_tile_group(struct drm_device *dev,
 	memcpy(tg->group_data, topology, 8);
 	tg->dev = dev;
 
-	mutex_lock(&dev->mode_config.idr_mutex);
-	ret = idr_alloc(&dev->mode_config.tile_idr, tg, 1, 0, GFP_KERNEL);
-	if (ret >= 0) {
-		tg->id = ret;
-	} else {
+	ret = xa_alloc(&dev->mode_config.tiles, &tg->id, tg, xa_limit_32b,
+			GFP_KERNEL);
+	if (ret < 0) {
 		kfree(tg);
 		tg = NULL;
 	}
 
-	mutex_unlock(&dev->mode_config.idr_mutex);
 	return tg;
 }
 EXPORT_SYMBOL(drm_mode_create_tile_group);
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index b4239fd04e9d..c3d1a6d81bc7 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -438,7 +438,7 @@ int drmm_mode_config_init(struct drm_device *dev)
 	INIT_LIST_HEAD(&dev->mode_config.plane_list);
 	INIT_LIST_HEAD(&dev->mode_config.privobj_list);
 	idr_init_base(&dev->mode_config.object_idr, 1);
-	idr_init_base(&dev->mode_config.tile_idr, 1);
+	xa_init_flags(&dev->mode_config.tiles, XA_FLAGS_ALLOC1);
 	ida_init(&dev->mode_config.connector_ida);
 	spin_lock_init(&dev->mode_config.connector_list_lock);
 
@@ -577,7 +577,6 @@ void drm_mode_config_cleanup(struct drm_device *dev)
 	}
 
 	ida_destroy(&dev->mode_config.connector_ida);
-	idr_destroy(&dev->mode_config.tile_idr);
 	idr_destroy(&dev->mode_config.object_idr);
 	drm_modeset_lock_fini(&dev->mode_config.connection_mutex);
 }
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 9e524b51a001..8412013914d9 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -392,8 +392,8 @@ struct drm_mode_config {
 	/**
 	 * @idr_mutex:
 	 *
-	 * Mutex for KMS ID allocation and management. Protects both @object_idr
-	 * and @tile_idr.
+	 * Mutex for KMS ID allocation and management. Protects the
+	 * objects in @object_idr.
 	 */
 	struct mutex idr_mutex;
 
@@ -406,12 +406,12 @@ struct drm_mode_config {
 	struct idr object_idr;
 
 	/**
-	 * @tile_idr:
+	 * @tiles:
 	 *
-	 * Use this idr for allocating new IDs for tiled sinks like use in some
-	 * high-res DP MST screens.
+	 * Use this for allocating new IDs for tiled sinks like those
+	 * used in some high-res DP MST screens.
 	 */
-	struct idr tile_idr;
+	struct xarray tiles;
 
 	/** @fb_lock: Mutex to protect fb the global @fb_list and @num_fb. */
 	struct mutex fb_lock;
-- 
2.43.0

