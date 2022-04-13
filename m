Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF464FF50C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 12:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4605410E08C;
	Wed, 13 Apr 2022 10:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582F210E08C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 10:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649846713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iFhpaO4flQWRHjopPtTFPWapfyKNAixT16D8GlIdtis=;
 b=ZM1AOWhcS4FhGt9/TpXInt2jAAsMUmeOZ1/UXueWi2G0Ui7qadUkIQJ5YxaAJTcw1mp41j
 K6c+CD65iOftVuPujhGjmd3adU1BsscwDmX77wUYHzIoksmKOKfZ9h9zdEdJzRbZ3m/WcZ
 Nz3OILNG6CXkelRNCVbJcYsSax51mJ8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-e3-nUXG6PwyMWY3PEG19Qw-1; Wed, 13 Apr 2022 06:45:12 -0400
X-MC-Unique: e3-nUXG6PwyMWY3PEG19Qw-1
Received: by mail-wr1-f71.google.com with SMTP id
 i64-20020adf90c6000000b00203f2b5e090so252928wri.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 03:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iFhpaO4flQWRHjopPtTFPWapfyKNAixT16D8GlIdtis=;
 b=txW96t29SvlzOuQmg2mlOFgtKCez4iDoKQBeBJnTbgBUe24uZByzSA8xSK5M+hbYDR
 GIKvZt8MLJHyGxGgcyxchhh5gT33rd3xyRJOcYLs8vxvF5Q4qq1aJSHs6nx/kKKfz2vz
 xRLRkdNSNK4pjQHGH0YzGf/gWObCHd8hT9/NBaAZMTlFdqaaI9GLpXp1QAYyCCtxwSVn
 ryMTRbHsR55fdzJuK9GbGUOVsbQGjybUduSovVU31lfTmrx8rOQaA87U8y18W2163AkJ
 FwU2ySbz0G1Be7zFFu8BmyFB3wM8ezhUpfNrXYSjglPOfsQ7Htvxzt/2vO9vtYylPwUs
 iUOg==
X-Gm-Message-State: AOAM533939TvOYegeTS2sJf2ZALl+b5HMfHgeBxOAhcuQ1qrXDjEp4nU
 7iviN1TrgQVJIwDx+UZuyfUUGf84Bfd7ixgkuZX+btN5WxNYDlXJp1eDxWTbxAt0UfU/f2kV/ML
 Lx5viif1BVk51O/IgjvTnVIlEC8NX
X-Received: by 2002:a7b:c350:0:b0:38c:6d3c:6c8 with SMTP id
 l16-20020a7bc350000000b0038c6d3c06c8mr7843237wmj.45.1649846710857; 
 Wed, 13 Apr 2022 03:45:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrABkEapBmyT3q0GmcVo1LIayLaVhccVgfexcQ/xcAqoykIRQcU/wRPqN7irY6KO22Ca1QDg==
X-Received: by 2002:a7b:c350:0:b0:38c:6d3c:6c8 with SMTP id
 l16-20020a7bc350000000b0038c6d3c06c8mr7843206wmj.45.1649846710486; 
 Wed, 13 Apr 2022 03:45:10 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a5d5587000000b00207a8cde900sm6685468wrv.19.2022.04.13.03.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 03:45:10 -0700 (PDT)
Message-ID: <23060462-5700-e17a-0abe-a4c5123abe29@redhat.com>
Date: Wed, 13 Apr 2022 12:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] of: Create platform devices for OF framebuffers
To: Thomas Zimmermann <tzimmermann@suse.de>, robh+dt@kernel.org,
 frowand.list@gmail.com, daniel@ffwll.ch, deller@gmx.de, sam@ravnborg.org,
 linux@roeck-us.net, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220413092454.1073-2-tzimmermann@suse.de>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

Thanks for working on this.

On 4/13/22 11:24, Thomas Zimmermann wrote:
> Create a platform device for each OF-declared framebuffer and have
> offb bind to these devices. Allows for real hot-unplugging and other
> drivers besides offb.
> 
> Originally, offb created framebuffer devices while initializing its
> module by parsing the OF device tree. No actual Linux device was set
> up. This tied OF framebuffers to offb and makes writing other drivers
> for the OF framebuffers complicated. The absence of a Linux device
> prevented real hot-unplugging. Adding a distinct platform device for
> each OF framebuffer solves both problems. Specifically, a DRM drivers
> can now provide graphics output with modern userspace.
> 
> Some of the offb init code is now located in the OF initialization.
> There's now also an implementation of of_platform_default_populate_init(),
> which was missing before. The OF side creates different devices for
> either OF display nodes or bootx displays as they require different
> handling by the driver. The offb drivers picks up each type of device
> and runs the appropriate fbdev initialization.
> 
> Tested with OF display nodes on qemu's ppc64le target.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[snip]

> +	for_each_node_by_type(node, "display") {
> +		if (!of_get_property(node, "linux,opened", NULL) ||
> +		    !of_get_property(node, "linux,boot-display", NULL))
> +			continue;
> +		dev = of_platform_device_create(node, "of-display", NULL);
> +		if (WARN_ON(!dev))
> +			return -ENOMEM;
> +		boot_display = node;
> +		break;
> +	}
> +	for_each_node_by_type(node, "display") {
> +		if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
> +			continue;
> +		of_platform_device_create(node, "of-display", NULL);

Shouldn't check for the return value here too ?

Other than this small nit, it looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

