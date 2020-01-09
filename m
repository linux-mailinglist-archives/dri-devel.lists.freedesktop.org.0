Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0BB1355E5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 10:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EFB6E3BB;
	Thu,  9 Jan 2020 09:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 466 seconds by postgrey-1.36 at gabe;
 Thu, 09 Jan 2020 09:36:59 UTC
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853466E3BB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 09:36:59 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200109092911epoutp02e1094b4359797f7e912bd3d320bb6b4c~oLem3xjx81393913939epoutp02r
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 09:29:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200109092911epoutp02e1094b4359797f7e912bd3d320bb6b4c~oLem3xjx81393913939epoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578562151;
 bh=nA+8WHtHukntbNivm5HssW7tiXFYPObvnQKOTXb2jwQ=;
 h=From:To:Cc:Subject:Date:References:From;
 b=aeTQO5pTQxMC1Z/4/BQRVjvsH8ZLYMmkLZo2v33u/UbkVdzGaDtaKq0UWrIjoAU/f
 p85uZ1Cnuz7wDSKJTyuejfaLzgKRXw8bny5T/kVailVYwRxvVZpqMs8nghDZVHg1SM
 lrB/qMaxGhZWp1+cJcIStJHS4PJ35FFF9/7x0PME=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200109092910epcas1p3f7a715f4ae39bb820ec276d44971202b~oLemof5gd0922309223epcas1p3F;
 Thu,  9 Jan 2020 09:29:10 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.157]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 47tgmM35TXzMqYm0; Thu,  9 Jan
 2020 09:29:07 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 21.FA.48019.062F61E5; Thu,  9 Jan 2020 18:29:04 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200109092903epcas1p49de22b4892ff4c6e205fb098c83c76ae~oLefvj1vf3223932239epcas1p4p;
 Thu,  9 Jan 2020 09:29:03 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200109092903epsmtrp262cbabf19cea1186c82713eb20bfc989~oLefu8RHI1249512495epsmtrp2P;
 Thu,  9 Jan 2020 09:29:03 +0000 (GMT)
X-AuditID: b6c32a38-257ff7000001bb93-e7-5e16f2606e12
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 27.0E.06569.F52F61E5; Thu,  9 Jan 2020 18:29:03 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.222]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200109092903epsmtip287f6e4f7bfe684b056d0beeead742203~oLefk0xgv1460414604epsmtip2O;
 Thu,  9 Jan 2020 09:29:03 +0000 (GMT)
From: Seung-Woo Kim <sw0312.kim@samsung.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] xf86drm: only include <sys/sysctl.h> for FreeBSD build case
Date: Thu,  9 Jan 2020 18:32:10 +0900
Message-Id: <1578562330-25594-1-git-send-email-sw0312.kim@samsung.com>
X-Mailer: git-send-email 1.7.4.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJKsWRmVeSWpSXmKPExsWy7bCmrm7CJ7E4g7WHOC2ufH3PZrH21kEW
 ixmTX7JZ9J/6w+TA4rHj7XEmj8V7XjJ53O8Gsvq2rGIMYInKtslITUxJLVJIzUvOT8nMS7dV
 8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wB2qmkUJaYUwoUCkgsLlbSt7Mpyi8tSVXI
 yC8usVVKLUjJKbAs0CtOzC0uzUvXS87PtTI0MDAyBSpMyM6Yt3IBY8FEtoru/deZGhi7WbsY
 OTkkBEwkft/qYO5i5OIQEtjBKHHmSQOU84lR4lbzfjYI5xujxLJZM5lhWtYtXAbWLiSwl1Hi
 wIVciKIvjBLfrt5gA0mwCehI7F/yG6xIREBZ4u/EVYwgNrOAp8TWbwvBbGEBH4mv8x6A2SwC
 qhJ7FhxmArF5Bdwk3vybDHWfgsSCe2/BrpAQeMoqsf70LqgrXCQ+fD7HDmELS7w6vgXKlpL4
 /G4vG4RdLbF9wk92iOYORome9kYWiISxxP6lk4G2cQBdpCmxfpc+RFhRYufvuVCH8km8+9rD
 ClIiIcAr0dEmBFGiIrHz6CQ2iLCUxKwNwRBhD4kl39cwQcIkVmLjxe0sExhlZyHMX8DIuIpR
 LLWgODc9tdiwwAQ5kjYxgpORlsUOxj3nfA4xCnAwKvHwMiiJxQmxJpYVV+YeYpTgYFYS4T16
 AyjEm5JYWZValB9fVJqTWnyI0RQYeBOZpUST84GJMq8k3tDUyNjY2MLE0MzU0FBJnJfjx8VY
 IYH0xJLU7NTUgtQimD4mDk6pBsYaZ4b/bOdsFBOyLx0LexJb9GqyW7vcv8g8yWTn9dOCtvSl
 PzFIytKsr57+yoJr99wt+klb2rYKTORvW8Y9P6V13cNdV2z/f+60U123XWLO/jCZOQ0bVnB0
 6Fd2cy5WVYx3Lwgx7V4Xabxxannb/DU6HesZ+RZpm7R8nLw0tOxBVii/peTuJ0osxRmJhlrM
 RcWJAIQl2gRcAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBJMWRmVeSWpSXmKPExsWy7bCSvG78J7E4g7k75C2ufH3PZrH21kEW
 ixmTX7JZ9J/6w+TA4rHj7XEmj8V7XjJ53O8Gsvq2rGIMYInisklJzcksSy3St0vgypi3cgFj
 wUS2iu7915kaGLtZuxg5OSQETCTWLVwGZHNxCAnsZpR4e7iNCSIhJTH323bGLkYOIFtY4vDh
 YoiaT4wSp2adZwepYRPQkdi/5DfYIBEBZYm/E1cxgtjMAr4Si59+ZQOxhQV8JL7OewAWZxFQ
 ldiz4DDYfF4BN4k3/yZDHaEgseDeW7YJjDwLGBlWMUqmFhTnpucWGxYY5aWW6xUn5haX5qXr
 JefnbmIEh4eW1g7GEyfiDzEKcDAq8fAyKInFCbEmlhVX5h5ilOBgVhLhPXoDKMSbklhZlVqU
 H19UmpNafIhRmoNFSZxXPv9YpJBAemJJanZqakFqEUyWiYNTqoHRYe6WuLlJv742R3t+XL5r
 hvHc1TPVO2ZeFzUV65y85M3KConlFTezInftunlYbv68A0WfePQD3EPKXgpnrFn1uIRR/uTp
 rY/j/u5pcztmorB2bVvRdcY5B5VL+jVmTw198MtwgbnPSvknteUS8tse7dLpPNQf+OPi0uvv
 khO9HBSLDis3LxcuUWIpzkg01GIuKk4EAG8iCrYLAgAA
X-CMS-MailID: 20200109092903epcas1p49de22b4892ff4c6e205fb098c83c76ae
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200109092903epcas1p49de22b4892ff4c6e205fb098c83c76ae
References: <CGME20200109092903epcas1p49de22b4892ff4c6e205fb098c83c76ae@epcas1p4.samsung.com>
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
Cc: eric.engestrom@intel.com, zeising@daemonic.se, sw0312.kim@samsung.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The <sys/sysctl.h> header is only required FreeBSD and GNU libc
2.30 starts to warn about Linux specific <sys/sysctl.h> header
deprecation. Only include <sys/sysctl.h> for FreeBSD.

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 xf86drmMode.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/xf86drmMode.c b/xf86drmMode.c
index 207d7be..ff1d31d 100644
--- a/xf86drmMode.c
+++ b/xf86drmMode.c
@@ -42,9 +42,11 @@
 #include <stdint.h>
 #include <stdlib.h>
 #include <sys/ioctl.h>
+#if defined (__FreeBSD__) || defined (__FreeBSD_kernel__)
 #ifdef HAVE_SYS_SYSCTL_H
 #include <sys/sysctl.h>
 #endif
+#endif /* defined (__FreeBSD__) || defined (__FreeBSD_kernel__) */
 #include <stdio.h>
 #include <stdbool.h>
 
-- 
1.7.4.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
