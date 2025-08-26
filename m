Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04D7B36E8F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 17:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EECC10E690;
	Tue, 26 Aug 2025 15:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="lovcWmXU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E7010E108
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 15:49:14 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QFDDRP019292;
 Tue, 26 Aug 2025 15:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=corp-2025-04-25; bh=nCbt7
 TS8/hbAOYDRRl6Jn1HXdbKA/WSEYy5d+Ymz4DY=; b=lovcWmXUwB0wti1EjUckN
 Y5fh5XAXtQv53zGPgDfzcnEUENP6bEiZAaJz+PvFdc0efF1lIoz6+hvc1y6W9XTF
 EB6v4TxX84MIr4P6MKuFKb+JZoZdFgr5SMn/AZG2TndROFE5jBL+RbuDnISh4FxB
 bFXlvwq1X7e4pF/PFKS41Myem6glAagYY29reFq39opc+ODsima9UXUWWWSLFuqU
 glSMUa++ZzVgJuntqSM4RSFgM/fNs0vkOOX3aVG1ATNhqjDa+8zCyeDX5mtcJidG
 je2FLB8l/LHwPxO37Wnz2qh0uRs94eO4nUNBz8srNcLpBZuXCH3hS5onwV9QYsG2
 w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48r8twbh0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Aug 2025 15:49:07 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 57QF51On014662; Tue, 26 Aug 2025 15:49:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 48q439pn1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Aug 2025 15:49:05 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57QFn4EL020762;
 Tue, 26 Aug 2025 15:49:05 GMT
Received: from sidhakum-ubuntu.osdevelopmeniad.oraclevcn.com
 (sidhakum-ubuntu.allregionaliads.osdevelopmeniad.oraclevcn.com
 [100.100.250.108])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 48q439pn0g-3; Tue, 26 Aug 2025 15:49:05 +0000
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, willy@infradead.org,
 sidhartha.kumar@oracle.com, jani.nikula@linux.intel.com
Subject: [PATCH v3 2/6] drm: Convert object_name_idr to XArray
Date: Tue, 26 Aug 2025 15:48:56 +0000
Message-ID: <20250826154900.405480-3-sidhartha.kumar@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826154900.405480-1-sidhartha.kumar@oracle.com>
References: <20250826154900.405480-1-sidhartha.kumar@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508260139
X-Proofpoint-ORIG-GUID: lURWdUPMT_LxaX6uYt3Qcr3enYji_NOz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI0MDE4NCBTYWx0ZWRfX7RSRs8OM02+p
 VS3t8OXbd/+s+8XsHRVYAbHpMxhVfTRti8FhT4v3qfcDfTVwlFiv4EFkysxsiYFY4QtP+Dx7xTl
 RCbvfE8gbZ9QU+vyXGIYrS9qcpodf7kDpxQ9LBH+wfoERfzJ26os6Ef/HXY1U83rPrTQwPTy9Bi
 cuQBAs4nWrE0OPRdcasv1w/FIPmcaT3vWG+jELJszC0WHgzZZWr4Cul/Isqggi6eduAvp6PdseV
 I14WLgRe3U59JwNTVDte19xIqu3wqGNVIbCRzk87NRvaJKX1skN9fOzSjsqH/VgT9hCuzXVUMzP
 qQVfkS/p2e7VUOwORU01pOP/M5MfFpEyvBMlfzpBh4GO+StqRjaIdnPyHPyDlh5ifgBXnHtBhBD
 +3RVWxGqN8q+ZWjJvt5UMZhFv+YtWw==
X-Proofpoint-GUID: lURWdUPMT_LxaX6uYt3Qcr3enYji_NOz
X-Authority-Analysis: v=2.4 cv=IciHWXqa c=1 sm=1 tr=0 ts=68add773 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117
 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=2OwXVqhp2XgA:10 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=DK_Tli1e-HrAiUtdIdsA:9
 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:13602
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

From: Matthew Wilcox <willy@infradead.org>

It's not possible to replace object_name_lock as it protects more
code than should be reasonably be run under a spinlock, so the xa_lock
is nested under the object_name_lock.

obj->name and obj is not modified so the indentifier value is unchanged
after this change.

Signed-off-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
---
 drivers/gpu/drm/drm_debugfs.c | 19 ++++++-------------
 drivers/gpu/drm/drm_gem.c     | 11 +++++------
 include/drm/drm_device.h      |  4 ++--
 3 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 365cf337529f..3e57e3da5115 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -122,27 +122,20 @@ static int drm_clients_info(struct seq_file *m, void *data)
 	return 0;
 }
 
-static int drm_gem_one_name_info(int id, void *ptr, void *data)
-{
-	struct drm_gem_object *obj = ptr;
-	struct seq_file *m = data;
-
-	seq_printf(m, "%6d %8zd %7d %8d\n",
-		   obj->name, obj->size,
-		   obj->handle_count,
-		   kref_read(&obj->refcount));
-	return 0;
-}
-
 static int drm_gem_name_info(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
 	struct drm_device *dev = entry->dev;
+	struct drm_gem_object *obj;
+	unsigned long index;
 
 	seq_printf(m, "  name     size handles refcount\n");
 
 	mutex_lock(&dev->object_name_lock);
-	idr_for_each(&dev->object_name_idr, drm_gem_one_name_info, m);
+	xa_for_each(&dev->object_names, index, obj) {
+		seq_printf(m, "%6d %8zd %7d %8d\n", obj->name, obj->size,
+				obj->handle_count, kref_read(&obj->refcount));
+	}
 	mutex_unlock(&dev->object_name_lock);
 
 	return 0;
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 6a44351e58b7..cef0c5935798 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -97,7 +97,7 @@ drm_gem_init(struct drm_device *dev)
 	struct drm_vma_offset_manager *vma_offset_manager;
 
 	mutex_init(&dev->object_name_lock);
-	idr_init_base(&dev->object_name_idr, 1);
+	xa_init_flags(&dev->object_names, XA_FLAGS_ALLOC1);
 
 	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
 					  GFP_KERNEL);
@@ -269,7 +269,7 @@ static void drm_gem_object_handle_free(struct drm_gem_object *obj)
 
 	/* Remove any name for this object */
 	if (obj->name) {
-		idr_remove(&dev->object_name_idr, obj->name);
+		xa_erase(&dev->object_names, obj->name);
 		obj->name = 0;
 	}
 }
@@ -927,11 +927,10 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
 	}
 
 	if (!obj->name) {
-		ret = idr_alloc(&dev->object_name_idr, obj, 1, 0, GFP_KERNEL);
+		ret = xa_alloc(&dev->object_names, &obj->name, obj,
+				xa_limit_32b, GFP_KERNEL);
 		if (ret < 0)
 			goto err;
-
-		obj->name = ret;
 	}
 
 	args->name = (uint64_t) obj->name;
@@ -967,7 +966,7 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
 		return -EOPNOTSUPP;
 
 	mutex_lock(&dev->object_name_lock);
-	obj = idr_find(&dev->object_name_idr, (int) args->name);
+	obj = xa_load(&dev->object_names, (int) args->name);
 	if (obj) {
 		drm_gem_object_get(obj);
 	} else {
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index a33aedd5e9ec..6a28a9b134dd 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -325,8 +325,8 @@ struct drm_device {
 	/** @object_name_lock: GEM information */
 	struct mutex object_name_lock;
 
-	/** @object_name_idr: GEM information */
-	struct idr object_name_idr;
+	/** @object_names: GEM information */
+	struct xarray object_names;
 
 	/** @vma_offset_manager: GEM information */
 	struct drm_vma_offset_manager *vma_offset_manager;
-- 
2.43.0

