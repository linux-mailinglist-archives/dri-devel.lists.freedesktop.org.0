Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 730E35FD70C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7B410E6A1;
	Thu, 13 Oct 2022 09:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1092B10E6A1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665653239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Df20eaFln656a5qXoCTem3l1HeGLTJ1pMaX6/OkaYdM=;
 b=UMdmbYnw2tvSAZXEKiAqjA7qCeEB7h+1WaHqbW/gaW24newEAM2YerIOuU4KK65n4napVe
 Lzwz9FM+82D14mhhf/fHfaa3B89ejUNosRqfPanbsp82THjVxFf/KE+aY+nMkuAhgp3Pmw
 rHY6KEtPAX16vvOPLcywSMOEdPDvrJQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263-bZrPShYQNSasYfz0tFCexA-1; Thu, 13 Oct 2022 05:27:18 -0400
X-MC-Unique: bZrPShYQNSasYfz0tFCexA-1
Received: by mail-wr1-f72.google.com with SMTP id
 m20-20020adfa3d4000000b0022e2fa93dd1so320840wrb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 02:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Df20eaFln656a5qXoCTem3l1HeGLTJ1pMaX6/OkaYdM=;
 b=GfWY9vARLVbWuN+1oC+IyH5jgSLJ0ZfSkUhGdpYt/zj8JHlWbLmG3d12xHxa5bsnWJ
 eW3uG3IlNjLbyaDTfhhU8Ygz3ZChGT1pnyojJ69rKTVUxkriw7zlpwnng0MBAGVU3S+c
 FWi+zaDWA1/6LPzgPUc7Vw8q7Ldk9qLKf11VJcjrz0S0WDWY+eD3pU+m2FqJT6ga8Oal
 qYIAjbKOVArEO0r3xZp+RN46+rACAtQyLVgGXFwIT7nNB8Q1wmbhWw0B9ba5c4dJzopZ
 BOIzR62RDi4PI2q45BtcmyAPJZcW1/ov3ow9GmvHIhdvj/mjopN1xRhpSpXwzVlqx/Qi
 hHlg==
X-Gm-Message-State: ACrzQf3E6Joquh2RgBdehKmrYDH9VjdsL1m0qNEpGC9Gk5Yk+xkohSy9
 AFlE0odg6gAkdrszkSfDJj0Eq94nEJ6aN2MdMEasYss90asN6CyvKWmK8FGEkcboYG/9UFL6SKp
 IZ5HthJHPaRFwmxWR9VYO4BIcvDsg
X-Received: by 2002:a5d:5221:0:b0:22e:3004:bb17 with SMTP id
 i1-20020a5d5221000000b0022e3004bb17mr20644312wra.352.1665653236985; 
 Thu, 13 Oct 2022 02:27:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4pAAFyOGQxiBtqaqh22fw2l7JYGV5vdX4+fLHJSG2vs36osXQnEBXRNpE6gj3ee78p7/Y9dg==
X-Received: by 2002:a5d:5221:0:b0:22e:3004:bb17 with SMTP id
 i1-20020a5d5221000000b0022e3004bb17mr20644301wra.352.1665653236702; 
 Thu, 13 Oct 2022 02:27:16 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f4-20020adff444000000b00225239d9265sm1570990wrp.74.2022.10.13.02.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 02:27:16 -0700 (PDT)
Message-ID: <16437681-c38a-7b4a-a3b0-bc65d75a805d@redhat.com>
Date: Thu, 13 Oct 2022 11:27:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] drm/vc4: Add module dependency on hdmi-codec
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
References: <20220902144111.3424560-1-maxime@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220902144111.3424560-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maxime,

On 9/2/22 16:41, Maxime Ripard wrote:
> The VC4 HDMI controller driver relies on the HDMI codec ASoC driver. In
> order to set it up properly, in vc4_hdmi_audio_init(), our HDMI driver
> will register a device matching the HDMI codec driver, and then register
> an ASoC card using that codec.
> 
> However, if vc4 is compiled as a module, chances are that the hdmi-codec
> driver will be too. In such a case, the module loader will have a very
> narrow window to load the module between the device registration and the
> card registration.
> 
> If it fails to load the module in time, the card registration will fail
> with EPROBE_DEFER, and we'll abort the audio initialisation,
> unregistering the HDMI codec device in the process.
> 
> The next time the bind callback will be run, it's likely that we end up
> missing that window again, effectively preventing vc4 to probe entirely.
> 
> In order to prevent this, we can create a soft dependency of the vc4
> driver on the HDMI codec one so that we're sure the HDMI codec will be
> loaded before the VC4 module is, and thus we'll never end up in the
> previous situation.
> 
> Fixes: 91e99e113929 ("drm/vc4: hdmi: Register HDMI codec")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index ffbbb454c9e8..2027063fdc30 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -490,6 +490,7 @@ module_init(vc4_drm_register);
>  module_exit(vc4_drm_unregister);
>  
>  MODULE_ALIAS("platform:vc4-drm");
> +MODULE_SOFTDEP("pre: snd-soc-hdmi-codec");

While this will solve the issue, I'm not a big fan of the MODULE_SOFTDEP()
macro to be honest. I always have the feeling that's fragile and something
that may not be updated if for example a module name changes in the future.

I wonder if instead the HDMI_CODEC_DRV_NAME platform device should not be
registered earlier and in a place that's not cleaned up in the probe error
path. For example in vc4_drm_register() instead of vc4_hdmi_audio_init().

Granted, that would register the platform device even when HDMI isn't used
which is disadvantage of doing it at vc4_hdmi_bind() time. But still, feel
that is more robust to rely on the Linux device model than module softdeps.

Having said that, I don't have a strong opinion and this patch is correct
and has been in the mailing list for a long time. So feel free to push it
if you think is the correct approach to solve this:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

