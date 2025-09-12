Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3051B5608D
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 13:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D67310E127;
	Sat, 13 Sep 2025 11:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="jPA7u0HU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C6910ECA4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 17:00:30 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CGN66u023858;
 Fri, 12 Sep 2025 17:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=corp-2025-04-25; bh=06+g7AZH7i0HwmSRN02FkXgDW1kLN
 QkWhVc/5luFnrE=; b=jPA7u0HUzkA2DsqjNffEODqW6dHqUc1krdsGz8PkFjMam
 smR/HLiMnfEYFJk22QKlE7k2eojA0JkTgeDKFJ0m5vA6yRCzciz+a+Kuub5sjwK1
 /EwAzk58BFyCdHI5Bcxr1uUwKsSIFKMLl8TGqscSEbQRpcJPoKECW0Uo1Yz9ZWBv
 qJcgW/Wgv3zrQ49V4lWpfTrjRjJKFgHgNuteM3nu33KnOcnzT09ceDaFlxg3q3RY
 uyTA/CuHbHdguNLLbZOALr43ZHtWwi84nkHaZqSj4SkGs3cI815nFhU55rfE85Hi
 lGO8kVbbsgAhEDPHl6ItX0kcBPO4gf3gR5jREDYQw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4921m30kac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Sep 2025 17:00:26 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 58CGga3K038836; Fri, 12 Sep 2025 17:00:25 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 490bde5atv-1; Fri, 12 Sep 2025 17:00:25 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: simona@ffwll.ch, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fbcon: fix integer overflow in fbcon_do_set_font
Date: Fri, 12 Sep 2025 10:00:23 -0700
Message-ID: <20250912170023.3931881-1-samasth.norway.ananda@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509120155
X-Proofpoint-GUID: BD1hBxHGxIjYKS9kfTh7ahBaI79xRZcx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE1MSBTYWx0ZWRfXxPZM6+vGXYFk
 71DDAgvmAE3Q52WR345M1UlMOsBn2R2sSRVmb9z9RJllL+6cj+mvINiFsA9gQ6fE+Oa7oIsOnlZ
 MBalIiiW0VqeXM9Zto7DqQuUgEw0dM/0zRDd5KkqZEidCm2qnIze6u6eO75oshc3rQF5BROpE4t
 746IGE2+3lcBZhFDAa08ZeatHjOtiH3+Dn3sHyXLlePi2hhPT9ol9nP2N5vjLbKfAtIo66xpG0F
 3cc647UxmAwMSnXuKIITEeZJk9EpjoU5NU+exrTscZojAOaW5RliPovM7AaGmcDWRYvpmtqdeAo
 eUpW8/nBWyekRSVh2dptwVE56badjOKwMbYpz/CpkrUwFKWv/9fVFkKd5QUUZWC4MMZ7uX5kwW5
 sd/2YulY+Q7dUUhFzkfAvXypWnJY3g==
X-Authority-Analysis: v=2.4 cv=Dp5W+H/+ c=1 sm=1 tr=0 ts=68c451aa b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117
 a=zPCbziy225d3KhSqZt3L1A==:17
 a=yJojWOMRYYMA:10 a=yPCof4ZbAAAA:8 a=gbwJbyMY3ZHlS5J_450A:9 cc=ntf
 awl=host:12083
X-Proofpoint-ORIG-GUID: BD1hBxHGxIjYKS9kfTh7ahBaI79xRZcx
X-Mailman-Approved-At: Sat, 13 Sep 2025 11:45:22 +0000
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

Fix integer overflow vulnerabilities in fbcon_do_set_font() where font
size calculations could overflow when handling user-controlled font
parameters.

The vulnerabilities occur when:
1. CALC_FONTSZ(h, pitch, charcount) performs h * pith * charcount
   multiplication with user-controlled values that can overflow.
2. FONT_EXTRA_WORDS * sizeof(int) + size addition can also overflow
3. This results in smaller allocations than expected, leading to buffer
   overflows during font data copying.

Add explicit overflow checking using check_mul_overflow() and
check_add_overflow() kernel helpers to safety validate all size
calculations before allocation.

Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
---
 drivers/video/fbdev/core/fbcon.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 55f5731e94c3..a507d05f8fea 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2531,9 +2531,16 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 	if (fbcon_invalid_charcount(info, charcount))
 		return -EINVAL;
 
-	size = CALC_FONTSZ(h, pitch, charcount);
+	/* Check for integer overflow in font size calculation */
+	if (check_mul_overflow(h, pitch, &size) ||
+	    check_mul_overflow(size, charcount, &size))
+		return -EINVAL;
+
+	/* Check for overflow in allocation size calculation */
+	if (check_add_overflow(FONT_EXTRA_WORDS * sizeof(int), size, &size))
+		return -EINVAL;
 
-	new_data = kmalloc(FONT_EXTRA_WORDS * sizeof(int) + size, GFP_USER);
+	new_data = kmalloc(size, GFP_USER);
 
 	if (!new_data)
 		return -ENOMEM;
-- 
2.50.1

