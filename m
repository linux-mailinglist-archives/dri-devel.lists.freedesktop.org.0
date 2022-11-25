Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0106388CF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 12:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C3610E739;
	Fri, 25 Nov 2022 11:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F9110E739
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 11:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669375943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VsGy2+SrkApv7QX3F61FbC2SPRAOik8DhfKcdY40dBI=;
 b=XLGa/PlxlbWm7ybOXLUt+g55fnBvcW9mnXetQpFFiuvO8sgIgL7tIV8TDYushOo+H2ICyB
 /eFxTnp9NLYLKIXKg50PULbMoOhGIC8JEpWGoWFnQd6TXdWfnQdQsJfrrmlDh1sMlCKytc
 QGPsWckLAHUmtQTvvt83OHVjYHzpWoA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-449-FtvARlQVMnWKbG_TPw26og-1; Fri, 25 Nov 2022 06:32:19 -0500
X-MC-Unique: FtvARlQVMnWKbG_TPw26og-1
Received: by mail-wm1-f70.google.com with SMTP id
 az40-20020a05600c602800b003cfa26c40easo3843423wmb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 03:32:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VsGy2+SrkApv7QX3F61FbC2SPRAOik8DhfKcdY40dBI=;
 b=BD6BtlhRLmmzuWzxf5mA2qxEHk3pQCHeDNc7Kb+fd1bnywyprR/K5cZYd+8r3uaTJh
 NLQVP0kkBy399EwB21KCV0aCmkx67sSI/4wyQLVX/JjecJMSJ1Zc/Xv1QiVTTYavZOgK
 1zG+ZfUaIjA8lqa5n0LpPQWVowTrcMNqdDgIgqaT2TyWzTw206J5WnqUMVBJKAwvWHn+
 63eeg2qFuH67lCPSAK23NMOewqcGgKC8CQewx/RtQXUuHGUjN4UG5g3cvDCm+O9q2X+P
 meWIVSo6HvEGvUFYey+6oDGzSzE6ut/BJZVLiUj83Zmx47qq4KkgJvO05wOGdAiiAR0w
 L4EA==
X-Gm-Message-State: ANoB5plp5PSqPhEpLnEBDQJh35FQb79Dx8O3ERWry5th7bcj4W4l6uI9
 IIf/Gaqa+vaSx6VQyl2dpzAWy2tpBxTqv6BgEMW930uqnq3bHeWZX9DQu17mqthJJaae97Xr9VF
 hrYLKJcPbJXOhbcuFoLzDG/1lFOou
X-Received: by 2002:a05:600c:246:b0:3cf:760a:fbaf with SMTP id
 6-20020a05600c024600b003cf760afbafmr14987945wmj.110.1669375938633; 
 Fri, 25 Nov 2022 03:32:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5OsbzQLyftwLIWI3nDfrRG5jE1JPupjLhaA0WX3eVwlG57KKybql+K8IcZ8fhxJNc3nhLhqQ==
X-Received: by 2002:a05:600c:246:b0:3cf:760a:fbaf with SMTP id
 6-20020a05600c024600b003cf760afbafmr14987919wmj.110.1669375938413; 
 Fri, 25 Nov 2022 03:32:18 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x10-20020a05600c21ca00b003a6125562e1sm4484075wmj.46.2022.11.25.03.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 03:32:17 -0800 (PST)
Message-ID: <171d89b4-fbd9-8df8-5250-5fabd1973960@redhat.com>
Date: Fri, 25 Nov 2022 12:32:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 20/24] drm/vc4: crtc: Provide a CRTC name
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-20-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-20-051a0bb60a16@cerno.tech>
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

On 11/23/22 16:26, Maxime Ripard wrote:
> It's fairly hard to figure out the instance of the CRTC affected by an
> atomic change using the default name.
> 
> Since we can provide our own to the CRTC initialization functions, let's
> do so to make the debugging sessions easier.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 10 +++++++++-
>  drivers/gpu/drm/vc4/vc4_drv.h  |  2 ++
>  drivers/gpu/drm/vc4/vc4_txp.c  |  1 +
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 8bc30ad0904b..59e473059fa2 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -1118,6 +1118,7 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
>  
>  static const struct vc4_pv_data bcm2835_pv0_data = {
>  	.base = {
> +		.name = "pixelvalve-0",

I wonder if would make sense to add the SoC name too, but either way:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

