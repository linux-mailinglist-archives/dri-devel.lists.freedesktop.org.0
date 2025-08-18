Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86841B2B93D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 08:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58CE10E212;
	Tue, 19 Aug 2025 06:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="iDr5tOyL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35D310E4BD
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 19:01:09 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IEu68D026074;
 Mon, 18 Aug 2025 19:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=corp-2025-04-25; bh=rB44w7e8vYrBklyS6wrJxx5m1LQ+f
 n2GlH+VUJma6u0=; b=iDr5tOyLzUFn01APH/xio8w3fU412bIATmoNBCjCkxkKH
 HSNLrz+t3+8QcY3odyLWXfp2tJdkC/U4d9/bUbeU5vtUnVKSt1tSZ5Z0ZJINqVD3
 P4L+1sGySvti6jy0x6l73cFWc3GQfFEsMNvMxwBLimd0DPKJ63OSTNQjIFao5Z2o
 c5o9ZpxArLMmMJcnGTnZWL/UVPXm0dphsT59hl65PqEaQc3JyoKwXNpa5bYHbYSs
 hA0wbP4Vg5KH9p7pTbSCJZ4TWfiyK6V02gj96qbgsXDN2ld/VbExb/Tp7t1pLTYl
 e6yMxlk52YmB0X/EwNRsE8DymWumvrXejuM44yC5g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48jgdfksyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Aug 2025 19:01:01 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 57IIHmrQ016771; Mon, 18 Aug 2025 19:00:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 48jge9d7rn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Aug 2025 19:00:55 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57IJ0sZT035076;
 Mon, 18 Aug 2025 19:00:54 GMT
Received: from sidhakum-ubuntu.osdevelopmeniad.oraclevcn.com
 (sidhakum-ubuntu.allregionaliads.osdevelopmeniad.oraclevcn.com
 [100.100.250.108])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 48jge9d7p3-1; Mon, 18 Aug 2025 19:00:54 +0000
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, willy@infradead.org,
 sidhartha.kumar@oracle.com
Subject: [PATCH 0/6] DRM IDR to Xarray conversions
Date: Mon, 18 Aug 2025 19:00:40 +0000
Message-ID: <20250818190046.157962-1-sidhartha.kumar@oracle.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-ORIG-GUID: a04NrHVhwvYkKGfESpGDhWe9GZV0CKpu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE3OCBTYWx0ZWRfXxYDzuOFWBTHP
 wWnIZcrZYimRJhlX4aiKWGEA+qr3GcIYD3e6hfr0I09hjDjSLMP7aIAE4kqhNDwW5Ajkgv15QI1
 DVVYrbJxHM8f7ZXFGeuPNMlp6wXfA0b+DAqSGh/AELgYp/AkPaf8Wzu2USZv6atLPmUDCOIv2pu
 v1EO1auv3JjKI+tej1KTGOmwOIwUG/K5UdMBhmT/Q69sy6wP6EgTwhH4o/6L1crCjPugE/8mIxL
 N+9oSKfxnlQye8Si5du121AFfTW4BYsjUZS3qfEw34EgCnWkl77RWx58i1GuCc4ri3T6x/cAYMf
 IHtNfWomyV5RUfTFb4GV5MHWxOTWC20BK+YHaOdNnIDd2pI4936I6vZ1DBp/w1L9onsq4fzt7l4
 GW0MQv7r4IWS5rCPeg4X4H6c7FUq3XPn0BSgBzMg3FqgtWnsjF5UQcRaYNItKkrsTQFZRxOG
X-Proofpoint-GUID: a04NrHVhwvYkKGfESpGDhWe9GZV0CKpu
X-Authority-Analysis: v=2.4 cv=OK4n3TaB c=1 sm=1 tr=0 ts=68a3786d cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=2OwXVqhp2XgA:10 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=LxaQk2LVrQ3WACRVRfUA:9
 a=1CNFftbPRP8L7MoqJWF3:22
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

From: Sidhartha <sidhartha.kumar@oracle.com>

This series is part of a project to depcrecate the IDR in favor
of the Xarray. This simplifies the code as locking is handled by
the Xarray internally and removes the need for a seperate mutex to
proect the IDR.

The patches are from this tree and have been rebased to drm-next-2025-06-06
https://git.infradead.org/?p=users/willy/xarray.git;a=shortlog;h=refs/heads/xarray-conv


The series has been compiled and tested with drivers/gpu/drm/tests/.kunitconfig
and passes all tests.

[15:22:04] Testing complete. Ran 608 tests: passed: 608
[15:22:04] Elapsed time: 34.792s total, 3.086s configuring, 31.541s building, 0.141s running

Matthew Wilcox (6):
  drm: Convert aux_idr to XArray
  drm: Convert object_name_idr to XArray
  drm: Convert syncobj_idr to XArray
  drm: Convert magic_map to XArray
  drm: Convert lessee_idr to XArray
  drm: Convert tile_idr to XArray

 drivers/gpu/drm/display/drm_dp_aux_dev.c | 38 ++++++--------
 drivers/gpu/drm/drm_auth.c               | 22 ++++----
 drivers/gpu/drm/drm_connector.c          | 26 ++++------
 drivers/gpu/drm/drm_debugfs.c            | 19 +++----
 drivers/gpu/drm/drm_gem.c                | 11 ++--
 drivers/gpu/drm/drm_lease.c              | 15 +++---
 drivers/gpu/drm/drm_mode_config.c        |  3 +-
 drivers/gpu/drm/drm_syncobj.c            | 64 ++++++++----------------
 include/drm/drm_auth.h                   |  9 ++--
 include/drm/drm_device.h                 |  4 +-
 include/drm/drm_file.h                   |  6 +--
 include/drm/drm_mode_config.h            | 12 ++---
 12 files changed, 86 insertions(+), 143 deletions(-)

-- 
2.43.0

