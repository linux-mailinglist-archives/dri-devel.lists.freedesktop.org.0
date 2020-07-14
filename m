Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C29021E501
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 03:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7410F6E198;
	Tue, 14 Jul 2020 01:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A446E198
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 01:16:15 +0000 (UTC)
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Mon, 13 Jul 2020 18:16:11 -0700
Received: from [0.0.0.0] (oddjob.vmware.com [10.253.4.32])
 by sc9-mailhost2.vmware.com (Postfix) with ESMTP id 71081B25ED;
 Mon, 13 Jul 2020 21:16:11 -0400 (EDT)
Subject: Re: [PATCH] drm/vmwgfx: Use correct vmw_legacy_display_unit pointer
To: Dan Carpenter <dan.carpenter@oracle.com>, VMware Graphics
 <linux-graphics-maintainer@vmware.com>
References: <20200626103437.GB314359@mwanda>
From: Roland Scheidegger <sroland@vmware.com>
Message-ID: <359c2028-7768-5a7b-b319-48da111d4f77@vmware.com>
Date: Tue, 14 Jul 2020 03:16:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200626103437.GB314359@mwanda>
Content-Language: de-DE
Received-SPF: None (EX13-EDG-OU-001.vmware.com: sroland@vmware.com does not
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
Cc: David Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for the delay, finally got time to look at this, seems all correct
to me, thanks. Applied to our vmvgfx-next tree. (I do wonder how this
somehow was supposed to work for all this time...)

Roland

Am 26.06.20 um 12:34 schrieb Dan Carpenter:
> The "entry" pointer is an offset from the list head and it doesn't
> point to a valid vmw_legacy_display_unit struct.  Presumably the
> intent was to point to the last entry.
> 
> Also the "i++" wasn't used so I have removed that as well.
> 
> Fixes: d7e1958dbe4a ("drm/vmwgfx: Support older hardware.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis.  Not tested.  This bug celebrated its tenth
> birthday last month.  :)
> 
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
> index 16dafff5cab1..009f1742bed5 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
> @@ -81,7 +81,7 @@ static int vmw_ldu_commit_list(struct vmw_private *dev_priv)
>  	struct vmw_legacy_display_unit *entry;
>  	struct drm_framebuffer *fb = NULL;
>  	struct drm_crtc *crtc = NULL;
> -	int i = 0;
> +	int i;
>  
>  	/* If there is no display topology the host just assumes
>  	 * that the guest will set the same layout as the host.
> @@ -92,12 +92,11 @@ static int vmw_ldu_commit_list(struct vmw_private *dev_priv)
>  			crtc = &entry->base.crtc;
>  			w = max(w, crtc->x + crtc->mode.hdisplay);
>  			h = max(h, crtc->y + crtc->mode.vdisplay);
> -			i++;
>  		}
>  
>  		if (crtc == NULL)
>  			return 0;
> -		fb = entry->base.crtc.primary->state->fb;
> +		fb = crtc->primary->state->fb;
>  
>  		return vmw_kms_write_svga(dev_priv, w, h, fb->pitches[0],
>  					  fb->format->cpp[0] * 8,
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
