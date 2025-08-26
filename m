Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2EDB36E92
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 17:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA8F10E383;
	Tue, 26 Aug 2025 15:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="a892MNXr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7722810E108
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 15:49:15 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QFC5ls005041;
 Tue, 26 Aug 2025 15:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=corp-2025-04-25; bh=m2kdE
 ZhnjwvmKpmJgI1tkEE9qCfQrhXmJNj51PQlkZg=; b=a892MNXruqeMFAIBCHIPU
 wZifL8uekAQ6ZZdS7+jKqnI7hzx0ILf5DQvRUUf31Ogm2Aq27PsroB1EVnYedErM
 ojiUf0DVJeFN9esGM6r37qnnV+c7f3pOX/dm9RQXa4lXLtM6Q8HsBoVUTusl3hyf
 nrg6trxF3VVOVCn7YtrUIg0sk3q+muySJoXMRFuRoWJIShBLyjciSLFoxmkFhZE4
 RKjhRHualsKPXn8u1/NDDkzJYEZbOI4jzmuu9VtRhNPgRNbpsEzz17Kh9HD2oxSk
 sk0jrYnC1miOfxm/oW2w2tphIt/dZi7RtxSKr0nS8OeA/eN1x4mGZrEnlO8QJhFz
 g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q678vrq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Aug 2025 15:49:08 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 57QFO54j014788; Tue, 26 Aug 2025 15:49:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 48q439pn2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Aug 2025 15:49:07 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57QFn4ER020762;
 Tue, 26 Aug 2025 15:49:06 GMT
Received: from sidhakum-ubuntu.osdevelopmeniad.oraclevcn.com
 (sidhakum-ubuntu.allregionaliads.osdevelopmeniad.oraclevcn.com
 [100.100.250.108])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 48q439pn0g-6; Tue, 26 Aug 2025 15:49:06 +0000
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, willy@infradead.org,
 sidhartha.kumar@oracle.com, jani.nikula@linux.intel.com
Subject: [PATCH v3 5/6] drm: Convert lessee_idr to XArray
Date: Tue, 26 Aug 2025 15:48:59 +0000
Message-ID: <20250826154900.405480-6-sidhartha.kumar@oracle.com>
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
X-Proofpoint-GUID: smSzIqe5Jfz8t-y_2iyXHrZj6v9U5OlI
X-Proofpoint-ORIG-GUID: smSzIqe5Jfz8t-y_2iyXHrZj6v9U5OlI
X-Authority-Analysis: v=2.4 cv=NrLRc9dJ c=1 sm=1 tr=0 ts=68add774 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117
 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=2OwXVqhp2XgA:10 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=8R3Qa1oyU1R4MiRUWy8A:9
 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:13602
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNSBTYWx0ZWRfX0BW0i/Yp0R9Z
 JnQkJRxE+GgOVoprQmYagvJyvMsiNkmF54qAwvo0o4DROIqwS9DrftXusmmXen3s8XxVHTaOX6s
 czbZv5iL6fAnA5JZXrXDIQJybsp1Q+hkKydNfSnjlHKy9zH8ixOQyI5yQIX2jJQmxIvMLt1fgZz
 MNGJqzQw2J61LaVDL8pV8t1wJERedYyeekSeBxW6YfntuSIhz7UpAx8TtZi02Z/rTfn3LFpWjcQ
 eyqRFZjwKo77pry1rdc1aFGKPGmOGw/M51o4waxYhwS3G7hktpjgBUXwJ1cpFwbI1xZNlY8Dnut
 qw6sY9RzRdl8qjAtXswYoMJcvql7Be9Esp7Gyh20KGr3+PQ9qMogfhmzToNkqJgMzZEjzXnzxjn
 TVqGsoUE02/Kme5epn9S4w4cPZM8jQ==
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

Part of the mass conversion of IDR users to the XArray API.
lessee_id and lessee are not modified so the indentifiers are
unchanged.

Signed-off-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
---
 drivers/gpu/drm/drm_auth.c  |  4 +---
 drivers/gpu/drm/drm_lease.c | 15 ++++++---------
 include/drm/drm_auth.h      |  4 ++--
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 66a672384367..0605a649b27f 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -142,8 +142,7 @@ struct drm_master *drm_master_create(struct drm_device *dev)
 	/* initialize the tree of output resource lessees */
 	INIT_LIST_HEAD(&master->lessees);
 	INIT_LIST_HEAD(&master->lessee_list);
-	idr_init(&master->leases);
-	idr_init_base(&master->lessee_idr, 1);
+	xa_init_flags(&master->lessee_xa, XA_FLAGS_ALLOC1);
 
 	return master;
 }
@@ -408,7 +407,6 @@ static void drm_master_destroy(struct kref *kref)
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

