Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B885C14BDD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 14:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B646B10E3CF;
	Tue, 28 Oct 2025 13:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="ZkAz/WyP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2A210E3D1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 13:02:18 +0000 (UTC)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59S1XMAL006945;
 Tue, 28 Oct 2025 13:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=pp1; bh=8zwaRUNSyGimNNs5q
 83h32soN7BNO+JqHU2+rsr4bU0=; b=ZkAz/WyPyVMHNioPXbmgvZxofsv7Dcr7X
 RlpDAtRariZrotrUaanDh6HjATMKK0cRWrVMIggfuKLpCY9Ggm9o6/FYsKTtkXQj
 fG36sWGQFPE/OugQt2bcpNrpq9njK0EZccanE/GOWu8mL0oSdZkHYIgnVTeSE67c
 4P91UwfAeQJ9nj4r1xI3/6Rrjfztnb4cphxUTgI77EpKpJbVPHCSgnltl/9ExOLI
 RqXPLV4OMzLqEjo7Rb7pLt9UTi8+Fa9RD79GkoRuDziuOgcgd8j7JUwdAqXg1Krv
 IZxzze4ay43bwJYmgntiX37su/j2D9RxxbofLUj1DEZ32pA21d09g==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0kytbya0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Oct 2025 13:02:00 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59SD1xIg026569;
 Tue, 28 Oct 2025 13:01:59 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0kytby9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Oct 2025 13:01:59 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59SC3nZL030454;
 Tue, 28 Oct 2025 13:01:58 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a1acjtqms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Oct 2025 13:01:58 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 59SD1qeR41091434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Oct 2025 13:01:52 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8933820043;
 Tue, 28 Oct 2025 13:01:52 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9BAC2004B;
 Tue, 28 Oct 2025 13:01:51 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.155.209.42])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 28 Oct 2025 13:01:51 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: akpm@linux-foundation.org
Cc: balbirs@nvidia.com, borntraeger@de.ibm.com, david@redhat.com,
 Liam.Howlett@oracle.com, airlied@gmail.com, apopple@nvidia.com,
 baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com,
 dakr@kernel.org, dev.jain@arm.com, dri-devel@lists.freedesktop.org,
 francois.dugast@intel.com, gourry@gourry.net, joshua.hahnjy@gmail.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, matthew.brost@intel.com,
 mpenttil@redhat.com, npache@redhat.com, osalvador@suse.de,
 rakie.kim@sk.com, rcampbell@nvidia.com, ryan.roberts@arm.com,
 simona@ffwll.ch, ying.huang@linux.alibaba.com, ziy@nvidia.com,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-next@vger.kernel.org, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com
Subject: [PATCH v1 1/1] KVM: s390: Fix missing present bit for gmap puds
Date: Tue, 28 Oct 2025 14:01:50 +0100
Message-ID: <20251028130150.57379-2-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028130150.57379-1-imbrenda@linux.ibm.com>
References: <d4a09cc8-84b2-42a8-bd03-7fa3adee4a99@linux.ibm.com>
 <20251028130150.57379-1-imbrenda@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mgW0Se2eCcEagXlixqJWxYsPb3M4yIqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAwMSBTYWx0ZWRfX4ZPTxHz/nLjF
 xkLcDvlI0MfdXrWHGjpk2MYUj2e8AaTxwoDyM1Ws6z/WBWDhYLgkvh9kctwGm0SDzI32XpEAiYS
 RQ1fmrQK5Y2aL5tkqPQ7tEvO+pEczIbhyBdfaV3gIJZZkX4+8Ffk9doHY3sWRSO5MOR9maXFMU0
 T9xnvsQ6c9m3/Ms/xlhZ0vrTptEPB7T8yLvX2x/xM2CbUsCBHjc+pKjXkeP42FdVB9Jqt6H3uta
 6pt/EN4f+k7djdTI2PI6eXURgjLw+RBVUIqwvJB+qrrl8j72/zWp7+hzGrIZvG2IxCLWp422HvL
 QMRzdYDo9Xz55+bqz1e9SlLuy4ToJ+49gefMqwNQP8QMhS34YL+EU0H/0uMxomQ9DS3cJ/2Dhne
 T7DFNb7p0KLKf5uHvKVu/3TVN0Et5g==
X-Proofpoint-GUID: jMVslQxQ5HRWocHTW0PkeXw2KfmAEMfx
X-Authority-Analysis: v=2.4 cv=FaE6BZ+6 c=1 sm=1 tr=0 ts=6900bec8 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=7fxA7ORCVWHQiGjyanUA:9 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510250001
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

For hugetlbs, gmap puds have the present bit set. For normal puds
(which point to ptes), the bit is not set. This is in contrast to the
normal userspace puds, which always have the bit set for present pmds.

This causes issues when ___pte_offset_map() is modified to only check
for the present bit.

The solution to the problem is simply to always set the present bit for
present gmap pmds.

Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Link: https://lore.kernel.org/lkml/20251017144924.10034-1-borntraeger@linux.ibm.com/
Tested-by: Christian Borntraeger <borntraeger@linux.ibm.com>
Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>
---
 arch/s390/mm/gmap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
index 8ff6bba107e8..22c448b32340 100644
--- a/arch/s390/mm/gmap.c
+++ b/arch/s390/mm/gmap.c
@@ -599,8 +599,9 @@ int __gmap_link(struct gmap *gmap, unsigned long gaddr, unsigned long vmaddr)
 					| _SEGMENT_ENTRY_GMAP_UC
 					| _SEGMENT_ENTRY;
 			} else
-				*table = pmd_val(*pmd) &
-					_SEGMENT_ENTRY_HARDWARE_BITS;
+				*table = (pmd_val(*pmd) &
+					_SEGMENT_ENTRY_HARDWARE_BITS)
+					| _SEGMENT_ENTRY;
 		}
 	} else if (*table & _SEGMENT_ENTRY_PROTECT &&
 		   !(pmd_val(*pmd) & _SEGMENT_ENTRY_PROTECT)) {
-- 
2.51.0

