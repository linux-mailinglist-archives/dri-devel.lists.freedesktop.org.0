Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA0167ADB6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 10:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3118F10E747;
	Wed, 25 Jan 2023 09:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4495710E0DC
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 09:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674638712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJl0EBn4HtiAr3IA7OgQLEz430pat4/3/h3H46oRT3g=;
 b=O+H7qImQw3n0kUBRnsTNA+l1Hq/rTQNS13RVoN+0vqDNYXE0xR+cIfGrlwlQdIpd5BQYBl
 va2LqhD7mdUX5HEyxWufgaeOStHyyj7iqWUJTFYso9UvxzBcaRARPvMVhA9Jpnb64ir497
 Id1fDr3Zb36RBSH58iuZcpKoDWAAJ9o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-76-xJWEnXxAP6mdwitUxv8nig-1; Wed, 25 Jan 2023 04:25:09 -0500
X-MC-Unique: xJWEnXxAP6mdwitUxv8nig-1
Received: by mail-wr1-f72.google.com with SMTP id
 bj7-20020a0560001e0700b002bfb3c6ec00so603510wrb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 01:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MJl0EBn4HtiAr3IA7OgQLEz430pat4/3/h3H46oRT3g=;
 b=HgLSRNc/nY/sbQAImscD5XSmmhqkJXv0DjS7wPe6PiInMsY66mYh4o372I+7Ri7iPi
 KKugM6K2AodSb2WLbBJRHdYiUs4LL+qk7MGxtWBkG3ODNZ0gWqn3V4gl9dJNw9bXY6xK
 tXWStx0E2xzNHkVTDtoXYPGNgA3g+kjsKqf38G0e6rYqYQ6V6rmak2ZEtqYJWkHTbMRO
 TtqC7DLqKYBoifswuB1D5GMFr03fWwbpBsjpPlza3FWD2X835TqxDqgfDD739qPMgPwU
 nmXmUSSQPEfcYWypoJfuEBQbcFf1V+In47G4nvogSj+Q8FL05dMzsm16BD0y6W+hdXKl
 oRww==
X-Gm-Message-State: AFqh2koKcmP4R6InO6Zi3ZllvfL/6TXMuiLQeCAVb3ccNEpDzyMs0Ef8
 0iPqyTgR2mut7TI/HEw+BAX73zhvwGrdtsAhEd4h3RjXrUt9OdBD43PDDDYep8x9DoPMon7EgEP
 IdShUjvzxSPfJhe6Q+ajcBNv6OR+k
X-Received: by 2002:adf:a38d:0:b0:2bf:9527:ce62 with SMTP id
 l13-20020adfa38d000000b002bf9527ce62mr13001329wrb.60.1674638707871; 
 Wed, 25 Jan 2023 01:25:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvA3fpsEqb88MB1qU578so/hL+p+6J8snUbZz7AHyqAc1so8GvG1XEiL3HmPZITj9u0u/0ozg==
X-Received: by 2002:adf:a38d:0:b0:2bf:9527:ce62 with SMTP id
 l13-20020adfa38d000000b002bf9527ce62mr13001312wrb.60.1674638707672; 
 Wed, 25 Jan 2023 01:25:07 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q8-20020adff788000000b002bfbda53b98sm534384wrp.35.2023.01.25.01.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:25:07 -0800 (PST)
Message-ID: <c0377e71-12b8-a545-dc48-704c223f344c@redhat.com>
Date: Wed, 25 Jan 2023 10:25:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 04/10] drm/fbdev-generic: Initialize fb-helper
 structure in generic setup
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-5-tzimmermann@suse.de>
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

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Initialize the fb-helper structure immediately after its allocation
> in drm_fbdev_generic_setup(). That will make it easier to fill it with
> driver-specific values, such as the preferred BPP.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> @@ -456,12 +454,12 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
>  	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
>  	if (!fb_helper)
>  		return;

Maybe add a new line here?

> +	drm_fb_helper_prepare(dev, fb_helper, &drm_fb_helper_generic_funcs);
>  

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

