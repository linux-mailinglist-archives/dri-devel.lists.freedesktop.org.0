Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFDD56B51F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37B11131AC;
	Fri,  8 Jul 2022 09:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2104 seconds by postgrey-1.36 at gabe;
 Fri, 08 Jul 2022 09:09:36 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006F51131AC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ixFXV+1Qd2iJruE4p7B4EgS2FeqpAuYVVZqEbaMEXRg=; b=M1z8RFrv3wFxAs4w7HTugkhoLr
 S76u1qClQ+NphECxpbgHLG4vYIYkJyS8a5YasaQqP+7VkUhYcp6RNFicg7QS5y52pfppDsSIezYye
 HXGNLI2Xt8vMONKFa0Z6gd2mzUyW9dqx8QabAJ1omH7XNz7sOeUnWeEsqomQELifnMI5W2vNkWRR1
 wmJB5AXGJxyUGFnTDjuIShnkXgVL1x2Dy6x9DenFzR8979g8zWV1tsgBlzs44fUBYwyxm5oW+aMfS
 qSlmXeAYDBhvlVYzLMN4eX9kLE7UiVU5VzlDiCKT/BpmUFti+tmNHBxZUUACo5QC8V5dErLbmwZcg
 8f9wCR7g==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10]) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1o9jR2-008aYH-P7; Fri, 08 Jul 2022 11:33:59 +0300
Message-ID: <14151873-8334-7a97-63c2-01cf700a95bd@kapsi.fi>
Date: Fri, 8 Jul 2022 11:33:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] gpu: host1x: Register context bus unconditionally
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, thierry.reding@gmail.com,
 mperttunen@nvidia.com
References: <503bffe670b24aac0dfb03c8fc16437b8f0cca58.1657215044.git.robin.murphy@arm.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <503bffe670b24aac0dfb03c8fc16437b8f0cca58.1657215044.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
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
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/7/22 20:30, Robin Murphy wrote:
> Conditional registration is a problem for other subsystems which may
> unwittingly try to interact with host1x_context_device_bus_type in an
> uninitialised state on non-Tegra platforms. A look under /sys/bus on a
> typical system already reveals plenty of entries from enabled but
> otherwise irrelevant configs, so lets keep things simple and register
> our context bus unconditionally too.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>   drivers/gpu/host1x/context_bus.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/context_bus.c b/drivers/gpu/host1x/context_bus.c
> index b0d35b2bbe89..d9421179d7b4 100644
> --- a/drivers/gpu/host1x/context_bus.c
> +++ b/drivers/gpu/host1x/context_bus.c
> @@ -15,11 +15,6 @@ static int __init host1x_context_device_bus_init(void)
>   {
>   	int err;
>   
> -	if (!of_machine_is_compatible("nvidia,tegra186") &&
> -	    !of_machine_is_compatible("nvidia,tegra194") &&
> -	    !of_machine_is_compatible("nvidia,tegra234"))
> -		return 0;
> -
>   	err = bus_register(&host1x_context_device_bus_type);
>   	if (err < 0) {
>   		pr_err("bus type registration failed: %d\n", err);

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

Cheers,
Mikko
