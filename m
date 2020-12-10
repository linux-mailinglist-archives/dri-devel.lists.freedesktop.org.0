Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D016A2D5A56
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 13:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175E86E441;
	Thu, 10 Dec 2020 12:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5D86E429;
 Thu, 10 Dec 2020 12:20:44 +0000 (UTC)
IronPort-SDR: ru80uhl8Y2CXSEbb/xgz7+ax6FJ9iujOlNZEkQteluji+OH4T/+v3uQuWiZ/g65Uh+3O6VAikY
 3zA0V7uKboqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="161295679"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="161295679"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 04:20:43 -0800
IronPort-SDR: K4kkgKmNOnj9mj1LRvQRm9rywBeaRnfg5H5+yvX02joxBiM5y/YJJG0ePGAjJiahEDU9lf77xb
 WQB1a0kTVwow==
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="375894739"
Received: from aknautiy-mobl.gar.corp.intel.com (HELO [10.215.193.151])
 ([10.215.193.151])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 04:20:40 -0800
Subject: Re: [PATCH v4 07/16] drm/dp_helper: Add helpers to configure PCONs
 RGB-YCbCr Conversion
To: Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org,
 intel-gfx@lists.freedesktop.org
References: <20201209175034.GJ2767@kadam>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <25291b7c-5aa5-d687-8516-a64e122dd2ee@intel.com>
Date: Thu, 10 Dec 2020 17:50:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201209175034.GJ2767@kadam>
Content-Language: en-US
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
Cc: kbuild-all@lists.01.org, lkp@intel.com, airlied@linux.ie,
 swati2.sharma@intel.com, vandita.kulkarni@intel.com, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

Thanks for the mail.

As rightly mentioned, the intention was && instead of ||.

I will fix the issue in the next version of the patch.

Thanks & Regards,

Ankit

On 12/9/2020 11:20 PM, Dan Carpenter wrote:
> Hi Ankit,
>
> url:    https://github.com/0day-ci/linux/commits/Ankit-Nautiyal/Add-support-for-DP-HDMI2-1-PCON/20201208-160027
> base:   git://anongit.freedesktop.org/drm-intel for-linux-next
> config: i386-randconfig-m021-20201209 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> smatch warnings:
> drivers/gpu/drm/drm_dp_helper.c:3185 drm_dp_pcon_convert_rgb_to_ycbcr() warn: was && intended here instead of ||?
>
> vim +3185 drivers/gpu/drm/drm_dp_helper.c
>
> +int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc)
> +{
> +	int ret;
> +	u8 buf;
> +
> +	if (color_spc != DP_CONVERSION_BT601_RGB_YCBCR_ENABLE ||
> +	    color_spc != DP_CONVERSION_BT709_RGB_YCBCR_ENABLE ||
> +	    color_spc != DP_CONVERSION_BT2020_RGB_YCBCR_ENABLE)
> +		return -EINVAL;
>
> "color_spc" cannot possibly be equal to three different values so this
> function will always return -EINVAL.
>
> +
> +	ret = drm_dp_dpcd_readb(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, &buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	buf |= color_spc;
> +	ret = drm_dp_dpcd_writeb(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
