Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF9DC19A6D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 11:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDAF10E0B5;
	Wed, 29 Oct 2025 10:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="CxvCE/I+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E218C10E0B5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 10:21:02 +0000 (UTC)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59SJmGuE008719;
 Wed, 29 Oct 2025 10:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=a8C3xo
 7d6IbVEJTrFBvgh0IG4wFajk7Jzk1+en8wFBE=; b=CxvCE/I+LSKtS0sazC2Nc6
 bp3whjjsUFd21k1GJtSj8Kdf+0EYFLgg9hz5DsiSTDo3LI6+WJtiqJCc8ga16KYl
 GrLdc/7dCYmzZXNGnTZ0dcP4KKPpr4c/7+qmGDhPtvndPENgvpcBsZK0SpBxiBXJ
 N2aQJfPj8xygiw9XjB6IZHNd+nANVczXQlzLweaAA7NYKpgT6TGc1NLtxpBztram
 828uKIXNKsXePgmptKTEKYlbA4DNUzfB6gKhoTFtaMOw9FrsvEBlUa4O3itHPa2F
 9F2XAxIjRcNT3QRLLEyioxafoUYAQbCB8jqk3oJnHK2G38bH8FWWpJ3snC8QWNhw
 ==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34afapvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Oct 2025 10:20:51 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59TAK2Li031504;
 Wed, 29 Oct 2025 10:20:51 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34afapuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Oct 2025 10:20:50 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59T9vZLR027516;
 Wed, 29 Oct 2025 10:20:44 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a33w2jqxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Oct 2025 10:20:44 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 59TAKcdE39977418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Oct 2025 10:20:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65AC52004F;
 Wed, 29 Oct 2025 10:20:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F4BD2005A;
 Wed, 29 Oct 2025 10:20:36 +0000 (GMT)
Received: from p-imbrenda (unknown [9.87.139.129])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
 Wed, 29 Oct 2025 10:20:36 +0000 (GMT)
Date: Wed, 29 Oct 2025 11:20:33 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, balbirs@nvidia.com, borntraeger@de.ibm.com,
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
Subject: Re: [PATCH v1 1/1] KVM: s390: Fix missing present bit for gmap puds
Message-ID: <20251029112033.23b3ee87@p-imbrenda>
In-Reply-To: <db143076-afa0-4129-b5b0-eab85ec54aac@redhat.com>
References: <d4a09cc8-84b2-42a8-bd03-7fa3adee4a99@linux.ibm.com>
 <20251028130150.57379-1-imbrenda@linux.ibm.com>
 <20251028130150.57379-2-imbrenda@linux.ibm.com>
 <db143076-afa0-4129-b5b0-eab85ec54aac@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iCCZHicpewE1nEEK0Th6TZo8jyCZ_lKE
X-Authority-Analysis: v=2.4 cv=WPhyn3sR c=1 sm=1 tr=0 ts=6901ea83 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=TqUBss7doubTCnVJSwQA:9
 a=CjuIK1q_8ugA:10 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NiBTYWx0ZWRfX2SsWkX+TbQmr
 2+aNTSE9EGTlVJFFPDNI6EvdJ/0NfLidif5XzlmHYduy5nfQecT+UYgBSNmL6XNqDkbQj/eqN+Z
 Aj3pDYE10hsg5ntFoqFViDE3Q5xO1GDKNGiZzWFDGbKvvuJKoQtcaFta8VzlvDgHz1bdD+6dW+A
 pCJjPzQks6en4f7qgaW5s26I9ftRLR5WqIr+sWqJzNBKkHOjDa23cObi9I8Ht558wHkgPC0fZv1
 LLBy4oHH0ig79qC3Raez+ML1eHMuj4KSAahnKAS7A+jqSFjkGr2UHtjWkInx/zsx05E7/VYjqIR
 3FQZTJCSdFfVUlzkLcj50LiZuToa1+MV63UUsB7dx5IlB8eZozqV4iaQsE9UsfuLjrJyb4Qwk43
 Ms1L5rM7zV9X+fse4/06Kz7/8zx0MA==
X-Proofpoint-ORIG-GUID: wKqPvWninnMRfuPgoIUz0EKbJo7AbSs7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2510280166
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

On Wed, 29 Oct 2025 11:00:14 +0100
David Hildenbrand <david@redhat.com> wrote:

> On 28.10.25 14:01, Claudio Imbrenda wrote:
> > For hugetlbs, gmap puds have the present bit set. For normal puds
> > (which point to ptes), the bit is not set. This is in contrast to the
> > normal userspace puds, which always have the bit set for present pmds.
> > 
> > This causes issues when ___pte_offset_map() is modified to only check
> > for the present bit.
> > 
> > The solution to the problem is simply to always set the present bit for
> > present gmap pmds.
> > 
> > Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> > Link: https://lore.kernel.org/lkml/20251017144924.10034-1-borntraeger@linux.ibm.com/
> > Tested-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> > Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> > ---
> >   arch/s390/mm/gmap.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
> > index 8ff6bba107e8..22c448b32340 100644
> > --- a/arch/s390/mm/gmap.c
> > +++ b/arch/s390/mm/gmap.c
> > @@ -599,8 +599,9 @@ int __gmap_link(struct gmap *gmap, unsigned long gaddr, unsigned long vmaddr)
> >   					| _SEGMENT_ENTRY_GMAP_UC
> >   					| _SEGMENT_ENTRY;
> >   			} else
> > -				*table = pmd_val(*pmd) &
> > -					_SEGMENT_ENTRY_HARDWARE_BITS;  
> 
> I'd add a comment here like
> 
> /* Make sure that pmd_present() will work on these entries. */

the whole file is going away very soon anyway

> 
> > +				*table = (pmd_val(*pmd) &
> > +					_SEGMENT_ENTRY_HARDWARE_BITS)
> > +					| _SEGMENT_ENTRY;
> >   		}
> >   	} else if (*table & _SEGMENT_ENTRY_PROTECT &&
> >   		   !(pmd_val(*pmd) & _SEGMENT_ENTRY_PROTECT)) {  
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 

