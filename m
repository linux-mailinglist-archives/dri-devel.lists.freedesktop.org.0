Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC53639701F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 11:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E546E9B5;
	Tue,  1 Jun 2021 09:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCFA6E9B3;
 Tue,  1 Jun 2021 09:15:53 +0000 (UTC)
IronPort-SDR: yTj46qgsVeJkEeH8Kyth8aZsyXFQq342/GrYK8e6pyBfFt4y6VMDulGyp2SFNDD/lEvw2CzaF9
 Otsh+Y5F32bg==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="190623636"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="190623636"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 02:15:52 -0700
IronPort-SDR: Bw0tk3C7d1eONPubV8f1kyR9bZ+TSKu8KpyNrFseCA1eadASP2wH92/dAbzFseIm9hc6Hhv/pw
 A19f5nJPi4nw==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="416411726"
Received: from deancarp-mobl.ger.corp.intel.com (HELO [10.213.232.28])
 ([10.213.232.28])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 02:15:50 -0700
Subject: Re: [Intel-gfx] [PATCH -next] drm/i915: use DEVICE_ATTR_RO macro
To: YueHaibing <yuehaibing@huawei.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, chris@chris-wilson.co.uk, tvrtko.ursulin@intel.com
References: <20210528100403.21548-1-yuehaibing@huawei.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <7e60320b-3a1b-0cdc-136d-29c139b27af7@linux.intel.com>
Date: Tue, 1 Jun 2021 10:15:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210528100403.21548-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/05/2021 11:04, YueHaibing wrote:
> Use DEVICE_ATTR_RO() helper instead of plain DEVICE_ATTR(),
> which makes the code a bit shorter and easier to read.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/gpu/drm/i915/i915_pmu.c   |  8 +++-----
>   drivers/gpu/drm/i915/i915_sysfs.c | 30 +++++++++++++++---------------
>   2 files changed, 18 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 41651ac255fa..fb215929b05b 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -834,15 +834,13 @@ static ssize_t i915_pmu_event_show(struct device *dev,
>   	return sprintf(buf, "config=0x%lx\n", eattr->val);
>   }
>   
> -static ssize_t
> -i915_pmu_get_attr_cpumask(struct device *dev,
> -			  struct device_attribute *attr,
> -			  char *buf)
> +static ssize_t cpumask_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
>   {
>   	return cpumap_print_to_pagebuf(true, buf, &i915_pmu_cpumask);
>   }
>   
> -static DEVICE_ATTR(cpumask, 0444, i915_pmu_get_attr_cpumask, NULL);
> +static DEVICE_ATTR_RO(cpumask);
>   
>   static struct attribute *i915_cpumask_attrs[] = {
>   	&dev_attr_cpumask.attr,
> diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
> index 4c6b5d52b5ca..183517d1a73d 100644
> --- a/drivers/gpu/drm/i915/i915_sysfs.c
> +++ b/drivers/gpu/drm/i915/i915_sysfs.c
> @@ -58,8 +58,8 @@ static u32 calc_residency(struct drm_i915_private *dev_priv,
>   	return DIV_ROUND_CLOSEST_ULL(res, 1000);
>   }
>   
> -static ssize_t
> -show_rc6_mask(struct device *kdev, struct device_attribute *attr, char *buf)
> +static ssize_t rc6_enable_show(struct device *kdev,
> +			       struct device_attribute *attr, char *buf)
>   {
>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>   	unsigned int mask;
> @@ -75,43 +75,43 @@ show_rc6_mask(struct device *kdev, struct device_attribute *attr, char *buf)
>   	return sysfs_emit(buf, "%x\n", mask);
>   }
>   
> -static ssize_t
> -show_rc6_ms(struct device *kdev, struct device_attribute *attr, char *buf)
> +static ssize_t rc6_residency_ms_show(struct device *kdev,
> +				     struct device_attribute *attr, char *buf)
>   {
>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>   	u32 rc6_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6);
>   	return sysfs_emit(buf, "%u\n", rc6_residency);
>   }
>   
> -static ssize_t
> -show_rc6p_ms(struct device *kdev, struct device_attribute *attr, char *buf)
> +static ssize_t rc6p_residency_ms_show(struct device *kdev,
> +				      struct device_attribute *attr, char *buf)
>   {
>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>   	u32 rc6p_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6p);
>   	return sysfs_emit(buf, "%u\n", rc6p_residency);
>   }
>   
> -static ssize_t
> -show_rc6pp_ms(struct device *kdev, struct device_attribute *attr, char *buf)
> +static ssize_t rc6pp_residency_ms_show(struct device *kdev,
> +				       struct device_attribute *attr, char *buf)
>   {
>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>   	u32 rc6pp_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6pp);
>   	return sysfs_emit(buf, "%u\n", rc6pp_residency);
>   }
>   
> -static ssize_t
> -show_media_rc6_ms(struct device *kdev, struct device_attribute *attr, char *buf)
> +static ssize_t media_rc6_residency_ms_show(struct device *kdev,
> +					   struct device_attribute *attr, char *buf)
>   {
>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>   	u32 rc6_residency = calc_residency(dev_priv, VLV_GT_MEDIA_RC6);
>   	return sysfs_emit(buf, "%u\n", rc6_residency);
>   }
>   
> -static DEVICE_ATTR(rc6_enable, S_IRUGO, show_rc6_mask, NULL);
> -static DEVICE_ATTR(rc6_residency_ms, S_IRUGO, show_rc6_ms, NULL);
> -static DEVICE_ATTR(rc6p_residency_ms, S_IRUGO, show_rc6p_ms, NULL);
> -static DEVICE_ATTR(rc6pp_residency_ms, S_IRUGO, show_rc6pp_ms, NULL);
> -static DEVICE_ATTR(media_rc6_residency_ms, S_IRUGO, show_media_rc6_ms, NULL);
> +static DEVICE_ATTR_RO(rc6_enable);
> +static DEVICE_ATTR_RO(rc6_residency_ms);
> +static DEVICE_ATTR_RO(rc6p_residency_ms);
> +static DEVICE_ATTR_RO(rc6pp_residency_ms);
> +static DEVICE_ATTR_RO(media_rc6_residency_ms);
>   
>   static struct attribute *rc6_attrs[] = {
>   	&dev_attr_rc6_enable.attr,
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
