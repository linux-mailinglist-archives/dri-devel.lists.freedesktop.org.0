Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1499CB36E93
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 17:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A63010E693;
	Tue, 26 Aug 2025 15:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="e03nfmFD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC17910E690
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 15:49:16 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QFC4n3023647;
 Tue, 26 Aug 2025 15:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=corp-2025-04-25; bh=mgeHveTBPT3qqn2ra8VG4npb+Vf/J
 7RaXKQEESlrkZ0=; b=e03nfmFDA/QcN+z1XZBob0isQj527PjpC1213KrAr1g+t
 Ux11okhgLjgyJ5K0bRkWm7WrEcEBtBwLd9EyQ/7aBQVqWEL9ai+2WjDnaE6oMRbF
 8Yok2RB6MHO9SfX22j9uP6zO859KDrCqbplCHKsQlMnTWNUIQKmmWPqE0exxiIrt
 62ZMAbvQBfI0ZgHuNqjQ3dw3fdfyN3/3RAN4utxEd1tK9nsNiRLVYWEVbqLa3Sr0
 e5FDyGrMTd+fsmgjng3SEA1X7szGeYY4ixl9gj+ST4FIZ24sVGBmb26mK6r+3OoR
 2sZkHK8KijO6p0gEH7t4X8h6yJ50sJ9ZAgxhKVMSw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q58s4r47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Aug 2025 15:49:05 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 57QEXSZK014626; Tue, 26 Aug 2025 15:49:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 48q439pn14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Aug 2025 15:49:04 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57QFn4EH020762;
 Tue, 26 Aug 2025 15:49:04 GMT
Received: from sidhakum-ubuntu.osdevelopmeniad.oraclevcn.com
 (sidhakum-ubuntu.allregionaliads.osdevelopmeniad.oraclevcn.com
 [100.100.250.108])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 48q439pn0g-1; Tue, 26 Aug 2025 15:49:04 +0000
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, willy@infradead.org,
 sidhartha.kumar@oracle.com, jani.nikula@linux.intel.com
Subject: [PATCH v3 0/6] DRM IDR to Xarray conversions
Date: Tue, 26 Aug 2025 15:48:54 +0000
Message-ID: <20250826154900.405480-1-sidhartha.kumar@oracle.com>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=J6mq7BnS c=1 sm=1 tr=0 ts=68add771 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117
 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=2OwXVqhp2XgA:10 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=LxaQk2LVrQ3WACRVRfUA:9 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:13602
X-Proofpoint-GUID: IJZ94Fn4UYOiVYtLqsWSqPH0mmID829C
X-Proofpoint-ORIG-GUID: IJZ94Fn4UYOiVYtLqsWSqPH0mmID829C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyNyBTYWx0ZWRfX3A1aAgl6mq9f
 Yu8MsPoCday4/SL5FZ67ObY30z5PVwzth6aaFskpofupOdABNDqXJyk+4RdqSQi6FCwSiMCQOpN
 0qTNZXy+W3hpR01UwxJfEMPQw9WS+phQ+fXXbDUQyhYBN+hQV4Npj/vzX4E7e7xKc8ie2EWcHC0
 AJwfiR8+NJKfIl0Imo7/d6/WOb7nXmwAaNlCIcoxt5ijGfNvMiJke8tiLCJExdpK5O4NgaD7N2k
 1N5yo6UvNxrnzM/iOfgTCR4EPdIs2nSfUCJyYMywzbU972oUuR4gyxKmP0aHW1Srnf3IdR3+kGn
 K9g9Zf0g+GBoNxIl/AbRHUKEu8ITxQ0etGghw7OQAQTspbQ+Ir6NknW7w0H4C3fM/gupVUxRmFQ
 6ZxMGyAtH89OOv+EQdzNSjmg5K/Kkg==
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

v2[2] -> v3:
  - indicate the indentifiers do not change in the
    commit mesage per Jani Nikula

v1[1] -> v2:
  - rebase onto latest mainline v6.17-rc2
  - fix build error in patch 1 per Intel Test Robot

This series is part of a project to depcrecate the IDR in favor
of the Xarray. This simplifies the code as locking is handled by
the Xarray internally and removes the need for a seperate mutex to
proect the IDR.

The patches are from this tree and have been rebased to v6.17-rc2
https://git.infradead.org/?p=users/willy/xarray.git;a=shortlog;h=refs/heads/xarray-conv


The series has been compiled and tested with drivers/gpu/drm/tests/.kunitconfig
and passes all tests.

[15:22:04] Testing complete. Ran 608 tests: passed: 608
[15:22:04] Elapsed time: 34.792s total, 3.086s configuring, 31.541s building, 0.141s running

[1]: https://lore.kernel.org/dri-devel/20250818190046.157962-1-sidhartha.kumar@oracle.com/
[2]: https://lore.kernel.org/dri-devel/20250821145429.305526-1-sidhartha.kumar@oracle.com/

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

