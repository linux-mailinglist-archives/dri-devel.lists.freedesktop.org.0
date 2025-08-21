Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9936EB2FD74
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 16:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF73410E9BC;
	Thu, 21 Aug 2025 14:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="F+TplOo4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B15A10E9BC
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 14:54:45 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LEh4vi031119;
 Thu, 21 Aug 2025 14:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=corp-2025-04-25; bh=N6Gbu
 R9LSSRc3N1wU5xRX5lAGkr/RfOrMSDT6LkHoCQ=; b=F+TplOo4EU7DhAbLThzJf
 tJVNd29WKOBRmgV6oOoHL/17QYOl8pxd2LvdHKRfCV+DYGYWVUgjUoaXyu6wJNXt
 n01EWfGAukiVThvAt0/eclx2Ibi9dRHNpmnYGKOjT9ZJEONS3UOP00j2a3SoC8aH
 dnvdUtrX+dsBBPXzT/P1oenxWWeJOeVWjpSCqjTEsc4st8i6lOhpdowMV5IQD/5b
 2GbRvzJwaUzGDZHtSsqJ7uLRnUvjLNZLz6XLDftPfzR4xrrSMqxmX/xi6cIn3XKf
 tTrVX84X2e3bSdG8gxVjFY+2J7I1exzG0BDzl9BRXpC+Yc4vOKRpa3NiF0sOysif
 g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48n0tsukef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Aug 2025 14:54:34 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 57LD9KP8020792; Thu, 21 Aug 2025 14:54:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 48nj6g5s8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Aug 2025 14:54:34 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57LEpOeD011459;
 Thu, 21 Aug 2025 14:54:33 GMT
Received: from sidhakum-ubuntu.osdevelopmeniad.oraclevcn.com
 (sidhakum-ubuntu.allregionaliads.osdevelopmeniad.oraclevcn.com
 [100.100.250.108])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 48nj6g5s7m-4; Thu, 21 Aug 2025 14:54:33 +0000
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, willy@infradead.org,
 sidhartha.kumar@oracle.com
Subject: [PATCH v2 3/6] drm: Convert syncobj_idr to XArray
Date: Thu, 21 Aug 2025 14:54:26 +0000
Message-ID: <20250821145429.305526-4-sidhartha.kumar@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821145429.305526-1-sidhartha.kumar@oracle.com>
References: <20250821145429.305526-1-sidhartha.kumar@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508210121
X-Proofpoint-GUID: TKq9kdl9qpybQSI7_o8POUORkkBZf-Lr
X-Authority-Analysis: v=2.4 cv=S6eAAIsP c=1 sm=1 tr=0 ts=68a7332a b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117
 a=zPCbziy225d3KhSqZt3L1A==:17
 a=2OwXVqhp2XgA:10 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=2SHY49DYBmSurWS0lVIA:9
 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:12069
X-Proofpoint-ORIG-GUID: TKq9kdl9qpybQSI7_o8POUORkkBZf-Lr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NyBTYWx0ZWRfX1LiotBPpK+lk
 O07FHF9l2ZTbKXcGW7kC4XQcX4DiLerfU/J2tJ1wyfztwNfnaZEm/JWC3yPUpXzKJSUkyDXqkvF
 4cLInObwvqjWjamGAXOu2ouaGypJtptwrJsazTte1/7KzDIgxhYnLXpLuYH43eO1TR0qBgEg34e
 psu8hU59/hr2SrXCUE0NW98fc3az5uwWjasLpHaV1t1IXcxfX0+jAfPtatelCJJZnavIZGtNa0+
 LbCn715S5X6c2VnNvzu9nasBL1i/TsZjoyzwYq136YgkJq+qeAi6HVvL4zE+haWJkwQTR00fiwc
 Psl5wtUjaS7SU86kEsvm4wNG47yAjEMOrF6PmqTCgPN85nDAVuUQJh5eb78WBtX3QPIzCIJOfWV
 o/RaY9L1gtfn2Y8XdrB5eNhWhAlx7Y4pTROKtLJcglE7bU9aGCg=
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

Remove syncobj_table_lock by converting the syncobj_idr to an XArray.

Signed-off-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
---
 drivers/gpu/drm/drm_syncobj.c | 64 +++++++++++------------------------
 include/drm/drm_file.h        |  6 ++--
 2 files changed, 22 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index e1b0fa4000cd..091f43cf11ba 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -250,14 +250,12 @@ struct drm_syncobj *drm_syncobj_find(struct drm_file *file_private,
 {
 	struct drm_syncobj *syncobj;
 
-	spin_lock(&file_private->syncobj_table_lock);
-
-	/* Check if we currently have a reference on the object */
-	syncobj = idr_find(&file_private->syncobj_idr, handle);
+	/* Get a reference on the object */
+	xa_lock(&file_private->syncobjs);
+	syncobj = xa_load(&file_private->syncobjs, handle);
 	if (syncobj)
 		drm_syncobj_get(syncobj);
-
-	spin_unlock(&file_private->syncobj_table_lock);
+	xa_unlock(&file_private->syncobjs);
 
 	return syncobj;
 }
@@ -598,23 +596,16 @@ int drm_syncobj_get_handle(struct drm_file *file_private,
 {
 	int ret;
 
-	/* take a reference to put in the idr */
+	/* take a reference to put in the XArray */
 	drm_syncobj_get(syncobj);
 
-	idr_preload(GFP_KERNEL);
-	spin_lock(&file_private->syncobj_table_lock);
-	ret = idr_alloc(&file_private->syncobj_idr, syncobj, 1, 0, GFP_NOWAIT);
-	spin_unlock(&file_private->syncobj_table_lock);
+	ret = xa_alloc(&file_private->syncobjs, handle, syncobj, xa_limit_31b,
+			GFP_KERNEL);
 
-	idr_preload_end();
-
-	if (ret < 0) {
+	if (ret < 0)
 		drm_syncobj_put(syncobj);
-		return ret;
-	}
 
-	*handle = ret;
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(drm_syncobj_get_handle);
 
@@ -638,9 +629,7 @@ static int drm_syncobj_destroy(struct drm_file *file_private,
 {
 	struct drm_syncobj *syncobj;
 
-	spin_lock(&file_private->syncobj_table_lock);
-	syncobj = idr_remove(&file_private->syncobj_idr, handle);
-	spin_unlock(&file_private->syncobj_table_lock);
+	syncobj = xa_erase(&file_private->syncobjs, handle);
 
 	if (!syncobj)
 		return -EINVAL;
@@ -726,16 +715,10 @@ static int drm_syncobj_fd_to_handle(struct drm_file *file_private,
 	syncobj = fd_file(f)->private_data;
 	drm_syncobj_get(syncobj);
 
-	idr_preload(GFP_KERNEL);
-	spin_lock(&file_private->syncobj_table_lock);
-	ret = idr_alloc(&file_private->syncobj_idr, syncobj, 1, 0, GFP_NOWAIT);
-	spin_unlock(&file_private->syncobj_table_lock);
-	idr_preload_end();
+	ret = xa_alloc(&file_private->syncobjs, handle, syncobj, xa_limit_31b,
+			GFP_KERNEL);
 
-	if (ret > 0) {
-		*handle = ret;
-		ret = 0;
-	} else
+	if (ret < 0)
 		drm_syncobj_put(syncobj);
 
 	return ret;
@@ -814,17 +797,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
 void
 drm_syncobj_open(struct drm_file *file_private)
 {
-	idr_init_base(&file_private->syncobj_idr, 1);
-	spin_lock_init(&file_private->syncobj_table_lock);
-}
-
-static int
-drm_syncobj_release_handle(int id, void *ptr, void *data)
-{
-	struct drm_syncobj *syncobj = ptr;
-
-	drm_syncobj_put(syncobj);
-	return 0;
+	xa_init_flags(&file_private->syncobjs, XA_FLAGS_ALLOC1);
 }
 
 /**
@@ -838,9 +811,12 @@ drm_syncobj_release_handle(int id, void *ptr, void *data)
 void
 drm_syncobj_release(struct drm_file *file_private)
 {
-	idr_for_each(&file_private->syncobj_idr,
-		     &drm_syncobj_release_handle, file_private);
-	idr_destroy(&file_private->syncobj_idr);
+	struct drm_syncobj *syncobj;
+	unsigned long index;
+
+	xa_for_each(&file_private->syncobjs, index, syncobj)
+		drm_syncobj_put(syncobj);
+	xa_destroy(&file_private->syncobjs);
 }
 
 int
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 115763799625..ee5a16338c86 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -309,10 +309,8 @@ struct drm_file {
 	/** @table_lock: Protects @object_idr. */
 	spinlock_t table_lock;
 
-	/** @syncobj_idr: Mapping of sync object handles to object pointers. */
-	struct idr syncobj_idr;
-	/** @syncobj_table_lock: Protects @syncobj_idr. */
-	spinlock_t syncobj_table_lock;
+	/** @syncobjs: Mapping of sync object handles to object pointers. */
+	struct xarray syncobjs;
 
 	/** @filp: Pointer to the core file structure. */
 	struct file *filp;
-- 
2.43.0

