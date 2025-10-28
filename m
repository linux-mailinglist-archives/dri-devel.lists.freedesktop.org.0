Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35464C1389D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 09:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70A810E5B3;
	Tue, 28 Oct 2025 08:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.b="A7gT8hbq";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="A7gT8hbq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 944 seconds by postgrey-1.36 at gabe;
 Tue, 28 Oct 2025 02:11:40 UTC
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E59210E064;
 Tue, 28 Oct 2025 02:11:40 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=KtvB1oS5JczByJ2TXJbSMekROy5U9Mx/XYWBZ+fYkHA=;
 b=A7gT8hbqcf1aNZZeClcqtU4HxgyLOxf+3xdLrC8jUe8vHKhZ1LQNE8l8SKUtwaXK9LQz7rCyl
 lk9MkCiBuwNYVYuwRKropa5IUssDfu9mJHKsffJQzdjrpvVV6aaeXCfQ//mhWQ7v3JnOpgSoyxp
 oDXln4mSG91mIVyZjIf8s2U=
Received: from canpmsgout03.his.huawei.com (unknown [172.19.92.159])
 by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4cwYNH0pMBz1BFnt;
 Tue, 28 Oct 2025 09:54:55 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=KtvB1oS5JczByJ2TXJbSMekROy5U9Mx/XYWBZ+fYkHA=;
 b=A7gT8hbqcf1aNZZeClcqtU4HxgyLOxf+3xdLrC8jUe8vHKhZ1LQNE8l8SKUtwaXK9LQz7rCyl
 lk9MkCiBuwNYVYuwRKropa5IUssDfu9mJHKsffJQzdjrpvVV6aaeXCfQ//mhWQ7v3JnOpgSoyxp
 oDXln4mSG91mIVyZjIf8s2U=
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4cwYMt0r7lzpStg;
 Tue, 28 Oct 2025 09:54:34 +0800 (CST)
Received: from dggpemf500015.china.huawei.com (unknown [7.185.36.143])
 by mail.maildlp.com (Postfix) with ESMTPS id 2A5C71800B4;
 Tue, 28 Oct 2025 09:55:50 +0800 (CST)
Received: from [10.67.121.110] (10.67.121.110) by
 dggpemf500015.china.huawei.com (7.185.36.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Oct 2025 09:55:48 +0800
Subject: Re: [PATCH 02/22] vfio/hisi: Convert to the get_region_info op
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>, Alex Williamson
 <alex.williamson@redhat.com>, Ankit Agrawal <ankita@nvidia.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Brett Creeley
 <brett.creeley@amd.com>, <dri-devel@lists.freedesktop.org>, Eric Auger
 <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>, Giovanni Cabiddu
 <giovanni.cabiddu@intel.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko
 Carstens <hca@linux.ibm.com>, <intel-gfx@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
 <kvm@vger.kernel.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 <linux-s390@vger.kernel.org>, Matthew Rosato <mjrosato@linux.ibm.com>, Nikhil
 Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Pranjal Shrivastava <praan@google.com>, <qat-linux@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, Shameer Kolothum
 <skolothumtho@nvidia.com>, Mostafa Saleh <smostafa@google.com>, Sven Schnelle
 <svens@linux.ibm.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 <virtualization@lists.linux.dev>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi
 Wang <zhi.wang.linux@gmail.com>
CC: <patches@lists.linux.dev>
References: <2-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
From: liulongfang <liulongfang@huawei.com>
Message-ID: <bdb90638-3439-be4e-8722-6e8f9564b7b4@huawei.com>
Date: Tue, 28 Oct 2025 09:55:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.110]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500015.china.huawei.com (7.185.36.143)
X-Mailman-Approved-At: Tue, 28 Oct 2025 08:28:06 +0000
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

On 2025/10/24 7:09, Jason Gunthorpe wrote:
> Change the function signature of hisi_acc_vfio_pci_ioctl()
> and re-indent it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    | 57 +++++++++----------
>  1 file changed, 27 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> index fde33f54e99ec5..f06dcfcf09599f 100644
> --- a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> +++ b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> @@ -1324,43 +1324,39 @@ static ssize_t hisi_acc_vfio_pci_read(struct vfio_device *core_vdev,
>  	return vfio_pci_core_read(core_vdev, buf, new_count, ppos);
>  }
>  
> -static long hisi_acc_vfio_pci_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
> -				    unsigned long arg)
> +static int hisi_acc_vfio_get_region(struct vfio_device *core_vdev,
> +				    struct vfio_region_info __user *arg)
>  {
> -	if (cmd == VFIO_DEVICE_GET_REGION_INFO) {
> -		struct vfio_pci_core_device *vdev =
> -			container_of(core_vdev, struct vfio_pci_core_device, vdev);
> -		struct pci_dev *pdev = vdev->pdev;
> -		struct vfio_region_info info;
> -		unsigned long minsz;
> +	struct vfio_pci_core_device *vdev =
> +		container_of(core_vdev, struct vfio_pci_core_device, vdev);
> +	struct pci_dev *pdev = vdev->pdev;
> +	struct vfio_region_info info;
> +	unsigned long minsz;
>  
> -		minsz = offsetofend(struct vfio_region_info, offset);
> +	minsz = offsetofend(struct vfio_region_info, offset);
>  
> -		if (copy_from_user(&info, (void __user *)arg, minsz))
> -			return -EFAULT;
> +	if (copy_from_user(&info, arg, minsz))
> +		return -EFAULT;
>  
> -		if (info.argsz < minsz)
> -			return -EINVAL;
> +	if (info.argsz < minsz)
> +		return -EINVAL;
>  
> -		if (info.index == VFIO_PCI_BAR2_REGION_INDEX) {
> -			info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
> +	if (info.index != VFIO_PCI_BAR2_REGION_INDEX)
> +		return vfio_pci_ioctl_get_region_info(core_vdev, arg);

Looking at your first patch from my driver implementation code, the vfio_pci_ioctl_get_region_info
function doesn't need to modify the first parameter; it can directly use vdev.

Thanks.
Longfang.

>  
> -			/*
> -			 * ACC VF dev BAR2 region consists of both functional
> -			 * register space and migration control register space.
> -			 * Report only the functional region to Guest.
> -			 */
> -			info.size = pci_resource_len(pdev, info.index) / 2;
> +	info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
>  
> -			info.flags = VFIO_REGION_INFO_FLAG_READ |
> -					VFIO_REGION_INFO_FLAG_WRITE |
> -					VFIO_REGION_INFO_FLAG_MMAP;
> +	/*
> +	 * ACC VF dev BAR2 region consists of both functional
> +	 * register space and migration control register space.
> +	 * Report only the functional region to Guest.
> +	 */
> +	info.size = pci_resource_len(pdev, info.index) / 2;
>  
> -			return copy_to_user((void __user *)arg, &info, minsz) ?
> -					    -EFAULT : 0;
> -		}
> -	}
> -	return vfio_pci_core_ioctl(core_vdev, cmd, arg);
> +	info.flags = VFIO_REGION_INFO_FLAG_READ | VFIO_REGION_INFO_FLAG_WRITE |
> +		     VFIO_REGION_INFO_FLAG_MMAP;
> +
> +	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
>  }
>  
>  static int hisi_acc_vf_debug_check(struct seq_file *seq, struct vfio_device *vdev)
> @@ -1557,7 +1553,8 @@ static const struct vfio_device_ops hisi_acc_vfio_pci_migrn_ops = {
>  	.release = vfio_pci_core_release_dev,
>  	.open_device = hisi_acc_vfio_pci_open_device,
>  	.close_device = hisi_acc_vfio_pci_close_device,
> -	.ioctl = hisi_acc_vfio_pci_ioctl,
> +	.ioctl = vfio_pci_core_ioctl,
> +	.get_region_info = hisi_acc_vfio_get_region,
>  	.device_feature = vfio_pci_core_ioctl_feature,
>  	.read = hisi_acc_vfio_pci_read,
>  	.write = hisi_acc_vfio_pci_write,
> 
