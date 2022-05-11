Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A374523B0A
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 19:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBAC112118;
	Wed, 11 May 2022 17:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A6A112118
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 17:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=CthhuaoXqbko6XshXK+xcu1gXO9c1mU6sdAFETgYJ8A=;
 b=qgnd50kXwQ5+SvNZ/1DmyHrbIjfVttYuUqdExe7VezKD6EW2utqdLl8CxI7LRgETGFCrY/w/qpcE4
 vcBCGIRq4YkCkZj4vODXOpydPykFlQLg2Yd+FRk76aR54rCNoGhmlnWYQefY9r57KMMmXNBZy1tLB1
 CJpXkraAUpUWRu3jchdxDeptn1bRvyAC85JxRQ7vrxKX9EOc/PoLsy6JekjRFyUpzBEKQ6SE6h3mmO
 Ok/tduP2T/9AhMjpzQp0zAay8A4106fVkGf6drF4gUI5Kll+rLphZeKcNDUnHgeRhL2pUcn2BklfCD
 fO0jybTLHKfvMQtSvX4MpPxsAAvMiug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=CthhuaoXqbko6XshXK+xcu1gXO9c1mU6sdAFETgYJ8A=;
 b=DcNFrpcOaBXAFCMtuWqzqZ5wO4r1XoPdsezcW3M7H7vfhOekJ4jGAYV+TIlsu6PFrkm057Lg0B+Xx
 Qgu9cFLDw==
X-HalOne-Cookie: 81577a4a9f2127a7356dca5ca047496006afae08
X-HalOne-ID: eb69835a-d14b-11ec-be6b-d0431ea8bb03
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id eb69835a-d14b-11ec-be6b-d0431ea8bb03;
 Wed, 11 May 2022 17:00:55 +0000 (UTC)
Date: Wed, 11 May 2022 19:00:52 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v5 7/7] fbdev: Make registered_fb[] private to fbmem.c
Message-ID: <YnvrxICnisXU6I1y@ravnborg.org>
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511113230.1252910-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511113230.1252910-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 kernel test robot <lkp@intel.com>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Jens Frederich <jfrederich@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Matthew Wilcox <willy@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Nettleton <jon.nettleton@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier.

On Wed, May 11, 2022 at 01:32:30PM +0200, Javier Martinez Canillas wrote:
> From: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Well except when the olpc dcon fbdev driver is enabled, that thing
> digs around in there in rather unfixable ways.
> 
> Cc oldc_dcon maintainers as fyi.

Another way to fix this is to mark FB_OLPC_DCON and add a TODO entry to
fix this. We are really not supposed to carry such special code around
to keep staging working.

I know this may not be a popular viewpoint, but just look at the ugly
workarounds required here.

	Sam


> 
> v2: I typoed the config name (0day)
> 
> Cc: kernel test robot <lkp@intel.com>
> Cc: Jens Frederich <jfrederich@gmail.com>
> Cc: Jon Nettleton <jon.nettleton@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-staging@lists.linux.dev
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
> Cc: Zhen Lei <thunder.leizhen@huawei.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Cc: linux-fbdev@vger.kernel.org
> Cc: Zheyu Ma <zheyuma97@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/video/fbdev/core/fbmem.c | 8 ++++++--
>  include/linux/fb.h               | 7 +++----
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 265efa189bcc..6cab5f4c1fb3 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -50,10 +50,14 @@
>  static DEFINE_MUTEX(registration_lock);
>  
>  struct fb_info *registered_fb[FB_MAX] __read_mostly;
> -EXPORT_SYMBOL(registered_fb);
> -
>  int num_registered_fb __read_mostly;
> +#if IS_ENABLED(CONFIG_FB_OLPC_DCON)
> +EXPORT_SYMBOL(registered_fb);
>  EXPORT_SYMBOL(num_registered_fb);
> +#endif

It is stuff like this I refer to as "ugly" in the comment above.

	Sam
