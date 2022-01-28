Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F93849F716
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 11:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D1010F1B8;
	Fri, 28 Jan 2022 10:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67FB10F1C0;
 Fri, 28 Jan 2022 10:18:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4BE72B82521;
 Fri, 28 Jan 2022 10:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5372EC340F4;
 Fri, 28 Jan 2022 10:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643365095;
 bh=K+Wnlf3fVErqV3HKWur25sPL5zJVCNS2YRoj6ofC3uU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2K5AAwMpNEB5WSDMIfE4CWnPMvSJM5Foa4dg6bQ2yBYvplO2/IPP6S3HMSzZK9cZQ
 fMqu/bVGPnH+1QVlxTGjbvhoZwAXxlwwUWhExKHC01M0hNV9GORJByqLt6mzzeVE9D
 NeJA0kga7NahzZmXXN5A/bnqTvhiYJSVeA/Dyu9I=
Date: Fri, 28 Jan 2022 11:18:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhou Qingyang <zhou1615@umn.edu>
Subject: Re: [PATCH] drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()
Message-ID: <YfPC3N+H9Fu/gqpz@kroah.com>
References: <20220124165856.57022-1-zhou1615@umn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124165856.57022-1-zhou1615@umn.edu>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 25, 2022 at 12:58:55AM +0800, Zhou Qingyang wrote:
> In nvkm_acr_hsfw_load_bl(), the return value of kmalloc() is directly
> passed to memcpy(), which could lead to undefined behavior on failure
> of kmalloc().
> 
> Fix this bug by using kmemdup() instead of kmalloc()+memcpy().
> 
> This bug was found by a static analyzer.
> 
> Builds with 'make allyesconfig' show no new warnings,
> and our static analyzer no longer warns about this code.
> 
> Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace "secure boot"")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
> The analysis employs differential checking to identify inconsistent 
> security operations (e.g., checks or kfrees) between two code paths 
> and confirms that the inconsistent operations are not recovered in the
> current function or the callers, so they constitute bugs. 
> 
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
> 
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> index 667fa016496e..a6ea89a5d51a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> @@ -142,11 +142,12 @@ nvkm_acr_hsfw_load_bl(struct nvkm_acr *acr, const char *name, int ver,
>  
>  	hsfw->imem_size = desc->code_size;
>  	hsfw->imem_tag = desc->start_tag;
> -	hsfw->imem = kmalloc(desc->code_size, GFP_KERNEL);
> -	memcpy(hsfw->imem, data + desc->code_off, desc->code_size);
> -
> +	hsfw->imem = kmemdup(data + desc->code_off, desc->code_size, GFP_KERNEL);
>  	nvkm_firmware_put(fw);
> -	return 0;
> +	if (!hsfw->imem)
> +		return -ENOMEM;
> +	else
> +		return 0;
>  }
>  
>  int
> -- 
> 2.25.1
> 

As stated before, umn.edu is still not allowed to contribute to the
Linux kernel.  Please work with your administration to resolve this
issue.

