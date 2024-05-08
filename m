Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5091E8BFDD5
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 14:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EEF10E400;
	Wed,  8 May 2024 12:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqVBq91V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBB91128DB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 12:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715173079; x=1746709079;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=SgE2RM2x5HJZ4SaN3UW2o7kXIdaMPZ/EpwnCZx9WaVo=;
 b=HqVBq91VF/VbPKP6O1Pq98ao5RdpEwlqA6RI0mfCXoFDsF+1EQLAY6A6
 DSsNPFzAGg20fxYNSf+xXiHc+BkhZyjxjk7dGDkIWnA+IGeO6LukjlS1q
 dFRl0CWHDYnr/TONhIDqACv3s10FY27v+5Gbvl4UHty+UvQUBNDihACLE
 Jdr/diekglldbIYn30dvt2qxXdMm13I8v5GEIcF4OrZMGLYLfwh0JI/sU
 6xZDNprF6SG9r9KI2xuVQ7tGACqwXZQrZsg6qdJZt998KVWTt/LNGe35R
 gKo6amJOq9/eHAcQXeSJIGh+4A/CDocOODr5zzHtlDyQhBmRGryb3KPaA A==;
X-CSE-ConnectionGUID: HTv0z2nyTCa3VbJ5u5t02A==
X-CSE-MsgGUID: 0K6GzSJ+TLOy57SBSTx7qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36409127"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="36409127"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:57:58 -0700
X-CSE-ConnectionGUID: jaBOeWByQTSzMUt+/WVfhQ==
X-CSE-MsgGUID: 0FvTtsVYRhGZbPdVjV1tyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33348258"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:57:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: deprecate driver date
In-Reply-To: <20240429164336.1406480-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240429164336.1406480-1-jani.nikula@intel.com>
Date: Wed, 08 May 2024 15:57:55 +0300
Message-ID: <87edacjwa4.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Apr 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> The driver date serves no useful purpose, because it's hardly ever
> updated. The information is misleading at best.
>
> As described in Documentation/gpu/drm-internals.rst:
>
>   The driver date, formatted as YYYYMMDD, is meant to identify the date
>   of the latest modification to the driver. However, as most drivers
>   fail to update it, its value is mostly useless. The DRM core prints it
>   to the kernel log at initialization time and passes it to userspace
>   through the DRM_IOCTL_VERSION ioctl.
>
> Stop printing the driver date at init, and start returning the empty
> string "" as driver date through the DRM_IOCTL_VERSION ioctl.
>
> The driver date initialization in drivers and the struct drm_driver date
> member can be removed in follow-up.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Pushed to drm-misc-next, thanks for the reviews and acks.

BR,
Jani.

>
> ---
>
> The below approximates when each driver's date was last updated.
>
> $ git grepblame "\(\.date = \".*\"\|#define.*DRIVER_DATE\)" -- drivers/gpu drivers/accel
> fe77368c0f3e0 drivers/accel/habanalabs/common/habanalabs_drv.c 94 (Tomer Tayar 2023-02-19 11:58:46 +0200 104) 	.date = "20190505",
> 35b137630f08d drivers/accel/ivpu/ivpu_drv.h 20 (Jacek Lawrynowicz 2023-01-17 10:27:17 +0100 24) #define DRIVER_DATE "20230117"
> d38ceaf99ed01 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h 43 (Alex Deucher 2015-04-20 16:55:21 -0400 43) #define DRIVER_DATE		"20150101"
> 61f1c4a8ab757 drivers/gpu/drm/arm/display/komeda/komeda_kms.c 51 (james qian wang (Arm Technology China) 2019-01-03 11:41:30 +0000 64) 	.date = "20181101",
> 8e22d79240d95 drivers/gpu/drm/arm/hdlcd_drv.c 343 (Liviu Dudau 2015-04-02 19:48:39 +0100 234) 	.date = "20151021",
> ad49f8602fe88 drivers/gpu/drm/arm/malidp_drv.c 232 (Liviu Dudau 2016-03-07 10:00:53 +0000 571) 	.date = "20160106",
> 4f2a8f5898ecd drivers/gpu/drm/aspeed/aspeed_gfx_drv.c 208 (Joel Stanley 2019-04-03 10:49:08 +1030 253) 	.date = "20180319",
> 312fec1405dd5 drivers/gpu/drm/ast/ast_drv.h 46 (Dave Airlie 2012-02-29 13:40:04 +0000 46) #define DRIVER_DATE		"20120228"
> 1a396789f65a2 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c 504 (Boris Brezillon 2015-01-06 11:13:28 +0100 741) 	.date = "20141504",
> 9913f74fe1570 drivers/gpu/drm/exynos/exynos_drm_drv.c 37 (Marek Szyprowski 2018-05-10 08:46:36 +0900 37) #define DRIVER_DATE	"20180330"
> f90cd811ae7a3 drivers/gpu/drm/gma500/psb_drv.h 43 (Arthur Borsboom 2014-03-15 22:12:17 +0100 29) #define DRIVER_DATE "20140314"
> 1053d01864937 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c 1070 (Xu YiPing 2019-08-20 23:06:19 +0000 930) 	.date = "20150718",
> 76c56a5affeba drivers/gpu/drm/hyperv/hyperv_drm_drv.c 22 (Deepak Rawat 2021-05-27 04:22:28 -0700 22) #define DRIVER_DATE "2020"
> 3570bd989acc6 drivers/gpu/drm/i915/i915_driver.h 18 (Jani Nikula 2023-09-29 12:43:23 +0300 18) #define DRIVER_DATE		"20230929"
> 4babef0708656 drivers/gpu/drm/imagination/pvr_drv.h 12 (Sarah Walker 2023-11-22 16:34:26 +0000 12) #define PVR_DRIVER_DATE "20230904"
> c87e859cdeb5d drivers/gpu/drm/imx/lcdc/imx-lcdc.c 361 (Marian Cichy 2023-03-06 12:52:49 +0100 353) 	.date = "20200716",
> eb92830cdbc23 drivers/gpu/drm/kmb/kmb_drv.h 19 (Edmund Dea 2020-08-26 13:17:29 -0700 19) #define DRIVER_DATE			"20210223"
> f39db26c54281 drivers/gpu/drm/loongson/lsdc_drv.c 28 (Sui Jingfeng 2023-06-15 22:36:12 +0800 28) #define DRIVER_DATE                 "20220701"
> 5fc537bfd0003 drivers/gpu/drm/mcde/mcde_drv.c 247 (Linus Walleij 2019-05-24 11:20:19 +0200 210) 	.date = "20180529",
> 119f5173628aa drivers/gpu/drm/mediatek/mtk_drm_drv.c 36 (CK Hu 2016-01-04 18:36:34 +0100 34) #define DRIVER_DATE "20150513"
> 414c453106255 drivers/gpu/drm/mgag200/mgag200_drv.h 34 (Dave Airlie 2012-04-17 15:01:25 +0100 31) #define DRIVER_DATE		"20110418"
> 77145f1cbdf8d drivers/gpu/drm/nouveau/nouveau_drm.h 9 (Ben Skeggs 2012-07-31 16:16:21 +1000 10) #define DRIVER_DATE		"20120801"
> cd5351f4d2b1b drivers/staging/omapdrm/omap_drv.c 27 (Rob Clark 2011-11-12 12:09:40 -0600 31) #define DRIVER_DATE		"20110917"
> 4bdca11507928 drivers/gpu/drm/panthor/panthor_drv.c 1371 (Boris Brezillon 2024-02-29 17:22:25 +0100 1386) 	.date = "20230801",
> bed41005e6174 drivers/gpu/drm/pl111/pl111_drv.c 157 (Tom Cooksey 2017-04-12 20:17:46 -0700 222) 	.date = "20170317",
> f64122c1f6ade drivers/gpu/drm/qxl/qxl_drv.h 52 (Dave Airlie 2013-02-25 14:47:55 +1000 57) #define DRIVER_DATE		"20120117"
> c0beb2a723d69 drivers/char/drm/radeon_drv.h 41 (Dave Airlie 2008-05-28 13:52:28 +1000 46) #define DRIVER_DATE		"20080528"
> 2048e3286f347 drivers/gpu/drm/rockchip/rockchip_drm_drv.c 34 (Mark Yao 2014-08-22 18:36:26 +0800 41) #define DRIVER_DATE	"20140818"
> a61732e808672 drivers/gpu/drm/solomon/ssd130x.c 38 (Javier Martinez Canillas 2022-02-14 14:37:07 +0100 41) #define DRIVER_DATE	"20220131"
> 43531edd53f07 drivers/gpu/drm/sprd/sprd_drm.c 26 (Kevin Tang 2021-12-07 22:27:13 +0800 26) #define DRIVER_DATE	"20200201"
> 9bbf86fe874cc drivers/gpu/drm/sti/sti_drm_drv.c 24 (Benjamin Gaignard 2014-07-31 09:39:11 +0200 31) #define DRIVER_DATE	"20140601"
> af5125de7a0e8 drivers/gpu/drm/stm/drv.c 57 (Philippe CORNU 2017-07-20 14:05:51 +0200 62) 	.date = "20170330",
> d8f4a9eda0067 drivers/gpu/drm/tegra/drm.c 22 (Thierry Reding 2012-11-15 21:28:22 +0000 37) #define DRIVER_DATE "20120330"
> 51dacf208988e drivers/gpu/drm/arc/arcpgu_drv.c 193 (Carlos Palminha 2016-02-19 15:30:26 +0300 368) 	.date = "20160219",
> ab3e023b1b4c9 drivers/gpu/drm/cirrus/cirrus.c 45 (Gerd Hoffmann 2019-04-05 11:52:19 +0200 50) #define DRIVER_DATE "2019"
> e4f86e4371644 drivers/gpu/drm/gm12u320/gm12u320.c 33 (Hans de Goede 2019-07-21 15:25:25 +0200 36) #define DRIVER_DATE		"2019"
> c8a17756c4258 drivers/gpu/drm/tiny/ofdrm.c 27 (Thomas Zimmermann 2022-10-11 17:07:08 +0200 27) #define DRIVER_DATE	"20220501"
> 11e8f5fd223bd drivers/gpu/drm/tiny/simpledrm.c 26 (Thomas Zimmermann 2021-04-30 12:58:35 +0200 33) #define DRIVER_DATE	"20200625"
> 179c02fe90a41 drivers/gpu/drm/tve200/tve200_drv.c 141 (Linus Walleij 2017-08-20 12:05:55 +0200 147) 	.date = "20170703",
> 5320918b9a878 drivers/gpu/drm/udl/udl_drv.h 21 (Dave Airlie 2010-12-15 07:14:24 +1000 29) #define DRIVER_DATE		"20120220"
> 57692c94dcbe9 drivers/gpu/drm/v3d/v3d_drv.c 31 (Eric Anholt 2018-04-30 11:10:58 -0700 34) #define DRIVER_DATE "20180419"
> dd55d44f40841 drivers/staging/vboxvideo/vbox_drv.h 55 (Hans de Goede 2017-07-06 16:06:01 +0200 28) #define DRIVER_DATE         "20130823"
> c8b75bca92cbf drivers/gpu/drm/vc4/vc4_drv.c 23 (Eric Anholt 2015-03-02 13:01:12 -0800 48) #define DRIVER_DATE "20140616"
> 502e95c667850 drivers/gpu/drm/vgem/vgem_drv.c 41 (Zach Reizner 2015-03-04 16:33:41 -0800 50) #define DRIVER_DATE	"20120112"
> dc5698e80cf72 drivers/gpu/drm/virtio/virtgpu_drv.h 44 (Dave Airlie 2013-09-09 10:02:56 +1000 48) #define DRIVER_DATE "0"
> 1c7c5fd916a0f drivers/gpu/drm/vkms/vkms_drv.c 16 (Haneen Mohammed 2018-05-14 17:33:46 +0300 36) #define DRIVER_DATE	"20180514"
> 94eb7de6f4bec drivers/gpu/drm/vmwgfx/vmwgfx_drv.h 57 (Zack Rusin 2021-12-08 21:49:24 -0500 59) #define VMWGFX_DRIVER_DATE "20211206"
> dd08ebf6c3525 drivers/gpu/drm/xe/xe_drv.h 13 (Matthew Brost 2023-03-30 17:31:57 -0400 13) #define DRIVER_DATE		"20201103"
> ---
>  Documentation/gpu/drm-internals.rst | 10 ++--------
>  drivers/gpu/drm/drm_drv.c           |  4 ++--
>  drivers/gpu/drm/drm_ioctl.c         |  5 +++--
>  include/drm/drm_drv.h               |  2 +-
>  4 files changed, 8 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> index 335de7fcddee..11d9a5730fb2 100644
> --- a/Documentation/gpu/drm-internals.rst
> +++ b/Documentation/gpu/drm-internals.rst
> @@ -57,8 +57,8 @@ is larger than the driver minor, the DRM_IOCTL_SET_VERSION call will
>  return an error. Otherwise the driver's set_version() method will be
>  called with the requested version.
>  
> -Name, Description and Date
> -~~~~~~~~~~~~~~~~~~~~~~~~~~
> +Name and Description
> +~~~~~~~~~~~~~~~~~~~~
>  
>  char \*name; char \*desc; char \*date;
>  The driver name is printed to the kernel log at initialization time,
> @@ -69,12 +69,6 @@ The driver description is a purely informative string passed to
>  userspace through the DRM_IOCTL_VERSION ioctl and otherwise unused by
>  the kernel.
>  
> -The driver date, formatted as YYYYMMDD, is meant to identify the date of
> -the latest modification to the driver. However, as most drivers fail to
> -update it, its value is mostly useless. The DRM core prints it to the
> -kernel log at initialization time and passes it to userspace through the
> -DRM_IOCTL_VERSION ioctl.
> -
>  Module Initialization
>  ---------------------
>  
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 535b624d4c9d..162f50c78d71 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -947,9 +947,9 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>  	}
>  	drm_panic_register(dev);
>  
> -	DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
> +	DRM_INFO("Initialized %s %d.%d.%d for %s on minor %d\n",
>  		 driver->name, driver->major, driver->minor,
> -		 driver->patchlevel, driver->date,
> +		 driver->patchlevel,
>  		 dev->dev ? dev_name(dev->dev) : "virtual device",
>  		 dev->primary ? dev->primary->index : dev->accel->index);
>  
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index e368fc084c77..89feb7306e47 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -529,9 +529,10 @@ int drm_version(struct drm_device *dev, void *data,
>  	version->version_patchlevel = dev->driver->patchlevel;
>  	err = drm_copy_field(version->name, &version->name_len,
>  			dev->driver->name);
> +
> +	/* Driver date is deprecated. Return the empty string. */
>  	if (!err)
> -		err = drm_copy_field(version->date, &version->date_len,
> -				dev->driver->date);
> +		err = drm_copy_field(version->date, &version->date_len, "");
>  	if (!err)
>  		err = drm_copy_field(version->desc, &version->desc_len,
>  				dev->driver->desc);
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 8878260d7529..cd37936c3926 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -411,7 +411,7 @@ struct drm_driver {
>  	char *name;
>  	/** @desc: driver description */
>  	char *desc;
> -	/** @date: driver date */
> +	/** @date: driver date, unused, to be removed */
>  	char *date;
>  
>  	/**

-- 
Jani Nikula, Intel
