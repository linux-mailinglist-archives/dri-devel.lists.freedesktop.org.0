Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5C8452E94
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 11:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBA76E947;
	Tue, 16 Nov 2021 10:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281356E945
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 10:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HqEM3DCxCc7EYy87yoH2Qfr/sJ9yOX855tzSUgvk9+E=; b=XvlB7UUpzDJsMbwOIwmxYeh0dv
 ilZ9VhOMQ5CFY4tnDutP00Kw0ggTC5QEo2qsluT5MVDcZgWeYQpAAGai01aO93Ah/ColkfEzmsSvL
 eE7qM2y/wcvKjb9OLvkIgTQGRFXhvmsTF52PK2hE45wHfQIw2U36JvRcncStfj819bpSw39yEN/Ts
 K8vzAPT8a3yy1yh48W6yqsaDzjaM02E2KB9U6Gl7xSZqXHsQEkl489YL0K522dG5RqoUe6h1T3+Mc
 UUEsaW7gdOvcf7+gMy6USURlvD8zSZGhd9QvDW1Iex/CQe2d29jgLwCDGWUB3/OTuEtyZnmxxi2dM
 sOtl85zg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1mmvH0-0004do-4u; Tue, 16 Nov 2021 12:01:06 +0200
Subject: Re: [PATCH] drm/tegra: remove no need NULL check before kfree
To: Bernard Zhao <bernard@vivo.com>, Thierry Reding
 <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20211116015513.27147-1-bernard@vivo.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <053718d8-0436-97c2-694d-510415dfbc12@kapsi.fi>
Date: Tue, 16 Nov 2021 12:01:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211116015513.27147-1-bernard@vivo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/16/21 3:55 AM, Bernard Zhao wrote:
> This change is to cleanup the code a bit.
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>   drivers/gpu/drm/tegra/submit.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
> index 776f825df52f..c2fc9677742e 100644
> --- a/drivers/gpu/drm/tegra/submit.c
> +++ b/drivers/gpu/drm/tegra/submit.c
> @@ -608,12 +608,10 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
>   	if (job_data && job_data->used_mappings) {
>   		for (i = 0; i < job_data->num_used_mappings; i++)
>   			tegra_drm_mapping_put(job_data->used_mappings[i].mapping);
> -
> -		kfree(job_data->used_mappings);
>   	}
>   
> -	if (job_data)
> -		kfree(job_data);
> +	kfree(job_data->used_mappings);

Now if job_data == NULL, we dereference a NULL pointer here.

In general I'm not a fan of relying on kfree() etc. being a no-op on 
NULL pointers, since doing so gets rid of visual hints on code paths 
indicating the "liveness" of pointer variables.

However I'll let Thierry/other maintainers decide according to their 
preferences.

Thanks,
Mikko

> +	kfree(job_data);
>   put_bo:
>   	gather_bo_put(&bo->base);
>   unlock:
> 
