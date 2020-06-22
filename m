Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B127220398F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 16:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CB16E0EB;
	Mon, 22 Jun 2020 14:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5926E0EB
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 14:31:35 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Mon, 22 Jun 2020 07:31:32 -0700
Received: from [0.0.0.0] (oddjob.vmware.com [10.253.4.32])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 77B8340489;
 Mon, 22 Jun 2020 07:31:31 -0700 (PDT)
Subject: Re: [PATCH] drm/vmwgfx: Use __drm_atomic_helper_crtc_reset
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
References: <20200612160056.2082681-6-daniel.vetter@ffwll.ch>
 <20200612204940.2134653-1-daniel.vetter@ffwll.ch>
From: Roland Scheidegger <sroland@vmware.com>
Message-ID: <0456635b-8f85-7b65-d643-2da7362961ea@vmware.com>
Date: Mon, 22 Jun 2020 16:31:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200612204940.2134653-1-daniel.vetter@ffwll.ch>
Content-Language: de-DE
Received-SPF: None (EX13-EDG-OU-002.vmware.com: sroland@vmware.com does not
 designate permitted sender hosts)
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks great to me.
Reviewed-by: Roland Scheidegger <sroland@vmware.com>

Am 12.06.20 um 22:49 schrieb Daniel Vetter:
> Now also comes with the added benefit of doing a drm_crtc_vblank_off(),
> which means vblank state isn't ill-defined and fail-y at driver load
> before the first modeset on each crtc.
> 
> v2: Compile fix. Oops.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> Cc: Roland Scheidegger <sroland@vmware.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 3c97654b5a43..bbce45d142aa 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -629,8 +629,7 @@ void vmw_du_crtc_reset(struct drm_crtc *crtc)
>  		return;
>  	}
>  
> -	crtc->state = &vcs->base;
> -	crtc->state->crtc = crtc;
> +	__drm_atomic_helper_crtc_reset(crtc, &vcs->base);
>  }
>  
>  
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
