Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA01C9880
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 19:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94CC6EA49;
	Thu,  7 May 2020 17:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD476EA49
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 17:58:53 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 931A580511;
 Thu,  7 May 2020 19:58:50 +0200 (CEST)
Date: Thu, 7 May 2020 19:58:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 02/36] drm/gem: use _unlocked reference in
 drm_gem_objects_lookup docs
Message-ID: <20200507175849.GA13247@ravnborg.org>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-3-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507150822.114464-3-emil.l.velikov@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8 a=e5mUnYsNAAAA:8
 a=n8BLXHv2dJ3HLnBGmvEA:9 a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil.

On Thu, May 07, 2020 at 04:07:48PM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> Use the drm_gem_object_put_unlocked in the documentation for
> drm_gem_objects_lookup. The locked version of the helper should be used
> solely by people who know exactly what they are doing.
> 
> Should prevent issues like ones adddressed with the next patch.
> 
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 7bf628e13023..918d1ba25f63 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -690,7 +690,7 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
>   * Returns:
>   *
>   * @objs filled in with GEM object pointers. Returned GEM objects need to be
> - * released with drm_gem_object_put(). -ENOENT is returned on a lookup
> + * released with drm_gem_object_put_unlocked(). -ENOENT is returned on a lookup
>   * failure. 0 is returned on success.
>   *
>   */

This change seems pointless as you go ahead and drop the _unlocked
suffix a few patches later.

	Sam

> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
