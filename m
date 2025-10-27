Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D0BC0F6DF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5355010E0AC;
	Mon, 27 Oct 2025 16:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="j+S6nQ74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B1F10E0AC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:47:43 +0000 (UTC)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59RD8UQE032633;
 Mon, 27 Oct 2025 16:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=1Z/0C6
 4ctaozs3ABvQcRCVXmOnEYI0cdXgxwFEI+wK8=; b=j+S6nQ74Se7giUxmRQfDzo
 0fHXyJt9Lgj5bSsrWtdQlcW/roLoLbYuUk7XXfEPscwj+Ier7Gw3pZ+MtYB/mbQh
 5zuyM1wmgFz0nm0QmuLMGxmbGA85R4Tt+f5obJoHkNaLwRs5NFy8TjQaad1XrZ2Y
 pruWJ55VfwMm53S9DVHJ23TIZQT+mc13OXbtSZp8JfZ1hffB5RORFuoZter1Tjlp
 g2/0uRFYQ9bxCPjJzqJFMfzzfBgLx6CiG6fubEPSlZTUrxQkxf13JSI77IP7lV8Z
 rh8/aGe2OWouWG0n9O9OJPJ8CbbcTRDk5beLBOGyNeXhvDtFrcw9MQJ/UH8stllw
 ==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0kyt7yx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Oct 2025 16:47:33 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59RGjbRp004340;
 Mon, 27 Oct 2025 16:47:32 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0kyt7yx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Oct 2025 16:47:32 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59RFIZ0s030114;
 Mon, 27 Oct 2025 16:47:31 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a19vmekkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Oct 2025 16:47:31 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 59RGlT109896284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Oct 2025 16:47:29 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87CB220043;
 Mon, 27 Oct 2025 16:47:29 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C59A320040;
 Mon, 27 Oct 2025 16:47:28 +0000 (GMT)
Received: from p-imbrenda (unknown [9.155.209.42])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Oct 2025 16:47:28 +0000 (GMT)
Date: Mon, 27 Oct 2025 17:47:26 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, Balbir Singh
 <balbirs@nvidia.com>, Liam.Howlett@oracle.com,
 airlied@gmail.com, akpm@linux-foundation.org, apopple@nvidia.com,
 baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com,
 dakr@kernel.org, dev.jain@arm.com, dri-devel@lists.freedesktop.org,
 francois.dugast@intel.com, gourry@gourry.net, joshua.hahnjy@gmail.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, matthew.brost@intel.com,
 mpenttil@redhat.com, npache@redhat.com, osalvador@suse.de,
 rakie.kim@sk.com, rcampbell@nvidia.com, ryan.roberts@arm.com,
 simona@ffwll.ch, ying.huang@linux.alibaba.com, ziy@nvidia.com,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: linux-next: KVM/s390x regression
Message-ID: <20251027174726.5d8fcce7@p-imbrenda>
In-Reply-To: <748cdc18-e32d-41bd-90d1-a102b1c51e06@redhat.com>
References: <20251001065707.920170-4-balbirs@nvidia.com>
 <20251017144924.10034-1-borntraeger@linux.ibm.com>
 <9beff9d6-47c7-4a65-b320-43efd1e12687@redhat.com>
 <c67386be-5278-411d-97e7-43fc34bf7c98@linux.ibm.com>
 <8c778cd0-5608-4852-9840-4d98828d7b33@redhat.com>
 <74272098-cfb7-424b-a55e-55e94f04524e@linux.ibm.com>
 <84349344-b127-41f6-99f1-10f907c2bd07@redhat.com>
 <c9f28d0c-6b06-47a2-884d-7533f7b49c45@nvidia.com>
 <f5debf87-0477-4d6a-8280-0cd95cd09412@linux.ibm.com>
 <748cdc18-e32d-41bd-90d1-a102b1c51e06@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ubob-5LekCHHco6DkR2SSF7gBcYPozRH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAwMSBTYWx0ZWRfX76PA6OE8xQR1
 w6FqXRJhMr8hQX2vlEjfyQrEeLlINNckKrCpHqV9x3C8T+/0MOhO77PRRlZuHvtxhrvJ14q4LDO
 gy6rQVqHOBPRsjm8rzQ8UM+K3vmNugEiNmmNaWYNYuyqgAXHCYVezSpfCtook6eZfohpVsMTAMS
 5pCfRkzynTMtXsJm4Shk77fu6hXApSLdiPXkdeRzPU6K1xQ04NwgFg0yewqrHjtiOSFUCftOrCi
 omXYZd64bQs5akgGifdp5LPzr8OIZUb23x6uhz2nt728Y1Oj8Cm8sHG2RjBZ5hjnfHNj9VV9gYq
 BwYfWdkAHiGeFDchPidmxmgC7VQQkseyNKh6QrnlvNqYyhG7dK2opBh9/BoJMwi2G/meyseDjdq
 GWSKir29IsZ3GOZL1FJz7G8+NgayeA==
X-Proofpoint-GUID: 6rmIiatZmSL_xPvg8AlM1iNfS4Hou4ZO
X-Authority-Analysis: v=2.4 cv=FaE6BZ+6 c=1 sm=1 tr=0 ts=68ffa225 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=20KFwNOVAAAA:8 a=ph-KnSEqExXM2Mgme_gA:9 a=CjuIK1q_8ugA:10
 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
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

On Mon, 20 Oct 2025 10:41:28 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 20.10.25 09:00, Christian Borntraeger wrote:
> > Am 17.10.25 um 23:56 schrieb Balbir Singh:
> >   
> >> In the meanwhile, does this fix/workaround work?
> >>
> >> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> >> index 0c847cdf4fd3..31c1754d5bd4 100644
> >> --- a/mm/pgtable-generic.c
> >> +++ b/mm/pgtable-generic.c
> >> @@ -290,7 +290,7 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
> >>    
> >>    	if (pmdvalp)
> >>    		*pmdvalp = pmdval;
> >> -	if (unlikely(pmd_none(pmdval) || !pmd_present(pmdval)))
> >> +	if (unlikely(pmd_none(pmdval) || is_pmd_non_present_folio_entry(pmdval)))
> >>    		goto nomap;
> >>    	if (unlikely(pmd_trans_huge(pmdval)))
> >>    		goto nomap;
> >>  
> > 
> > Yes, this seems to work.  
> 
> Right, but that's not what we will want here. We'll have to adjust s390x 
> gmap code (which is getting redesigned either way) to only take the page 
> lock.
> 
> In the end, we'll want here later a single
> 
> if (!pmd_present(pmdval))
> 	goto nomap;
> 

this seems to do the trick:

diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
index 8ff6bba107e8..22c448b32340 100644
--- a/arch/s390/mm/gmap.c
+++ b/arch/s390/mm/gmap.c
@@ -599,8 +599,9 @@ int __gmap_link(struct gmap *gmap, unsigned long
gaddr, unsigned long vmaddr) | _SEGMENT_ENTRY_GMAP_UC
                                        | _SEGMENT_ENTRY;
                        } else
-                               *table = pmd_val(*pmd) &
-                                       _SEGMENT_ENTRY_HARDWARE_BITS;
+                               *table = (pmd_val(*pmd) &
+                                       _SEGMENT_ENTRY_HARDWARE_BITS)
+                                       | _SEGMENT_ENTRY;
                }
        } else if (*table & _SEGMENT_ENTRY_PROTECT &&
                   !(pmd_val(*pmd) & _SEGMENT_ENTRY_PROTECT)) {



it marks non-leaf gmap segment (pmd) entries as present, just as normal
pmds would be.

I think it's a good enough fix for now, pending the rewrite, which I
hope to get in the next merge window

