Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D1B2B945
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 08:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2D310E105;
	Tue, 19 Aug 2025 06:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Wf9Nrxnf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D89E10E4BD
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 19:01:11 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IEtnQk030303;
 Mon, 18 Aug 2025 19:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=corp-2025-04-25; bh=z6TPL
 kSjmE9IwF51L2EN1IwxfhH+JEAx1RRQGI35iZk=; b=Wf9Nrxnf4H4gMQWua/pU7
 ws54ne3ZBZ/CkZPYwq6GAYkq8GOomoRFsXNCeF8zQEUmmbpfean341WidRLwnliH
 etNur8ENeBVFyeZ6oMgXhBEieoP4myUIGVdGaxrrcqjXzm28CaNOqz4pnlgsZ//+
 c2w7n0kByp6B/UPA/k4+feKpVRsa/LWTywJ86PEclR3UCRhsC4VN4oWKBoTViggp
 AN+T4RnzewO8nCARZOcZDpwutD/YDr7C9OKkFEmcA0lYSWFxYwJrzkz24X5jB1tM
 5hSttD96x85M4IdNSUW8KCSpmA4LvTyklCc4DY6xXCLENVB0mWx0yzx5fx0fOXUa
 A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48jj1e3tte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Aug 2025 19:01:04 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 57IHvoL1016798; Mon, 18 Aug 2025 19:01:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 48jge9d84w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Aug 2025 19:01:03 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57IJ0sZd035076;
 Mon, 18 Aug 2025 19:01:02 GMT
Received: from sidhakum-ubuntu.osdevelopmeniad.oraclevcn.com
 (sidhakum-ubuntu.allregionaliads.osdevelopmeniad.oraclevcn.com
 [100.100.250.108])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 48jge9d7p3-6; Mon, 18 Aug 2025 19:01:02 +0000
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, willy@infradead.org,
 sidhartha.kumar@oracle.com
Subject: [PATCH 5/6] drm: Convert lessee_idr to XArray
Date: Mon, 18 Aug 2025 19:00:45 +0000
Message-ID: <20250818190046.157962-6-sidhartha.kumar@oracle.com>
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
X-Proofpoint-GUID: ZqZ8oPrOZufSZQAn68dibctAiOKf1eC6
X-Authority-Analysis: v=2.4 cv=dN2mmPZb c=1 sm=1 tr=0 ts=68a37870 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=2OwXVqhp2XgA:10 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=8R3Qa1oyU1R4MiRUWy8A:9
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE3OCBTYWx0ZWRfX+4XsGTXfX2ll
 BXG3IayFtp6oPeie/x9dp2NgGsZwhTW0fBvOV3brN1cXGbbgVn2YQY9jrWF6QZ0WTU+u/mZIl6F
 IUx1kPNBFKZmQVjYPxyn9BiXq57YQK5S9BrQ3X2ZaHBFXq7iNqmWgzqMsfzg8lzXcirK+wkF0Xm
 iNBmwjf9CRqXNNzEUFYCtEkHa4ynsx1KOCT0bTSXCRpSPMD0n2ksN8CbVWOruLOhjzgNgbDv20m
 vR/AGQwCN3Deha1NGtUQfsuXEN5KEYFGy1bvYjsgqED0NxqaDtu/FFh5cgI5Bgb63ak1WS2I7fo
 o9xs6yejnka2tNen/Zh3zwNwMIB8WiEQFnchLR1AGkJmIKwA9vvLKfeK+Ofnk1SQz/kbMCCakRx
 6FwF94Pkig8mDVVExYk/jXmrXf+DdJm2VEYtFdlUjwd8vH0JGpIxSYVT0/Mu08r1M9Rq+qsr
X-Proofpoint-ORIG-GUID: ZqZ8oPrOZufSZQAn68dibctAiOKf1eC6
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

Part of the mass conversion of IDR users to the XArray API.

Signed-off-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
---
 drivers/gpu/drm/drm_auth.c  |  4 +---
 drivers/gpu/drm/drm_lease.c | 15 ++++++---------
 include/drm/drm_auth.h      |  4 ++--
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 41aa20144a9d..ca94d148b889 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -143,8 +143,7 @@ struct drm_master *drm_master_create(struct drm_device *dev)
 	/* initialize the tree of output resource lessees */
 	INIT_LIST_HEAD(&master->lessees);
 	INIT_LIST_HEAD(&master->lessee_list);
-	idr_init(&master->leases);
-	idr_init_base(&master->lessee_idr, 1);
+	xa_init_flags(&master->lessee_xa, XA_FLAGS_ALLOC1);
 
 	return master;
 }
@@ -425,7 +424,6 @@ static void drm_master_destroy(struct kref *kref)
 		drm_lease_destroy(master);
 
 	idr_destroy(&master->leases);
-	idr_destroy(&master->lessee_idr);
 
 	kfree(master->unique);
 	kfree(master);
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 94375c6a5425..a9d5b8a48b24 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -82,7 +82,7 @@ static struct drm_master*
 _drm_find_lessee(struct drm_master *master, int lessee_id)
 {
 	lockdep_assert_held(&master->dev->mode_config.idr_mutex);
-	return idr_find(&drm_lease_owner(master)->lessee_idr, lessee_id);
+	return xa_load(&drm_lease_owner(master)->lessee_xa, lessee_id);
 }
 
 static int _drm_lease_held_master(struct drm_master *master, int id)
@@ -210,7 +210,6 @@ static struct drm_master *drm_lease_create(struct drm_master *lessor, struct idr
 	int error;
 	struct drm_master *lessee;
 	int object;
-	int id;
 	void *entry;
 
 	drm_dbg_lease(dev, "lessor %d\n", lessor->lessee_id);
@@ -237,13 +236,11 @@ static struct drm_master *drm_lease_create(struct drm_master *lessor, struct idr
 	}
 
 	/* Insert the new lessee into the tree */
-	id = idr_alloc(&(drm_lease_owner(lessor)->lessee_idr), lessee, 1, 0, GFP_KERNEL);
-	if (id < 0) {
-		error = id;
+	error = xa_alloc(&drm_lease_owner(lessor)->lessee_xa,
+			&lessee->lessee_id, lessee, xa_limit_32b, GFP_KERNEL);
+	if (error < 0)
 		goto out_lessee;
-	}
 
-	lessee->lessee_id = id;
 	lessee->lessor = drm_master_get(lessor);
 	list_add_tail(&lessee->lessee_list, &lessor->lessees);
 
@@ -276,11 +273,11 @@ void drm_lease_destroy(struct drm_master *master)
 	 */
 	WARN_ON(!list_empty(&master->lessees));
 
-	/* Remove this master from the lessee idr in the owner */
+	/* Remove this master from the lessee array in the owner */
 	if (master->lessee_id != 0) {
 		drm_dbg_lease(dev, "remove master %d from device list of lessees\n",
 			      master->lessee_id);
-		idr_remove(&(drm_lease_owner(master)->lessee_idr), master->lessee_id);
+		xa_erase(&drm_lease_owner(master)->lessee_xa, master->lessee_id);
 	}
 
 	/* Remove this master from any lessee list it may be on */
diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
index 3026aedbc205..1b6064afc8b0 100644
--- a/include/drm/drm_auth.h
+++ b/include/drm/drm_auth.h
@@ -120,12 +120,12 @@ struct drm_master {
 	struct idr leases;
 
 	/**
-	 * @lessee_idr:
+	 * @lessee_xa:
 	 *
 	 * All lessees under this owner (only used where @lessor is NULL).
 	 * Protected by &drm_device.mode_config's &drm_mode_config.idr_mutex.
 	 */
-	struct idr lessee_idr;
+	struct xarray lessee_xa;
 };
 
 struct drm_master *drm_master_get(struct drm_master *master);
-- 
2.43.0

