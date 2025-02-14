Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42D7A35E4E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 14:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A554A10E492;
	Fri, 14 Feb 2025 13:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cJit1wiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3FC10E33A;
 Fri, 14 Feb 2025 13:05:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7C96DA42A50;
 Fri, 14 Feb 2025 13:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F21C4CED1;
 Fri, 14 Feb 2025 13:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739538335;
 bh=/ZYi30Kqhec6sI50rp5karwtCSQKZsO3cRynCmtVBPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cJit1wiQdtUEi6Y+oJwzRcYtOmuBFe84LqN26AtuWh+zhqbWsH2H9Mm3OUodU7rnu
 OsYvAxB4z8aMwU3hu1pi5Rbno7ukKSxfQpYj0aWm/Bd9k4HpX5Y431f4o23IibT8Kr
 JIX40X1JSQg3ZSakpkOx3YkBRQsybJrwiKdjYYnR1hvCf4bNnA8XDmw2peDVuQMJmv
 0KLYY4Qq+4XkdsOwFMhvV5DliEy6finX2KMX3JlvrwPD6L5wkIjLojgJcifZ78hrRP
 PglUQQq+7oDWT2uEvF2K8+wjXGQepO54dFYkT/cmMd6yhF8o3xI5x7F1jhKIz6Til7
 7lAtxJWjdy2Eg==
Date: Fri, 14 Feb 2025 14:05:31 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>
Subject: Re: [PATCH] drm/nouveau: select FW caching
Message-ID: <Z68_m1iHYN_7a_hH@cassiopeiae>
References: <20250207012531.621369-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207012531.621369-1-airlied@gmail.com>
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

(+ Luis, Russ)

On Fri, Feb 07, 2025 at 11:25:31AM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> nouveau tries to load some firmware during suspend that it loaded earlier, but with
> fw caching disabled it hangs suspend, so just rely on FW cache enabling instead of
> working around it in the driver.
> 
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
> index ce840300578d8..1050a4617fc15 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -4,6 +4,7 @@ config DRM_NOUVEAU
>  	depends on DRM && PCI && MMU
>  	select IOMMU_API
>  	select FW_LOADER
> +	select FW_CACHE if PM_SLEEP

CONFIG_FW_CACHE was added, as the Kconfig says, it "can prevent suspend on many
platforms".

@Luis, Russ: I assume this mostly means embedded platforms?

I wonder if we should not insist on FW_CACHE if NOUVEAU_PLATFORM_DRIVER, or even
only force FW_CACHE if DRM_NOUVEAU_GSP_DEFAULT?
