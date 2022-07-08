Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B20CF56C13E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4394710E75B;
	Fri,  8 Jul 2022 20:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C8410E745;
 Fri,  8 Jul 2022 20:25:50 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268K5Ici028542;
 Fri, 8 Jul 2022 20:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=DSQUqWE2dRZCXC+NskDK0nwVtWpWGLEy2mcjypXbwGI=;
 b=V8vR6QA0b2ZSYTxAKyAakG6Ye1LWDBMK0lwVKg06DHsdC+Z45L/KhpOEvzMaY5OpDtzY
 tKFjG0XZhl83jZM5Zlb6Cy3kd/fV55t5+EkOfkJLM7+/NzOL5EfphZUHP8xU4MbJgvnj
 08dNnbzK0hpsGZAFaiqMLgH0q2kSL+DH1KcCfUbD3n7wzcC8OPEv03nTJM9NgW0FZAXq
 4MIy6JwzRD4tnNv/RioCsB8Nl5tp/A01qYT/svLU3+w+WkyWcNButIdGKQExZlVfxs22
 IKuuhfgqKoVIExkJWy/7hR4ZDEx1vl2XOqHpjB6oRgKc+4Q+sLg2Xig7FK0nsEST+UEk NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h6nx1sacs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jul 2022 20:25:37 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 268KDWaI000413;
 Fri, 8 Jul 2022 20:25:36 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h6nx1sacb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jul 2022 20:25:36 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 268KKiGe007579;
 Fri, 8 Jul 2022 20:25:35 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 3h4ugfthy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jul 2022 20:25:35 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 268KPY6620971848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Jul 2022 20:25:34 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 055076A047;
 Fri,  8 Jul 2022 20:25:34 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC3936A057;
 Fri,  8 Jul 2022 20:25:30 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.38.121])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  8 Jul 2022 20:25:30 +0000 (GMT)
Message-ID: <7a455f070ce9afde6ee392f3c136acc144d7f08e.camel@linux.ibm.com>
Subject: Re: [RFT][PATCH v2 3/9] vfio/ccw: Only pass in contiguous pages
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
Date: Fri, 08 Jul 2022 16:25:30 -0400
In-Reply-To: <20220706062759.24946-4-nicolinc@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-4-nicolinc@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GMVIgV7EbRpQa5LfF60uqE8f5DgOr00l
X-Proofpoint-GUID: UdE0rDt9UkqK_geeTxwBRxfm4g2t9yLI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_17,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 suspectscore=0 clxscore=1011 mlxlogscore=999 spamscore=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207080078
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
> This driver is the only caller of vfio_pin/unpin_pages that might
> pass
> in a non-contiguous PFN list, but in many cases it has a contiguous
> PFN
> list to process. So letting VFIO API handle a non-contiguous PFN list
> is actually counterproductive.
> 
> Add a pair of simple loops to pass in contiguous PFNs only, to have
> an
> efficient implementation in VFIO.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
>  drivers/s390/cio/vfio_ccw_cp.c | 70 +++++++++++++++++++++++++++-----
> --
>  1 file changed, 56 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/s390/cio/vfio_ccw_cp.c
> b/drivers/s390/cio/vfio_ccw_cp.c
> index 0c2be9421ab7..3b94863ad24e 100644
> --- a/drivers/s390/cio/vfio_ccw_cp.c
> +++ b/drivers/s390/cio/vfio_ccw_cp.c
> @@ -90,6 +90,38 @@ static int pfn_array_alloc(struct pfn_array *pa,
> u64 iova, unsigned int len)
>  	return 0;
>  }
>  
> +/*
> + * pfn_array_unpin() - Unpin user pages in memory
> + * @pa: pfn_array on which to perform the operation
> + * @vdev: the vfio device to perform the operation
> + * @pa_nr: number of user pages to unpin
> + *
> + * Only unpin if any pages were pinned to begin with, i.e. pa_nr >
> 0,
> + * otherwise only clear pa->pa_nr
> + */
> +static void pfn_array_unpin(struct pfn_array *pa,
> +			    struct vfio_device *vdev, int pa_nr)
> +{
> +	int unpinned = 0, npage = 1;
> +
> +	while (unpinned < pa_nr) {
> +		unsigned long *first = &pa->pa_iova_pfn[unpinned];
> +		unsigned long *last = &first[npage];
> +
> +		if (unpinned + npage < pa_nr &&
> +		    *first + npage == *last) {
> +			npage++;
> +			continue;
> +		}
> +
> +		vfio_unpin_pages(vdev, first, npage);
> +		unpinned += npage;
> +		npage = 1;
> +	}
> +
> +	pa->pa_nr = 0;
> +}
> +
>  /*
>   * pfn_array_pin() - Pin user pages in memory
>   * @pa: pfn_array on which to perform the operation
> @@ -101,34 +133,44 @@ static int pfn_array_alloc(struct pfn_array
> *pa, u64 iova, unsigned int len)
>   */
>  static int pfn_array_pin(struct pfn_array *pa, struct vfio_device
> *vdev)
>  {
> +	int pinned = 0, npage = 1;
>  	int ret = 0;
>  
> -	ret = vfio_pin_pages(vdev, pa->pa_iova_pfn, pa->pa_nr,
> -			     IOMMU_READ | IOMMU_WRITE, pa->pa_pfn);
> +	while (pinned < pa->pa_nr) {
> +		unsigned long *first = &pa->pa_iova_pfn[pinned];
> +		unsigned long *last = &first[npage];
>  
> -	if (ret < 0) {
> -		goto err_out;
> -	} else if (ret > 0 && ret != pa->pa_nr) {
> -		vfio_unpin_pages(vdev, pa->pa_iova_pfn, ret);
> -		ret = -EINVAL;
> -		goto err_out;
> +		if (pinned + npage < pa->pa_nr &&
> +		    *first + npage == *last) {
> +			npage++;
> +			continue;
> +		}
> +
> +		ret = vfio_pin_pages(vdev, first, npage,
> +				     IOMMU_READ | IOMMU_WRITE,
> +				     &pa->pa_pfn[pinned]);
> +		if (ret < 0) {
> +			goto err_out;
> +		} else if (ret > 0 && ret != npage) {
> +			pinned += ret;
> +			ret = -EINVAL;
> +			goto err_out;
> +		}
> +		pinned += npage;
> +		npage = 1;
>  	}
>  
>  	return ret;
>  
>  err_out:
> -	pa->pa_nr = 0;
> -
> +	pfn_array_unpin(pa, vdev, pinned);
>  	return ret;
>  }
>  
>  /* Unpin the pages before releasing the memory. */
>  static void pfn_array_unpin_free(struct pfn_array *pa, struct
> vfio_device *vdev)
>  {
> -	/* Only unpin if any pages were pinned to begin with */
> -	if (pa->pa_nr)
> -		vfio_unpin_pages(vdev, pa->pa_iova_pfn, pa->pa_nr);
> -	pa->pa_nr = 0;
> +	pfn_array_unpin(pa, vdev, pa->pa_nr);
>  	kfree(pa->pa_iova_pfn);
>  }
>  

