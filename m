Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E0B5B198D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 12:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EF410EA8A;
	Thu,  8 Sep 2022 10:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 95B7E10EA72
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 10:03:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58C9114BF;
 Thu,  8 Sep 2022 03:03:36 -0700 (PDT)
Received: from [10.1.39.19] (e122027.cambridge.arm.com [10.1.39.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 936833F73D;
 Thu,  8 Sep 2022 03:03:23 -0700 (PDT)
Message-ID: <65948185-b017-3da5-fdce-e28887b01ff4@arm.com>
Date: Thu, 8 Sep 2022 11:03:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 4/5] drm/panfrost: devfreq: set opp to the recommended
 one to configure regulator
Content-Language: en-GB
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220906153034.153321-1-peron.clem@gmail.com>
 <20220906153034.153321-5-peron.clem@gmail.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220906153034.153321-5-peron.clem@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Qiang Yu <yuq825@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/09/2022 16:30, Clément Péron wrote:
> Enabling panfrost GPU OPP with dynamic regulator will make OPP
> responsible to enable and configure it.
> 
> Unfortunatly OPP configure and enable the regulator when an OPP

NIT: Unfortunately

> is asked to be set, which is not the case during
> panfrost_devfreq_init().
> 
> This leave the regulator unconfigured and if no GPU load is
> triggered, no OPP is asked to be set which make the regulator framework
> switching it off during regulator_late_cleanup() without
> noticing and therefore make the board hang as any access to GPU
> memory space make bus locks up.
> 
> Call dev_pm_opp_set_opp() with the recommend OPP in
> panfrost_devfreq_init() to enable the regulator, this will properly
> configure and enable the regulator and will avoid any switch off
> by regulator_late_cleanup().
> 
> Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Clément Péron <peron.clem@gmail.com>

Reviewed-by: Steven Price <steven.price@arm.com>

Note this same sequence is used in the Lima driver, so it would be good
to submit the fix there too as it presumably is affected by the same
issue. I've CC'd Qiang for visibility.

I'll push this patch to drm-misc-fixes (with the typo above fixed), the
device tree patches can go through a different tree.

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 5110cd9b2425..fe5f12f16a63 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -131,6 +131,17 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  		return PTR_ERR(opp);
>  
>  	panfrost_devfreq_profile.initial_freq = cur_freq;
> +
> +	/*
> +	 * Set the recommend OPP this will enable and configure the regulator
> +	 * if any and will avoid a switch off by regulator_late_cleanup()
> +	 */
> +	ret = dev_pm_opp_set_opp(dev, opp);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
> +		return ret;
> +	}
> +
>  	dev_pm_opp_put(opp);
>  
>  	/*

