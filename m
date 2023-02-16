Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8324D699B0A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 18:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77C010EE22;
	Thu, 16 Feb 2023 17:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8A810EE22;
 Thu, 16 Feb 2023 17:16:06 +0000 (UTC)
Received: from [192.168.2.109] (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 00D3F6602116;
 Thu, 16 Feb 2023 17:16:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676567765;
 bh=8RfT/ATOYpAaq4kgh8A+t+VldumzcvpydtSOWpN9s9M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kT50sYEOQAK1eeuhcAYSgT3kb57q77fBt3kN8DmvPwjRchCyjR3BfehrnYGaQ8D6x
 e19DXEQVqZe2bueNDF2NC6FdO+L/luHFywCzxgw4c4idCFqbOu9Egeismn2s2ljpff
 hly6ZmBfXM8AFJT6acOFRJTMfR6gStqfdM3xVR56zg0DyUQ9YLXhg5MJzJfl4n3wG+
 HrZOVQP+oqboCeMXiZeLLmVTWZEo6BJvQoZzb6MyjHEqGpm0vp9OGSdx7M2q8bPY/E
 +SJLneCCZsBb8evAwCSLVUXUzASwaaF8BZWeHRk2EgJ3zljJECbE4jcM28VOJxKLn9
 ykLOjm4SpJEZw==
Message-ID: <fca1d6ee-552c-2d8a-2558-2932de453304@collabora.com>
Date: Thu, 16 Feb 2023 20:16:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/msm: Fix potential invalid ptr free
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230215235048.1166484-1-robdclark@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230215235048.1166484-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/16/23 02:50, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The error path cleanup expects that chain and syncobj are either NULL or
> valid pointers.  But post_deps was not allocated with __GFP_ZERO.
> 
> Fixes: ab723b7a992a ("drm/msm: Add syncobj support.")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 6503220e5a4b..e4d13540300e 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -640,8 +640,8 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
>  	int ret = 0;
>  	uint32_t i, j;
>  
> -	post_deps = kmalloc_array(nr_syncobjs, sizeof(*post_deps),
> -	                          GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
> +	post_deps = kcalloc(nr_syncobjs, sizeof(*post_deps),
> +			    GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
>  	if (!post_deps)
>  		return ERR_PTR(-ENOMEM);
>  
> @@ -656,7 +656,6 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
>  		}
>  
>  		post_deps[i].point = syncobj_desc.point;
> -		post_deps[i].chain = NULL;
>  
>  		if (syncobj_desc.flags) {
>  			ret = -EINVAL;

Good catch!

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

