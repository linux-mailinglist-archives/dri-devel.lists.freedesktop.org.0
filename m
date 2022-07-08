Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F13356C147
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3ED210E7DA;
	Fri,  8 Jul 2022 20:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C3010E7EE;
 Fri,  8 Jul 2022 20:29:47 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268HpsJa000982;
 Fri, 8 Jul 2022 20:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=QeDo5USZkSOgeHA1+5u293B83gRQ5EgFQCkOdgj2vzY=;
 b=GxbKnqrQG+PmbD0CVzrzHXeLCXwzH2QaaWrQDtq8G/KhZqU5E30UeVTKnPTsd5cKO4wi
 6b4MiU4ldVcn0VCl0ytxY7JRoiCPRuUUaKMDuY8EaJGucSri1jFb64SxE8h5sCnnEe+U
 Uh020lKcjYeWjl5lvcBEj3sz42bMBhx/BR9WDAbQ1UdnPjEsEFtCfOQIm/yD/YakcYRe
 +o8qkjVQikbkV9DaiWNOdu6pyocFbGfRqr4165sO9kBKPBJXlueBafX/iUHuuXOSjx10
 UWKIiy7/D2twV2q8zbW6Pg2GDPEEc8+5i3hK/symuuCs+z11pA4uIMo6DRlGoQq11jhL aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h6sbu3702-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jul 2022 20:29:42 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 268KIsHk024859;
 Fri, 8 Jul 2022 20:29:41 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h6sbu36yd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jul 2022 20:29:41 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 268KLsPg010925;
 Fri, 8 Jul 2022 20:29:40 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 3h4ud82m7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jul 2022 20:29:40 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 268KTdgX8192946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Jul 2022 20:29:39 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BDD2124053;
 Fri,  8 Jul 2022 20:29:39 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35B16124052;
 Fri,  8 Jul 2022 20:29:31 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.38.121])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  8 Jul 2022 20:29:30 +0000 (GMT)
Message-ID: <b8ad32db67e23455e021fc054d22e4512484db59.camel@linux.ibm.com>
Subject: Re: [RFT][PATCH v2 8/9] vfio/ccw: Add kmap_local_page() for memcpy
From: Eric Farman <farman@linux.ibm.com>
To: Nicolin Chen <nicolinc@nvidia.com>, kwankhede@nvidia.com, corbet@lwn.net, 
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com,
 zhenyuw@linux.intel.com, zhi.a.wang@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, daniel@ffwll.ch, mjrosato@linux.ibm.com,
 pasic@linux.ibm.com, vneethv@linux.ibm.com, oberpar@linux.ibm.com,
 freude@linux.ibm.com, akrowiak@linux.ibm.com, jjherne@linux.ibm.com,
 alex.williamson@redhat.com, cohuck@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com, hch@infradead.org
Date: Fri, 08 Jul 2022 16:29:29 -0400
In-Reply-To: <20220706062759.24946-9-nicolinc@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-9-nicolinc@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TDASEhEflXjYf4LxUiQ-00bW7dS0RTif
X-Proofpoint-ORIG-GUID: 3q-7Ow7uaB0pGlrLmhUnswjJ38crTp7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_17,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207080079
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, jchrist@linux.ibm.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-07-05 at 23:27 -0700, Nicolin Chen wrote:
> A PFN is not secure enough to promise that the memory is not IO. And
> direct access via memcpy() that only handles CPU memory will crash on
> S390 if the PFN is an IO PFN, as we have to use the
> memcpy_to/fromio()
> that uses the special S390 IO access instructions. On the other hand,
> a "struct page *" is always a CPU coherent thing that fits memcpy().
> 
> Also, casting a PFN to "void *" for memcpy() is not a proper
> practice,
> kmap_local_page() is the correct API to call here, though S390
> doesn't
> use highmem, which means kmap_local_page() is a NOP.
> 
> There's a following patch changing the vfio_pin_pages() API to return
> a list of "struct page *" instead of PFNs. It will block any IO
> memory
> from ever getting into this call path, for such a security purpose.
> In
> this patch, add kmap_local_page() to prepare for that.

This all sounds like it's conflating vfio-ccw with vfio-pci, and
configuration-wise I have a hard time picturing the situation described
above. But in the interest of the change in the next patch, I suppose
it's fine.

Acked-by: Eric Farman <farman@linux.ibm.com>

> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/s390/cio/vfio_ccw_cp.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/s390/cio/vfio_ccw_cp.c
> b/drivers/s390/cio/vfio_ccw_cp.c
> index 3854c3d573f5..cd4ec4f6d6ff 100644
> --- a/drivers/s390/cio/vfio_ccw_cp.c
> +++ b/drivers/s390/cio/vfio_ccw_cp.c
> @@ -11,6 +11,7 @@
>  #include <linux/ratelimit.h>
>  #include <linux/mm.h>
>  #include <linux/slab.h>
> +#include <linux/highmem.h>
>  #include <linux/iommu.h>
>  #include <linux/vfio.h>
>  #include <asm/idals.h>
> @@ -230,7 +231,6 @@ static long copy_from_iova(struct vfio_device
> *vdev, void *to, u64 iova,
>  			   unsigned long n)
>  {
>  	struct page_array pa = {0};
> -	u64 from;
>  	int i, ret;
>  	unsigned long l, m;
>  
> @@ -246,7 +246,9 @@ static long copy_from_iova(struct vfio_device
> *vdev, void *to, u64 iova,
>  
>  	l = n;
>  	for (i = 0; i < pa.pa_nr; i++) {
> -		from = pa.pa_pfn[i] << PAGE_SHIFT;
> +		struct page *page = pfn_to_page(pa.pa_pfn[i]);
> +		void *from = kmap_local_page(page);
> +
>  		m = PAGE_SIZE;
>  		if (i == 0) {
>  			from += iova & (PAGE_SIZE - 1);
> @@ -254,7 +256,8 @@ static long copy_from_iova(struct vfio_device
> *vdev, void *to, u64 iova,
>  		}
>  
>  		m = min(l, m);
> -		memcpy(to + (n - l), (void *)from, m);
> +		memcpy(to + (n - l), from, m);
> +		kunmap_local(from);
>  
>  		l -= m;
>  		if (l == 0)

