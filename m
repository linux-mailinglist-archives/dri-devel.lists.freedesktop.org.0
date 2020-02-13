Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C963515D377
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03E76EB4F;
	Fri, 14 Feb 2020 08:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3DE6E2ED
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 13:38:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id AEB7029520D
Subject: Re: [PATCH] drm/mediatek: Update the fb property
 mtk_plane_atomic_async_update
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
References: <20200213120103.823501-1-enric.balletbo@collabora.com>
Message-ID: <7cd36a53-30d9-7efb-4864-78f994268f1b@collabora.com>
Date: Thu, 13 Feb 2020 14:38:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200213120103.823501-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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
Cc: drinkcat@chromium.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 13/2/20 13:01, Enric Balletbo i Serra wrote:
> Commit 920fffcc8912 ("drm/mediatek: update cursors by using async atomic
> update") added support to async updates of cursors by using the new atomic
> interface for that. Unfortunately, introduced two issues. The first one is
> that since then, the drm_atomic_helper_async_commit triggers a WARNING due
> current fb is not the new fb. The second one, is that we get a black screen
> connecting the external display on Elm device and another WARNING due vblank
> wait timed out.
> 
> Swap the fb in mtk_plane_atomic_async_update to fix both issues.
> 
> Fixes: 920fffcc8912 ("drm/mediatek: update cursors by using async atomic update")
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---

I just noticed this, which should fix the problem too, so you can ignore this patch.

https://patchwork.kernel.org/patch/11379571/

> 
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index 914cc7619cd7..7eb10115e72a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -116,6 +116,7 @@ static void mtk_plane_atomic_async_update(struct drm_plane *plane,
>  	plane->state->src_h = new_state->src_h;
>  	plane->state->src_w = new_state->src_w;
>  	state->pending.async_dirty = true;
> +	swap(plane->state->fb, new_state->fb);
>  
>  	mtk_drm_crtc_async_update(new_state->crtc, plane, new_state);
>  }
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
