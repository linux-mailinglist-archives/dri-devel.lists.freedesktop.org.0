Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570ACB2FD72
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 16:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDA510E37E;
	Thu, 21 Aug 2025 14:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="TwTRSgri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0769810E37E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 14:54:44 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LEUrVw004114;
 Thu, 21 Aug 2025 14:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=corp-2025-04-25; bh=NY8P2pAC2w3BZwheXIPZfToa0idr5
 ZyXbrJafy8RiIc=; b=TwTRSgrisF0IyRK647Ziio4OxVjqstu00YUIMn6GtVboy
 MfauEpaURiBXmTkEtH3q+rxMZURm7aozseRggKFT8l2pq8okTAe3+wJw4Gp5yVsI
 t6X7DasvCX1I/AIykA8HVqxmBHDNPkPZO4QEGyfnuAnhY/N9Z/Ii6oQGGmyRMepT
 LDY861o5UxYpOgItJUAMlGGEwePEMwIkUGKbKiV2NIp3VxllImltnWinOPPJrxxx
 TE42yIb0ID/nf21B92Yozl7zTNQcSTJ/q860svkSF0j2ZhtrWqpzjYB6MU1rIJRx
 SQRG+cantYn03PbhO3b7fc4guN6+JqtskuZcr2/bA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48n0tquss6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Aug 2025 14:54:33 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 57LEp9E3020556; Thu, 21 Aug 2025 14:54:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 48nj6g5s7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Aug 2025 14:54:32 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57LEpOe7011459;
 Thu, 21 Aug 2025 14:54:32 GMT
Received: from sidhakum-ubuntu.osdevelopmeniad.oraclevcn.com
 (sidhakum-ubuntu.allregionaliads.osdevelopmeniad.oraclevcn.com
 [100.100.250.108])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 48nj6g5s7m-1; Thu, 21 Aug 2025 14:54:32 +0000
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, willy@infradead.org,
 sidhartha.kumar@oracle.com
Subject: [PATCH v2 0/6] DRM IDR to Xarray conversions
Date: Thu, 21 Aug 2025 14:54:23 +0000
Message-ID: <20250821145429.305526-1-sidhartha.kumar@oracle.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NyBTYWx0ZWRfX2QpT5fqNZrOM
 w38S0tw5AzQ9yaRTiWwRdvmUvQC7L6sNXcpFyQ7jhzgWk7galJ5A1TUZ+gfF2ON66XWr5EXzEOE
 0QWRGqZpAFRbvy9h2LYfNSFfX5mcuBLaLrQlG4ghHvxTPPtViX7WLsxNAVq6nAfH1smxKxEOdD3
 MWotGTPo+I4vW1G1KnBW26gd7lgs1lPHwlZAqI05+sPDhZDcTPtf8BmIdOM2gkQgGS+43jX8Z35
 RSiVeo71GICgCBDdsjhOe15XhKcS97rpQW3okh9Iz53wPb4GD7D8Lb+e43L2EBM2QtzMm7DVB67
 81oLew58kHUgWCcG8kK5zdx0kvUmeU03I68ZpX9WlfXilG3Ux7HzPb+PGSg9WXX6z1PDHNfq7Oe
 2fnGSFT5o8Z0Q4k4izyL4v+HEzWno62fQ5sCixaBh/V6FXtytIY=
X-Proofpoint-ORIG-GUID: GByawrZvgDPbg_ntwydTDv_xd3GUSyTs
X-Proofpoint-GUID: GByawrZvgDPbg_ntwydTDv_xd3GUSyTs
X-Authority-Analysis: v=2.4 cv=K/p73yWI c=1 sm=1 tr=0 ts=68a73329 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117
 a=zPCbziy225d3KhSqZt3L1A==:17
 a=2OwXVqhp2XgA:10 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=LxaQk2LVrQ3WACRVRfUA:9 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:12069
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

