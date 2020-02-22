Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFA7168E87
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 12:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531F66E875;
	Sat, 22 Feb 2020 11:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6A36E875
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 11:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582371415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJ/w/or5K/3iSGjnhNEupgWTYRGrnhJNvNBceudjZb0=;
 b=JBQzU5+Q6I8unYQXpnPXOiwZN5bUO3F7+WGnSGWQhMc/6529J6z8OOZ125kAuSZV66FcPH
 /rYwev8WpMXi9STh5m4sD3E3CVKnqqEQ/5Jixl8qKq+xpAxIic9JEvLsbEDU5K5uLg13eb
 LVjeLXVmcRtU3N1ti5K5nIeuvAoThhc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-ZcBGiPNROby_X0qQAYLyEA-1; Sat, 22 Feb 2020 06:36:53 -0500
X-MC-Unique: ZcBGiPNROby_X0qQAYLyEA-1
Received: by mail-wr1-f72.google.com with SMTP id d15so2391857wru.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 03:36:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HJ/w/or5K/3iSGjnhNEupgWTYRGrnhJNvNBceudjZb0=;
 b=MDll5tMYpvInl5Fb6/+uQcHMQED140qNHKvjnCg/B7I410R4fU1pUaa+ToNadvLeaB
 wFCAkghISgk6aEqk0K4pNPT+Uemo+or7iVYnHmW0gHql9/gOeKtY0MgUze1shZcf2c6I
 RFnvhvFF1ni7aCUnWzP0cgJiFj/imbHpdkRBi17UtvJOfaNJlZ9ypYGHckufPjqG1USn
 iRMMzq5QAovnlRZWQ9eEOPXcpXzIwlOjhY41myAvkF34dWSb0Ctb0PQl7jBKLJeVlLJa
 ODkHOEk3OZdj3IKwrRK5Ag8/mg/HLzGmzZZrOlADjaR+LkF9LZ0iwUDf8WgFCohbyTNM
 p9/A==
X-Gm-Message-State: APjAAAXo74hsZnyR+LjdlItMF7NWKk1/8j3WqkzsVxt7NRbcAFDv91+K
 ia+8GPCMLWSp9tSbld5cMdaEYrEsHu8ipy4JQ88BseaXQujParsTwQGrb8zeuS39tSk5A8v487C
 U5nirzwl2/tviPJfow4teb2Xk0lsN
X-Received: by 2002:adf:df0e:: with SMTP id y14mr52355554wrl.377.1582371412162; 
 Sat, 22 Feb 2020 03:36:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZwTRbNmwvna8NwJJdWmiLjZ2zk4hzXiWwHc/VxMptD6a7Y9B0F7KB6fJdUUdPxuXl19pi7Q==
X-Received: by 2002:adf:df0e:: with SMTP id y14mr52355536wrl.377.1582371411917; 
 Sat, 22 Feb 2020 03:36:51 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-7a91-34f6-66f7-d87c.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7a91:34f6:66f7:d87c])
 by smtp.gmail.com with ESMTPSA id m125sm8379996wmf.8.2020.02.22.03.36.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Feb 2020 03:36:51 -0800 (PST)
Subject: Re: [PATCH 17/51] drm/gm12u320: Use drmm_add_final_kfree
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
 <20200221210319.2245170-18-daniel.vetter@ffwll.ch>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <468c8ab6-b99f-c662-6f02-bc600b11ceb2@redhat.com>
Date: Sat, 22 Feb 2020 12:36:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221210319.2245170-18-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/21/20 10:02 PM, Daniel Vetter wrote:
> With this we can drop the final kfree from the release function.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/gpu/drm/tiny/gm12u320.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index a48173441ae0..524ca0941cf9 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -19,6 +19,7 @@
>   #include <drm/drm_gem_shmem_helper.h>
>   #include <drm/drm_gem_framebuffer_helper.h>
>   #include <drm/drm_ioctl.h>
> +#include <drm/drm_managed.h>
>   #include <drm/drm_modeset_helper_vtables.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_simple_kms_helper.h>
> @@ -637,7 +638,6 @@ static void gm12u320_driver_release(struct drm_device *dev)
>   	gm12u320_usb_free(gm12u320);
>   	drm_mode_config_cleanup(dev);
>   	drm_dev_fini(dev);
> -	kfree(gm12u320);
>   }
>   
>   DEFINE_DRM_GEM_FOPS(gm12u320_fops);
> @@ -692,6 +692,7 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
>   		return ret;
>   	}
>   	dev->dev_private = gm12u320;
> +	drmm_add_final_kfree(dev, gm12u320);
>   
>   	drm_mode_config_init(dev);
>   	dev->mode_config.min_width = GM12U320_USER_WIDTH;
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
