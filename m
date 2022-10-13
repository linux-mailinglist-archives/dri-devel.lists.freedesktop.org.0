Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6972B5FD72E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF0B10E6F3;
	Thu, 13 Oct 2022 09:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A476710E6ED
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665653883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9snsm3rk9oLMX8YjTU2ibqvXXarlConNz6Jrmux1oCU=;
 b=ZZ/62M9+ZEurw/rIeaDs5b81ghwNhzEqdbEj1Z1XooruC0yL79e0wsS2Psah1Zt1+devvc
 ZDCV6yTWl2jOEXt58RDMgxdBRaulN2+bM6dpmj3ssvXzPUZzhd8v0cUPNvL83eXcA5W2Ho
 b70yzY/VjDYxHWH7YHc8xIfH9m49NYM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-371-XJ3euWK6OQ2gxVzcFZAYAg-1; Thu, 13 Oct 2022 05:38:00 -0400
X-MC-Unique: XJ3euWK6OQ2gxVzcFZAYAg-1
Received: by mail-wm1-f71.google.com with SMTP id
 b7-20020a05600c4e0700b003bde2d860d1so860940wmq.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 02:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9snsm3rk9oLMX8YjTU2ibqvXXarlConNz6Jrmux1oCU=;
 b=g8XKm5uq9D0XBDEZpNZwBYkJbjCF4ibdtZO+QizyJa+y/qn3+Ne2C9x7llB9OfrWCk
 +n0j+tkokYf6mFLRFHapAbnyFRSfX8y8sWng0Y9OOBjcws9pM8SyBXLk7swVgoNrlwaN
 9JiLAOWFXSpJf10Rat9PYT/+Bz6HYxeVYP5OLSJ8ppZy2rs2HNJbx8GC7jb2GpdkyYWk
 VHHkownFKKpnmblx8/Vj3eZnwpcm9pbrTYy/bsro+Hc6H8xB3LHZLRKGDa9Hz0i6w7wN
 tZ4iGWRDIJq4VDFmTKsqL0hgsIpLg8zoGXytU1FOIobBAwt7I7GJ9mdhvZtPz7kQcRCR
 raVQ==
X-Gm-Message-State: ACrzQf0tX2sARmis2ihFYp6CteuLi39u42C9Ak+nZRM5bup8palOMSdL
 /dtatTIeslG1GCHpZTJtcvnJ+1fMaSFqWPXek7m4Gvsq1Zwvb1fHdYgy3QZo3ta8zTmOCXKL3KH
 7G1XxcrwEVOYrcAaiaH73Lvs3Fv+r
X-Received: by 2002:a5d:4f10:0:b0:231:1c7b:e42 with SMTP id
 c16-20020a5d4f10000000b002311c7b0e42mr9831842wru.568.1665653879274; 
 Thu, 13 Oct 2022 02:37:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7aKiCQzKwG4ALs3g7YVHciVvngW7vaZpaRtnbUpk0vmjjT0EU7jXg6H/lJIm7bxDjjILLbjQ==
X-Received: by 2002:a5d:4f10:0:b0:231:1c7b:e42 with SMTP id
 c16-20020a5d4f10000000b002311c7b0e42mr9831824wru.568.1665653879063; 
 Thu, 13 Oct 2022 02:37:59 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p31-20020a05600c1d9f00b003c6c3fb3cf6sm3944476wms.18.2022.10.13.02.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 02:37:58 -0700 (PDT)
Message-ID: <be19509a-3e9a-e2a9-24c5-0aac74987942@redhat.com>
Date: Thu, 13 Oct 2022 11:37:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/2] drm/vc4: hdmi: Enforce the minimum rate at
 runtime_resume
To: Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>
References: <20220929-rpi-pi3-unplugged-fixes-v1-0-cd22e962296c@cerno.tech>
 <20220929-rpi-pi3-unplugged-fixes-v1-1-cd22e962296c@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220929-rpi-pi3-unplugged-fixes-v1-1-cd22e962296c@cerno.tech>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maxime,

On 9/29/22 11:21, Maxime Ripard wrote:
> This is a revert of commit fd5894fa2413 ("drm/vc4: hdmi: Remove clock
> rate initialization"), with the code slightly moved around.
> 
> It turns out that we can't downright remove that code from the driver,
> since the Pi0-3 and Pi4 are in different cases, and it only works for
> the Pi4.
> 
> Indeed, the commit mentioned above was relying on the RaspberryPi
> firmware clocks driver to initialize the rate if it wasn't done by the
> firmware. However, the Pi0-3 are using the clk-bcm2835 clock driver that
> wasn't doing this initialization. We therefore end up with the clock not
> being assigned a rate, and the CPU stalling when trying to access a
> register.
> 
> We can't move that initialization in the clk-bcm2835 driver, since the
> HSM clock we depend on is actually part of the HDMI power domain, so any
> rate setup is only valid when the power domain is enabled. Thus, we
> reinstated the minimum rate setup at runtime_suspend, which should
> address both issues.
> 
> Link: https://lore.kernel.org/dri-devel/20220922145448.w3xfywkn5ecak2et@pengutronix.de/
> Fixes: fd5894fa2413 ("drm/vc4: hdmi: Remove clock rate initialization")
> Reported-by: Marc Kleine-Budde <mkl@pengutronix.de>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 199bc398817f..2e28fe16ed5e 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2891,6 +2891,15 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
>  	u32 __maybe_unused value;
>  	int ret;
>  
> +	/*
> +	 * The HSM clock is in the HDMI power domain, so we need to set
> +	 * its frequency while the power domain is active so that it
> +	 * keeps its rate.
> +	 */
> +	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, HSM_MIN_CLOCK_FREQ);
> +	if (ret)
> +		return ret;
> +

I'm not familiar with VC4 but your commit message has a great explanation
of the issue and the code is doing what you mention there. So this patch
looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

