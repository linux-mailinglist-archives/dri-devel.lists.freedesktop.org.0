Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC7B44AA84
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 10:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5876EA45;
	Tue,  9 Nov 2021 09:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5416EA45
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 09:23:55 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20211109092353epoutp02f6f587e96c8328eee1aaf9ff853910e9~11nQdqY8f0847108471epoutp02M
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 09:23:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20211109092353epoutp02f6f587e96c8328eee1aaf9ff853910e9~11nQdqY8f0847108471epoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1636449833;
 bh=593Amkrgb9Jqhcs++h0w+CuiiQCyeji1tJb9jeqi/SA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=el/DAqFro5XNVbc04l4VBczrTikPYchrJFtOK67SxtmHnIEzEuoXNx60cfCFpWDVR
 W0ktfQXouQW3GmctN1Qqrk2bA2hreCIzxriTOlsqHIFJxcBcKSBAEqbQHcNIxl5nPQ
 RqhKvx1gX0R1GK+VpsnFn2Uz47/toyUYF6NDT7Rs=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211109092353epcas1p19ed9d2f87f770292ff82f841458c4bd9~11nPx38ud1097210972epcas1p18;
 Tue,  9 Nov 2021 09:23:53 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.237]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4HpMwn2cVPz4x9Pw; Tue,  9 Nov
 2021 09:23:37 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 56.7E.64085.91E3A816; Tue,  9 Nov 2021 18:23:37 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20211109092336epcas1p3be56f6ff9049a1a6b80a92a47eedddd0~11nAdiFDw0648806488epcas1p3Y;
 Tue,  9 Nov 2021 09:23:36 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211109092336epsmtrp27ce965acdbbf0384ca0cf1149b0bd07d~11nAcscpF2653426534epsmtrp2G;
 Tue,  9 Nov 2021 09:23:36 +0000 (GMT)
X-AuditID: b6c32a35-9c3ff7000000fa55-13-618a3e19ccb5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D0.09.29871.81E3A816; Tue,  9 Nov 2021 18:23:36 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20211109092336epsmtip284e72dab5b5eb4adf5781b6d47de46c6~11nAJMu9p2082120821epsmtip2C;
 Tue,  9 Nov 2021 09:23:36 +0000 (GMT)
Subject: Re: [PATCH 1/3] drm/exynox: Implement mmap as GEM object function
To: Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <10fcb430-b051-20f0-b0c0-3f54285e01ce@samsung.com>
Date: Tue, 9 Nov 2021 18:34:31 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YYlCUOgd1/GBluE7@phenom.ffwll.local>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf0wTZxjOd3c9CqzkKAKfQBAvM6IRaIHWk0mDweFNiWHolriN4AWOH6O0
 9do6NllERQNMGCdGaRVFFCK4RakgyFJZ6BSBMGBhggyBDcwGIiBExsYMa3u68d/zvN/zfO/7
 fD/EqHQY9xNnagwsp2HUJO6G3bFtkoWsVRUxsp9OelLFP3Yg1ModHqX6X87i1B8jfRhV/3wJ
 obqPT7tQlvFHIqq85x5CXXnRiFGnCmtE1NyNWXutbBKnGqZ5EfVnQxkS40Gb84pxerj6LqCt
 i5UYbakrxOmmxTERfanjfXr0q3aEvn3tKG2b68fokoY6QN/uOkIvWAIT3vooa3sGy6SyXBCr
 SdGmZmrSo8k9+5JjkxVKmTxEvo3aSgZpmGw2mtwZnxASl6m2JyGDDjNqo72UwOj1ZJhqO6c1
 GtigDK3eEE2yulS1TqEL1TPZeqMmPVTDGqLkMlm4wi48mJVR0WMFOl6VU/1oGcsDpogi4CqG
 RCRsvVKLFgE3sZRoBrD7epNIIPMAHqvhMYEsAvjUdBZ7Y+nqmgXCghXAyW4LIpBZAH/5a8m+
 mVjsReyGlfPuDsMaIh4W3jzj4tCgxAwC+0dnUMcCTmyA/PVR3IElhAp+0/LQWceIt2HxfL4T
 exMH4KuOFpGg8YQdpgnnFK5EOJwYKHVilPCFQxOXEQGvgycaLzgDQWJaDHsu2hBh7J3wWXcn
 ELAXnGpvcBGwH1yYseKC4QSAfHkXIpACAJ+MD7wOHQFbq8sQRzSU2ARvtoQJ5fXw7nIFEDp7
 wJmXp0UOCSQksOCUVJCQ8EHf4Ou+EPZe43FBQsP755JKwXrzqmjmVXHMq+KY/+9bCbA64MPq
 9NnprF6uk/933SnabAtwPvPNimbAP58LbQOIGLQBKEbJNZKR+wWMVJLKfP4Fy2mTOaOa1bcB
 hf2wedTPO0Vr/ycaQ7I8cpssUhkeEUnJlXLSV7IQeIiREumMgc1iWR3LvfEhYle/PESy3zt4
 R+tYQL5RyiRdCsxLa5V3kqWz8Xt//9jGxVgvf4vwmMi6tjbt+y2DK8bwck/jZJTqYH+c6jdz
 zljVGBecu/set/FrJsqNu3g1cGjhUHPj4Pi0OoJPHAJVIvTWjbSSaVtsCphaXFZke/QVXV3p
 3Xg6cVx5Mo57F1acp4e3JpSYhsKMURX4p483ELndlic+x2PPj0gatnj9fawzIPNVVk/Mhf6W
 3IfBLwa09Ylztg8CPvPpdHf/50H72V3fFX8pPfD4nZ/9m/yL/G+V7bD0ThWe45Yal/Olqvyn
 tT8ovSe0Ce8h3sqIXc/OlByR7k3yzflwT32h9tfDRz9ZZ5LVVJGYPoORb0Y5PfMvGJxAl28E
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsWy7bCSvK6EXVeiwaFeJYvecyeZLP5vm8hs
 ceXrezaLF/cuslhsfPuDyeJs0xt2i02Pr7FazDi/j8li4cetLBZtnctYLT6sfg8Um/ySzWLL
 m4msFt+3TGZy4POY1dDL5nFn6U5Gj73fFrB4bFrVyeax/dsDVo95JwM97ncfZ/LYvKTe4/CH
 KywefVtWMXpsPl3t8XmTXABPFJdNSmpOZllqkb5dAlfG3PN7GQsm2lUsvfabpYFxpnEXIyeH
 hICJxOnT7xm7GLk4hAR2M0qs/97J1sXIAZSQkNiylQPCFJY4fLgYouQto8ThPUuYQOLCAl4S
 Cz5xg4wREfCR6Fw/iR3EZhZ4xySx6ZU0RP19Romd916CJdgEVCUmrrjPBmLzCthJrNl1ghnE
 ZhFQkej91AJmiwpESjSd2ApVIyhxcuYTFhCbU8BI4sn1CSwQC9Ql/sy7xAxhi0vcejKfCcKW
 l2jeOpt5AqPQLCTts5C0zELSMgtJywJGllWMkqkFxbnpucWGBYZ5qeV6xYm5xaV56XrJ+bmb
 GMGRq6W5g3H7qg96hxiZOBgPMUpwMCuJ8N472pEoxJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC
 18l4IYH0xJLU7NTUgtQimCwTB6dUA5PjqpJDj37zfPY82dzoHrgre/mEElvhJY+vVp2cp/Lu
 kOmRjul/f74OKnD/e99ox+nrOtFOjTWzzhgVCM1kmG66XmlHrc06VdvgalvBt94czMyp20vv
 qxxf93KRxgLzqbsU9pplNO2oMBRYr/281Ntsi+Qq980na+tO38zzmS90R3zfgwbuQ+2FiWl6
 4quCXqxxYz29b4vYpJ3CnOn5qZd+y5xtk8lcOP/Hq1dbgqZt2ZVxvX7TXZlFTgUHP6tv/XbG
 QlGqw+DYB+d/Dytv/rjV05/J7Nd3aO/zR7VR31anMDceE364Sr6k4P7NXV/u19skHJF3KJ60
 vJBXS+qCwBNJCdMlJnsmhb+fzCu7c/FsJZbijERDLeai4kQAs2Tm+UsDAAA=
X-CMS-MailID: 20211109092336epcas1p3be56f6ff9049a1a6b80a92a47eedddd0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211108152930epcas1p4e61b02b1151ba4779949d81312597a08
References: <20211108102846.309-1-tzimmermann@suse.de>
 <20211108102846.309-2-tzimmermann@suse.de>
 <CGME20211108152930epcas1p4e61b02b1151ba4779949d81312597a08@epcas1p4.samsung.com>
 <YYlCUOgd1/GBluE7@phenom.ffwll.local>
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
Cc: linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie,
 oleksandr_andrushchenko@epam.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, dri-devel@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas and Daniel,

21. 11. 9. 오전 12:29에 Daniel Vetter 이(가) 쓴 글:
> On Mon, Nov 08, 2021 at 11:28:44AM +0100, Thomas Zimmermann wrote:
>> Moving the driver-specific mmap code into a GEM object function allows
>> for using DRM helpers for various mmap callbacks.
>>
>> The respective exynos functions are being removed. The file_operations
>> structure exynos_drm_driver_fops is now being created by the helper macro
>> DEFINE_DRM_GEM_FOPS().
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> s/exynox/exynos in the subject.
> 
> Patch lgtm, but would still be good if exynos maintainers would
> ack/review/test it. But if you don't get anything within 2 weeks here's

Sorry for late. Confirmed working well on Odroid board, and had a review. Applied.
https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/log/?h=exynos-drm-next

Thanks,
Inki Dae

> my:
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_drv.c   | 13 ++-----
>>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 20 ++---------
>>  drivers/gpu/drm/exynos/exynos_drm_gem.c   | 43 +++++------------------
>>  drivers/gpu/drm/exynos/exynos_drm_gem.h   |  5 ---
>>  4 files changed, 13 insertions(+), 68 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> index d8f1cf4d6b69..9743b6b17447 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> @@ -102,16 +102,7 @@ static const struct drm_ioctl_desc exynos_ioctls[] = {
>>  			DRM_RENDER_ALLOW),
>>  };
>>  
>> -static const struct file_operations exynos_drm_driver_fops = {
>> -	.owner		= THIS_MODULE,
>> -	.open		= drm_open,
>> -	.mmap		= exynos_drm_gem_mmap,
>> -	.poll		= drm_poll,
>> -	.read		= drm_read,
>> -	.unlocked_ioctl	= drm_ioctl,
>> -	.compat_ioctl = drm_compat_ioctl,
>> -	.release	= drm_release,
>> -};
>> +DEFINE_DRM_GEM_FOPS(exynos_drm_driver_fops);
>>  
>>  static const struct drm_driver exynos_drm_driver = {
>>  	.driver_features	= DRIVER_MODESET | DRIVER_GEM
>> @@ -124,7 +115,7 @@ static const struct drm_driver exynos_drm_driver = {
>>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
>>  	.gem_prime_import	= exynos_drm_gem_prime_import,
>>  	.gem_prime_import_sg_table	= exynos_drm_gem_prime_import_sg_table,
>> -	.gem_prime_mmap		= exynos_drm_gem_prime_mmap,
>> +	.gem_prime_mmap		= drm_gem_prime_mmap,
>>  	.ioctls			= exynos_ioctls,
>>  	.num_ioctls		= ARRAY_SIZE(exynos_ioctls),
>>  	.fops			= &exynos_drm_driver_fops,
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
>> index 5147f5929be7..02c97b9ca926 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
>> @@ -15,6 +15,7 @@
>>  #include <drm/drm_crtc.h>
>>  #include <drm/drm_fb_helper.h>
>>  #include <drm/drm_fourcc.h>
>> +#include <drm/drm_prime.h>
>>  #include <drm/drm_probe_helper.h>
>>  #include <drm/exynos_drm.h>
>>  
>> @@ -39,25 +40,8 @@ static int exynos_drm_fb_mmap(struct fb_info *info,
>>  	struct drm_fb_helper *helper = info->par;
>>  	struct exynos_drm_fbdev *exynos_fbd = to_exynos_fbdev(helper);
>>  	struct exynos_drm_gem *exynos_gem = exynos_fbd->exynos_gem;
>> -	unsigned long vm_size;
>> -	int ret;
>> -
>> -	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>> -
>> -	vm_size = vma->vm_end - vma->vm_start;
>> -
>> -	if (vm_size > exynos_gem->size)
>> -		return -EINVAL;
>>  
>> -	ret = dma_mmap_attrs(to_dma_dev(helper->dev), vma, exynos_gem->cookie,
>> -			     exynos_gem->dma_addr, exynos_gem->size,
>> -			     exynos_gem->dma_attrs);
>> -	if (ret < 0) {
>> -		DRM_DEV_ERROR(to_dma_dev(helper->dev), "failed to mmap.\n");
>> -		return ret;
>> -	}
>> -
>> -	return 0;
>> +	return drm_gem_prime_mmap(&exynos_gem->base, vma);
>>  }
>>  
>>  static const struct fb_ops exynos_drm_fb_ops = {
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> index 4396224227d1..c4b63902ee7a 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> @@ -17,6 +17,8 @@
>>  #include "exynos_drm_drv.h"
>>  #include "exynos_drm_gem.h"
>>  
>> +static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
>> +
>>  static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
>>  {
>>  	struct drm_device *dev = exynos_gem->base.dev;
>> @@ -135,6 +137,7 @@ static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
>>  static const struct drm_gem_object_funcs exynos_drm_gem_object_funcs = {
>>  	.free = exynos_drm_gem_free_object,
>>  	.get_sg_table = exynos_drm_gem_prime_get_sg_table,
>> +	.mmap = exynos_drm_gem_mmap,
>>  	.vm_ops = &exynos_drm_gem_vm_ops,
>>  };
>>  
>> @@ -354,12 +357,16 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
>>  	return 0;
>>  }
>>  
>> -static int exynos_drm_gem_mmap_obj(struct drm_gem_object *obj,
>> -				   struct vm_area_struct *vma)
>> +static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>>  {
>>  	struct exynos_drm_gem *exynos_gem = to_exynos_gem(obj);
>>  	int ret;
>>  
>> +	if (obj->import_attach)
>> +		return dma_buf_mmap(obj->dma_buf, vma, 0);
>> +
>> +	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>> +
>>  	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->dev), "flags = 0x%x\n",
>>  			  exynos_gem->flags);
>>  
>> @@ -385,26 +392,6 @@ static int exynos_drm_gem_mmap_obj(struct drm_gem_object *obj,
>>  	return ret;
>>  }
>>  
>> -int exynos_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>> -{
>> -	struct drm_gem_object *obj;
>> -	int ret;
>> -
>> -	/* set vm_area_struct. */
>> -	ret = drm_gem_mmap(filp, vma);
>> -	if (ret < 0) {
>> -		DRM_ERROR("failed to mmap.\n");
>> -		return ret;
>> -	}
>> -
>> -	obj = vma->vm_private_data;
>> -
>> -	if (obj->import_attach)
>> -		return dma_buf_mmap(obj->dma_buf, vma, 0);
>> -
>> -	return exynos_drm_gem_mmap_obj(obj, vma);
>> -}
>> -
>>  /* low-level interface prime helpers */
>>  struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device *dev,
>>  					    struct dma_buf *dma_buf)
>> @@ -466,15 +453,3 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>>  	exynos_gem->sgt = sgt;
>>  	return &exynos_gem->base;
>>  }
>> -
>> -int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
>> -			      struct vm_area_struct *vma)
>> -{
>> -	int ret;
>> -
>> -	ret = drm_gem_mmap_obj(obj, obj->size, vma);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	return exynos_drm_gem_mmap_obj(obj, vma);
>> -}
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
>> index a23272fb96fb..79d7e1a87419 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
>> @@ -96,9 +96,6 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
>>  			       struct drm_device *dev,
>>  			       struct drm_mode_create_dumb *args);
>>  
>> -/* set vm_flags and we can change the vm attribute to other one at here. */
>> -int exynos_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
>> -
>>  /* low-level interface prime helpers */
>>  struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device *dev,
>>  					    struct dma_buf *dma_buf);
>> @@ -107,7 +104,5 @@ struct drm_gem_object *
>>  exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>>  				     struct dma_buf_attachment *attach,
>>  				     struct sg_table *sgt);
>> -int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
>> -			      struct vm_area_struct *vma);
>>  
>>  #endif
>> -- 
>> 2.33.1
>>
> 
