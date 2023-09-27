Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C93F67B05C3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 15:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8075610E52B;
	Wed, 27 Sep 2023 13:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BF43910E52B;
 Wed, 27 Sep 2023 13:48:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 411E31FB;
 Wed, 27 Sep 2023 06:48:55 -0700 (PDT)
Received: from [10.57.2.15] (unknown [10.57.2.15])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1D953F59C;
 Wed, 27 Sep 2023 06:48:15 -0700 (PDT)
Message-ID: <3344d3cf-2883-27d1-424e-d33b739dceb5@arm.com>
Date: Wed, 27 Sep 2023 14:48:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/7] drm: Do not round to megabytes for greater than 1MiB
 sizes in fdinfo stats
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230927133843.247957-1-tvrtko.ursulin@linux.intel.com>
 <20230927133843.247957-2-tvrtko.ursulin@linux.intel.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230927133843.247957-2-tvrtko.ursulin@linux.intel.com>
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
Cc: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/09/2023 14:38, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> It is better not to lose precision and not revert to 1 MiB size
> granularity for every size greater than 1 MiB.
> 
> Sizes in KiB should not be so troublesome to read (and in fact machine
> parsing is I expect the norm here), they align with other api like
> /proc/meminfo, and they allow writing tests for the interface without
> having to embed drm.ko implementation knowledge into them. (Like knowing
> that minimum buffer size one can use for successful verification has to be
> 1MiB aligned, and on top account for any pre-existing memory utilisation
> outside of driver's control.)
> 
> But probably even more importantly I think that it is just better to show
> the accurate sizes and not arbitrary lose precision for a little bit of a
> stretched use case of eyeballing fdinfo text directly.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
> Cc: steven.price@arm.com

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/drm_file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index e692770ef6d3..ecb5038009e7 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -913,7 +913,7 @@ static void print_size(struct drm_printer *p, const char *stat,
>  	unsigned u;
>  
>  	for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
> -		if (sz < SZ_1K)
> +		if (sz == 0 || !IS_ALIGNED(sz, SZ_1K))
>  			break;
>  		sz = div_u64(sz, SZ_1K);
>  	}

