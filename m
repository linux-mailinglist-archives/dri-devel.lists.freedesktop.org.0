Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 301E7218E25
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 19:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD686E8FD;
	Wed,  8 Jul 2020 17:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663FB6E8FD
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:20:42 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7A99980528;
 Wed,  8 Jul 2020 19:20:40 +0200 (CEST)
Date: Wed, 8 Jul 2020 19:20:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/6] drm/ast: Use managed VRAM-helper initialization
Message-ID: <20200708172039.GB121132@ravnborg.org>
References: <20200708074912.25422-1-tzimmermann@suse.de>
 <20200708074912.25422-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708074912.25422-4-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=WSmEbT3tZrykCLaYO20A:9 a=CjuIK1q_8ugA:10
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
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 08, 2020 at 09:49:09AM +0200, Thomas Zimmermann wrote:
> As a first step to managed MM code in ast, switch over VRAM MM helpers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/ast/ast_mm.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
> index 9c3788a4c1c5..c0bbcfed9c43 100644
> --- a/drivers/gpu/drm/ast/ast_mm.c
> +++ b/drivers/gpu/drm/ast/ast_mm.c
> @@ -39,9 +39,8 @@ int ast_mm_init(struct ast_private *ast)
>  	int ret;
>  	struct drm_device *dev = ast->dev;
>  
> -	vmm = drm_vram_helper_alloc_mm(
> -		dev, pci_resource_start(dev->pdev, 0),
> -		ast->vram_size);
> +	vmm = drmm_vram_helper_alloc_mm(dev, pci_resource_start(dev->pdev, 0),
> +					ast->vram_size);
>  	if (IS_ERR(vmm)) {
>  		ret = PTR_ERR(vmm);
>  		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);

This would be a little simpler if drmm_vram_helper_alloc_mm() return an
int error code as suggested in previous patch.

	Sam

> @@ -60,8 +59,6 @@ void ast_mm_fini(struct ast_private *ast)
>  {
>  	struct drm_device *dev = ast->dev;
>  
> -	drm_vram_helper_release_mm(dev);
> -
>  	arch_phys_wc_del(ast->fb_mtrr);
>  	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
>  				pci_resource_len(dev->pdev, 0));
> -- 
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
