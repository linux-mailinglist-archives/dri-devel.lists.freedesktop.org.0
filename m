Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909D940A529
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 06:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF18F6E3B7;
	Tue, 14 Sep 2021 04:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DB76E3B7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 04:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=kkVnv6BuGX82Yh9Od+36FMPLZ2st+Pigxo8qEI4xegw=; b=B/+snexSizUZY+3Xpfrz8dHjjK
 mQn+1RQcpDlZlh99+n35Cy6Uc/KhRt0ncLcjnn5FyQabcc4DWQfeIOeaM6loQOYoZd4o+bvfUKqn3
 BjG3aqAkRIkhcEWKDQz1Q9dwtZaUKeuNtrWsVkDhjWfdUw7S/i17vDh8B0wGywuDh17ePhrbsQIrZ
 OoaeOr5vKvr6hWSzHjpNpr61Awj0wSY6FTkE19t/lpUHR02+766HDtTGV3GRnO+pXpZ8rV3PY3rFY
 C/KxKdgOySM/DchDRyxBP8A8V/u9vAZmUluK57U2eI8cwzIxvpBRMDPLhxGLOsuiyDaf6r2oRjUDb
 R76AktDw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPzqz-0049pw-Pq; Tue, 14 Sep 2021 04:15:29 +0000
Subject: Re: [PATCH] drm/rockchip: cdn-dp-core: Fix cdn_dp_resume unused
 warning
To: Palmer Dabbelt <palmer@dabbelt.com>, heiko@sntech.de
Cc: hjc@rock-chips.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>
References: <20210115074043.2944-1-palmer@dabbelt.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <36ff9f69-2c77-90ca-e2b5-f237f94a95a0@infradead.org>
Date: Mon, 13 Sep 2021 21:15:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210115074043.2944-1-palmer@dabbelt.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/14/21 11:40 PM, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> cdn_dp_resume is only used under PM_SLEEP, and now that it's static an
> unused function warning is triggered undner !PM_SLEEP.  This
> conditionally enables the function to avoid the warning.
> 
> Fixes: 7c49abb4c2f8 ("drm/rockchip: cdn-dp-core: Make cdn_dp_core_suspend/resume static")
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>   drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> index a4a45daf93f2..063a60d213ba 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> @@ -1121,6 +1121,7 @@ static int cdn_dp_suspend(struct device *dev)
>   	return ret;
>   }
>   
> +#ifdef CONFIG_PM_SLEEP
>   static int cdn_dp_resume(struct device *dev)
>   {
>   	struct cdn_dp_device *dp = dev_get_drvdata(dev);
> @@ -1133,6 +1134,7 @@ static int cdn_dp_resume(struct device *dev)
>   
>   	return 0;
>   }
> +#endif
>   
>   static int cdn_dp_probe(struct platform_device *pdev)
>   {
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


Is someone going to merge this patch from January?

thanks.
-- 
~Randy
