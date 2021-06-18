Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE9E3ACB44
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 14:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CA56EA03;
	Fri, 18 Jun 2021 12:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id ACC116EA02
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 12:43:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 115EB1476;
 Fri, 18 Jun 2021 05:43:28 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4E5C3F85F;
 Fri, 18 Jun 2021 05:43:26 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost:modify 'break' to 'continue' to traverse the
 circulation
To: ChunyouTang <tangchunyou@163.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20210617080414.1940-1-tangchunyou@163.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <4d289eed-59f2-161a-40d1-2a434a1955c2@arm.com>
Date: Fri, 18 Jun 2021 13:43:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617080414.1940-1-tangchunyou@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: ChunyouTang <tangchunyou@icubecorp.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/06/2021 09:04, ChunyouTang wrote:
> From: ChunyouTang <tangchunyou@icubecorp.cn>
> 
> The 'break' can cause 'Memory manager not clean during takedown'
> 
> It cannot use break to finish the circulation,it should use
> 
> continue to traverse the circulation.it should put every mapping
> 
> which is not NULL.

You don't appear to have answered my question about whether you've
actually seen this happen (and ideally what circumstances). In my
previous email[1] I explained why I don't think this is needed. You need
to convince me that I've overlooked something.

Thanks,

Steve

[1] https://lore.kernel.org/r/31644881-134a-2d6e-dddf-e658a3a8176b%40arm.com

> Signed-off-by: ChunyouTang <tangchunyou@icubecorp.cn>
> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 6003cfeb1322..52bccc1d2d42 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -281,7 +281,7 @@ static void panfrost_job_cleanup(struct kref *ref)
>  	if (job->mappings) {
>  		for (i = 0; i < job->bo_count; i++) {
>  			if (!job->mappings[i])
> -				break;
> +				continue;
>  
>  			atomic_dec(&job->mappings[i]->obj->gpu_usecount);
>  			panfrost_gem_mapping_put(job->mappings[i]);
> 

