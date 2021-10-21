Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB40436A42
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 20:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6E56ECE6;
	Thu, 21 Oct 2021 18:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FCA6ECD8;
 Thu, 21 Oct 2021 18:12:13 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19LGlTIJ025167; 
 Thu, 21 Oct 2021 14:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=/7T47fDjjGD4Y0Vbq2SQYiIwz/sVtf8u6rvGWOeefmg=;
 b=YTOK8g5oNCRCWq8pvibIj6oBcBTZvcurcDD7WWnfGT4vCQU3NCO1Gx+THm9sEqAJhSgD
 5bZowNe2UH+Q+OKm8p/IqUeAmWbSeSsSBjX2BO1F0wFJoAzpe5OK0PAlhxW6/ZVg8IL1
 4RoqgQmxyp0E11OFt3K6N60NMt7yO93HfoqUgehwP6ebAIkcuGsAPTvOh/M4TJu9AQa1
 rmY1IiBnm/Wt/2vvbWVq7QTqoOKNz/yUunwgMlfvcvTQH60YBFghAqIdNuOX426nnVyL
 siCqKH5X8GrkxBgGW024ZcV69OKYmpDGfNgLsWgHwhHyvlFw28yqdzlevPCR85jwfHzr tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3buc1qsn7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 14:09:24 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19LHxSXa028167;
 Thu, 21 Oct 2021 14:09:24 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3buc1qsn6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 14:09:24 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19LI7feu005517;
 Thu, 21 Oct 2021 18:09:22 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 3bqpcdw3hy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 18:09:22 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19LI9LUD45351422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Oct 2021 18:09:21 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EF73112067;
 Thu, 21 Oct 2021 18:09:21 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E1E7112065;
 Thu, 21 Oct 2021 18:09:15 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.163.26.166])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 21 Oct 2021 18:09:15 +0000 (GMT)
Message-ID: <88f889047e9269222f6c7c439ebe44cb799a2e60.camel@linux.ibm.com>
Subject: Re: [PATCH v3 04/10] vfio/ccw: Convert to use
 vfio_register_emulated_iommu_dev()
From: Eric Farman <farman@linux.ibm.com>
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>, Tony
 Krowiak <akrowiak@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Cornelia Huck <cohuck@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org, Kirti
 Wankhede <kwankhede@nvidia.com>,
 linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vineeth Vijayan
 <vneethv@linux.ibm.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>, Christoph Hellwig <hch@lst.de>
Date: Thu, 21 Oct 2021 14:09:12 -0400
In-Reply-To: <4-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
References: <4-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zMKb3XWsTnH1-YMw_ggmThPI9lrWfc5Y
X-Proofpoint-ORIG-GUID: 1vDXoFqe3HFFNDwEo3mCreg-b6T2hA_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-21_04,2021-10-21_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110210090
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

On Fri, 2021-10-01 at 14:52 -0300, Jason Gunthorpe wrote:
> This is a more complicated conversion because vfio_ccw is sharing the
> vfio_device between both the mdev_device, its vfio_device and the
> css_driver.
> 
> The mdev is a singleton, and the reason for this sharing is so the
> extra
> css_driver function callbacks to be delivered to the vfio_device
> implementation.
> 
> This keeps things as they are, with the css_driver allocating the
> singleton, not the mdev_driver. Following patches work to clean this
> further.
> 
> Embed the vfio_device in the vfio_ccw_private and instantiate it as a
> vfio_device when the mdev probes. The drvdata of both the css_device
> and
> the mdev_device point at the private, and container_of is used to get
> it
> back from the vfio_device.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Eric Farman <farman@linux.ibm.com>

Worth noting that this particular patch depends on Alex' vfio/next
branch, which defines vfio_register_emulated_iommu_dev() and is used
below. That is alluded to in the cover letter, but of course I forgot
that point when going through the mbox.

> ---
>  drivers/s390/cio/vfio_ccw_drv.c     |  21 ++++--
>  drivers/s390/cio/vfio_ccw_ops.c     | 107 +++++++++++++++++---------
> --
>  drivers/s390/cio/vfio_ccw_private.h |   5 ++
>  3 files changed, 85 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/s390/cio/vfio_ccw_drv.c
> b/drivers/s390/cio/vfio_ccw_drv.c
> index e32678a71644fb..0407427770955d 100644
> --- a/drivers/s390/cio/vfio_ccw_drv.c
> +++ b/drivers/s390/cio/vfio_ccw_drv.c
> @@ -468,7 +468,7 @@ static int __init vfio_ccw_sch_init(void)
>  	vfio_ccw_work_q = create_singlethread_workqueue("vfio-ccw");
>  	if (!vfio_ccw_work_q) {
>  		ret = -ENOMEM;
> -		goto out_err;
> +		goto out_regions;
>  	}
>  
>  	vfio_ccw_io_region =
> kmem_cache_create_usercopy("vfio_ccw_io_region",
> @@ -477,7 +477,7 @@ static int __init vfio_ccw_sch_init(void)
>  					sizeof(struct ccw_io_region),
> NULL);
>  	if (!vfio_ccw_io_region) {
>  		ret = -ENOMEM;
> -		goto out_err;
> +		goto out_regions;
>  	}
>  
>  	vfio_ccw_cmd_region =
> kmem_cache_create_usercopy("vfio_ccw_cmd_region",
> @@ -486,7 +486,7 @@ static int __init vfio_ccw_sch_init(void)
>  					sizeof(struct ccw_cmd_region),
> NULL);
>  	if (!vfio_ccw_cmd_region) {
>  		ret = -ENOMEM;
> -		goto out_err;
> +		goto out_regions;
>  	}
>  
>  	vfio_ccw_schib_region =
> kmem_cache_create_usercopy("vfio_ccw_schib_region",
> @@ -496,7 +496,7 @@ static int __init vfio_ccw_sch_init(void)
>  
>  	if (!vfio_ccw_schib_region) {
>  		ret = -ENOMEM;
> -		goto out_err;
> +		goto out_regions;
>  	}
>  
>  	vfio_ccw_crw_region =
> kmem_cache_create_usercopy("vfio_ccw_crw_region",
> @@ -506,19 +506,25 @@ static int __init vfio_ccw_sch_init(void)
>  
>  	if (!vfio_ccw_crw_region) {
>  		ret = -ENOMEM;
> -		goto out_err;
> +		goto out_regions;
>  	}
>  
> +	ret = mdev_register_driver(&vfio_ccw_mdev_driver);
> +	if (ret)
> +		goto out_regions;
> +
>  	isc_register(VFIO_CCW_ISC);
>  	ret = css_driver_register(&vfio_ccw_sch_driver);
>  	if (ret) {
>  		isc_unregister(VFIO_CCW_ISC);
> -		goto out_err;
> +		goto out_driver;
>  	}
>  
>  	return ret;
>  
> -out_err:
> +out_driver:
> +	mdev_unregister_driver(&vfio_ccw_mdev_driver);
> +out_regions:
>  	vfio_ccw_destroy_regions();
>  	destroy_workqueue(vfio_ccw_work_q);
>  	vfio_ccw_debug_exit();
> @@ -528,6 +534,7 @@ static int __init vfio_ccw_sch_init(void)
>  static void __exit vfio_ccw_sch_exit(void)
>  {
>  	css_driver_unregister(&vfio_ccw_sch_driver);
> +	mdev_unregister_driver(&vfio_ccw_mdev_driver);
>  	isc_unregister(VFIO_CCW_ISC);
>  	vfio_ccw_destroy_regions();
>  	destroy_workqueue(vfio_ccw_work_q);
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c
> b/drivers/s390/cio/vfio_ccw_ops.c
> index 1edbea9de0ec42..d8589afac272f1 100644
> --- a/drivers/s390/cio/vfio_ccw_ops.c
> +++ b/drivers/s390/cio/vfio_ccw_ops.c
> @@ -17,6 +17,8 @@
>  
>  #include "vfio_ccw_private.h"
>  
> +static const struct vfio_device_ops vfio_ccw_dev_ops;
> +
>  static int vfio_ccw_mdev_reset(struct vfio_ccw_private *private)
>  {
>  	struct subchannel *sch;
> @@ -111,10 +113,10 @@ static struct attribute_group
> *mdev_type_groups[] = {
>  	NULL,
>  };
>  
> -static int vfio_ccw_mdev_create(struct mdev_device *mdev)
> +static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
>  {
> -	struct vfio_ccw_private *private =
> -		dev_get_drvdata(mdev_parent_dev(mdev));
> +	struct vfio_ccw_private *private = dev_get_drvdata(mdev-
> >dev.parent);
> +	int ret;
>  
>  	if (private->state == VFIO_CCW_STATE_NOT_OPER)
>  		return -ENODEV;
> @@ -122,6 +124,10 @@ static int vfio_ccw_mdev_create(struct
> mdev_device *mdev)
>  	if (atomic_dec_if_positive(&private->avail) < 0)
>  		return -EPERM;
>  
> +	memset(&private->vdev, 0, sizeof(private->vdev));
> +	vfio_init_group_dev(&private->vdev, &mdev->dev,
> +			    &vfio_ccw_dev_ops);
> +
>  	private->mdev = mdev;
>  	private->state = VFIO_CCW_STATE_IDLE;
>  
> @@ -130,19 +136,31 @@ static int vfio_ccw_mdev_create(struct
> mdev_device *mdev)
>  			   private->sch->schid.ssid,
>  			   private->sch->schid.sch_no);
>  
> +	ret = vfio_register_emulated_iommu_dev(&private->vdev);
> +	if (ret)
> +		goto err_atomic;
> +	dev_set_drvdata(&mdev->dev, private);
>  	return 0;
> +
> +err_atomic:
> +	vfio_uninit_group_dev(&private->vdev);
> +	atomic_inc(&private->avail);
> +	private->mdev = NULL;
> +	private->state = VFIO_CCW_STATE_IDLE;
> +	return ret;
>  }
>  
> -static int vfio_ccw_mdev_remove(struct mdev_device *mdev)
> +static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
>  {
> -	struct vfio_ccw_private *private =
> -		dev_get_drvdata(mdev_parent_dev(mdev));
> +	struct vfio_ccw_private *private = dev_get_drvdata(mdev-
> >dev.parent);
>  
>  	VFIO_CCW_MSG_EVENT(2, "mdev %pUl, sch %x.%x.%04x: remove\n",
>  			   mdev_uuid(mdev), private->sch->schid.cssid,
>  			   private->sch->schid.ssid,
>  			   private->sch->schid.sch_no);
>  
> +	vfio_unregister_group_dev(&private->vdev);
> +
>  	if ((private->state != VFIO_CCW_STATE_NOT_OPER) &&
>  	    (private->state != VFIO_CCW_STATE_STANDBY)) {
>  		if (!vfio_ccw_sch_quiesce(private->sch))
> @@ -150,23 +168,22 @@ static int vfio_ccw_mdev_remove(struct
> mdev_device *mdev)
>  		/* The state will be NOT_OPER on error. */
>  	}
>  
> +	vfio_uninit_group_dev(&private->vdev);
>  	cp_free(&private->cp);
>  	private->mdev = NULL;
>  	atomic_inc(&private->avail);
> -
> -	return 0;
>  }
>  
> -static int vfio_ccw_mdev_open_device(struct mdev_device *mdev)
> +static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
>  {
>  	struct vfio_ccw_private *private =
> -		dev_get_drvdata(mdev_parent_dev(mdev));
> +		container_of(vdev, struct vfio_ccw_private, vdev);
>  	unsigned long events = VFIO_IOMMU_NOTIFY_DMA_UNMAP;
>  	int ret;
>  
>  	private->nb.notifier_call = vfio_ccw_mdev_notifier;
>  
> -	ret = vfio_register_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
> +	ret = vfio_register_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
>  				     &events, &private->nb);
>  	if (ret)
>  		return ret;
> @@ -187,15 +204,15 @@ static int vfio_ccw_mdev_open_device(struct
> mdev_device *mdev)
>  
>  out_unregister:
>  	vfio_ccw_unregister_dev_regions(private);
> -	vfio_unregister_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
> +	vfio_unregister_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
>  				 &private->nb);
>  	return ret;
>  }
>  
> -static void vfio_ccw_mdev_close_device(struct mdev_device *mdev)
> +static void vfio_ccw_mdev_close_device(struct vfio_device *vdev)
>  {
>  	struct vfio_ccw_private *private =
> -		dev_get_drvdata(mdev_parent_dev(mdev));
> +		container_of(vdev, struct vfio_ccw_private, vdev);
>  
>  	if ((private->state != VFIO_CCW_STATE_NOT_OPER) &&
>  	    (private->state != VFIO_CCW_STATE_STANDBY)) {
> @@ -206,8 +223,7 @@ static void vfio_ccw_mdev_close_device(struct
> mdev_device *mdev)
>  
>  	cp_free(&private->cp);
>  	vfio_ccw_unregister_dev_regions(private);
> -	vfio_unregister_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
> -				 &private->nb);
> +	vfio_unregister_notifier(vdev->dev, VFIO_IOMMU_NOTIFY,
> &private->nb);
>  }
>  
>  static ssize_t vfio_ccw_mdev_read_io_region(struct vfio_ccw_private
> *private,
> @@ -231,15 +247,14 @@ static ssize_t
> vfio_ccw_mdev_read_io_region(struct vfio_ccw_private *private,
>  	return ret;
>  }
>  
> -static ssize_t vfio_ccw_mdev_read(struct mdev_device *mdev,
> +static ssize_t vfio_ccw_mdev_read(struct vfio_device *vdev,
>  				  char __user *buf,
>  				  size_t count,
>  				  loff_t *ppos)
>  {
> +	struct vfio_ccw_private *private =
> +		container_of(vdev, struct vfio_ccw_private, vdev);
>  	unsigned int index = VFIO_CCW_OFFSET_TO_INDEX(*ppos);
> -	struct vfio_ccw_private *private;
> -
> -	private = dev_get_drvdata(mdev_parent_dev(mdev));
>  
>  	if (index >= VFIO_CCW_NUM_REGIONS + private->num_regions)
>  		return -EINVAL;
> @@ -284,15 +299,14 @@ static ssize_t
> vfio_ccw_mdev_write_io_region(struct vfio_ccw_private *private,
>  	return ret;
>  }
>  
> -static ssize_t vfio_ccw_mdev_write(struct mdev_device *mdev,
> +static ssize_t vfio_ccw_mdev_write(struct vfio_device *vdev,
>  				   const char __user *buf,
>  				   size_t count,
>  				   loff_t *ppos)
>  {
> +	struct vfio_ccw_private *private =
> +		container_of(vdev, struct vfio_ccw_private, vdev);
>  	unsigned int index = VFIO_CCW_OFFSET_TO_INDEX(*ppos);
> -	struct vfio_ccw_private *private;
> -
> -	private = dev_get_drvdata(mdev_parent_dev(mdev));
>  
>  	if (index >= VFIO_CCW_NUM_REGIONS + private->num_regions)
>  		return -EINVAL;
> @@ -510,12 +524,12 @@ void vfio_ccw_unregister_dev_regions(struct
> vfio_ccw_private *private)
>  	private->region = NULL;
>  }
>  
> -static ssize_t vfio_ccw_mdev_ioctl(struct mdev_device *mdev,
> +static ssize_t vfio_ccw_mdev_ioctl(struct vfio_device *vdev,
>  				   unsigned int cmd,
>  				   unsigned long arg)
>  {
>  	struct vfio_ccw_private *private =
> -		dev_get_drvdata(mdev_parent_dev(mdev));
> +		container_of(vdev, struct vfio_ccw_private, vdev);
>  	int ret = 0;
>  	unsigned long minsz;
>  
> @@ -606,37 +620,48 @@ static ssize_t vfio_ccw_mdev_ioctl(struct
> mdev_device *mdev,
>  }
>  
>  /* Request removal of the device*/
> -static void vfio_ccw_mdev_request(struct mdev_device *mdev, unsigned
> int count)
> +static void vfio_ccw_mdev_request(struct vfio_device *vdev, unsigned
> int count)
>  {
> -	struct vfio_ccw_private *private =
> dev_get_drvdata(mdev_parent_dev(mdev));
> -
> -	if (!private)
> -		return;
> +	struct vfio_ccw_private *private =
> +		container_of(vdev, struct vfio_ccw_private, vdev);
> +	struct device *dev = vdev->dev;
>  
>  	if (private->req_trigger) {
>  		if (!(count % 10))
> -			dev_notice_ratelimited(mdev_dev(private->mdev),
> +			dev_notice_ratelimited(dev,
>  					       "Relaying device request
> to user (#%u)\n",
>  					       count);
>  
>  		eventfd_signal(private->req_trigger, 1);
>  	} else if (count == 0) {
> -		dev_notice(mdev_dev(private->mdev),
> +		dev_notice(dev,
>  			   "No device request channel registered,
> blocked until released by user\n");
>  	}
>  }
>  
> +static const struct vfio_device_ops vfio_ccw_dev_ops = {
> +	.open_device = vfio_ccw_mdev_open_device,
> +	.close_device = vfio_ccw_mdev_close_device,
> +	.read = vfio_ccw_mdev_read,
> +	.write = vfio_ccw_mdev_write,
> +	.ioctl = vfio_ccw_mdev_ioctl,
> +	.request = vfio_ccw_mdev_request,
> +};
> +
> +struct mdev_driver vfio_ccw_mdev_driver = {
> +	.driver = {
> +		.name = "vfio_ccw_mdev",
> +		.owner = THIS_MODULE,
> +		.mod_name = KBUILD_MODNAME,
> +	},
> +	.probe = vfio_ccw_mdev_probe,
> +	.remove = vfio_ccw_mdev_remove,
> +};
> +
>  static const struct mdev_parent_ops vfio_ccw_mdev_ops = {
>  	.owner			= THIS_MODULE,
> +	.device_driver		= &vfio_ccw_mdev_driver,
>  	.supported_type_groups  = mdev_type_groups,
> -	.create			= vfio_ccw_mdev_create,
> -	.remove			= vfio_ccw_mdev_remove,
> -	.open_device		= vfio_ccw_mdev_open_device,
> -	.close_device		= vfio_ccw_mdev_close_device,
> -	.read			= vfio_ccw_mdev_read,
> -	.write			= vfio_ccw_mdev_write,
> -	.ioctl			= vfio_ccw_mdev_ioctl,
> -	.request		= vfio_ccw_mdev_request,
>  };
>  
>  int vfio_ccw_mdev_reg(struct subchannel *sch)
> diff --git a/drivers/s390/cio/vfio_ccw_private.h
> b/drivers/s390/cio/vfio_ccw_private.h
> index b2c762eb42b9bb..7272eb78861244 100644
> --- a/drivers/s390/cio/vfio_ccw_private.h
> +++ b/drivers/s390/cio/vfio_ccw_private.h
> @@ -17,6 +17,7 @@
>  #include <linux/eventfd.h>
>  #include <linux/workqueue.h>
>  #include <linux/vfio_ccw.h>
> +#include <linux/vfio.h>
>  #include <asm/crw.h>
>  #include <asm/debug.h>
>  
> @@ -67,6 +68,7 @@ struct vfio_ccw_crw {
>  
>  /**
>   * struct vfio_ccw_private
> + * @vdev: Embedded VFIO device
>   * @sch: pointer to the subchannel
>   * @state: internal state of the device
>   * @completion: synchronization helper of the I/O completion
> @@ -90,6 +92,7 @@ struct vfio_ccw_crw {
>   * @crw_work: work for deferral process of CRW handling
>   */
>  struct vfio_ccw_private {
> +	struct vfio_device vdev;
>  	struct subchannel	*sch;
>  	int			state;
>  	struct completion	*completion;
> @@ -121,6 +124,8 @@ extern void vfio_ccw_mdev_unreg(struct subchannel
> *sch);
>  
>  extern int vfio_ccw_sch_quiesce(struct subchannel *sch);
>  
> +extern struct mdev_driver vfio_ccw_mdev_driver;
> +
>  /*
>   * States of the device statemachine.
>   */

