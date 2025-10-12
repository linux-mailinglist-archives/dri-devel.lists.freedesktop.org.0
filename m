Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB467BD034F
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 16:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BBC10E0DC;
	Sun, 12 Oct 2025 14:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="MLlkMCT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5114410E0DC
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 14:20:22 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CCCoxY026585;
 Sun, 12 Oct 2025 14:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=corp-2025-04-25; bh=dSKG4SyNo0gaYpGXItd1jsVLKWrJl
 F0G3L0At3p9re0=; b=MLlkMCT9mtxxtFKPjjnZP0zUiAs21SfeI25eSPp+p7GNq
 D5olZSP795qsvqtH8cvmARqIQmrfY4eBNo70NcHwlor0kvalVXfh4Ht4OhLmZiCr
 vrER6ko6wqev6Le4lq5Olru9m/I+Piybim0l5BMTNbd3yfjCQAx4NL6USXj3yVVo
 +1/5QDMSOSVUUlZgTfUN90UUN5Rpa0D39OLF2gcHyLdMM53y1hzVqZhj/xk4C2Fp
 me2k5DNytG8nYW9hjk2TyeOiGF7f2qVOiWuElSOR+FvCJq28mPQ01i4Sg6368Fkj
 T+sml1GTwEwBFkZp4xhKfKQkpz2DA6U3Q73qSz/qA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qf47h13d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 12 Oct 2025 14:20:11 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 59CCCYWT038325; Sun, 12 Oct 2025 14:20:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 49qdpcpm6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 12 Oct 2025 14:20:10 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59CEK9ot017983;
 Sun, 12 Oct 2025 14:20:09 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 49qdpcpm67-1; Sun, 12 Oct 2025 14:20:09 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: christianshewitt@gmail.com, michael.riesch@wolfvision.net, robh@kernel.org,
 s.hauer@pengutronix.de, dri-devel@lists.freedesktop.org,
 simona@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de,
 mripard@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com
Cc: alok.a.tiwari@oracle.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH v2] drm/rockchip: vop2: use correct destination rectangle
 height check
Date: Sun, 12 Oct 2025 07:20:01 -0700
Message-ID: <20251012142005.660727-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510120075
X-Authority-Analysis: v=2.4 cv=SK9PlevH c=1 sm=1 tr=0 ts=68ebb91b b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117
 a=zPCbziy225d3KhSqZt3L1A==:17
 a=x6icFKpwvdMA:10 a=yPCof4ZbAAAA:8 a=hxm_DrHGMFVl4YJQ088A:9 cc=ntf
 awl=host:12091
X-Proofpoint-GUID: StkRRQBnFKGXHAixh64KUh0QRVi1Lxh0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNiBTYWx0ZWRfX0cxlfedsE8qn
 1AOf75wrgH900ULgKQwNoCLGi0D0VJ4FLcyXg3AFAhVqsdI/NwYmpcq1QqsR0HxF6Wy+a3mS6Dc
 h3xMPCUjzBKKB2/JZFPRsweoj226hnM4xordj5G9KZScNca9hgmc0f/LBF7udk+bsw15kj4iClV
 Ptw6IBrzkAksZQpyQNRlsa+TdsnH+ywLBS51U1My9IMhJjEgy5sNrDDfS4pTJz9GP+sXY09fDVf
 v210AJAaMo/qRXWileO2hRgZA//sP9unehQE+Eb3bBCICRgByx8wT7IsPISlo8FG0Fm7jf6QPIS
 GpVnA60grTOlTgwDbTcTDq0+cYAgUa/YpeTseMq/vHwXlds1pyL6ieFZCoMHwNeDNIzJ39ecTsx
 23kUFR41qMNGhfvABo17GOKIZn+PiZ1C4fxRAR9ZpC++QU6SO8w=
X-Proofpoint-ORIG-GUID: StkRRQBnFKGXHAixh64KUh0QRVi1Lxh0
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

The vop2_plane_atomic_check() function incorrectly checks
drm_rect_width(dest) twice instead of verifying both width and height.
Fix the second condition to use drm_rect_height(dest) so that invalid
destination rectangles with height < 4 are correctly rejected.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
v1 -> v2
fix typo drm_rect_heigh -> drm_rect_height
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index b50927a824b4..7ec7bea5e38e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1031,7 +1031,7 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		return format;
 
 	if (drm_rect_width(src) >> 16 < 4 || drm_rect_height(src) >> 16 < 4 ||
-	    drm_rect_width(dest) < 4 || drm_rect_width(dest) < 4) {
+	    drm_rect_width(dest) < 4 || drm_rect_height(dest) < 4) {
 		drm_err(vop2->drm, "Invalid size: %dx%d->%dx%d, min size is 4x4\n",
 			drm_rect_width(src) >> 16, drm_rect_height(src) >> 16,
 			drm_rect_width(dest), drm_rect_height(dest));
-- 
2.50.1

