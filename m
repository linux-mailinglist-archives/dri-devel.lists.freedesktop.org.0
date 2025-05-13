Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB4CAB4933
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 04:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E901610E4C9;
	Tue, 13 May 2025 02:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="JLLObg9L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631BA10E4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 02:06:49 +0000 (UTC)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250513020647epoutp04757ed8f7145b202554a6477db4dd5327~_9ATwISoG2678426784epoutp04F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 02:06:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250513020647epoutp04757ed8f7145b202554a6477db4dd5327~_9ATwISoG2678426784epoutp04F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1747102007;
 bh=kvmgVEKPuoH4lsNXw8T8Zxc8qcsTU4lXcf5uvCsEiLE=;
 h=Date:From:To:Cc:Subject:References:From;
 b=JLLObg9LvDUWOb9h8cgIcaLo9i0/g4RaX55lF4eHdwhJsxyYB+xbw63mIeR57N1Yn
 pFhMNg8Z2qqDgDLyI9XJisl0TdPcER01A8xARCzk+iS43cVwrnusqttY70zN851VgP
 EmdzZHfKINroce7FjzcEkLnAe9FRZcAGDFKh8754=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
 20250513020647epcas2p223ba67175952e88d475e7c9bfb77fe36~_9ATZhi8U0045700457epcas2p2S;
 Tue, 13 May 2025 02:06:47 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.88]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4ZxKbV2Rhvz3hhTZ; Tue, 13 May
 2025 02:06:46 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20250513020645epcas2p12a62716c7e311d0a95a550b712ff517c~_9AR7RyP51150911509epcas2p1B;
 Tue, 13 May 2025 02:06:45 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250513020645epsmtrp1be71d5fb323beb72ad00df561448b47f~_9AR6nRKI0202202022epsmtrp1x;
 Tue, 13 May 2025 02:06:45 +0000 (GMT)
X-AuditID: b6c32a2a-d63ff70000002265-0e-6822a93550e8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 76.10.08805.539A2286; Tue, 13 May 2025 11:06:45 +0900 (KST)
Received: from au1-maretx-p37.eng.sarc.samsung.com (unknown
 [105.148.41.227]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250513020643epsmtip237f1d392cb69a5e0ba8c42642fe09e2c~_9AQD5Awv2522725227epsmtip29;
 Tue, 13 May 2025 02:06:43 +0000 (GMT)
Date: Mon, 12 May 2025 21:06:38 -0500
From: Hyejeong Choi <hjeong.choi@samsung.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 hjeong.choi@samsung.com
Subject: [PATCH] dma-buf: insert memory barrier before updating num_fences
Message-ID: <20250513020638.GA2329653@au1-maretx-p37.eng.sarc.samsung.com>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBLMWRmVeSWpSXmKPExsWy7bCSvK7pSqUMg3NzpS3e3t/NanHl63s2
 i4s9X9ksvlx5yGRxedccNoueDVtZLU7d/czuwO7Reukvm8eda3vYPO53H2fyuP3vMbNH35ZV
 jB6fN8kFsEVx2aSk5mSWpRbp2yVwZfy9cp+14DR7xculJ1kbGDewdTFyckgImEjsOvSCsYuR
 i0NIYDejxM95b4ESHEAJaYmOY+kQNcIS91uOsELUNDBJ3Nx7ixkkwSKgKtG6oQFsEJuArsS2
 TzfAbBEBU4mj6/rZQBqYBWYzSvS/bWYFSQgLeEksXLKJHWQBL5C9rLEUJMwrIChxcuYTFhCb
 WUBL4sa/l0wgJcxANyz/xwFiigqoSHxeIDCBkX8WkoZZSBpmITQsYGRexSiZWlCcm55bbFhg
 lJdarlecmFtcmpeul5yfu4kRHNhaWjsY96z6oHeIkYmD8RCjBAezkghv43bFDCHelMTKqtSi
 /Pii0pzU4kOM0hwsSuK83173pggJpCeWpGanphakFsFkmTg4pRqYEgQ3r01MkfUSv8j/+XG5
 jmZTZPexDQ8+OOxcynImJ0thmuULtVLu04LfA35bx6c6/t7IOf3UZ5vn4Qycs1cH//Na2vR/
 i8yDi90mE49EZWprHdko6t+sO0P2xzqResWSm9HNDeyur0xEb0U2zlerXPPuXU3njvNHrmem
 evi8Lg78P10kpcj828dfNTEiBtJ/DNQz5R7cny77W1LbZf5lU+HVVroSfc2LVLfdmrghO++a
 wkMm5uo1Qe1y+yINX+7+/nJaUNM0hYaPmYW33B+17JOL47q/tPHc9rirvsrWjOy6utIRKvcO
 VtyQDnQ5fk/CWuSG7tLtC5ObM2eynth51uPRFLVXXB2SXTOdjBYosRRnJBpqMRcVJwIAAPwn
 39sCAAA=
X-CMS-MailID: 20250513020645epcas2p12a62716c7e311d0a95a550b712ff517c
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----vXMtb.xJEBdKRg-x-G_2.bLfm7.PUyBosmRElnm._zJRPIlO=_2cd20_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250513020645epcas2p12a62716c7e311d0a95a550b712ff517c
References: <CGME20250513020645epcas2p12a62716c7e311d0a95a550b712ff517c@epcas2p1.samsung.com>
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

------vXMtb.xJEBdKRg-x-G_2.bLfm7.PUyBosmRElnm._zJRPIlO=_2cd20_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

smp_store_mb() inserts memory barrier after storing operation.
It is different with what the comment is originally aiming so Null
pointer dereference can be happened if memory update is reordered.

Signed-off-by: Hyejeong Choi <hjeong.choi@samsung.com>
---
 drivers/dma-buf/dma-resv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 5f8d010516f0..b1ef4546346d 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -320,8 +320,9 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
 	count++;
 
 	dma_resv_list_set(fobj, i, fence, usage);
-	/* pointer update must be visible before we extend the num_fences */
-	smp_store_mb(fobj->num_fences, count);
+	/* fence update must be visible before we extend the num_fences */
+	smp_wmb();
+	fobj->num_fences = count;
 }
 EXPORT_SYMBOL(dma_resv_add_fence);
 
-- 
2.31.1


------vXMtb.xJEBdKRg-x-G_2.bLfm7.PUyBosmRElnm._zJRPIlO=_2cd20_
Content-Type: text/plain; charset="utf-8"


------vXMtb.xJEBdKRg-x-G_2.bLfm7.PUyBosmRElnm._zJRPIlO=_2cd20_--
