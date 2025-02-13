Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D4EA34AB6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3448D10EB38;
	Thu, 13 Feb 2025 16:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="D4jdYieB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 359 seconds by postgrey-1.36 at gabe;
 Thu, 13 Feb 2025 16:51:16 UTC
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397CA10EB38
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:51:16 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 28C78600022F;
 Thu, 13 Feb 2025 16:45:14 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id D_X-8oSLhMw0; Thu, 13 Feb 2025 16:45:11 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id CB87E60020DD;
 Thu, 13 Feb 2025 16:45:10 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail; t=1739465111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//D+0qXwv5Gm0YeDVVYXQrXCtiWyh/Qcg6tCR6GBt/s=;
 b=D4jdYieBlgGj0cdGpUzvaClL8gP/IjGHUNP1odAglnuYitwG8ZtYOd6oMKsnKxq6yXH+Xk
 VG7X9GbHmY3Z6SAkLpu9IZZzr3GPKZlgkG/vZo50cTCx3qZgFy1dsf1cW8iN1ylxwfFvQd
 Ut9Vvt19KWCaK1kuYlb9o+GzcxVWEis=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown
 [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id A77A6360259;
 Thu, 13 Feb 2025 16:45:09 +0000 (WET)
Message-ID: <a77768b7-b4f5-47b1-8134-ca7e2bf5660b@tecnico.ulisboa.pt>
Date: Thu, 13 Feb 2025 16:45:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rc] gpu: host1x: Do not assume that a NULL domain means no
 DMA IOMMU
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <jroedel@suse.de>,
 Jerry Snitselaar <jsnitsel@redhat.com>, patches@lists.linux.dev
References: <0-v1-10dcc8ce3869+3a7-host1x_identity_jgg@nvidia.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <0-v1-10dcc8ce3869+3a7-host1x_identity_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi all,

On 2/4/25 7:18 PM, Jason Gunthorpe wrote:
> Previously with tegra-smmu, even with CONFIG_IOMMU_DMA, the default domain
> could have been left as NULL. The NULL domain is specially recognized by
> host1x_iommu_attach() as meaning it is not the DMA domain and
> should be replaced with the special shared domain.
> 
> This happened prior to the below commit because tegra-smmu was using the
> NULL domain to mean IDENTITY.
> 
> Now that the domain is properly labled the test in DRM doesn't see NULL.
> Check for IDENTITY as well to enable the special domains.
> 
> This is the same issue and basic fix as seen in
> commit fae6e669cdc5 ("drm/tegra: Do not assume that a NULL domain means no
> DMA IOMMU").
> 
> Fixes: c8cc2655cc6c ("iommu/tegra-smmu: Implement an IDENTITY domain")
> Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Closes: https://lore.kernel.org/all/c6a6f114-3acd-4d56-a13b-b88978e927dc@tecnico.ulisboa.pt/
> Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/gpu/host1x/dev.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index 7b1d091f3c090c..5d27662019d28b 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -361,6 +361,10 @@ static bool host1x_wants_iommu(struct host1x *host1x)
>   	return true;
>   }
>   
> +/*
> + * Returns ERR_PTR on failure, NULL if the translation is IDENTITY, otherwise a
> + * valid paging domain.
> + */
>   static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
>   {
>   	struct iommu_domain *domain = iommu_get_domain_for_dev(host->dev);
> @@ -385,6 +389,8 @@ static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
>   	 * Similarly, if host1x is already attached to an IOMMU (via the DMA
>   	 * API), don't try to attach again.
>   	 */
> +	if (domain && domain->type == IOMMU_DOMAIN_IDENTITY)
> +		domain = NULL;
>   	if (!host1x_wants_iommu(host) || domain)
>   		return domain;
>   
> 
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b

Any updates on the status of this patch?

Thanks,
Diogo
