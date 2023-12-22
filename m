Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C161181C48F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 06:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6321710E74D;
	Fri, 22 Dec 2023 05:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7578110E74D;
 Fri, 22 Dec 2023 05:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=qv/4WGiqI5RbZ8+yGA8HWT/rnQNhck+h6ELpLX3MmQY=; b=F6DfyCULg5XHnTy+4wuTpM9wxk
 Hs3AwZ8tRZmisefjBm9ibPINppADr01EN3dIf8uRAFUuP4DBjeA+7ynMnzxqeacrR2tX8v4s5jo9e
 vb6dERMHAZ2x97TqbnpuX2IhTomk+qv5m4e7i3heCEwRgv+2pSxR9aHM3juS1LqyCSjzvWmsGD5u4
 3SGUcjunrW73kUvkJ12ONNDmLxPSK2HjB+Olh5PDI4kEXwT5IaNRsu7lesJlrdCwQQcgWdyq1yIdl
 WfSgdNhghRnmBAQ8Sn8CuEU0feM/A4x6qQPU1ZzIHI6t6rHr3OgN3Ac5//7p/Y5jWWjGqn2I/es/n
 +YrrZrkg==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rGXmO-004wFX-1m; Fri, 22 Dec 2023 05:09:00 +0000
Message-ID: <536a5850-34af-4a7d-b65d-82147895ef04@infradead.org>
Date: Thu, 21 Dec 2023 21:08:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: avoid stringop-overflow warnings for
 dp_decide_lane_settings()
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
References: <20231122221421.2944301-1-arnd@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231122221421.2944301-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Alan Liu <haoping.liu@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Michael Mityushkin <michael.mityushkin@amd.com>,
 Michael Strauss <michael.strauss@amd.com>, dri-devel@lists.freedesktop.org,
 George Shen <george.shen@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/22/23 14:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc prints a warning about a possible array overflow for a couple of
> callers of dp_decide_lane_settings() after commit 1b56c90018f0 ("Makefile:
> Enable -Wstringop-overflow globally"):
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_fixed_vs_pe_retimer.c: In function 'dp_perform_fixed_vs_pe_training_sequence_legacy':
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_fixed_vs_pe_retimer.c:426:25: error: 'dp_decide_lane_settings' accessing 4 bytes in a region of size 1 [-Werror=stringop-overflow=]
>   426 |                         dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   427 |                                         lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
>       |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_fixed_vs_pe_retimer.c:426:25: note: referencing argument 4 of type 'union dpcd_training_lane[4]'
> 
> I'm not entirely sure what caused this, but changing the prototype to expect
> a pointer instead of an array avoids the warnings.
> 
> Fixes: 7727e7b60f82 ("drm/amd/display: Improve robustness of FIXED_VS link training at DP1 rates")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  .../gpu/drm/amd/display/dc/link/protocols/link_dp_training.c    | 2 +-
>  .../gpu/drm/amd/display/dc/link/protocols/link_dp_training.h    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
> index 90339c2dfd84..5a0b04518956 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
> @@ -807,7 +807,7 @@ void dp_decide_lane_settings(
>  		const struct link_training_settings *lt_settings,
>  		const union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
>  		struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
> -		union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX])
> +		union dpcd_training_lane *dpcd_lane_settings)
>  {
>  	uint32_t lane;
>  
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.h b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.h
> index 7d027bac8255..851bd17317a0 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.h
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.h
> @@ -111,7 +111,7 @@ void dp_decide_lane_settings(
>  	const struct link_training_settings *lt_settings,
>  	const union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
>  	struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
> -	union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX]);
> +	union dpcd_training_lane *dpcd_lane_settings);
>  
>  enum dc_dp_training_pattern decide_cr_training_pattern(
>  		const struct dc_link_settings *link_settings);

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html
