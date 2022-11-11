Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE42625790
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 11:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255F610E7EA;
	Fri, 11 Nov 2022 10:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B1F10E7EA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 10:02:24 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A0E6F3EE66;
 Fri, 11 Nov 2022 11:02:20 +0100 (CET)
Date: Fri, 11 Nov 2022 11:02:18 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Subject: Re: [PATCH 3/5] drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in
 msm_icc_get()
Message-ID: <20221111100218.6h47vtyu67ovda3d@SoMainline.org>
References: <20221110094445.2930509-1-cuigaosheng1@huawei.com>
 <20221110094445.2930509-4-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110094445.2930509-4-cuigaosheng1@huawei.com>
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
Cc: emma@anholt.net, quic_akhilpo@quicinc.com, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 angelogioacchino.delregno@somainline.org, mihail.atanassov@arm.com,
 sam@ravnborg.org, james.qian.wang@arm.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, sean@poorly.run, vladimir.lypak@gmail.com,
 dianders@chromium.org, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-11-10 17:44:43, Gaosheng Cui wrote:
> The of_icc_get() function returns NULL or error pointers on error path,
> so we should use IS_ERR_OR_NULL() to check the return value.
> 
> Fixes: 5ccdcecaf8f7 ("drm/msm: lookup the ICC paths in both mdp5/dpu and mdss devices")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  drivers/gpu/drm/msm/msm_io_utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index d02cd29ce829..950083b2f092 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -133,7 +133,7 @@ struct icc_path *msm_icc_get(struct device *dev, const char *name)
>  	struct icc_path *path;
>  
>  	path = of_icc_get(dev, name);
> -	if (path)
> +	if (IS_ERR_OR_NULL(path))

NAK. This path should be returned if it is NON-NULL, otherwise we defer
to of_icc_get() on the parent device.  See the code-comment below.

- Marijn

>  		return path;
>  
>  	/*
> -- 
> 2.25.1
> 
