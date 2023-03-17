Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 989FC6BE922
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE6110E113;
	Fri, 17 Mar 2023 12:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A855810E113
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679055863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZSkB8AD4o1VKm3IMgju66plGEHgOjjlHFW0wgrUcZ6M=;
 b=f6tA/AIhoOAYZlStQ7owmJkO1HtOHTOxiXPK9xYwcprSGg0Iv47BKILyehmgGAZs2bY011
 +OvUfO+XjH2vyBYrzpSF+1sltO4cGJrVUK2l87hrznWUapDvO9wFkKmAIJRJJB6GFXCiPm
 dswDH3P0Winx7wu2DzwvALHjW2sd1nM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-ZjCpfLLMOtyA84Zlv3ITVQ-1; Fri, 17 Mar 2023 08:24:22 -0400
X-MC-Unique: ZjCpfLLMOtyA84Zlv3ITVQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l20-20020a05600c1d1400b003e10d3e1c23so4210183wms.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 05:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679055861;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZSkB8AD4o1VKm3IMgju66plGEHgOjjlHFW0wgrUcZ6M=;
 b=izrRKd/D8FRHa8q3Jv5mZOxdIkPMd7f/I/9V6w8o4nRtzLqzCRrUmqPH/QE60Yx2nA
 hzIrOxrlkXMpX7enQNumWEbaJhVoa4aY4HOMpDfKwcKwpXAaPG69p8kLaY+IQrCpOeFR
 D4CAs1YUqdPWZOABG58+eVX2AfBpn1Z4nu86GfY/BlFWtqFaWSPSmEFdkEkX9CmTFHxh
 8AkAnbryehgg9mW3EXMf1IpE80M8NtP1ziOFunWBJ5mI9shwUAMs6oPHJ0WHHYQxHGWd
 SvhBV9jWUSFzzfwceLdqHQhpI15659ryxm7ZZ4umdWicjBPdi39vZHTOK8/koO8rgGun
 8wDg==
X-Gm-Message-State: AO0yUKVCRoiPXIkXjvxj4CShI0PvKWf5Beootdrcx8EfWT7aB+hzrwLp
 gGYosxOsCrGlmPt7IgpPLPzDGl5FSF6scKWmvbtLDkDsNXq3H4iHbw43zx0ydvJzno3nWDoMR+m
 EIAHc9nNNVUSlY0DnRk4IpkTlhVhp
X-Received: by 2002:a7b:c044:0:b0:3ed:9212:b4fe with SMTP id
 u4-20020a7bc044000000b003ed9212b4femr866255wmc.0.1679055860889; 
 Fri, 17 Mar 2023 05:24:20 -0700 (PDT)
X-Google-Smtp-Source: AK7set+rDU5RcxP9lLq6J0of0QQBPSXg1zHFmiYGUwsmyI9CRW00vHpVFdlqYMZbEUgRVoKh8cbsXA==
X-Received: by 2002:a7b:c044:0:b0:3ed:9212:b4fe with SMTP id
 u4-20020a7bc044000000b003ed9212b4femr866240wmc.0.1679055860595; 
 Fri, 17 Mar 2023 05:24:20 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o17-20020a056000011100b002d30fe0d2fcsm1866104wrx.13.2023.03.17.05.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 05:24:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: Re: [PATCH 4/6] drm/fbdev-generic: Clean up after failed probing
In-Reply-To: <20230315161442.27318-5-tzimmermann@suse.de>
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-5-tzimmermann@suse.de>
Date: Fri, 17 Mar 2023 13:24:19 +0100
Message-ID: <87sfe3pnv0.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]

> @@ -91,36 +93,52 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
>  
>  	fb_helper->buffer = buffer;
>  	fb_helper->fb = buffer->fb;
> -	fb = buffer->fb;
> +
> +	screen_size = buffer->gem->size;

[...]

> -	info->screen_size = sizes->surface_height * fb->pitches[0];

[...]

I wonder if this change should be a separate patch? I know that it should
be the same size but still feels like an unrelated change that deserves a
different patch and description.

[...]
  
> -	/* Set a default deferred I/O handler */
> +	/* deferred I/O */

I would either have it as /* Generic fbdev deferred I/O handler */ or just
remove the comment. I understand why you are removing the "default", since
implies that drivers can change the handler and that's not the case here.

But I think that just leaving the "deferred I/O" comment there doesn't say
that much.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

