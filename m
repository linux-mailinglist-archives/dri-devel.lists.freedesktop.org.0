Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBF14A4093
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 11:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED7710E38F;
	Mon, 31 Jan 2022 10:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6690810E38F
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 10:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643626647; x=1675162647;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZdENkAwNTJtD0Npkluazkuj5//kfgKoLfVNh1OSJ8Us=;
 b=G2/f5EW9iabG8hkLAMWkBLrSworB1oiqC0mWyrlHLic7ucEfKFE8GZDf
 jn+UgvFk3KtjFvKBsFi6fvld9O7qbi92U7Ix7X9wGm9b9v7NLax5TX/ZI
 /u0ugDbx6sEv9uCqIBMRpXrTZWqz81N0kCgjWmg+SA/+HPnKuEAxybO+J
 xesfwdCYp2uikVee7I4rIbiqXNauwB0CS0hCdXL0OyIxgwg4CYxavRXG7
 UpSxvxqaQgbFUHflifk4zPsxGFqrDEnzRICMr6bHUdd/8sGzsvbFGYECL
 3/k0DsElVt0mqbIWv9/DmiEOdIRgB05BnSjS/6cLTfQlbc99dv/Yymtpa Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="246272067"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="246272067"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 02:57:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="481712993"
Received: from ylian16-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.16.100])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 02:57:19 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Yong Wu <yong.wu@mediatek.com>
Subject: Re: [RFC PATCH] component: Add common helpers for compare/release
 functions
In-Reply-To: <YfRtGF3v+BwH5RkG@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220128081101.27837-1-yong.wu@mediatek.com>
 <YfRtGF3v+BwH5RkG@phenom.ffwll.local>
Date: Mon, 31 Jan 2022 12:57:16 +0200
Message-ID: <878ruww4tv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, James Wang <james.qian.wang@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Jan 2022, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Fri, Jan 28, 2022 at 04:11:01PM +0800, Yong Wu wrote:
>> The component requires the compare/release functions, there are so many
>> copy in current kernel. Just define three common helpers for them.
>> No functional change.
>> 
>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>> ---
>> Base on v5.17-rc1
>> ---
>>  .../gpu/drm/arm/display/komeda/komeda_drv.c    |  5 -----
>>  drivers/gpu/drm/arm/hdlcd_drv.c                |  7 +------
>>  drivers/gpu/drm/armada/armada_drv.c            |  5 -----
>>  drivers/gpu/drm/drm_of.c                       |  8 +-------
>>  drivers/gpu/drm/etnaviv/etnaviv_drv.c          |  7 -------
>>  drivers/gpu/drm/exynos/exynos_drm_drv.c        |  5 -----
>>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |  5 -----
>>  drivers/gpu/drm/imx/imx-drm-core.c             |  4 ++--
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c      |  5 -----
>>  drivers/gpu/drm/mcde/mcde_drv.c                |  7 +------
>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c         |  5 -----
>>  drivers/gpu/drm/meson/meson_drv.c              |  8 --------
>>  drivers/gpu/drm/msm/msm_drv.c                  |  9 ---------
>>  drivers/gpu/drm/omapdrm/dss/dss.c              |  8 +-------
>>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c    |  5 -----
>>  drivers/gpu/drm/sti/sti_drv.c                  |  5 -----
>>  drivers/gpu/drm/sun4i/sun4i_drv.c              |  9 ---------
>>  drivers/gpu/drm/vc4/vc4_drv.c                  |  5 -----
>>  drivers/iommu/mtk_iommu.h                      | 10 ----------
>>  drivers/power/supply/ab8500_charger.c          |  8 +-------
>>  drivers/video/fbdev/omap2/omapfb/dss/dss.c     |  8 +-------
>>  include/linux/component.h                      | 18 ++++++++++++++++++
>>  sound/soc/codecs/wcd938x.c                     | 16 ++--------------
>
> Seems like a neat idea. Please add kerneldoc for the new functions you're
> adding (bonus point for an example in there) and make sure it all renders
> correctly in
>
> $ make htmldoc
>
> Also please split up the patch series per-driver and add the maintainers
> to each patches' Cc: list. With that I think this should be ready for
> merging.

Aren't the function names perhaps a bit short and generic for the global
namespace though? If you encounter compare_of, release_of, or
compare_dev in code, component.h is not where you'd expect to find them.

BR,
Jani.


>> diff --git a/include/linux/component.h b/include/linux/component.h
>> index 16de18f473d7..5a7468ea827c 100644
>> --- a/include/linux/component.h
>> +++ b/include/linux/component.h
>> @@ -2,6 +2,8 @@
>>  #ifndef COMPONENT_H
>>  #define COMPONENT_H
>>  
>> +#include <linux/device.h>
>> +#include <linux/of.h>
>>  #include <linux/stddef.h>
>>  
>>  
>> @@ -82,6 +84,22 @@ struct component_master_ops {
>>  	void (*unbind)(struct device *master);
>>  };
>>  
>> +/* A set common helpers for compare/release functions */
>> +static inline int compare_of(struct device *dev, void *data)
>> +{
>> +	return dev->of_node == data;
>> +}
>> +
>> +static inline void release_of(struct device *dev, void *data)
>> +{
>> +	of_node_put(data);
>> +}
>> +
>> +static inline int compare_dev(struct device *dev, void *data)
>> +{
>> +	return dev == data;
>> +}
>> +
>>  void component_master_del(struct device *,
>>  	const struct component_master_ops *);
>>  

-- 
Jani Nikula, Intel Open Source Graphics Center
