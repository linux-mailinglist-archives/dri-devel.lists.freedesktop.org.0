Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9BFBEB5EF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 21:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098AE89A72;
	Fri, 17 Oct 2025 19:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Anm8vNe/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FD910E191
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 19:16:49 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HCdhMl030408;
 Fri, 17 Oct 2025 19:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=corp-2025-04-25; bh=V+icTy3tzcd03YExIPZhZp9rgkUAs
 FIbErp7/q/7OB8=; b=Anm8vNe/XhnAkQ4kDuCxeHdPyftJpIYq9hL6oZ7exX2oV
 JZEqXbYWaU/Vp4D+Z78l16/2coG32Bu5xcW7s7A1HOpXwXFoO0HwLd7tmZsNs2Hu
 1pJJ4q65Ix9ogwmZjF3kHvB2CfeB3yvTdtaFRNg4nBS40GoGcHQqo5KUg5nd5ove
 3Q580FfCEaxvrobbFE420kYqLrqCjoUNDSv8ACowuE8C6ARZpFtQo0gWalel1xTs
 0ResGTK4xoklx23TSSf/17WrMRrdMJZG8Z3ks3bOhkJ7PyPMjshmztTH2fHxte4E
 PfYvVBxp3xhX6q+4hovChoFvg0n0b/RLuMA64iAqQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qdncbj4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Oct 2025 19:16:39 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 59HHxumo025845; Fri, 17 Oct 2025 19:16:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 49qdpkg87x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Oct 2025 19:16:38 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59HJ7xen032553;
 Fri, 17 Oct 2025 19:16:38 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 49qdpkg87a-1; Fri, 17 Oct 2025 19:16:37 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: laurent.pinchart+renesas@ideasonboard.com,
 tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 geert+renesas@glider.be, magnus.damm@gmail.com,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 alok.a.tiwari@oracle.com
Cc: alok.a.tiwarilinux@gmail.com
Subject: [PATCH next] drm: rcar-du: fix incorrect return in
 rcar_du_crtc_cleanup()
Date: Fri, 17 Oct 2025 12:16:21 -0700
Message-ID: <20251017191634.1454201-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510170146
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAwNiBTYWx0ZWRfXyfUlmv73rWFI
 FLsFVpn/0BP20drFc3uXW37wMwkq/BzKgHpUFHWaBe13woM9ecYZTx4WvXuvghuHNi65YBvZiOD
 Pxx/vHUmxtgsoM2hxz0BbIDP7XkMMKC7LC9zaJ6lhKQeJTMoko99AjJnPtl79wQqTEUV98R15D2
 QCpeoP/025pgpYzd79p8gfOhKuYbYVl9rAY/ntqu7OJEIuXwpdGZkRJ+e5ghMEsCLGoeu/uU9/t
 E/zvQFvngHwsi9TDdAVlGOzs8/IHFXAffo8in/unHdx0v0wkKSIXrnP1OflfLF0eDDwoqkaZ5/i
 vePZi3CZk21ZTUks9pE+2EQ9JfNM5iaHxbd3LUiXAF3A5gAQxxY+fBB0LyYzfOC4m63p1Y496qN
 1EKZm/W4dpTpN4lKh41OrPBvNpTVbxJKevJ0phkjMqMaQBkfnLs=
X-Proofpoint-GUID: -79bYQyYjDcP-3Xy89Za8R8hoOcnIjUv
X-Authority-Analysis: v=2.4 cv=ReCdyltv c=1 sm=1 tr=0 ts=68f29617 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117
 a=zPCbziy225d3KhSqZt3L1A==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=FgpMwCVgqWoq9Yy4Z-AA:9 cc=ntf awl=host:12091
X-Proofpoint-ORIG-GUID: -79bYQyYjDcP-3Xy89Za8R8hoOcnIjUv
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

The rcar_du_crtc_cleanup() function has a void return type, but
incorrectly uses a return statement with a call to drm_crtc_cleanup(),
which also returns void.

Remove the return statement to ensure proper function semantics.
No functional change intended.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
index 7e175dbfd892..22bcd7db4195 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
@@ -993,7 +993,7 @@ static void rcar_du_crtc_cleanup(struct drm_crtc *crtc)
 
 	rcar_du_crtc_crc_cleanup(rcrtc);
 
-	return drm_crtc_cleanup(crtc);
+	drm_crtc_cleanup(crtc);
 }
 
 static void rcar_du_crtc_reset(struct drm_crtc *crtc)
-- 
2.50.1

