Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE901968AC
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 19:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697EA6E153;
	Sat, 28 Mar 2020 18:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A848F6E153
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 18:49:46 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id BB8F480518;
 Sat, 28 Mar 2020 19:49:43 +0100 (CET)
Date: Sat, 28 Mar 2020 19:49:42 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/managed: Fix off-by-one in warning
Message-ID: <20200328184942.GA28087@ravnborg.org>
References: <20200328162358.18500-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200328162358.18500-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=7gkXJVJtAAAA:8 a=yPCof4ZbAAAA:8 a=P1BnusSwAAAA:8 a=IpJZQVW2AAAA:8
 a=ag1SF4gXAAAA:8 a=VwQbUJbxAAAA:8 a=bKRcGsDcNYQy4q6Rx_4A:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=D0XLA9XvdZm18NrgonBM:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: kernel test robot <lkp@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Sat, Mar 28, 2020 at 05:23:58PM +0100, Daniel Vetter wrote:
> I'm thinking this is the warning that fired in the 0day report, but I
> can't double-check yet since 0day didn't upload its source tree
> anywhere I can check. And all the drivers I can easily test don't use
> drm_dev_alloc anymore ...
> 
> Also if I'm correct supreme amounts of bad luck because usually kslap
> (for bigger structures) gives us something quite a bit bigger than
> what we asked for.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: c6603c740e0e ("drm: add managed resources tied to drm_device")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_managed.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index 4955241ceb4c..9cebfe370a65 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -139,8 +139,7 @@ void drmm_add_final_kfree(struct drm_device *dev, void *container)
>  {
>  	WARN_ON(dev->managed.final_kfree);
>  	WARN_ON(dev < (struct drm_device *) container);
> -	WARN_ON(dev + 1 >=
> -		(struct drm_device *) (container + ksize(container)));
> +	WARN_ON(dev + 1 > (struct drm_device *) (container + ksize(container)));

I do not think this is the right fix...
The original code would trigger if
1) the container only had a drm_device - and nothing else
2) and the allocated size was the same

And the modification will now allow for a container with the exact size
of drm_device.

I checked all users in my tree - no-one only had a drm_device.
The minimum was one extra pointer.

Another thing that could trigger the warning was if any users
did not specify a pointer to memory allocated by k(z)alloc()
But I could not find any.

tiny/st7735r.c looked suspisius, but I think it is also OK,
because struct st7735r_priv is allocated, but the poitner specified in
st7735r_priv.dbidev. But dbidev is the first field - so OK.

So no better clue...

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
