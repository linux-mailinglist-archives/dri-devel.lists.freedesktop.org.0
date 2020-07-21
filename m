Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2595A227376
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 02:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF536E0BE;
	Tue, 21 Jul 2020 00:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B766E0BC;
 Tue, 21 Jul 2020 00:05:24 +0000 (UTC)
IronPort-SDR: TCEJl9xKSI6UygznOd2huSlD58iKcb5hGw1TiFU7Gd1ToyuLHjMq8G8Ow9fQ7Q3itQeF9oA4DO
 WbyFIxUINazQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="168173625"
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="168173625"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 17:05:23 -0700
IronPort-SDR: 66/gtJP3ssgvZKRSKgtoab7l2pAwds66Ock87NMLaGZhhVAIQdg5ftre91LrpFUqWZN9BnlGKu
 +0RAuWOQopIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="487896047"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by fmsmga005.fm.intel.com with ESMTP; 20 Jul 2020 17:05:23 -0700
Date: Mon, 20 Jul 2020 17:07:35 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Khaled Almahallawy <khaled.almahallawy@intel.com>
Subject: Re: [PATCH 1/2] drm/dp: Add PHY_TEST_PATTERN CP2520 Pattern 2 and 3
Message-ID: <20200721000734.GA14395@intel.com>
References: <20200720234126.11853-1-khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720234126.11853-1-khaled.almahallawy@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: intel-gfx@lists.freedesktop.org, animesh.manna@intel.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 04:41:25PM -0700, Khaled Almahallawy wrote:
> Add the missing CP2520 pattern 2 and 3 phy compliance patterns
> 
> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 2 +-
>  include/drm/drm_dp_helper.h     | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index a3c82e726057..d0fb78c6aca6 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -1583,7 +1583,7 @@ int drm_dp_get_phy_test_pattern(struct drm_dp_aux *aux,
>  			return err;
>  
>  		break;
> -	case DP_PHY_TEST_PATTERN_CP2520:
> +	case DP_PHY_TEST_PATTERN_CP2520_PAT1:
>  		err = drm_dp_dpcd_read(aux, DP_TEST_HBR2_SCRAMBLER_RESET,
>  				       &data->hbr2_reset,
>  				       sizeof(data->hbr2_reset));

Where do we read PAT2 and PAT3, I see you defined those newly and patch 2/2 has them
in teh switch case but the drm_dp_get_phy_test_pattern function doesnt read them?

Manasi

> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index e47dc22ebf50..65dd6cd71f1e 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -708,7 +708,9 @@
>  # define DP_PHY_TEST_PATTERN_ERROR_COUNT    0x2
>  # define DP_PHY_TEST_PATTERN_PRBS7          0x3
>  # define DP_PHY_TEST_PATTERN_80BIT_CUSTOM   0x4
> -# define DP_PHY_TEST_PATTERN_CP2520         0x5
> +# define DP_PHY_TEST_PATTERN_CP2520_PAT1	0x5
> +# define DP_PHY_TEST_PATTERN_CP2520_PAT2	0x6
> +# define DP_PHY_TEST_PATTERN_CP2520_PAT3	0x7
>  
>  #define DP_TEST_HBR2_SCRAMBLER_RESET        0x24A
>  #define DP_TEST_80BIT_CUSTOM_PATTERN_7_0    0x250
> -- 
> 2.17.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
