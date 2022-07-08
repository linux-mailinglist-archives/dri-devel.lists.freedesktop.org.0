Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C7756C142
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6828910E79C;
	Fri,  8 Jul 2022 20:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E453F10E79D;
 Fri,  8 Jul 2022 20:28:16 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268JbMlE019243;
 Fri, 8 Jul 2022 20:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=gZIL1NoIRuy00BzL/Smq/IgRrjQdqoqr588U5TsuVl0=;
 b=mQ18DxueAFoDBQ37roYqAvcSXzwXf4mXP4//A4o1x2QcFIfN8DAY+VTgKJIKWGLQ81um
 LRgiumwxMVmnaKRZ6YLJ1EYbXItsa3hIlc2FeIOJBeRMQbHtHcrYG0S3rZIInpflH/2p
 ytELcdZE6jAH8lEqgcda2Y7g0F1tJWdTjtMVQb6M3wiSZl2vaS8se01lzkPfir3ERE3l
 BHiisTQ3OvXs5o1ukjvWJu5BYwAn/1NKm3GpIjDJxNld82Ngid1HvDVYqGHxuWB90aIA
 v3d55EicTd0SgJ+R80XvNI3tB+oWVtZn0gukAAH7nl6ajdTrE3X63OieXpCKRLsEFxEl ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h6q9upkpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jul 2022 20:28:07 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 268KBuSu012634;
 Fri, 8 Jul 2022 20:28:07 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h6q9upkpe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jul 2022 20:28:07 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 268KLscS010922;
 Fri, 8 Jul 2022 20:28:05 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 3h4ud82m0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jul 2022 20:28:05 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 268KS4hd20054526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Jul 2022 20:28:04 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB1C7AC05F;
 Fri,  8 Jul 2022 20:28:04 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1813EAC059;
 Fri,  8 Jul 2022 20:27:56 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.38.121])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  8 Jul 2022 20:27:55 +0000 (GMT)
Message-ID: <76bd0a24d2689d3dd7fa62c4a6282c8a6db691d9.camel@linux.ibm.com>
Subject: Re: [RFT][PATCH v2 6/9] vfio/ccw: Change pa_pfn list to pa_iova list
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
Date: Fri, 08 Jul 2022 16:26:23 -0400
In-Reply-To: <20220706062759.24946-7-nicolinc@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-7-nicolinc@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ucpp18Pi3yDq8p499lGp7e5jcXIdwPMv
X-Proofpoint-ORIG-GUID: lviuEIAN7Ro6tB1IibF9j1zivZZ_kowA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_17,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> The vfio_ccw_cp code maintains both iova and its PFN list because the
> vfio_pin/unpin_pages API wanted pfn list. Since
> vfio_pin/unpin_pages()
> now accept "iova", change to maintain only pa_iova list and rename
> all
> "pfn_array" strings to "page_array", so as to simplify the code.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
>  drivers/s390/cio/vfio_ccw_cp.c | 135 ++++++++++++++++---------------
> --
>  1 file changed, 64 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/s390/cio/vfio_ccw_cp.c
> b/drivers/s390/cio/vfio_ccw_cp.c
> index a739262f988d..3854c3d573f5 100644
> --- a/drivers/s390/cio/vfio_ccw_cp.c
> +++ b/drivers/s390/cio/vfio_ccw_cp.c
> @@ -18,11 +18,9 @@
>  #include "vfio_ccw_cp.h"
>  #include "vfio_ccw_private.h"
>  
> -struct pfn_array {
> -	/* Starting guest physical I/O address. */
> -	unsigned long		pa_iova;
> -	/* Array that stores PFNs of the pages need to pin. */
> -	unsigned long		*pa_iova_pfn;
> +struct page_array {
> +	/* Array that stores pages need to pin. */
> +	dma_addr_t		*pa_iova;
>  	/* Array that receives PFNs of the pages pinned. */
>  	unsigned long		*pa_pfn;
>  	/* Number of pages pinned from @pa_iova. */
> @@ -37,53 +35,50 @@ struct ccwchain {
>  	/* Count of the valid ccws in chain. */
>  	int			ch_len;
>  	/* Pinned PAGEs for the original data. */
> -	struct pfn_array	*ch_pa;
> +	struct page_array	*ch_pa;
>  };
>  
>  /*
> - * pfn_array_alloc() - alloc memory for PFNs
> - * @pa: pfn_array on which to perform the operation
> + * page_array_alloc() - alloc memory for page array
> + * @pa: page_array on which to perform the operation
>   * @iova: target guest physical address
>   * @len: number of bytes that should be pinned from @iova
>   *
> - * Attempt to allocate memory for PFNs.
> + * Attempt to allocate memory for page array.
>   *
> - * Usage of pfn_array:
> - * We expect (pa_nr == 0) and (pa_iova_pfn == NULL), any field in
> + * Usage of page_array:
> + * We expect (pa_nr == 0) and (pa_iova == NULL), any field in
>   * this structure will be filled in by this function.
>   *
>   * Returns:
> - *         0 if PFNs are allocated
> - *   -EINVAL if pa->pa_nr is not initially zero, or pa->pa_iova_pfn
> is not NULL
> + *         0 if page array is allocated
> + *   -EINVAL if pa->pa_nr is not initially zero, or pa->pa_iova is
> not NULL
>   *   -ENOMEM if alloc failed
>   */
> -static int pfn_array_alloc(struct pfn_array *pa, u64 iova, unsigned
> int len)
> +static int page_array_alloc(struct page_array *pa, u64 iova,
> unsigned int len)
>  {
>  	int i;
>  
> -	if (pa->pa_nr || pa->pa_iova_pfn)
> +	if (pa->pa_nr || pa->pa_iova)
>  		return -EINVAL;
>  
> -	pa->pa_iova = iova;
> -
>  	pa->pa_nr = ((iova & ~PAGE_MASK) + len + (PAGE_SIZE - 1)) >>
> PAGE_SHIFT;
>  	if (!pa->pa_nr)
>  		return -EINVAL;
>  
> -	pa->pa_iova_pfn = kcalloc(pa->pa_nr,
> -				  sizeof(*pa->pa_iova_pfn) +
> -				  sizeof(*pa->pa_pfn),
> -				  GFP_KERNEL);
> -	if (unlikely(!pa->pa_iova_pfn)) {
> +	pa->pa_iova = kcalloc(pa->pa_nr,
> +			      sizeof(*pa->pa_iova) + sizeof(*pa-
> >pa_pfn),
> +			      GFP_KERNEL);
> +	if (unlikely(!pa->pa_iova)) {
>  		pa->pa_nr = 0;
>  		return -ENOMEM;
>  	}
> -	pa->pa_pfn = pa->pa_iova_pfn + pa->pa_nr;
> +	pa->pa_pfn = (unsigned long *)&pa->pa_iova[pa->pa_nr];
>  
> -	pa->pa_iova_pfn[0] = pa->pa_iova >> PAGE_SHIFT;
> +	pa->pa_iova[0] = iova;
>  	pa->pa_pfn[0] = -1ULL;
>  	for (i = 1; i < pa->pa_nr; i++) {
> -		pa->pa_iova_pfn[i] = pa->pa_iova_pfn[i - 1] + 1;
> +		pa->pa_iova[i] = pa->pa_iova[i - 1] + PAGE_SIZE;
>  		pa->pa_pfn[i] = -1ULL;
>  	}
>  
> @@ -91,30 +86,30 @@ static int pfn_array_alloc(struct pfn_array *pa,
> u64 iova, unsigned int len)
>  }
>  
>  /*
> - * pfn_array_unpin() - Unpin user pages in memory
> - * @pa: pfn_array on which to perform the operation
> + * page_array_unpin() - Unpin user pages in memory
> + * @pa: page_array on which to perform the operation
>   * @vdev: the vfio device to perform the operation
>   * @pa_nr: number of user pages to unpin
>   *
>   * Only unpin if any pages were pinned to begin with, i.e. pa_nr >
> 0,
>   * otherwise only clear pa->pa_nr
>   */
> -static void pfn_array_unpin(struct pfn_array *pa,
> -			    struct vfio_device *vdev, int pa_nr)
> +static void page_array_unpin(struct page_array *pa,
> +			     struct vfio_device *vdev, int pa_nr)
>  {
>  	int unpinned = 0, npage = 1;
>  
>  	while (unpinned < pa_nr) {
> -		unsigned long *first = &pa->pa_iova_pfn[unpinned];
> -		unsigned long *last = &first[npage];
> +		dma_addr_t *first = &pa->pa_iova[unpinned];
> +		dma_addr_t *last = &first[npage];
>  
>  		if (unpinned + npage < pa_nr &&
> -		    *first + npage == *last) {
> +		    *first + npage * PAGE_SIZE == *last) {
>  			npage++;
>  			continue;
>  		}
>  
> -		vfio_unpin_pages(vdev, *first << PAGE_SHIFT, npage);
> +		vfio_unpin_pages(vdev, *first, npage);
>  		unpinned += npage;
>  		npage = 1;
>  	}
> @@ -123,30 +118,30 @@ static void pfn_array_unpin(struct pfn_array
> *pa,
>  }
>  
>  /*
> - * pfn_array_pin() - Pin user pages in memory
> - * @pa: pfn_array on which to perform the operation
> + * page_array_pin() - Pin user pages in memory
> + * @pa: page_array on which to perform the operation
>   * @mdev: the mediated device to perform pin operations
>   *
>   * Returns number of pages pinned upon success.
>   * If the pin request partially succeeds, or fails completely,
>   * all pages are left unpinned and a negative error value is
> returned.
>   */
> -static int pfn_array_pin(struct pfn_array *pa, struct vfio_device
> *vdev)
> +static int page_array_pin(struct page_array *pa, struct vfio_device
> *vdev)
>  {
>  	int pinned = 0, npage = 1;
>  	int ret = 0;
>  
>  	while (pinned < pa->pa_nr) {
> -		unsigned long *first = &pa->pa_iova_pfn[pinned];
> -		unsigned long *last = &first[npage];
> +		dma_addr_t *first = &pa->pa_iova[pinned];
> +		dma_addr_t *last = &first[npage];
>  
>  		if (pinned + npage < pa->pa_nr &&
> -		    *first + npage == *last) {
> +		    *first + npage * PAGE_SIZE == *last) {
>  			npage++;
>  			continue;
>  		}
>  
> -		ret = vfio_pin_pages(vdev, *first << PAGE_SHIFT, npage,
> +		ret = vfio_pin_pages(vdev, *first, npage,
>  				     IOMMU_READ | IOMMU_WRITE,
>  				     &pa->pa_pfn[pinned]);
>  		if (ret < 0) {
> @@ -163,32 +158,30 @@ static int pfn_array_pin(struct pfn_array *pa,
> struct vfio_device *vdev)
>  	return ret;
>  
>  err_out:
> -	pfn_array_unpin(pa, vdev, pinned);
> +	page_array_unpin(pa, vdev, pinned);
>  	return ret;
>  }
>  
>  /* Unpin the pages before releasing the memory. */
> -static void pfn_array_unpin_free(struct pfn_array *pa, struct
> vfio_device *vdev)
> +static void page_array_unpin_free(struct page_array *pa, struct
> vfio_device *vdev)
>  {
> -	pfn_array_unpin(pa, vdev, pa->pa_nr);
> -	kfree(pa->pa_iova_pfn);
> +	page_array_unpin(pa, vdev, pa->pa_nr);
> +	kfree(pa->pa_iova);
>  }
>  
> -static bool pfn_array_iova_pinned(struct pfn_array *pa, unsigned
> long iova)
> +static bool page_array_iova_pinned(struct page_array *pa, unsigned
> long iova)
>  {
> -	unsigned long iova_pfn = iova >> PAGE_SHIFT;
>  	int i;
>  
>  	for (i = 0; i < pa->pa_nr; i++)
> -		if (pa->pa_iova_pfn[i] == iova_pfn)
> +		if (pa->pa_iova[i] == iova)
>  			return true;
>  
>  	return false;
>  }
> -/* Create the list of IDAL words for a pfn_array. */
> -static inline void pfn_array_idal_create_words(
> -	struct pfn_array *pa,
> -	unsigned long *idaws)
> +/* Create the list of IDAL words for a page_array. */
> +static inline void page_array_idal_create_words(struct page_array
> *pa,
> +						unsigned long *idaws)
>  {
>  	int i;
>  
> @@ -204,7 +197,7 @@ static inline void pfn_array_idal_create_words(
>  		idaws[i] = pa->pa_pfn[i] << PAGE_SHIFT;
>  
>  	/* Adjust the first IDAW, since it may not start on a page
> boundary */
> -	idaws[0] += pa->pa_iova & (PAGE_SIZE - 1);
> +	idaws[0] += pa->pa_iova[0] & (PAGE_SIZE - 1);
>  }
>  
>  static void convert_ccw0_to_ccw1(struct ccw1 *source, unsigned long
> len)
> @@ -236,18 +229,18 @@ static void convert_ccw0_to_ccw1(struct ccw1
> *source, unsigned long len)
>  static long copy_from_iova(struct vfio_device *vdev, void *to, u64
> iova,
>  			   unsigned long n)
>  {
> -	struct pfn_array pa = {0};
> +	struct page_array pa = {0};
>  	u64 from;
>  	int i, ret;
>  	unsigned long l, m;
>  
> -	ret = pfn_array_alloc(&pa, iova, n);
> +	ret = page_array_alloc(&pa, iova, n);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = pfn_array_pin(&pa, vdev);
> +	ret = page_array_pin(&pa, vdev);
>  	if (ret < 0) {
> -		pfn_array_unpin_free(&pa, vdev);
> +		page_array_unpin_free(&pa, vdev);
>  		return ret;
>  	}
>  
> @@ -268,7 +261,7 @@ static long copy_from_iova(struct vfio_device
> *vdev, void *to, u64 iova,
>  			break;
>  	}
>  
> -	pfn_array_unpin_free(&pa, vdev);
> +	page_array_unpin_free(&pa, vdev);
>  
>  	return l;
>  }
> @@ -371,7 +364,7 @@ static struct ccwchain *ccwchain_alloc(struct
> channel_program *cp, int len)
>  	chain->ch_ccw = (struct ccw1 *)data;
>  
>  	data = (u8 *)(chain->ch_ccw) + sizeof(*chain->ch_ccw) * len;
> -	chain->ch_pa = (struct pfn_array *)data;
> +	chain->ch_pa = (struct page_array *)data;
>  
>  	chain->ch_len = len;
>  
> @@ -555,7 +548,7 @@ static int ccwchain_fetch_direct(struct ccwchain
> *chain,
>  	struct vfio_device *vdev =
>  		&container_of(cp, struct vfio_ccw_private, cp)->vdev;
>  	struct ccw1 *ccw;
> -	struct pfn_array *pa;
> +	struct page_array *pa;
>  	u64 iova;
>  	unsigned long *idaws;
>  	int ret;
> @@ -589,13 +582,13 @@ static int ccwchain_fetch_direct(struct
> ccwchain *chain,
>  	}
>  
>  	/*
> -	 * Allocate an array of pfn's for pages to pin/translate.
> +	 * Allocate an array of pages to pin/translate.
>  	 * The number of pages is actually the count of the idaws
>  	 * required for the data transfer, since we only only support
>  	 * 4K IDAWs today.
>  	 */
>  	pa = chain->ch_pa + idx;
> -	ret = pfn_array_alloc(pa, iova, bytes);
> +	ret = page_array_alloc(pa, iova, bytes);
>  	if (ret < 0)
>  		goto out_free_idaws;
>  
> @@ -606,21 +599,21 @@ static int ccwchain_fetch_direct(struct
> ccwchain *chain,
>  			goto out_unpin;
>  
>  		/*
> -		 * Copy guest IDAWs into pfn_array, in case the memory
> they
> +		 * Copy guest IDAWs into page_array, in case the memory
> they
>  		 * occupy is not contiguous.
>  		 */
>  		for (i = 0; i < idaw_nr; i++)
> -			pa->pa_iova_pfn[i] = idaws[i] >> PAGE_SHIFT;
> +			pa->pa_iova[i] = idaws[i];
>  	} else {
>  		/*
> -		 * No action is required here; the iova addresses in
> pfn_array
> -		 * were initialized sequentially in pfn_array_alloc()
> beginning
> +		 * No action is required here; the iova addresses in
> page_array
> +		 * were initialized sequentially in page_array_alloc()
> beginning
>  		 * with the contents of ccw->cda.
>  		 */
>  	}
>  
>  	if (ccw_does_data_transfer(ccw)) {
> -		ret = pfn_array_pin(pa, vdev);
> +		ret = page_array_pin(pa, vdev);
>  		if (ret < 0)
>  			goto out_unpin;
>  	} else {
> @@ -630,13 +623,13 @@ static int ccwchain_fetch_direct(struct
> ccwchain *chain,
>  	ccw->cda = (__u32) virt_to_phys(idaws);
>  	ccw->flags |= CCW_FLAG_IDA;
>  
> -	/* Populate the IDAL with pinned/translated addresses from pfn
> */
> -	pfn_array_idal_create_words(pa, idaws);
> +	/* Populate the IDAL with pinned/translated addresses from page
> */
> +	page_array_idal_create_words(pa, idaws);
>  
>  	return 0;
>  
>  out_unpin:
> -	pfn_array_unpin_free(pa, vdev);
> +	page_array_unpin_free(pa, vdev);
>  out_free_idaws:
>  	kfree(idaws);
>  out_init:
> @@ -742,7 +735,7 @@ void cp_free(struct channel_program *cp)
>  	cp->initialized = false;
>  	list_for_each_entry_safe(chain, temp, &cp->ccwchain_list, next)
> {
>  		for (i = 0; i < chain->ch_len; i++) {
> -			pfn_array_unpin_free(chain->ch_pa + i, vdev);
> +			page_array_unpin_free(chain->ch_pa + i, vdev);
>  			ccwchain_cda_free(chain, i);
>  		}
>  		ccwchain_free(chain);
> @@ -918,7 +911,7 @@ bool cp_iova_pinned(struct channel_program *cp,
> u64 iova)
>  
>  	list_for_each_entry(chain, &cp->ccwchain_list, next) {
>  		for (i = 0; i < chain->ch_len; i++)
> -			if (pfn_array_iova_pinned(chain->ch_pa + i,
> iova))
> +			if (page_array_iova_pinned(chain->ch_pa + i,
> iova))
>  				return true;
>  	}
>  

