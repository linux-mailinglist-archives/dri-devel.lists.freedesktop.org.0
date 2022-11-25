Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33220638816
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 12:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C83E10E721;
	Fri, 25 Nov 2022 11:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A6C10E721
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 11:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669374048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H/ZkLtm8A9FTaUIt1krh1NXQg3mdZeQrz9lNHvK9Ra0=;
 b=DtzlBBkf+51d4EnyQoopC36sUkcY/ttW7tFFXAYOpVrUTUmGTDgJ7QB2DU6MjbB9oOB3/C
 G5gGlxcJfvzQBpqCrx6D3Egt7hVix2BuvmA658vZNZpPJdpJYr4uNQNHEpLgTehHY6O+1/
 FdexgqtUYMsE+gcKOvP4KL2d/4NRbZ8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-106-WopJfYPiOlWkdFw39LoFEg-1; Fri, 25 Nov 2022 06:00:47 -0500
X-MC-Unique: WopJfYPiOlWkdFw39LoFEg-1
Received: by mail-wm1-f69.google.com with SMTP id
 f1-20020a1cc901000000b003cf703a4f08so1679937wmb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 03:00:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H/ZkLtm8A9FTaUIt1krh1NXQg3mdZeQrz9lNHvK9Ra0=;
 b=oo2x/LuFsW6Z7xJXTHt/YDCvj9IPfTEytHePJ2ZXGOLdAr+7uMoICVM4DALR8S+zVk
 WNQt5rmswOVb7EEulqPy1iz3jterE6fYG2QHoKSB+LSITNkgMJiAieOGS6VqtDqy4Zq6
 EVOsxZEh06yd/d/pQqqQA9G0eLI9CMob4ByOcfDqluHIDF31t3g2XezyBZgJ47IXkvg0
 G5aLUvol/CwU9oAgTMVGbwyKLJmp6Bnx/6YAX6JoKxmX9E6CCSpmrAZzuDCY2oZZIBlU
 Am0r2XLf1bgc90sYcninG43Y236t+IIDi72ge/F2iGX/14tZcJBN8Jbu20CClinQlGMT
 nh6A==
X-Gm-Message-State: ANoB5pkbmiSjgwHaRqCTJr4cXogWNIPlKF6EFky4cHKbDvrMsDvQy5MS
 o93XY7wHAapFM3EusGaSTqgTjbZIyyXnLY5gRHGk0K4thJnTmml30+qAj/qMBcVZ/B+yyZEeZTR
 mXfw+m9csnzXpqylL/gumvbJKbXkL
X-Received: by 2002:adf:e508:0:b0:236:588f:b5d with SMTP id
 j8-20020adfe508000000b00236588f0b5dmr11244630wrm.255.1669374046415; 
 Fri, 25 Nov 2022 03:00:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Xu/NP6mlFBtx0snOLhZERGkaY9p8k3uPMLjkAV/xFHCXfHC5Y76yhHYrvcopCb8lv41h+LQ==
X-Received: by 2002:adf:e508:0:b0:236:588f:b5d with SMTP id
 j8-20020adfe508000000b00236588f0b5dmr11244612wrm.255.1669374046175; 
 Fri, 25 Nov 2022 03:00:46 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p1-20020a1c5441000000b003b4cba4ef71sm8531125wmi.41.2022.11.25.03.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 03:00:45 -0800 (PST)
Message-ID: <2762e41f-0508-2e25-b787-7b68d5014a77@redhat.com>
Date: Fri, 25 Nov 2022 12:00:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 10/24] drm/vc4: kms: Sort the CRTCs by output before
 assigning them
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-10-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-10-051a0bb60a16@cerno.tech>
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
Cc: David Gow <davidgow@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/23/22 16:25, Maxime Ripard wrote:
> On the vc4 devices (and later), the blending is done by a single device
> called the HVS. The HVS has three FIFO that can operate in parallel, and
> route their output to 6 CRTCs and 7 encoders on the BCM2711.
> 
> Each of these CRTCs and encoders have some contraints on which FIFO they

constraints.

> can feed from, so we need some code to take all those constraints into
> account and assign FIFOs to CRTCs.
> 
> The problem can be simplified by assigning those FIFOs to CRTCs by
> ascending output index number. We had a comment mentioning it already,
> but we were never actually enforcing it.
> 
> It was working still in most situations because the probe order is
> roughly equivalent, except for the (optional, and fairly rarely used on
> the Pi4) VEC which was last in the probe order sequence, but one of the
> earliest device to assign.
> 
> This resulted in configurations that were rejected by our code but were
> still valid with a different assignment.
> 
> We can fix this by making sure we assign CRTCs to FIFOs by ordering
> them by ascending HVS output index.
> 
> Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[...]

>  
> -	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
> -		struct vc4_crtc_state *old_vc4_crtc_state =
> -			to_vc4_crtc_state(old_crtc_state);
> -		struct vc4_crtc_state *new_vc4_crtc_state =
> -			to_vc4_crtc_state(new_crtc_state);
> -		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
> +	/*
> +	 * The problem we have to solve here is that we have up to 7
> +	 * encoders, connected to up to 6 CRTCs.
> +	 *
> +	 * Those CRTCs, depending on the instance, can be routed to 1, 2
> +	 * or 3 HVS FIFOs, and we need to set the change the muxing

This sentence sounds a little bit off to me. Did you mean:

"we need to set the muxing between" or "we need to change the muxing" ?

I'm not familiar with VC4 but the patch seems to do what the commit message
says, so the changes look good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

