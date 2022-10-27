Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7F960FBDB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 17:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F2310E678;
	Thu, 27 Oct 2022 15:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C165110E678
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 15:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666884364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6AFhkuxbmuNtizR3GjX6137d8pj4FiTRbGMWfbYP3f0=;
 b=QUdZ1UZHCs4e2TsP5g/H7rx4f2rzjSDHY0R/bjzDDrlmnd03ZBvVV+mfhUmj+6dRUeqXM7
 iVFgpvrySEmyni1EhcoyICrFm/0QPBuhqd6kgP+O4OJRnFyBiU3EdWRZaiu1z5grS1a3W9
 KtGt39D9ubQtN6XTtb8FkQiFsZG2cCg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-526-l3TupviGM2GLLo-kcN6pKg-1; Thu, 27 Oct 2022 11:26:03 -0400
X-MC-Unique: l3TupviGM2GLLo-kcN6pKg-1
Received: by mail-wr1-f69.google.com with SMTP id
 d10-20020adfa34a000000b00236616a168bso527979wrb.18
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 08:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6AFhkuxbmuNtizR3GjX6137d8pj4FiTRbGMWfbYP3f0=;
 b=mzpG5st1ahWinrvFJtm20MVkiZOVzBeY+DRybu6Th1M0dUtAMdBTnQZqi/WqV4kNgE
 cNX9+sYd3VId3so4Ol8acAF2IwcMWVCZk+nuSYJEZLhf86LXVcWUuo+6u2kUbJnG4Zc3
 MvaYI9vpQWuDiaJdMX15/V+fPPld+JjinkmM0uIHqswxIsdo3DAEy5OsTJXw8vS2jt4w
 o8ZeEewv7PyNz4q+dGZpBzT+54lZVms9c5FmTDTECVamDiJjRUZI/mrX9iRVp9n50wQe
 LEyuEdmnj+6E5NSqoFuwp5Pzo3ztGqACIUJrQRUj7DUOY52DHpFBTQEZPke+6u0f/PCs
 iaVA==
X-Gm-Message-State: ACrzQf3FBI5eFA/t41CsbI81E0x1MNn//+RN8mzd/0bZ58j0YhoM7WXm
 Nix1z0Qu8MFwurC3AMLhy/z4RD72yV8RzxDKhVTfb7lXHid9CLBm53O6XQSeIykwNpFmXwQ7azV
 pYTz4/u22q3NN6drP12LLiEPsVlVK
X-Received: by 2002:adf:e5c3:0:b0:236:5092:7cfc with SMTP id
 a3-20020adfe5c3000000b0023650927cfcmr22970126wrn.285.1666884361972; 
 Thu, 27 Oct 2022 08:26:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4cSF/cW0SefLKSM4Tdmprwq06ZOhxO2RN9MUElJceZ16ocrqLlsGNrXc/BTixsXbe54NkzWA==
X-Received: by 2002:a5d:5a82:0:b0:224:f744:1799 with SMTP id
 bp2-20020a5d5a82000000b00224f7441799mr32210444wrb.582.1666884351138; 
 Thu, 27 Oct 2022 08:25:51 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 6-20020a05600c230600b003cf37c5ddc0sm1764578wmo.22.2022.10.27.08.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 08:25:50 -0700 (PDT)
Message-ID: <bb901a65-d7c3-b75e-c34b-23ec46c960f6@redhat.com>
Date: Thu, 27 Oct 2022 17:25:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] drm/vc4: hdmi: Fix HSM clock too low on Pi4
To: maxime@cerno.tech, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221021131339.2203291-1-maxime@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221021131339.2203291-1-maxime@cerno.tech>
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
Cc: Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/21/22 15:13, maxime@cerno.tech wrote:
> Commit ae71ab585c81 ("drm/vc4: hdmi: Enforce the minimum rate at
> runtime_resume") reintroduced the call to clk_set_min_rate in an attempt
> to fix the boot without a monitor connected on the RaspberryPi3.
> 
> However, that introduced a regression breaking the display output
> entirely (black screen but no vblank timeout) on the Pi4.
> 
> This is due to the fact that we now have in a typical modeset at boot,
> in vc4_hdmi_encoder_pre_crtc_configure(), we have a first call to
> clk_set_min_rate() asking for the minimum rate of the HSM clock for our
> given resolution, and then a call to pm_runtime_resume_and_get(). We
> will thus execute vc4_hdmi_runtime_resume() which, since the commit
> mentioned above, will call clk_set_min_rate() a second time with the
> absolute minimum rate we want to enforce on the HSM clock.
> 
> We're thus effectively erasing the minimum mandated by the mode we're
> trying to set. The fact that only the Pi4 is affected is due to the fact
> that it uses a different clock driver that tries to minimize the HSM
> clock at all time. It will thus lower the HSM clock rate to 120MHz on
> the second clk_set_min_rate() call.
> 
> The Pi3 doesn't use the same driver and will not change the frequency on
> the second clk_set_min_rate() call since it's still within the new
> boundaries and it doesn't have the code to minimize the clock rate as
> needed. So even though the boundaries are still off, the clock rate is
> still the right one for our given mode, so everything works.
> 
> There is a lot of moving parts, so I couldn't find any obvious
> solution:
> 
>   - Reverting the original is not an option, as that would break the Pi3
>     again.
> 
>   - We can't move the clk_set_min_rate() call in _pre_crtc_configure()
>     since because, on the Pi3, the HSM clock has the CLK_SET_RATE_GATE
>     flag which prevents the clock rate from being changed after it's
>     been enabled. Our calls to clk_set_min_rate() can change it, so they
>     need to be done before clk_prepare_enable().
> 
>   - We can't remove the call to clk_prepare_enable() from the
>     runtime_resume hook to put it into _pre_crtc_configure() either,
>     since we need that clock to be enabled to access the registers, and
>     we can't count on the fact that the display will be active in all
>     situations (doing any CEC operation, or listing the modes while
>     inactive are valid for example()).
> 
>   - We can't drop the call to clk_set_min_rate() in
>     _pre_crtc_configure() since we would need to still enforce the
>     minimum rate for a given resolution, and runtime_resume doesn't have
>     access to the current mode, if there's any.
> 
>   - We can't copy the TMDS character rate into vc4_hdmi and reuse it
>     since, because it's part of the KMS atomic state, it needs to be
>     protected by a mutex. Unfortunately, some functions (CEC operations,
>     mostly) can be reentrant (through the CEC framework) and still need
>     a pm_runtime_get.
> 
> However, we can work around this issue by leveraging the fact that the
> clk_set_min_rate() calls set boundaries for its given struct clk, and
> that each different clk_get() call will return a different instance of
> struct clk. The clock framework will then aggregate the boundaries for
> each struct clk instances linked to a given clock, plus its hardware
> boundaries, and will use that.
> 
> We can thus get an extra HSM clock user for runtime_pm use only, and use
> our different clock instances depending on the context: runtime_pm will
> use its own to set the absolute minimum clock setup so that we never
> lock the CPU waiting for a register access, and the modeset part will
> set its requirement for the current resolution. And we let the CCF do
> the coordination.
> 
> It's not an ideal solution, but it's fairly unintrusive and doesn't
> really change any part of the logic so it looks like a rather safe fix.
> 

What a great commit message. I learned a couple of things from it :)

[...]

Maybe adding some comments here explaining why two instances of the
same clock are getting by the driver? It's very clear after reading
your commit message, but it may not be for someone looking the code.
  
> +	vc4_hdmi->hsm_rpm_clock = devm_clk_get(dev, "hdmi");
> +	if (IS_ERR(vc4_hdmi->hsm_rpm_clock)) {
> +		DRM_ERROR("Failed to get HDMI state machine clock\n");
> +		return PTR_ERR(vc4_hdmi->hsm_rpm_clock);
> +	}
> +

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

