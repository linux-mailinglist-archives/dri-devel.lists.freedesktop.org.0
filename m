Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9DF44A5F7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 05:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78CC89EB8;
	Tue,  9 Nov 2021 04:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A66289F06
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 04:57:47 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20211109045745epoutp0128ac28e6e39284b1712ea5650a8be851~1x_5DbxaT0218802188epoutp01P
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 04:57:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20211109045745epoutp0128ac28e6e39284b1712ea5650a8be851~1x_5DbxaT0218802188epoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1636433865;
 bh=ANh3cRKm36WmEPwoAPLZp935d6WceP07H6l2ech2/Hc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=IecfXSdX64/SEd8VWbb/8WXCnIaYGeI/HbYBp4f6aTXstSu97tSkWZkGBUEMaFgFC
 yAFxhFtazNBA7PL92QiQyP1TB0LuLosgyMpYC40WsxwraCl6NlPUgM4L+vvmj3MMR9
 IH6UwhNITaTb2UmLkETWto7Nuw3csdrCLSruWv4E=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20211109045745epcas1p241828c9a74fb4b6120bfff7ca0719c92~1x_4el3W60690306903epcas1p2G;
 Tue,  9 Nov 2021 04:57:45 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.235]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4HpG1r6GVvz4x9R0; Tue,  9 Nov
 2021 04:57:36 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 23.2B.64085.ABFF9816; Tue,  9 Nov 2021 13:57:30 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20211109045730epcas1p4a5295673a5aad41d1b0c8b5ea68636dd~1x_rFtcz30646206462epcas1p4R;
 Tue,  9 Nov 2021 04:57:30 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20211109045730epsmtrp1213b89479be836f60004e73dd7eb7b8a~1x_rE1PHb1318413184epsmtrp1u;
 Tue,  9 Nov 2021 04:57:30 +0000 (GMT)
X-AuditID: b6c32a35-9adff7000000fa55-c9-6189ffbaeeb6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 5C.BF.08738.ABFF9816; Tue,  9 Nov 2021 13:57:30 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20211109045730epsmtip2305d4d7a3be6744286980fba874b0a67~1x_qwWiAs1204612046epsmtip2U;
 Tue,  9 Nov 2021 04:57:30 +0000 (GMT)
Subject: Re: [PATCH 1/3] drm/exynox: Implement mmap as GEM object function
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@canonical.com, oleksandr_andrushchenko@epam.com
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <f88911b4-b5a7-abf1-4294-8e593b049448@samsung.com>
Date: Tue, 9 Nov 2021 14:08:25 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211108102846.309-2-tzimmermann@suse.de>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf1AUdRyd7+7eskei2ynyDQru1mwGjB8nHOwhh4yZs2DjgExZOIUbrNzF
 /er2aFSkMIoBFOKEAi9EmI6ow/EEDwTMmmAAGQihYcQcERJqgkQOEG3GceyOxeK/9z7z3vd9
 3/cHgUrGcX9CozdzJj2rpXBvrK07ODz0ytNiNmIhgS4d6kfop20WlB5dnsfpv+6MYHTz3D8I
 /cun97zolqkbIrr6+o8IXb/QitGFxd+KaFfTvHtWMYPTznsWEf3IWYEkrGes+aU4c7uhAzBX
 H9ZhTIu9GGcuP5wUMbX9KczEyT6EuWT7hOl2jWJMmdMOmEsDucxSS2DyurTsODXHZnImKafP
 MGRq9Fkqam9q+mvpiugIeahcScdQUj2r41TU7jeSQ/dotO4ilPQjVpvjHiWzPE+Fx8eZDDlm
 Tqo28GYVxRkztUaFMYxndXyOPitMz5lj5RER2xVu4aFs9VzfNG4cVh4puDaB5IOq8BIgJiAZ
 BSseLIhKgDchIdsBHG2+ighkEcCljkFcIEsAtleWoc8sjXeLV1WdADYNtaySeQAbT9e4VQSx
 kUyCdYvPeeabyBoETtmeAA9ByTIAf+5exjxL4eRWaPluAvdgHzIeOi9WrmCMfBleKRlCPNiX
 fAc+6e8UCZrnYf+Z6RWvmIyB9jnbih4l/eCt6XOIgINgQevXqCcMki4C3u2qRYR974bLpd8A
 AW+Es31OLwH7w5kvCr0EQwGAluoBRCBFAI5PjWGCKhL+1FCBeLqhZDB0dK6enwx2PD4LhOT1
 8P7yKZFHAkkfWFQoESQU7B25uZoL4bDNgguYgc03z6PlQGZd0826po91TR/r/8F1ALODzZyR
 12VxvNwo/+/CMwy6FrDyzkMU7cAy5wrrAggBugAkUGqTz52eIlbik8kePcaZDOmmHC3HdwGF
 +7QtqL9vhsH9UfTmdHmUMiIqentkFC2PllN+PkuBH7ISMos1c9kcZ+RMz3wIIfbPR/K9q05V
 9spEDZN9O4sOSvZc/O1WuE23v/f3A6mJYztiljc4J9+jt73oCC6MZpPGbUpkMQ858bH2cn39
 Z7INSpmGUxCNuQF/Hzx+9M05ac9g/dIP5bHDryRc+FW1GQbMgrRcu/hLv/DW761f7X2rad5x
 Yv+f7xaXtw0ZxCFiWcpZ1+dBSTvyetTKsl1bHah+y8AHfacr+AMXQtGTqfuuM2l5kZr5xNqa
 bVsKz7lUs2kvjUTFByeeCXk7rCrF1XHYrts5wxy69rrsyDrNLvHgH/dL21BD+lhAucM4zDqw
 B8czlIE3jBmvliy84Jsp5eCx2MfnqzlV0O1R8b448pHzffKwmcJ4NSsPQU08+y8YGzrVcAQA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRmVeSWpSXmKPExsWy7bCSvO6u/52JBkePKFr0njvJZPF/20Rm
 iytf37NZvLh3kcVi49sfTBZnm96wW2x6fI3VYsb5fUwWCz9uZbFo61zGavFh9Xug2OSXbBZb
 3kxktfi+ZTKTA5/HrIZeNo87S3cyeuz9toDFY9OqTjaP7d8esHrMOxnocb/7OJPH5iX1Hoc/
 XGHx6NuyitFj8+lqj8+b5AJ4orhsUlJzMstSi/TtErgy3h5/wlZwwbKi+cR9pgbG6fpdjJwc
 EgImEssfdTKB2EICOxglvr5V62LkAIpLSGzZygFhCkscPlzcxcgFVPGWUeJ2z0UmkLiwgJfE
 gk/cIHERgTlMEj8nH2ADcZgF+hgl7nQeZoLo2M4osefUFVaQBWwCqhITV9xnA7F5BewktmyY
 AmazCKhI7O46B3aEqECkRNOJrVA1ghInZz5hAbE5BcwlVr1dAhZnFlCX+DPvEjOELS5x68l8
 JghbXqJ562zmCYxCs5C0z0LSMgtJyywkLQsYWVYxSqYWFOem5xYbFhjlpZbrFSfmFpfmpesl
 5+duYgTHrpbWDsY9qz7oHWJk4mA8xCjBwawkwnvvaEeiEG9KYmVValF+fFFpTmrxIUZpDhYl
 cd4LXSfjhQTSE0tSs1NTC1KLYLJMHJxSDUwp0tJ1z7V4blzgKf9+a/ePxxt/1WbeedhyluFC
 WFkJs3v6xpNSL638pzEr/JqTlXpLOYblb+SvA7mztHW/5h0/d3tO7p8OnrtZ6w5Js+ywrpx8
 brtzZVScssWl3Xwi1avfLi9nzLow/93x8w+PxM8S6f1T9drZZKXQBpGrtrHXeH1L/v9ckLGp
 Yb/mpenaMgW1/gXeEpM+vqnZFqI2s6bXKsUr+RRHWpqt3+ypSz7/3Nz+0O/SRIebRo7nT1y/
 nPdY7ZFZNVd39sRF9aJz8+f3TGprW2lZ+Px0tPmpKrMZtjUdSufnCHJW6m6W3mnIqcXod3lV
 5tUZfxzTzP2cnfNtRfRt9mRFF+46XOP7Q1aJpTgj0VCLuag4EQCAp9CVTAMAAA==
X-CMS-MailID: 20211109045730epcas1p4a5295673a5aad41d1b0c8b5ea68636dd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211108102856epcas1p3c75e195fee7701b637f1c872ca0c7f93
References: <20211108102846.309-1-tzimmermann@suse.de>
 <CGME20211108102856epcas1p3c75e195fee7701b637f1c872ca0c7f93@epcas1p3.samsung.com>
 <20211108102846.309-2-tzimmermann@suse.de>
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
Cc: xen-devel@lists.xenproject.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Really sorry for late. I saw this patch in my mailbox just before. Seems I missed it due to a typo, exynox.
I will review and apply this patch ASAP.

Thanks,
Inki Dae

21. 11. 8. 오후 7:28에 Thomas Zimmermann 이(가) 쓴 글:
> Moving the driver-specific mmap code into a GEM object function allows
> for using DRM helpers for various mmap callbacks.
> 
> The respective exynos functions are being removed. The file_operations
> structure exynos_drm_driver_fops is now being created by the helper macro
> DEFINE_DRM_GEM_FOPS().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c   | 13 ++-----
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 20 ++---------
>  drivers/gpu/drm/exynos/exynos_drm_gem.c   | 43 +++++------------------
>  drivers/gpu/drm/exynos/exynos_drm_gem.h   |  5 ---
>  4 files changed, 13 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index d8f1cf4d6b69..9743b6b17447 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -102,16 +102,7 @@ static const struct drm_ioctl_desc exynos_ioctls[] = {
>  			DRM_RENDER_ALLOW),
>  };
>  
> -static const struct file_operations exynos_drm_driver_fops = {
> -	.owner		= THIS_MODULE,
> -	.open		= drm_open,
> -	.mmap		= exynos_drm_gem_mmap,
> -	.poll		= drm_poll,
> -	.read		= drm_read,
> -	.unlocked_ioctl	= drm_ioctl,
> -	.compat_ioctl = drm_compat_ioctl,
> -	.release	= drm_release,
> -};
> +DEFINE_DRM_GEM_FOPS(exynos_drm_driver_fops);
>  
>  static const struct drm_driver exynos_drm_driver = {
>  	.driver_features	= DRIVER_MODESET | DRIVER_GEM
> @@ -124,7 +115,7 @@ static const struct drm_driver exynos_drm_driver = {
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
>  	.gem_prime_import	= exynos_drm_gem_prime_import,
>  	.gem_prime_import_sg_table	= exynos_drm_gem_prime_import_sg_table,
> -	.gem_prime_mmap		= exynos_drm_gem_prime_mmap,
> +	.gem_prime_mmap		= drm_gem_prime_mmap,
>  	.ioctls			= exynos_ioctls,
>  	.num_ioctls		= ARRAY_SIZE(exynos_ioctls),
>  	.fops			= &exynos_drm_driver_fops,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index 5147f5929be7..02c97b9ca926 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -15,6 +15,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_prime.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/exynos_drm.h>
>  
> @@ -39,25 +40,8 @@ static int exynos_drm_fb_mmap(struct fb_info *info,
>  	struct drm_fb_helper *helper = info->par;
>  	struct exynos_drm_fbdev *exynos_fbd = to_exynos_fbdev(helper);
>  	struct exynos_drm_gem *exynos_gem = exynos_fbd->exynos_gem;
> -	unsigned long vm_size;
> -	int ret;
> -
> -	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
> -
> -	vm_size = vma->vm_end - vma->vm_start;
> -
> -	if (vm_size > exynos_gem->size)
> -		return -EINVAL;
>  
> -	ret = dma_mmap_attrs(to_dma_dev(helper->dev), vma, exynos_gem->cookie,
> -			     exynos_gem->dma_addr, exynos_gem->size,
> -			     exynos_gem->dma_attrs);
> -	if (ret < 0) {
> -		DRM_DEV_ERROR(to_dma_dev(helper->dev), "failed to mmap.\n");
> -		return ret;
> -	}
> -
> -	return 0;
> +	return drm_gem_prime_mmap(&exynos_gem->base, vma);
>  }
>  
>  static const struct fb_ops exynos_drm_fb_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index 4396224227d1..c4b63902ee7a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -17,6 +17,8 @@
>  #include "exynos_drm_drv.h"
>  #include "exynos_drm_gem.h"
>  
> +static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
> +
>  static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
>  {
>  	struct drm_device *dev = exynos_gem->base.dev;
> @@ -135,6 +137,7 @@ static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
>  static const struct drm_gem_object_funcs exynos_drm_gem_object_funcs = {
>  	.free = exynos_drm_gem_free_object,
>  	.get_sg_table = exynos_drm_gem_prime_get_sg_table,
> +	.mmap = exynos_drm_gem_mmap,
>  	.vm_ops = &exynos_drm_gem_vm_ops,
>  };
>  
> @@ -354,12 +357,16 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
>  	return 0;
>  }
>  
> -static int exynos_drm_gem_mmap_obj(struct drm_gem_object *obj,
> -				   struct vm_area_struct *vma)
> +static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>  {
>  	struct exynos_drm_gem *exynos_gem = to_exynos_gem(obj);
>  	int ret;
>  
> +	if (obj->import_attach)
> +		return dma_buf_mmap(obj->dma_buf, vma, 0);
> +
> +	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
> +
>  	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->dev), "flags = 0x%x\n",
>  			  exynos_gem->flags);
>  
> @@ -385,26 +392,6 @@ static int exynos_drm_gem_mmap_obj(struct drm_gem_object *obj,
>  	return ret;
>  }
>  
> -int exynos_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -	struct drm_gem_object *obj;
> -	int ret;
> -
> -	/* set vm_area_struct. */
> -	ret = drm_gem_mmap(filp, vma);
> -	if (ret < 0) {
> -		DRM_ERROR("failed to mmap.\n");
> -		return ret;
> -	}
> -
> -	obj = vma->vm_private_data;
> -
> -	if (obj->import_attach)
> -		return dma_buf_mmap(obj->dma_buf, vma, 0);
> -
> -	return exynos_drm_gem_mmap_obj(obj, vma);
> -}
> -
>  /* low-level interface prime helpers */
>  struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device *dev,
>  					    struct dma_buf *dma_buf)
> @@ -466,15 +453,3 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>  	exynos_gem->sgt = sgt;
>  	return &exynos_gem->base;
>  }
> -
> -int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
> -			      struct vm_area_struct *vma)
> -{
> -	int ret;
> -
> -	ret = drm_gem_mmap_obj(obj, obj->size, vma);
> -	if (ret < 0)
> -		return ret;
> -
> -	return exynos_drm_gem_mmap_obj(obj, vma);
> -}
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> index a23272fb96fb..79d7e1a87419 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> @@ -96,9 +96,6 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
>  			       struct drm_device *dev,
>  			       struct drm_mode_create_dumb *args);
>  
> -/* set vm_flags and we can change the vm attribute to other one at here. */
> -int exynos_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
> -
>  /* low-level interface prime helpers */
>  struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device *dev,
>  					    struct dma_buf *dma_buf);
> @@ -107,7 +104,5 @@ struct drm_gem_object *
>  exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>  				     struct dma_buf_attachment *attach,
>  				     struct sg_table *sgt);
> -int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
> -			      struct vm_area_struct *vma);
>  
>  #endif
> 
