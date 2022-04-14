Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE9E501C6E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 22:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E70110E21B;
	Thu, 14 Apr 2022 20:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569DA10E203;
 Thu, 14 Apr 2022 20:14:18 +0000 (UTC)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23EH8IU8015720; 
 Thu, 14 Apr 2022 19:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=ozm7ObVk9+dmufRZapWVOwMVGMWLWKlEXppBnJWoflE=;
 b=MGLO55jPGvwihfaFDaSwwejN6qf//k0YAChtN6/8N4qE04nhdYSP9y31Qj4rfcRz/CMg
 0BEahHC9Fjb4RfTdMix3h5DhRd4/eqJOAS8wOfGfp+dvOAk/4BH81i0wrVNkfcFg4PTt
 lcnHK0bjoHtwXgjDS99tBcmquO6L1G3pUuBOarlWWVK4/Q0m+U3mWU5cGm7+MVx+5MnQ
 AglPibbAlgETll38WNKozchQt4Kjk+Vyek96CC4EuiO/+0LUNF3ljLSm7ojoEK1Py2B6
 jHK+qDr8m8ofhI9drdFzMXnNWfTFVvQbWmzh1kofvIE6/XAP7da2sPFnozf2bu/TJxvn rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fefydd057-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 19:26:22 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23EJH0lv007797;
 Thu, 14 Apr 2022 19:26:22 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fefydd051-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 19:26:22 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23EJIChX024952;
 Thu, 14 Apr 2022 19:26:21 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3fb1sabjp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 19:26:21 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23EJQKoQ25100588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Apr 2022 19:26:20 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02C89AE060;
 Thu, 14 Apr 2022 19:26:20 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25C80AE05C;
 Thu, 14 Apr 2022 19:26:13 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.52.116])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 14 Apr 2022 19:26:12 +0000 (GMT)
Message-ID: <f9d4fb48ccee8ffa70caadf88f143bd91fcfc05e.camel@linux.ibm.com>
Subject: Re: [PATCH 3/9] vfio/mdev: Pass in a struct vfio_device * to
 vfio_pin/unpin_pages()
From: Eric Farman <farman@linux.ibm.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@linux.ie>, Tony Krowiak
 <akrowiak@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Harald Freudenberger
 <freude@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org, Kirti
 Wankhede <kwankhede@nvidia.com>,
 linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Vineeth Vijayan
 <vneethv@linux.ibm.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
Date: Thu, 14 Apr 2022 15:26:11 -0400
In-Reply-To: <3-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
References: <3-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uZq8aBCvvRiYB0aEQrrVOKYqDxG7Xk9n
X-Proofpoint-ORIG-GUID: 93JfTwHUje5lundOnEzqRFuD3bDlU-bs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-14_05,2022-04-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxscore=0 malwarescore=0 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204140100
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-04-12 at 12:53 -0300, Jason Gunthorpe wrote:
> Every caller has a readily available vfio_device pointer, use that
> instead
> of passing in a generic struct device. The struct vfio_device already
> contains the group we need so this avoids complexity, extra
> refcountings,
> and a confusing lifecycle model.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  .../driver-api/vfio-mediated-device.rst       |  4 +-
>  drivers/s390/cio/vfio_ccw_cp.c                |  6 +--
>  drivers/s390/crypto/vfio_ap_ops.c             |  8 ++--
>  drivers/vfio/vfio.c                           | 40 ++++++-----------
> --
>  include/linux/vfio.h                          |  4 +-
>  5 files changed, 24 insertions(+), 38 deletions(-)

For the -ccw bits:

Acked-by: Eric Farman <farman@linux.ibm.com>

> 
> diff --git a/Documentation/driver-api/vfio-mediated-device.rst
> b/Documentation/driver-api/vfio-mediated-device.rst
> index 9f26079cacae35..6aeca741dc9be1 100644
> --- a/Documentation/driver-api/vfio-mediated-device.rst
> +++ b/Documentation/driver-api/vfio-mediated-device.rst
> @@ -279,10 +279,10 @@ Translation APIs for Mediated Devices
>  The following APIs are provided for translating user pfn to host pfn
> in a VFIO
>  driver::
>  
> -	extern int vfio_pin_pages(struct device *dev, unsigned long
> *user_pfn,
> +	extern int vfio_pin_pages(struct vfio_device *vdev, unsigned
> long *user_pfn,
>  				  int npage, int prot, unsigned long
> *phys_pfn);
>  
> -	extern int vfio_unpin_pages(struct device *dev, unsigned long
> *user_pfn,
> +	extern int vfio_unpin_pages(struct vfio_device *vdev, unsigned
> long *user_pfn,
>  				    int npage);
>  
>  These functions call back into the back-end IOMMU module by using
> the pin_pages
> diff --git a/drivers/s390/cio/vfio_ccw_cp.c
> b/drivers/s390/cio/vfio_ccw_cp.c
> index af5048a1ba8894..e362cb962a7234 100644
> --- a/drivers/s390/cio/vfio_ccw_cp.c
> +++ b/drivers/s390/cio/vfio_ccw_cp.c
> @@ -103,13 +103,13 @@ static int pfn_array_pin(struct pfn_array *pa,
> struct vfio_device *vdev)
>  {
>  	int ret = 0;
>  
> -	ret = vfio_pin_pages(vdev->dev, pa->pa_iova_pfn, pa->pa_nr,
> +	ret = vfio_pin_pages(vdev, pa->pa_iova_pfn, pa->pa_nr,
>  			     IOMMU_READ | IOMMU_WRITE, pa->pa_pfn);
>  
>  	if (ret < 0) {
>  		goto err_out;
>  	} else if (ret > 0 && ret != pa->pa_nr) {
> -		vfio_unpin_pages(vdev->dev, pa->pa_iova_pfn, ret);
> +		vfio_unpin_pages(vdev, pa->pa_iova_pfn, ret);
>  		ret = -EINVAL;
>  		goto err_out;
>  	}
> @@ -127,7 +127,7 @@ static void pfn_array_unpin_free(struct pfn_array
> *pa, struct vfio_device *vdev)
>  {
>  	/* Only unpin if any pages were pinned to begin with */
>  	if (pa->pa_nr)
> -		vfio_unpin_pages(vdev->dev, pa->pa_iova_pfn, pa-
> >pa_nr);
> +		vfio_unpin_pages(vdev, pa->pa_iova_pfn, pa->pa_nr);
>  	pa->pa_nr = 0;
>  	kfree(pa->pa_iova_pfn);
>  }
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c
> b/drivers/s390/crypto/vfio_ap_ops.c
> index 69768061cd7bd9..a10b3369d76c41 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -124,7 +124,7 @@ static void vfio_ap_free_aqic_resources(struct
> vfio_ap_queue *q)
>  		q->saved_isc = VFIO_AP_ISC_INVALID;
>  	}
>  	if (q->saved_pfn && !WARN_ON(!q->matrix_mdev)) {
> -		vfio_unpin_pages(mdev_dev(q->matrix_mdev->mdev),
> +		vfio_unpin_pages(&q->matrix_mdev->vdev,
>  				 &q->saved_pfn, 1);
>  		q->saved_pfn = 0;
>  	}
> @@ -258,7 +258,7 @@ static struct ap_queue_status
> vfio_ap_irq_enable(struct vfio_ap_queue *q,
>  		return status;
>  	}
>  
> -	ret = vfio_pin_pages(mdev_dev(q->matrix_mdev->mdev), &g_pfn, 1,
> +	ret = vfio_pin_pages(&q->matrix_mdev->vdev, &g_pfn, 1,
>  			     IOMMU_READ | IOMMU_WRITE, &h_pfn);
>  	switch (ret) {
>  	case 1:
> @@ -301,7 +301,7 @@ static struct ap_queue_status
> vfio_ap_irq_enable(struct vfio_ap_queue *q,
>  		break;
>  	case AP_RESPONSE_OTHERWISE_CHANGED:
>  		/* We could not modify IRQ setings: clear new
> configuration */
> -		vfio_unpin_pages(mdev_dev(q->matrix_mdev->mdev),
> &g_pfn, 1);
> +		vfio_unpin_pages(&q->matrix_mdev->vdev, &g_pfn, 1);
>  		kvm_s390_gisc_unregister(kvm, isc);
>  		break;
>  	default:
> @@ -1250,7 +1250,7 @@ static int vfio_ap_mdev_iommu_notifier(struct
> notifier_block *nb,
>  		struct vfio_iommu_type1_dma_unmap *unmap = data;
>  		unsigned long g_pfn = unmap->iova >> PAGE_SHIFT;
>  
> -		vfio_unpin_pages(mdev_dev(matrix_mdev->mdev), &g_pfn,
> 1);
> +		vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
>  		return NOTIFY_OK;
>  	}
>  
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index 8a5c46aa2bef61..24b92a45cfc8f1 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -2142,32 +2142,26 @@
> EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare);
>   * @phys_pfn[out]: array of host PFNs
>   * Return error or number of pages pinned.
>   */
> -int vfio_pin_pages(struct device *dev, unsigned long *user_pfn, int
> npage,
> +int vfio_pin_pages(struct vfio_device *vdev, unsigned long
> *user_pfn, int npage,
>  		   int prot, unsigned long *phys_pfn)
>  {
>  	struct vfio_container *container;
> -	struct vfio_group *group;
> +	struct vfio_group *group = vdev->group;
>  	struct vfio_iommu_driver *driver;
>  	int ret;
>  
> -	if (!dev || !user_pfn || !phys_pfn || !npage)
> +	if (!user_pfn || !phys_pfn || !npage)
>  		return -EINVAL;
>  
>  	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
>  		return -E2BIG;
>  
> -	group = vfio_group_get_from_dev(dev);
> -	if (!group)
> -		return -ENODEV;
> -
> -	if (group->dev_counter > 1) {
> -		ret = -EINVAL;
> -		goto err_pin_pages;
> -	}
> +	if (group->dev_counter > 1)
> +		return -EINVAL;
>  
>  	ret = vfio_group_add_container_user(group);
>  	if (ret)
> -		goto err_pin_pages;
> +		return ret;
>  
>  	container = group->container;
>  	driver = container->iommu_driver;
> @@ -2180,8 +2174,6 @@ int vfio_pin_pages(struct device *dev, unsigned
> long *user_pfn, int npage,
>  
>  	vfio_group_try_dissolve_container(group);
>  
> -err_pin_pages:
> -	vfio_group_put(group);
>  	return ret;
>  }
>  EXPORT_SYMBOL(vfio_pin_pages);
> @@ -2195,28 +2187,24 @@ EXPORT_SYMBOL(vfio_pin_pages);
>   *                 be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
>   * Return error or number of pages unpinned.
>   */
> -int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn,
> int npage)
> +int vfio_unpin_pages(struct vfio_device *vdev, unsigned long
> *user_pfn,
> +		     int npage)
>  {
>  	struct vfio_container *container;
> -	struct vfio_group *group;
>  	struct vfio_iommu_driver *driver;
>  	int ret;
>  
> -	if (!dev || !user_pfn || !npage)
> +	if (!user_pfn || !npage)
>  		return -EINVAL;
>  
>  	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
>  		return -E2BIG;
>  
> -	group = vfio_group_get_from_dev(dev);
> -	if (!group)
> -		return -ENODEV;
> -
> -	ret = vfio_group_add_container_user(group);
> +	ret = vfio_group_add_container_user(vdev->group);
>  	if (ret)
> -		goto err_unpin_pages;
> +		return ret;
>  
> -	container = group->container;
> +	container = vdev->group->container;
>  	driver = container->iommu_driver;
>  	if (likely(driver && driver->ops->unpin_pages))
>  		ret = driver->ops->unpin_pages(container->iommu_data,
> user_pfn,
> @@ -2224,10 +2212,8 @@ int vfio_unpin_pages(struct device *dev,
> unsigned long *user_pfn, int npage)
>  	else
>  		ret = -ENOTTY;
>  
> -	vfio_group_try_dissolve_container(group);
> +	vfio_group_try_dissolve_container(vdev->group);
>  
> -err_unpin_pages:
> -	vfio_group_put(group);
>  	return ret;
>  }
>  EXPORT_SYMBOL(vfio_unpin_pages);
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 748ec0e0293aea..8f2a09801a660b 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -150,9 +150,9 @@ extern long vfio_external_check_extension(struct
> vfio_group *group,
>  
>  #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned
> long))
>  
> -extern int vfio_pin_pages(struct device *dev, unsigned long
> *user_pfn,
> +extern int vfio_pin_pages(struct vfio_device *vdev, unsigned long
> *user_pfn,
>  			  int npage, int prot, unsigned long
> *phys_pfn);
> -extern int vfio_unpin_pages(struct device *dev, unsigned long
> *user_pfn,
> +extern int vfio_unpin_pages(struct vfio_device *vdev, unsigned long
> *user_pfn,
>  			    int npage);
>  
>  extern int vfio_group_pin_pages(struct vfio_group *group,

