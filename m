Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C29B8BF014F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 11:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9B088DE5;
	Mon, 20 Oct 2025 09:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="hjsK+JyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC5488DE5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 09:05:02 +0000 (UTC)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JMkum2016545;
 Mon, 20 Oct 2025 09:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=Pe7xLD
 fJi0AzIHv3rSgjsegyZR/rKdoJT/nj5U92Ldg=; b=hjsK+JyUy1jI2s0tYnGGdS
 sB7zH8bk1jLbaqVv8Tyyy59hum6lqx6j84ewkAt2iRFJeJLFfyqq2f/IAv5+3FqO
 AAPffhaAz70St6g1Fn12h0jL1eCu12XV7G3y+Zds4PuB4whuzpn3Z5thi+v9FqAy
 fXFmqZdNqbf1YXk1H8stbvCsbQpPuwnEqGcHRAg8rWzpZELHxeeOlBwncqIc3kAu
 8c2ER3gwOuSqr/3KpmZXtzTQfOGhoE0uHZ1ZPrg+VX3GBeBpD+rPsp9JhDJYH38e
 YVhzsXcaZXbE8yXVeId3rj8z9X/Xvn2jupst+8QK0I3EqyFEm4CzN0R6G0XxzQBw
 ==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v33f0k57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Oct 2025 09:04:52 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59K931u2006230;
 Mon, 20 Oct 2025 09:04:51 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v33f0k51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Oct 2025 09:04:51 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59K6wZc2024686;
 Mon, 20 Oct 2025 09:04:50 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49vpqjmudb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Oct 2025 09:04:50 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 59K94m1962718372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Oct 2025 09:04:48 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F48C20049;
 Mon, 20 Oct 2025 09:04:48 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 143B220040;
 Mon, 20 Oct 2025 09:04:47 +0000 (GMT)
Received: from p-imbrenda (unknown [9.155.209.42])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 20 Oct 2025 09:04:47 +0000 (GMT)
Date: Mon, 20 Oct 2025 11:04:44 +0200
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
Message-ID: <20251020110444.18981271@p-imbrenda>
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
X-Authority-Analysis: v=2.4 cv=FMYWBuos c=1 sm=1 tr=0 ts=68f5fb34 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=20KFwNOVAAAA:8 a=Y9YCzrUEY6i5LxjyWmAA:9 a=CjuIK1q_8ugA:10
 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-GUID: 8NerjxZPc--zjiIaTkWhkbJb_dv91boA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfXwUQT8uqXzLgT
 JXanwJTsJZhXSf9IQ85O6DcGpxj2pZbntCNT2apS3VcD/U6tP0QhPJfmrYMTAFY5moHo9ocxaBp
 +YrDIFN/qxKi7hF9PcJJL1NaQU9stv1rfOV+z2A95t4AbdVbAJBsm8Md4kJIHjjdKc8DClAH7O7
 BjnaJmtsN6hMiSl/+syaXX5Ba90L75FhUWn7ANyQw3EQ3v1HNxUnQh6BqaRIV+bYdyt37Bpqb5n
 BMqhwknYHskhwr19Sg1KoUc9vENeex3nQpwCG0dSoCQc8JiJnE0TbPS6EsohBPRPmFaql31m/Yg
 AqSen81fILOQUHR5w2lt7AYaVgKFKtbDVCFWDdsM/LMjll6ySvJFhQPLR0yqyDznjUZPW3ofJto
 TTo4j1PQpHWqLLm3u1x0jnTvPhWevw==
X-Proofpoint-ORIG-GUID: ut1HsLhtsE_04j4yjYOi9RKsWrHzMoY0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180022
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

I'm looking into that

> gmap code (which is getting redesigned either way) to only take the page 

unfortunately the rework won't make it in 6.18, so I'll have to quickly
cobble together a fix

> lock.
> 
> In the end, we'll want here later a single
> 
> if (!pmd_present(pmdval))
> 	goto nomap;
> 

