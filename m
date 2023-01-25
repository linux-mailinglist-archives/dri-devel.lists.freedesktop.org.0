Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B0867ABBC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 09:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223C910E753;
	Wed, 25 Jan 2023 08:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEAD10E755
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 08:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674635447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kr0S8akD6qUBjK/SM2fF6lu+0ihmEwSHU9fQtaMUMNo=;
 b=c82vQHfGvl69RfAXVYFrW2N0W8Ijsjsjpnjk1bowJm/pXrJxdkxGqIuUhU5SsgTTLLfChe
 WCLgudtbd4i2a67T5yUtWti3Rrnvc7tjBjBAa2DISqSv0KJPjNuKUh2mamIk8uLrVTgKsh
 45QcAOaKX2KrCFHZDN0PbyR4zQgJDHI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-g8VqzgtWPPaXOg44chbGmw-1; Wed, 25 Jan 2023 03:30:45 -0500
X-MC-Unique: g8VqzgtWPPaXOg44chbGmw-1
Received: by mail-wr1-f71.google.com with SMTP id
 e37-20020a5d5965000000b002bfb4cab735so494408wri.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 00:30:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kr0S8akD6qUBjK/SM2fF6lu+0ihmEwSHU9fQtaMUMNo=;
 b=UIN2jGFYksVJsz1UyxFXgrwu1pr5dWxnieDZYCiXAE7HVeQ4U4AcFXMNycZfqMmYLg
 zxYpcxBZYHsCbE5PsGrm7NxB0XT54VWaCW72ViQqTRgs3XStsux2Pd08ZQHZzST3yAig
 6Pzy751QSow0upG795J5Yo1i8uD5Q/9z0wrfVu1OdrBj8phqr006YUT0n7ziOaAVVWkA
 p97P++PJWf/r1JR1NosQUUPD+k4VDU9LK2dlSOeprcoa88mFgOLW8xQdy7RYXlZgsUEB
 MRZkeF/ZI3iNRJyA7YZfjocfZ2cD/Y+Rd1BVpOJGMRDulbh0Ah87nA+BGzbDaGz9LTQZ
 u/Pw==
X-Gm-Message-State: AFqh2kqjKLCzcBWiqviA6T49XIgRvpUqc6f16FZ8pBLTSBBGiWwAk2Z8
 VEIHVF+PssjUqFGFB6m+ZjJc6WMmiwCcuoYpjVF0auih3c3etvWR6uSIbP8RaBUpAJRmrmNgfTl
 D9R0JEQ8kzoDdfdYj/hXhXvx6US7C
X-Received: by 2002:a05:6000:388:b0:2bc:7ec3:8b2 with SMTP id
 u8-20020a056000038800b002bc7ec308b2mr29736115wrf.68.1674635444579; 
 Wed, 25 Jan 2023 00:30:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvJXEPl3F4VP/2Wui1NMuiLkn1RDtzF7t2lLspd9Qgz+v3EiIOxwRmTCt+QhhFH4DIAkfWI6g==
X-Received: by 2002:a05:6000:388:b0:2bc:7ec3:8b2 with SMTP id
 u8-20020a056000038800b002bc7ec308b2mr29736083wrf.68.1674635444065; 
 Wed, 25 Jan 2023 00:30:44 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n17-20020a5d67d1000000b002425be3c9e2sm3716862wrw.60.2023.01.25.00.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 00:30:43 -0800 (PST)
Message-ID: <296bcff0-9d75-3d6b-e101-dddb26edadf1@redhat.com>
Date: Wed, 25 Jan 2023 09:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 01/10] drm/client: Test for connectors before sending
 hotplug event
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-2-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Test for connectors in the client code and remove a similar test
> from the generic fbdev emulation. Do nothing if the test fails.
> Not having connectors indicates a driver bug.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

but I've a question below.

>  drivers/gpu/drm/drm_client.c        | 5 +++++
>  drivers/gpu/drm/drm_fbdev_generic.c | 5 -----
>  2 files changed, 5 insertions(+), 5 deletions(-)

[...]

> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -389,11 +389,6 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
>  	if (dev->fb_helper)
>  		return drm_fb_helper_hotplug_event(dev->fb_helper);
>  
> -	if (!dev->mode_config.num_connector) {
> -		drm_dbg_kms(dev, "No connectors found, will not create framebuffer!\n");
> -		return 0;
> -	}
> -

What about the following code snippet:

	if (!drm_drv_uses_atomic_modeset(dev))
		drm_helper_disable_unused_functions(dev);

that seems to be something that should be in the core client dev hotplug
as well, since it isn't specific to the fbdev emulation client ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

