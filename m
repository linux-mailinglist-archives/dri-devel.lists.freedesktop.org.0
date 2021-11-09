Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF36144AA72
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 10:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813D36E9F0;
	Tue,  9 Nov 2021 09:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D096E9F0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 09:19:33 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id b12so31779953wrh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 01:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=7tokRF/FVlwuKlYK0+nIVx5Z3Xcvz1VhwMbFjVHQ51U=;
 b=KhnKo5mMFpVopf630w1tivsAqagAbuC+kPV9SqhdLQ780GfI81VnY2Lrd4TZw9/SPD
 IxN517AMfx8Ny1Ncpyf+GsLXNM90xtngjB/DMJ/rdKlRUa2h3Rv/eyGYCO8bdt5SXrXO
 pyo78/RPlkkCKH7k9VspiValrCmYWBlS4UMWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=7tokRF/FVlwuKlYK0+nIVx5Z3Xcvz1VhwMbFjVHQ51U=;
 b=SU8ZOLjwz77gd0bwogr0IBgkXEbPrqIUiOH3uW6hEE4L4YUW10mAF56+Wa51z66Ebb
 eKWZAbqoNLT6Oy9tU8GmHDG9NcuWv1GTtjsW4D+XDPROsUDLKu8fkrR9/5iXGhcHEX2Z
 +a5quqYrHMXCnmXoVCLPC0IM/6pSvKkqVFZ4ambuFPzi787rCeWBQF3OCUsSVt6RaEPU
 /vR47exePP32D0PqAVhk+wlOKjdfS+1FOcU454go93rZIsF8GToiIvDibM1wTMz6p14U
 tljz5KKiXoahXdf3pPK1ObzMNrwbu06OQzvcBUoLfJPCKXj/m0Hnt2DtQsOhHv1NY36k
 fChQ==
X-Gm-Message-State: AOAM531X2PQ7CkDgDTqAFSQSFaWhqz38fwwnH24C415pzm5hp6UjY0fC
 ppqgsxZ42YQ8N3YgjPscpQ698A==
X-Google-Smtp-Source: ABdhPJyhl4rnIDo8s67BBa3FpOq8w2dJxJWsiwIIUG7H8BtsauFJhUGPnqaQiD8vEe7kDCDAYjmyEw==
X-Received: by 2002:adf:df89:: with SMTP id z9mr7260671wrl.336.1636449572025; 
 Tue, 09 Nov 2021 01:19:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m2sm1901543wml.15.2021.11.09.01.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:19:31 -0800 (PST)
Date: Tue, 9 Nov 2021 10:19:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/2] drm/tegra: Use drm_dp_aux_register_ddc/chardev()
 helpers
Message-ID: <YYo9IXjevmstSREu@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Thomas Graichen <thomas.graichen@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20211107230821.13511-1-digetx@gmail.com>
 <20211107230821.13511-2-digetx@gmail.com>
 <YYk/jfcceun/Qleq@phenom.ffwll.local>
 <0a2c02ae-3fe1-e384-28d3-13e13801d675@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a2c02ae-3fe1-e384-28d3-13e13801d675@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: David Airlie <airlied@linux.ie>,
 Thomas Graichen <thomas.graichen@gmail.com>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 08, 2021 at 09:16:07PM +0300, Dmitry Osipenko wrote:
> 08.11.2021 18:17, Daniel Vetter пишет:
> > On Mon, Nov 08, 2021 at 02:08:21AM +0300, Dmitry Osipenko wrote:
> >> Use drm_dp_aux_register_ddc/chardev() helpers that allow to register I2C
> >> adapter separately from the character device. This fixes broken display
> >> panel driver of Acer Chromebook CB5-311 that fails to probe starting with
> >> v5.13 kernel when DP AUX registration order was changed. Tegra SOR driver
> >> is never probed now using the new registration order because tegra-output
> >> always fails with -EPROBE_DEFER due to missing display panel that requires
> >> DP AUX DDC to be registered first. The offending commit made DDC to be
> >> registered after SOR's output, which can't ever happen. Use new helpers
> >> to restore the registration order and revive display panel.
> > 
> > This feels a bit backward, I think the clean solution would be to untangle
> > the SOR loading from the panel driver loading, and then only block
> > registering the overall drm_device on both drivers having loaded.
> 
> Sounds impossible.
> 
> 1. DRM device can be created only when all components are ready, panel
> is one of the components.

Nope. drm_device can be instantiated whenever you feel like.
drm_dev_register can only be called when it's all fully set up. Absolutely
nothing would work if drm_device wouldn't support this two-stage setup.

So sequence:

1. drm_dev_init

2. bind sor driver

3. create dp aux ddc

4. bind panel

5. yay we have everything, drm_dev_register

This should work, and it's designed to work like this actually. You
couldn't write big complex drivers otherwise.
-Daniel

> 
> 2. SOR driver is controlling panel and programs h/w based on panel presence.
> 
> 3. Panel can't become ready until DP AUX DDC is created.
> 
> 4. DP AUX DDC can't be created until DRM device is created.
> 
> 5. Go to 1.
> 
> Even if there is an option to somehow rewrite Tegra DRM driver to
> accommodate it to the desired driver model, it won't be something
> portable to stable kernels.
> 
> > This here at least feels like a game of whack-a-mole, if like every driver
> > needs its own careful staging of everything.
> 
> That is inevitable because each hardware design is individual.

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
