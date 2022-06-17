Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F1954F797
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 14:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E20011AF83;
	Fri, 17 Jun 2022 12:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB3011AF40
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 12:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655468975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAIIq/q8RghQVhSS6ZIK4fU5ZM18LuuQ8XAZ51sXCt4=;
 b=Zhr4unRynuTXlhVFr4GxIPFwO3mLC3RCw67J66IREaJrPUVk1JCryAI3S7RvGv6XPI3ZHA
 TQ0c7Y2vsbKlkyW5t87LLP1fp+4v45K0MNUo4We4AR4Vcgf1KeevrCvN4dzikOJfVfVc+Y
 ypOqM3F16t7oL0lkLpavjEW/STfOsKY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-jIi2Dy53OX62Hd8ajome2w-1; Fri, 17 Jun 2022 08:29:32 -0400
X-MC-Unique: jIi2Dy53OX62Hd8ajome2w-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay28-20020a05600c1e1c00b0039c5cbe76c1so2663338wmb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 05:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dAIIq/q8RghQVhSS6ZIK4fU5ZM18LuuQ8XAZ51sXCt4=;
 b=T7f+Pc5UNBZuTC+86Xs/SR5CpXBlZwlK6nvu9eV7aqGDAmvU9ixNgoAkgmOrKvV0OZ
 LEHNH3/GQM16egi1WK/3eQHN1EA/xkpKEqRLIJ4/avLNJxIKDdTA5HNswJyz7iEt8wc7
 g85V+kkopq9QZ551C//NaM2kKJX1FwnmzCm1dFYj1VJYDabmUwM4/VXzUs7RIjsUjKkM
 SykXO4nb7E3kkV2xUNSDWcL9qkR/tg3fp7pr1kJWvLwn0KwkvBIWGbF4CyEhxSV5AMQ7
 xIh3QOYcDihANLr9SLqAKSq4ADgZZlPPXnbE6/uutc5xKZ/pLJxI67jws1EUQTcGeKx6
 5a/w==
X-Gm-Message-State: AJIora+UNoLjKYFNeurDuDw0/drpEKVAdaNj2MQnGLFU6jEdjKqt8Jmt
 2KAiUVAajeKSmROSZ/WLjQm6RaeNpgIxPNKhU8ioLiLvaspynM+LbS9CFxpqXQ3yAg7nrFZ84zk
 P9iFt6CRAEi0C4KXxmTO7IN/cALHv
X-Received: by 2002:a5d:644d:0:b0:210:2f75:25f8 with SMTP id
 d13-20020a5d644d000000b002102f7525f8mr8947543wrw.394.1655468970653; 
 Fri, 17 Jun 2022 05:29:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sCiOLRDdkF5inpgP31fcCFconB8+5DRhPGMkFhvOx72lTtZGoaa7xGzXFazCNqqwe1+FBXgg==
X-Received: by 2002:a5d:644d:0:b0:210:2f75:25f8 with SMTP id
 d13-20020a5d644d000000b002102f7525f8mr8947516wrw.394.1655468970283; 
 Fri, 17 Jun 2022 05:29:30 -0700 (PDT)
Received: from [172.20.10.7] ([84.78.249.164])
 by smtp.gmail.com with ESMTPSA id
 d8-20020adfc088000000b00213ba0cab3asm4566648wrf.44.2022.06.17.05.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 05:29:29 -0700 (PDT)
Message-ID: <47b627e1-5c87-f092-3ce8-a078898d0eb2@redhat.com>
Date: Fri, 17 Jun 2022 14:29:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/aperture: Run fbdev removal before internal helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, airlied@linux.ie
References: <20220617121027.30273-1-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220617121027.30273-1-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, dri-devel@lists.freedesktop.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[adding Zack and Alex to Cc list]

Hello Thomas,

Thanks a lot for tracking this down and figuring out the root cause!

On 6/17/22 14:10, Thomas Zimmermann wrote:
> Always run fbdev removal first to remove simpledrm via
> sysfb_disable(). This clears the internal state. The later call
> to drm_aperture_detach_drivers() then does nothing. Otherwise,
> with drm_aperture_detach_drivers() running first, the call to
> sysfb_disable() uses inconsistent state.
> 
> Example backtrace show below:
> 
> [   11.663422] ==================================================================
> [   11.663426] BUG: KASAN: use-after-free in device_del+0x79/0x5f0
> [   11.663435] Read of size 8 at addr ffff888108185050 by task systemd-udevd/311
> [   11.663440] CPU: 0 PID: 311 Comm: systemd-udevd Tainted: G            E     5
> 	.19.0-rc2-1-default+ #1689
> [   11.663445] Hardware name: HP ProLiant DL120 G7, BIOS J01 04/21/2011
> [   11.663447] Call Trace:
> [   11.663449]  <TASK>
> [   11.663451]  ? device_del+0x79/0x5f0
> [   11.663456]  dump_stack_lvl+0x5b/0x73
> [   11.663462]  print_address_description.constprop.0+0x1f/0x1b0
> [   11.663468]  ? device_del+0x79/0x5f0
> [   11.663471]  ? device_del+0x79/0x5f0
> [   11.663475]  print_report.cold+0x3c/0x21c
> [   11.663481]  ? lock_acquired+0x87/0x1e0
> [   11.663484]  ? lock_acquired+0x87/0x1e0
> [   11.663489]  ? device_del+0x79/0x5f0
> [   11.663492]  kasan_report+0xbf/0xf0
> [   11.663498]  ? device_del+0x79/0x5f0
> [   11.663503]  device_del+0x79/0x5f0
> [   11.663509]  ? device_remove_attrs+0x170/0x170
> [   11.663514]  ? lock_is_held_type+0xe8/0x140
> [   11.663523]  platform_device_del.part.0+0x19/0xe0
> [   11.663530]  platform_device_unregister+0x1c/0x30
> [   11.663535]  sysfb_disable+0x2d/0x70
> [   11.663540]  remove_conflicting_framebuffers+0x1c/0xf0
> [   11.663546]  remove_conflicting_pci_framebuffers+0x130/0x1a0
> [   11.663554]  drm_aperture_remove_conflicting_pci_framebuffers+0x86/0xb0
> [   11.663561]  ? mgag200_pci_remove+0x30/0x30 [mgag200]
> [   11.663578]  mgag200_pci_probe+0x2d/0x140 [mgag200]
> 

Maybe include a Reported-by: Zack Rusin <zackr@vmware.com> ? since
this seems to be the exact same issue that he reported yesterday.

Patch looks good to me and this seems to be the correct fix IMO.
That way we won't re-introduce the issue that was fixed by the
sysfb_unregister() function, that is to remove a pdev even if wasn't
bound to a driver to prevent a late simpledrm registration to match.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

I wonder what's the best way to coordinate with Alex to merge this
fix and your patch that moves the aperture code out of DRM, since
as far as I can tell both should target the v5.20 release.

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 873eb3b11860 ("fbdev: Disable sysfb device registration when removing conflicting FBs")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Zhen Lei <thunder.leizhen@huawei.com>
> Cc: Changcheng Deng <deng.changcheng@zte.com.cn>
> ---
>  drivers/gpu/drm/drm_aperture.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
> index 74bd4a76b253..059fd71424f6 100644
> --- a/drivers/gpu/drm/drm_aperture.c
> +++ b/drivers/gpu/drm/drm_aperture.c
> @@ -329,7 +329,20 @@ int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
>  						     const struct drm_driver *req_driver)
>  {
>  	resource_size_t base, size;
> -	int bar, ret = 0;
> +	int bar, ret;
> +
> +	/*
> +	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
> +	 * otherwise the vga fbdev driver falls over.
> +	 */
> +#if IS_REACHABLE(CONFIG_FB)
> +	ret = remove_conflicting_pci_framebuffers(pdev, req_driver->name);
> +	if (ret)
> +		return ret;
> +#endif
> +	ret = vga_remove_vgacon(pdev);
> +	if (ret)
> +		return ret;
>  
>  	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
>  		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
> @@ -339,15 +352,6 @@ int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
>  		drm_aperture_detach_drivers(base, size);
>  	}
>  
> -	/*
> -	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
> -	 * otherwise the vga fbdev driver falls over.
> -	 */
> -#if IS_REACHABLE(CONFIG_FB)
> -	ret = remove_conflicting_pci_framebuffers(pdev, req_driver->name);
> -#endif
> -	if (ret == 0)
> -		ret = vga_remove_vgacon(pdev);
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_aperture_remove_conflicting_pci_framebuffers);

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

