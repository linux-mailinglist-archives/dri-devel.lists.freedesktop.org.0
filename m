Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A072BFBE3
	for <lists+dri-devel@lfdr.de>; Sun, 22 Nov 2020 23:04:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861AA898EA;
	Sun, 22 Nov 2020 22:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6A8898EA
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 22:04:01 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 11E5D80567;
 Sun, 22 Nov 2020 23:04:00 +0100 (CET)
Date: Sun, 22 Nov 2020 23:03:58 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH 084/141] drm/via: Fix fall-through warnings for Clang
Message-ID: <20201122220358.GB566387@ravnborg.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <c21a588bf9e222826f6b138db91de26a2b21df33.1605896060.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c21a588bf9e222826f6b138db91de26a2b21df33.1605896060.git.gustavoars@kernel.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=iH7RfIX4AAAA:20 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8
 a=gTDArIOx2wuNTLb-19gA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 12:35:54PM -0600, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a break statement instead of letting the code fall
> through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks, also applied to drm-misc-next.

	Sam

> ---
>  drivers/gpu/drm/via/via_irq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/via/via_irq.c b/drivers/gpu/drm/via/via_irq.c
> index 24cc445169e2..a3e0fb5b8671 100644
> --- a/drivers/gpu/drm/via/via_irq.c
> +++ b/drivers/gpu/drm/via/via_irq.c
> @@ -364,6 +364,7 @@ int via_wait_irq(struct drm_device *dev, void *data, struct drm_file *file_priv)
>  		irqwait->request.sequence +=
>  			atomic_read(&cur_irq->irq_received);
>  		irqwait->request.type &= ~_DRM_VBLANK_RELATIVE;
> +		break;
>  	case VIA_IRQ_ABSOLUTE:
>  		break;
>  	default:
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
