Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE24140D795
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 12:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4436EB57;
	Thu, 16 Sep 2021 10:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A4F6EB58
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 10:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LHerWY/ZhQ6jFl/el4x8baC1Icz/JH5Yay+QD3Atfac=; b=IE7vmY/nbFS5rKzSYC4oMpmdZ6
 gLYxUCxypoVH0mG9zgbQqnmvRjdg+BiVGO7QP/LHEyWOe4VnEy4ZZCUeHJ+14oxHOTtrgSZyCNAQ5
 87m4lNKuxxDDtw/sLPuGGGyxHffbneT6++hq3Ih76ji6j3rf9H75EImMbTi/Cmj3rQ7cqWOAa5qpM
 XFQWk+6wBQ0FhBKcmjPfMm0bATwFktKorUAL94F3xWpBaLXj1DoaJ3Zx+7mjurprq+R2w9lMf+KY1
 boeWYK4U9XuzJbTTFp43Igo8yJ5s2RLz7tffejEJeqesz+aJqgYPNpfuyTB6X109PeBtTNFX4zita
 uac9TCZQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1mQoo1-0007M0-Ue; Thu, 16 Sep 2021 13:39:49 +0300
Subject: Re: [PATCH 3/6] drm/tegra: Implement buffer object cache
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210916094404.888267-1-thierry.reding@gmail.com>
 <20210916094404.888267-3-thierry.reding@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <741e628f-8ae2-6c73-2ca4-185659b18ccf@kapsi.fi>
Date: Thu, 16 Sep 2021 13:39:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210916094404.888267-3-thierry.reding@gmail.com>
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

On 9/16/21 12:44 PM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> ...
> diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
> index 794c400c38b1..66fe8717e747 100644
> --- a/drivers/gpu/drm/tegra/uapi.c
> +++ b/drivers/gpu/drm/tegra/uapi.c
> @@ -201,7 +201,8 @@ int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data, struct drm_f
>   		goto put_gem;
>   	}
>   
> -	mapping->map = host1x_bo_pin(context->client->base.dev, mapping->bo, direction);
> +	mapping->map = host1x_bo_pin(context->client->base.dev, mapping->bo, direction,
> +				     &context->client->base.cache);

Do we need caching here? The map/unmap operation is explicit and should 
not be on the hot path, and this will complicate context isolation 
support where we cannot have an engine-specific cache.

Mikko
