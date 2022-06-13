Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7C95485B2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43FB10E7FB;
	Mon, 13 Jun 2022 14:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F93910E7FB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655130752; x=1686666752;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8wF/1dU2hbX2DYy7M0ppAJdB0m/VKc5sXgeurboZAI8=;
 b=jvskJfiZr6rpHVzjLa2gglnM0esxQPjUeTVc2XRv9ZvIYcHV8byhrNGZ
 6fayReejTxS0IOVNZ8uiXp9jcb7l9AeXeUqb3D3yf0MR4XpX5lEYwWSuA
 qxPRm5QRvkAF/i1zx9fMwVRSbaaBYKRmvPQLrv+VTUl4lH/0hucU/rAhO
 tTmaekEtrIQUFhnF1DaZtUmbOh+xiLTPmryV7lrnEN8EcQBmhQy3s/DZO
 /S5SRXHJZJQmfT5dSoC+2+uhZCJ8lTU7kZXd5e4w3x125HDaDratSZTW+
 U0xEagvS2pmo8aTT1DeN3mPsDO8A97R7qZVVj3KiKnzu6+2Ks/nvoRqOw w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="342271755"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="342271755"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 07:32:31 -0700
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="639761550"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.18.236])
 ([10.213.18.236])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 07:32:27 -0700
Message-ID: <67c65cde-ccdd-5c1d-0b47-85e01d1e45e0@intel.com>
Date: Mon, 13 Jun 2022 16:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/msm: Fix convert to drm_of_get_data_lanes_count
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20220612143349.105766-1-marex@denx.de>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220612143349.105766-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: kernel test robot <lkp@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 robert.foss@linaro.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.06.2022 16:33, Marek Vasut wrote:
> Add missing header file into dsi_host.c and encode data-lanes string
> directly into the warning message in the driver to avoid build issues
> detected by lkp.
>
> Fixes: 185443efa26a ("drm/msm: Convert to drm_of_get_data_lanes_count")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sean Paul <sean@poorly.run>
> To: dri-devel@lists.freedesktop.org

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/msm/dp/dp_parser.c | 4 ++--
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 346556c5706d7..57ae14a0e1814 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -106,8 +106,8 @@ static int dp_parser_misc(struct dp_parser *parser)
>   
>   	len = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
>   	if (len < 0) {
> -		DRM_WARN("Invalid property %s, default max DP lanes = %d\n",
> -				data_lane_property, DP_MAX_NUM_DP_LANES);
> +		DRM_WARN("Invalid property \"data-lanes\", default max DP lanes = %d\n",
> +			 DP_MAX_NUM_DP_LANES);
>   		len = DP_MAX_NUM_DP_LANES;
>   	}
>   
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index db5871b9c5d88..7e21916d1511a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -21,6 +21,8 @@
>   
>   #include <video/mipi_display.h>
>   
> +#include <drm/drm_of.h>
> +
>   #include "dsi.h"
>   #include "dsi.xml.h"
>   #include "sfpb.xml.h"

