Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE7AA6CF54
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 13:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C5410E1C4;
	Sun, 23 Mar 2025 12:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="aWL/Mcsn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0112310E1C4;
 Sun, 23 Mar 2025 12:49:15 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52N6wa7x025718;
 Sun, 23 Mar 2025 12:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=corp-2023-11-20; bh=y1p8efBTlVkGZuPqovRJRIEED8k9c
 61FVODzJx6N494=; b=aWL/McsnxrCM9uobUxcWd1nwQJUWHW9CSwuMnZnjj0X3d
 7JOMuVzDQTzRBPvSIMSvQPN+ly0NNddmuCtqN13fePOO+2Awk+hD42cEDfS6/O+E
 ISyYgtjL5jzq3ERb6V4aj24yX+IagtugI7VSRodQXY6403kfh5R6kKPtCH/gdFXs
 pEItFa4MPgqkS+btX6n88PSXCyt0d2i7o4ycTcb2o20cP+FnZZIk5fjwqigHtV0o
 nYfQQ9QVfNdv8JTxRiVWNOudgyXT//EXgJzD0sWxiIDB2xCWV/nIr1JU2nLoAjOS
 uld6c9CPpasWb7AP5yLWIg60cYP00qmhYXUMW5+tA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hn7dj3rm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 23 Mar 2025 12:49:11 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 52NCU31q029893; Sun, 23 Mar 2025 12:49:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 45jjbx89d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 23 Mar 2025 12:49:10 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52NCnAqp026147;
 Sun, 23 Mar 2025 12:49:10 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 45jjbx89cu-1; Sun, 23 Mar 2025 12:49:10 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com, harshit.m.mogalapalli@oracle.com
Subject: [PATCH] drm/xe/svm: fix dereferencing error pointer in
 drm_gpusvm_range_alloc()
Date: Sun, 23 Mar 2025 05:49:06 -0700
Message-ID: <20250323124907.3946370-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-23_06,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503230093
X-Proofpoint-GUID: cvCcg96ARbVDUoAZZm1Bw8SDjUXEjOoc
X-Proofpoint-ORIG-GUID: cvCcg96ARbVDUoAZZm1Bw8SDjUXEjOoc
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

xe_svm_range_alloc() returns ERR_PTR(-ENOMEM) on failure and there is a
dereference of "range" after that:

	-->     range->gpusvm = gpusvm;

In xe_svm_range_alloc(), when memory allocation fails return NULL
instead to handle this situation.

Fixes: 99624bdff867 ("drm/gpusvm: Add support for GPU Shared Virtual Memory")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/adaef4dd-5866-48ca-bc22-4a1ddef20381@stanley.mountain/
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is based on static analysis and only compile tested.
---
 drivers/gpu/drm/xe/xe_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 52e04e7e343f..a79df8cf1f36 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -80,7 +80,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
 
 	range = kzalloc(sizeof(*range), GFP_KERNEL);
 	if (!range)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	INIT_LIST_HEAD(&range->garbage_collector_link);
 	xe_vm_get(gpusvm_to_vm(gpusvm));
-- 
2.39.3

