Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932A775C497
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 12:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A935710E651;
	Fri, 21 Jul 2023 10:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D5C910E64E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 10:24:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FEC52F4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 03:25:33 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E05843F738
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 03:24:49 -0700 (PDT)
Date: Fri, 21 Jul 2023 11:24:33 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Subject: Re: [PATCH v3 3/3] drm/komeda: Fix IS_ERR() vs NULL check in
 komeda_component_get_avail_scaler()
Message-ID: <ZLpc4Yt39SjbGA-T@e110455-lin.cambridge.arm.com>
References: <20230714014820.2186203-1-cuigaosheng1@huawei.com>
 <20230714014820.2186203-4-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230714014820.2186203-4-cuigaosheng1@huawei.com>
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
Cc: neil.armstrong@linaro.org, quic_eberman@quicinc.com, sam@ravnborg.org,
 quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org, a39.skl@gmail.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 james.qian.wang@arm.com, angelogioacchino.delregno@somainline.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gaosheng,

On Fri, Jul 14, 2023 at 09:48:20AM +0800, Gaosheng Cui wrote:
> The komeda_pipeline_get_state() returns an ERR_PTR() on failure, we should
> use IS_ERR() to check the return value.
> 
> Fixes: 502932a03fce ("drm/komeda: Add the initial scaler support for CORE")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> index 3276a3e82c62..e9c92439398d 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> @@ -259,7 +259,7 @@ komeda_component_get_avail_scaler(struct komeda_component *c,
>  	u32 avail_scalers;
>  
>  	pipe_st = komeda_pipeline_get_state(c->pipeline, state);
> -	if (!pipe_st)
> +	if (IS_ERR(pipe_st))

If you're going to update the other patches to use IS_ERR_OR_NULL() please do so
here too. You can keep my R-b for that change.

Best regards,
Liviu

>  		return NULL;
>  
>  	avail_scalers = (pipe_st->active_comps & KOMEDA_PIPELINE_SCALERS) ^
> -- 
> 2.25.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
