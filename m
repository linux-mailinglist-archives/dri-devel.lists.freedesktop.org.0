Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D03C6256D2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 10:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B68C10E7D6;
	Fri, 11 Nov 2022 09:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C6810E7D6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 09:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668158936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fi2SE1B7lTw9mdq0VS6e9xO7m6BadB4tfHCV89qdFtE=;
 b=QLpENXMWdoifKQrfMAkdUXX0jr924XEepJvFh0dsbis9AMoSFb8rDkaBRNLSq1sLsuXvpV
 88RPN0KKc6lA0BYVsGv0Qo4eunS+N2YIiO1GrK27dUxjKn5Ft2XG1Gxdq/Vep5ghi4dCZi
 tI8k443vnYD4tKc5Lba88EX1lMB/ifo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-167-qcHNocJAN6Oc5TJ6e-nBDw-1; Fri, 11 Nov 2022 04:28:54 -0500
X-MC-Unique: qcHNocJAN6Oc5TJ6e-nBDw-1
Received: by mail-wr1-f70.google.com with SMTP id
 c18-20020adfa312000000b002364fabf2ceso849973wrb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 01:28:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fi2SE1B7lTw9mdq0VS6e9xO7m6BadB4tfHCV89qdFtE=;
 b=c1sk/mFLFUcTSzvoeF9L4UaToKBqZNY0J351h7ax+ea3CS5hIvD+nyQf9LhyYqX+s5
 InXKLPBUqi7tAkj4IhrlxuWDuW0JDw50VE5TRRhNgLIGi97Nwe8N+1YpTukzpaGTTCVd
 A/F1yJ+Vj8B6F1LdffrtabSDltTPSHoiQQ4F6kMuFZDG+h70BheDB4rN1m/Jtf1qLEYk
 1Au5NJUC13PDjkZg0hvaK86XVCGS/IQCrQKjSQ2NwmuwismkLdjiXBaN3dFHmVeaSr1/
 KzKA4LpsJ+DU0Dx1olXf1ZLl+eRbVLDava3fgYTiCx3lkEOYPq4lfbSA4z9Hl8az17uk
 RKhg==
X-Gm-Message-State: ANoB5plt/atGGycTy6Tnph/TWqAz4rDvEbus2xNmfegohHGMQPD25KuM
 6e1/wawclhUO99Twxj/7tZ9V+8ArjggMJ51FloGpp6oGQYoa6Hcv1Vf1wYMg535m4ZcIbedBrFw
 W/a0VH0tL7jJja1N563WfE3my99uH
X-Received: by 2002:a05:600c:501f:b0:3cf:7801:c780 with SMTP id
 n31-20020a05600c501f00b003cf7801c780mr665763wmr.29.1668158933144; 
 Fri, 11 Nov 2022 01:28:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6gggVWY5XHMDcKBvOquzjta+/8rIcI2BSxVmt+9jHIw0LxNFF/HyaBPWPLAepS/LDlWXKyyA==
X-Received: by 2002:a05:600c:501f:b0:3cf:7801:c780 with SMTP id
 n31-20020a05600c501f00b003cf7801c780mr665754wmr.29.1668158932932; 
 Fri, 11 Nov 2022 01:28:52 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m10-20020a5d56ca000000b00241736714c3sm342853wrw.14.2022.11.11.01.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 01:28:52 -0800 (PST)
Message-ID: <8447ae65-3f44-6e96-2c0e-f62a06b3e712@redhat.com>
Date: Fri, 11 Nov 2022 10:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/2] drm: Move nomodeset kernel parameter to drivers/video
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221107104916.18733-2-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 11/7/22 11:49, Thomas Zimmermann wrote:

[...]

> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a465d5242774a..70178c5f53956 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3777,7 +3777,7 @@
>  			shutdown the other cpus.  Instead use the REBOOT_VECTOR
>  			irq.
>  
> -	nomodeset	Disable kernel modesetting. DRM drivers will not perform
> +	nomodeset	Disable kernel modesetting. Graphics drivers will not perform
>  			display-mode changes or accelerated rendering. Only the
>  			system framebuffer will be available for use if this was
>  			set-up by the firmware or boot loader.

Not really part of your patch but probably we should reword this a little bit.

Because as this is written, it implies that not only DRM drivers with feature
DRIVER_MODESET will not be available but also drivers with DRIVER_RENDER. But
that's not the case, render-only drivers usually just ignore this parameter
(but not all IIRC), so I wonder how we could make this comment more accurate.

Also maybe we can mention in the comment fbdev and DRM? Just to make it clear
that this will affect to both subsystems? When I first worked on this, there
were a lot of assumptions in the stack (gdm, mutter, plymouth) that nomodeset
basically meant "no DRM but fbdev".

[...]

>  
>  int drm_dev_set_unique(struct drm_device *dev, const char *name);
>  
> -extern bool drm_firmware_drivers_only(void);
> +/* TODO: Inline drm_firmware_drivers_only() in all its callers. */

I guess you plan to do that as follow-up patches once this series land? Just
to avoid the churn to require acks for all the drivers to merge this series?

The changes looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

