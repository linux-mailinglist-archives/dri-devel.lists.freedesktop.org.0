Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA0FB8A0FA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 16:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D64710E240;
	Fri, 19 Sep 2025 14:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Mwoz1b9m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B2C10E240
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mvgSoHMutbFl2FMbCN07B63A7O4JE+nasJF1jfRf8+k=; b=Mwoz1b9m5QxB4Mk9+ugFEdhPEj
 0x9qzkpK+MN8gItD93GhG4XFqNTdXqdWO5coTTlyi2eZrZ3UVIBim5xP00GhYZsQuOuHbXuD0x+GI
 iQKx70+LgGb3W3oRbzSPqfq+xx6aeCjP831cngv/2QXqvfSeoDsjnMFOiNbE/z9gRzQUSEWdStcTh
 w/2CQ6BDHBJohPhCmoz0u78whjhEps3Q+xrqBK2XeadrLtT8ss8R7IMr/2+Ds1XNqWrPPtrcHZrdC
 pAVtWr8okFOCJlZWk3CTRPga6On9NpH+tazLplDPAJ2Im35jWHk0Km76eGknTHEGPxmLMA7lsd1It
 ze/2gaEg==;
Received: from 179-125-87-227-dinamico.pombonet.net.br ([179.125.87.227]
 helo=quatroqueijos.cascardo.eti.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uzcNs-00E8AE-9u; Fri, 19 Sep 2025 16:46:48 +0200
Date: Fri, 19 Sep 2025 11:46:43 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH 1/4] drm/ttm: Make ttm_bo_init_validate safe against
 ttm_operation_ctx re-ordering
Message-ID: <aM1s01r5qfv6FdUr@quatroqueijos.cascardo.eti.br>
References: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
 <20250919131530.91247-2-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919131530.91247-2-tvrtko.ursulin@igalia.com>
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

On Fri, Sep 19, 2025 at 02:15:27PM +0100, Tvrtko Ursulin wrote:
> Struct ttm_operation_ctx initializer in ttm_bo_init_validate assumes the
> order of the structure fields when it is configuring the interruptible
> flag.
> 
> Fix it by using named initialization.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 29423ceeec5c..e5f5d4aa5a47 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1024,7 +1024,7 @@ int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
>  			 struct sg_table *sg, struct dma_resv *resv,
>  			 void (*destroy) (struct ttm_buffer_object *))
>  {
> -	struct ttm_operation_ctx ctx = { interruptible, false };
> +	struct ttm_operation_ctx ctx = { .interruptible = interruptible };
>  	int ret;
>  
>  	ret = ttm_bo_init_reserved(bdev, bo, type, placement, alignment, &ctx,
> -- 
> 2.48.0
> 

Acked-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
