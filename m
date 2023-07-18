Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BCB7579EE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 12:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7219410E315;
	Tue, 18 Jul 2023 10:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08B510E1C3;
 Tue, 18 Jul 2023 10:58:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BCB70614FB;
 Tue, 18 Jul 2023 10:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626C4C433C8;
 Tue, 18 Jul 2023 10:58:09 +0000 (UTC)
Message-ID: <263b3c0f-53cf-14b6-b956-e0f5b03c95b5@xs4all.nl>
Date: Tue, 18 Jul 2023 12:58:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 11/18] media: Remove flag FBINFO_FLAG_DEFAULT from
 fbdev drivers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 javierm@redhat.com, geert@linux-m68k.org, dan.carpenter@linaro.org
References: <20230715185343.7193-1-tzimmermann@suse.de>
 <20230715185343.7193-12-tzimmermann@suse.de>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230715185343.7193-12-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, Andy Walls <awalls@md.metrocast.net>,
 kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 15/07/2023 20:51, Thomas Zimmermann wrote:
> The flag FBINFO_FLAG_DEFAULT is 0 and has no effect, as struct
> fbinfo.flags has been allocated to zero by kzalloc(). So do not
> set it.
> 
> Flags should signal differences from the default values. After cleaning
> up all occurrences of FBINFO_DEFAULT, the token will be removed.
> 
> v2:
> 	* fix commit message (Miguel)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andy Walls <awalls@md.metrocast.net>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Hans Verkuil <hverkuil@xs4all.nl>
> ---
>  drivers/media/pci/ivtv/ivtvfb.c              | 1 -
>  drivers/media/test-drivers/vivid/vivid-osd.c | 1 -
>  2 files changed, 2 deletions(-)

I can take this patches for 6.6, unless you prefer to have this whole series
merged in one go?

In that case you can use my:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> 
> diff --git a/drivers/media/pci/ivtv/ivtvfb.c b/drivers/media/pci/ivtv/ivtvfb.c
> index 0aeb9daaee4c..23c8c094e791 100644
> --- a/drivers/media/pci/ivtv/ivtvfb.c
> +++ b/drivers/media/pci/ivtv/ivtvfb.c
> @@ -1048,7 +1048,6 @@ static int ivtvfb_init_vidmode(struct ivtv *itv)
>  	/* Generate valid fb_info */
>  
>  	oi->ivtvfb_info.node = -1;
> -	oi->ivtvfb_info.flags = FBINFO_FLAG_DEFAULT;
>  	oi->ivtvfb_info.par = itv;
>  	oi->ivtvfb_info.var = oi->ivtvfb_defined;
>  	oi->ivtvfb_info.fix = oi->ivtvfb_fix;
> diff --git a/drivers/media/test-drivers/vivid/vivid-osd.c b/drivers/media/test-drivers/vivid/vivid-osd.c
> index ec25edc679b3..051f1805a16d 100644
> --- a/drivers/media/test-drivers/vivid/vivid-osd.c
> +++ b/drivers/media/test-drivers/vivid/vivid-osd.c
> @@ -310,7 +310,6 @@ static int vivid_fb_init_vidmode(struct vivid_dev *dev)
>  	/* Generate valid fb_info */
>  
>  	dev->fb_info.node = -1;
> -	dev->fb_info.flags = FBINFO_FLAG_DEFAULT;
>  	dev->fb_info.par = dev;
>  	dev->fb_info.var = dev->fb_defined;
>  	dev->fb_info.fix = dev->fb_fix;

