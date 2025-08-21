Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A437AB2FD6C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 16:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B3610E37C;
	Thu, 21 Aug 2025 14:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="FeIwAwFb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C560F10E37C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 14:54:43 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LEUrGE004115;
 Thu, 21 Aug 2025 14:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=corp-2025-04-25; bh=1K0QQ
 apToE39cNs2MkPWJnRiSNR/HxdHTzYC8iViLtk=; b=FeIwAwFbK2+g+b46BYBXN
 eoMIzaQG2cq3NK7vOztAbC+QHc/IdKpN5TMZu621ZeG6wYVUjR7yUcBgC1r1Vbfz
 9TapTOsgR+xAHksNSqGAOaxIQbju94hGGWgPr3E9Hfy4d3T3VGQaxhoYhV9JXKe5
 ujIjeds7ZYccQt+Nx2VcjoufXJFOZeSwWmdARRGesy7R3M1yZTAGtFx87vXnODS5
 dAxL8Mi7u7NNVj459qbA3Ov0ob6XiN7JXBYFz98MwPYHDFuL4Kb0vcOYkZFAmWQ3
 1foYQNF2Nj0oGV7DyFH95B8g5bOScXruD0dINdnXPn+ZAs30UPwv76mJkq6KOzVb
 w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48n0tquss9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Aug 2025 14:54:33 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 57LDav88020689; Thu, 21 Aug 2025 14:54:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 48nj6g5s8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Aug 2025 14:54:33 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57LEpOe9011459;
 Thu, 21 Aug 2025 14:54:32 GMT
Received: from sidhakum-ubuntu.osdevelopmeniad.oraclevcn.com
 (sidhakum-ubuntu.allregionaliads.osdevelopmeniad.oraclevcn.com
 [100.100.250.108])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 48nj6g5s7m-2; Thu, 21 Aug 2025 14:54:32 +0000
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, willy@infradead.org,
 sidhartha.kumar@oracle.com
Subject: [PATCH v2 1/6] drm: Convert aux_idr to XArray
Date: Thu, 21 Aug 2025 14:54:24 +0000
Message-ID: <20250821145429.305526-2-sidhartha.kumar@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NyBTYWx0ZWRfX0BUZlYxeegxP
 B69p7iqP2QM/M/5XZ31MJYi6cXWSFtpJRAeJ+0u79/JkXXrVkJRhAHVZi9TUxxQrXbjbxguQl7W
 Tl2pX7qJF6usjT2P9jGtRolJw7APOK19l+hG6LM6GJqhN1LbMIUaNwZG6fFheJUflfyp0WjrF8S
 p1EQIqlDE/hCzYJBX5rxSFeR5xs32xRsWmntlKiNjpGyDo81OAUzIjfxa56L9xNbCjcTywV4Hz0
 eXaM2lk9paZuFpYuG/zRmBbIzh8DPboU39qyqyKuKH4+LjtsEFel4oQ7vn9zcBPKRk+qv+vHo/n
 tDVtT2TWCbGlQbTZuSoJto0cvTc0mWr8lYeWGH6Il5n1Jv5W5N6QvNffoIE4G+7VYsaan9wFEJa
 jD+vGjubWZRcOsMHbE5aYCh2PJIODEEcNpzAhyI7YzugXHG5aiQ=
X-Proofpoint-ORIG-GUID: nhVFLOmAlmY05OT13hilfLbFnVmcXLI7
X-Proofpoint-GUID: nhVFLOmAlmY05OT13hilfLbFnVmcXLI7
X-Authority-Analysis: v=2.4 cv=K/p73yWI c=1 sm=1 tr=0 ts=68a73329 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117
 a=zPCbziy225d3KhSqZt3L1A==:17
 a=2OwXVqhp2XgA:10 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=bhnSk7d9TMSBOys-tl0A:9
 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:12069
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

Remove aux_idr_mutex by converting aux_idr to an XArray.

Signed-off-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
---
 drivers/gpu/drm/display/drm_dp_aux_dev.c | 38 ++++++++++--------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_dev.c b/drivers/gpu/drm/display/drm_dp_aux_dev.c
index 29555b9f03c8..2a29d4b2cda0 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_dev.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_dev.c
@@ -52,8 +52,7 @@ struct drm_dp_aux_dev {
 
 #define DRM_AUX_MINORS	256
 #define AUX_MAX_OFFSET	(1 << 20)
-static DEFINE_IDR(aux_idr);
-static DEFINE_MUTEX(aux_idr_mutex);
+static DEFINE_XARRAY_ALLOC(aux_xa);
 static struct class *drm_dp_aux_dev_class;
 static int drm_dev_major = -1;
 
@@ -61,11 +60,11 @@ static struct drm_dp_aux_dev *drm_dp_aux_dev_get_by_minor(unsigned index)
 {
 	struct drm_dp_aux_dev *aux_dev = NULL;
 
-	mutex_lock(&aux_idr_mutex);
-	aux_dev = idr_find(&aux_idr, index);
+	xa_lock(&aux_xa);
+	aux_dev = xa_load(&aux_xa, index);
 	if (aux_dev && !kref_get_unless_zero(&aux_dev->refcount))
 		aux_dev = NULL;
-	mutex_unlock(&aux_idr_mutex);
+	xa_unlock(&aux_xa);
 
 	return aux_dev;
 }
@@ -73,7 +72,7 @@ static struct drm_dp_aux_dev *drm_dp_aux_dev_get_by_minor(unsigned index)
 static struct drm_dp_aux_dev *alloc_drm_dp_aux_dev(struct drm_dp_aux *aux)
 {
 	struct drm_dp_aux_dev *aux_dev;
-	int index;
+	int err;
 
 	aux_dev = kzalloc(sizeof(*aux_dev), GFP_KERNEL);
 	if (!aux_dev)
@@ -82,14 +81,12 @@ static struct drm_dp_aux_dev *alloc_drm_dp_aux_dev(struct drm_dp_aux *aux)
 	atomic_set(&aux_dev->usecount, 1);
 	kref_init(&aux_dev->refcount);
 
-	mutex_lock(&aux_idr_mutex);
-	index = idr_alloc(&aux_idr, aux_dev, 0, DRM_AUX_MINORS, GFP_KERNEL);
-	mutex_unlock(&aux_idr_mutex);
-	if (index < 0) {
+	err = xa_alloc(&aux_xa, &aux_dev->index, aux_dev,
+		XA_LIMIT(0, DRM_AUX_MINORS - 1), GFP_KERNEL);
+	if (err < 0) {
 		kfree(aux_dev);
-		return ERR_PTR(index);
+		return ERR_PTR(err);
 	}
-	aux_dev->index = index;
 
 	return aux_dev;
 }
@@ -250,22 +247,19 @@ static const struct file_operations auxdev_fops = {
 
 static struct drm_dp_aux_dev *drm_dp_aux_dev_get_by_aux(struct drm_dp_aux *aux)
 {
-	struct drm_dp_aux_dev *iter, *aux_dev = NULL;
-	int id;
+	struct drm_dp_aux_dev *aux_dev;
+	unsigned long id;
 
 	/* don't increase kref count here because this function should only be
 	 * used by drm_dp_aux_unregister_devnode. Thus, it will always have at
 	 * least one reference - the one that drm_dp_aux_register_devnode
 	 * created
 	 */
-	mutex_lock(&aux_idr_mutex);
-	idr_for_each_entry(&aux_idr, iter, id) {
-		if (iter->aux == aux) {
-			aux_dev = iter;
+	xa_for_each(&aux_xa, id, aux_dev) {
+		if (aux_dev->aux == aux)
 			break;
-		}
 	}
-	mutex_unlock(&aux_idr_mutex);
+
 	return aux_dev;
 }
 
@@ -284,9 +278,7 @@ void drm_dp_aux_unregister_devnode(struct drm_dp_aux *aux)
 	 */
 	aux->drm_dev = NULL;
 
-	mutex_lock(&aux_idr_mutex);
-	idr_remove(&aux_idr, aux_dev->index);
-	mutex_unlock(&aux_idr_mutex);
+	xa_erase(&aux_xa, aux_dev->index);
 
 	atomic_dec(&aux_dev->usecount);
 	wait_var_event(&aux_dev->usecount, !atomic_read(&aux_dev->usecount));
-- 
2.43.0

