Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F62A438755
	for <lists+dri-devel@lfdr.de>; Sun, 24 Oct 2021 10:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6226E0FC;
	Sun, 24 Oct 2021 08:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82316E0FC
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 08:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fwJDIpeHcoTCjW6d/WqsB8/Thoo6o3AVkcfg+s98K0I=; b=qehNJuPVO9T/ZFjxGZ8o0QEU7g
 SUqvQak6gweJzXhpOH25ANz86m7hjBj9YiBeupYHPY8ns9hKV6fkmqYlxtQotrx0MoFEwYPU0bKBM
 oN1lzdHLNYuuPdAQnyJUaleZM4aUqb8Ef+Azn9F388Q9Eg/iZUiKOkV1HgnWa05yMfqnrHOjTX69r
 KLhvaUxHOSzuA/S1TB7N+pqUI9nyiE0brWZC5bo0sqdGZxHfLXuYdbleH9ZVq11T8mFlb7yVvhDN0
 h8Ktf9+/tXJoM2whsU8hFEYwMKhLCu2AKcjRK9o6EHZ7eyf/LBEjUSJxrijxXcbYKosnBoylPY0Gh
 i5lNMmEw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56181
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1meYof-0005AL-35; Sun, 24 Oct 2021 10:25:17 +0200
Subject: Re: [PATCH 1/9] drm/format-helper: Export drm_fb_clip_offset()
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org
References: <20211022132829.7697-1-tzimmermann@suse.de>
 <20211022132829.7697-2-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <6ed5fba0-72d5-7fb8-338c-230bf69e2c03@tronnes.org>
Date: Sun, 24 Oct 2021 10:25:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211022132829.7697-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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



Den 22.10.2021 15.28, skrev Thomas Zimmermann:
> Provide a function that computes the offset into a blit destination
> buffer. This will allow to move destination-buffer clipping into the
> format-helper callers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 10 ++++++++--
>  include/drm/drm_format_helper.h     |  4 ++++
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 69fde60e36b3..28e9d0d89270 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -17,12 +17,18 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_rect.h>
>  
> -static unsigned int clip_offset(struct drm_rect *clip,
> -				unsigned int pitch, unsigned int cpp)
> +static unsigned int clip_offset(const struct drm_rect *clip, unsigned int pitch, unsigned int cpp)
>  {
>  	return clip->y1 * pitch + clip->x1 * cpp;
>  }
>  
> +unsigned long drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info *format,

Like Sam I wonder about the unsigned long here.

Noralf.

> +				 const struct drm_rect *clip)
> +{
> +	return clip_offset(clip, pitch, format->cpp[0]);
> +}
> +EXPORT_SYMBOL(drm_fb_clip_offset);
> +

