Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C28F674023B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 19:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CF610E057;
	Tue, 27 Jun 2023 17:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8587C10E057
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 17:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=WOIqmxjaW3P+LlRmbZ49O1gHpta/KA6PE6kRYNWDh+s=;
 b=a6tzBkBpxC8oq97AbAMWaSxDW8p/GB0PXPcdPfcCqr4TyCgupz07swlh
 M4ZS8GYPv3YD9upAASVAz0Z1at37LZN0s9CWrpRFX8AXwOV1KrBWsRQ6S
 5f10tQA/a97SQQ3Aeo9XsLr0IBvZ6fucjbD+WCpS6199B5rHnOUtAgeoQ E=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,163,1684792800"; d="scan'208";a="59972556"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 19:33:28 +0200
Date: Tue, 27 Jun 2023 19:33:27 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 20/26] drm/vmwgfx: use array_size
In-Reply-To: <20230623211457.102544-21-Julia.Lawall@inria.fr>
Message-ID: <alpine.DEB.2.22.394.2306271932410.3150@hadrien>
References: <20230623211457.102544-1-Julia.Lawall@inria.fr>
 <20230623211457.102544-21-Julia.Lawall@inria.fr>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: keescook@chromium.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Fri, 23 Jun 2023, Julia Lawall wrote:

> Use array_size to protect against multiplication overflows.
>
> The changes were done using the following Coccinelle semantic patch:
>
> // <smpl>
> @@
>     size_t e1,e2;
>     expression COUNT;
>     identifier alloc = {vmalloc,vzalloc,kvmalloc,kvzalloc};
> @@
>
> (
>       alloc(
> -           (e1) * (e2)
> +           array_size(e1, e2)
>       ,...)
> |
>       alloc(
> -           (e1) * (COUNT)
> +           array_size(COUNT, e1)
>       ,...)
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c b/drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c
> index 829df395c2ed..c72fc8111a11 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c
> @@ -88,7 +88,7 @@ int vmw_devcaps_create(struct vmw_private *vmw)
>  	uint32_t i;
>
>  	if (gb_objects) {
> -		vmw->devcaps = vzalloc(sizeof(uint32_t) * SVGA3D_DEVCAP_MAX);
> +		vmw->devcaps = vzalloc(array_size(SVGA3D_DEVCAP_MAX, sizeof(uint32_t)));
>  		if (!vmw->devcaps)
>  			return -ENOMEM;
>  		for (i = 0; i < SVGA3D_DEVCAP_MAX; ++i) {

Hello,

I think this patch can be dropped, since it's a multiplication of two
constants and no overflow should be possible.

julia
