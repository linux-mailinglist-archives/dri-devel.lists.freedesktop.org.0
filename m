Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FEC69466D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 13:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE7B10E5AE;
	Mon, 13 Feb 2023 12:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6048310E5AE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 12:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676293150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sr32W6YPmd1W7Q3/7hIKrP1sIec4jf+zMzMaG9iU4Ts=;
 b=Aob1D3zy8JGLXR/fXMYYBsX7WQysut1HH3t4ZCvVkzCg6DJZ9/r8cYYvSzLUkY1kocJvk0
 WXJLSeRHxQ4CzrW27Q8WiNllEWerJeLvh4kbjtRtnrQnkYssKmvIwanZyHt4KoC46o/VfR
 rTHrPCpal+62owGa8xe0cfa+sRYC8rs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-359-vHB3cdPMPcenZVTW-tQ9zw-1; Mon, 13 Feb 2023 07:59:09 -0500
X-MC-Unique: vHB3cdPMPcenZVTW-tQ9zw-1
Received: by mail-wm1-f70.google.com with SMTP id
 iz20-20020a05600c555400b003dc53fcc88fso6805516wmb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 04:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sr32W6YPmd1W7Q3/7hIKrP1sIec4jf+zMzMaG9iU4Ts=;
 b=JgNI/KlsopB1/LEqcY5keLtPaCKuMApYXzahve3WH6gunIjTVlkEqJ9S+eFJjAiRqj
 VJ/xl8WlzeVefGlGOHX1PwMxKMfSBpHmZseVQp0pY8+hRzN6+IybSYVbiNd/KQ5oVf7P
 ofQjQ0yJ/E01WDnlnk0p6XNqqs04BDyko47xjS21gXG0phJachW2rtWk91sR6J+NZ4BZ
 qL3MJ1NdFz94qYXt3HJQRYwbyovayrUPK7cFngetEm3+82iMKqzT1n5aUr3qKxp7lOMR
 RvPKw5eRLbKxWqEMQmPxxfh+8RGUqI+xEsmLZMTK5PcUkGTLT0Rnd1nejAaqk1zbfvOn
 nXZA==
X-Gm-Message-State: AO0yUKWJcFv+0zmJet+rHbLsKrUT5p3ZKrL3PdmWUGDn9RJ2buKlnQKy
 5f946YxC+q5iQamjuSZgAbi/WYF9b2z5b6pCt5sjkZQ7ZYDPxa4FBgv3VQGMZfaAIL4X6YO9YBT
 JyOMKubewFzRx6LAnv4VzXNPBdwapLnbQSw==
X-Received: by 2002:a05:6000:124e:b0:2c5:5454:22f5 with SMTP id
 j14-20020a056000124e00b002c5545422f5mr4041006wrx.54.1676293147856; 
 Mon, 13 Feb 2023 04:59:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+2CfSs0HvvE0g5xn98FoymHYlVBVN/pq+asF2ZXlqjZN8eHrzya9X+exWrdVF5/TFVr4zoTw==
X-Received: by 2002:a05:6000:124e:b0:2c5:5454:22f5 with SMTP id
 j14-20020a056000124e00b002c5545422f5mr4040988wrx.54.1676293147637; 
 Mon, 13 Feb 2023 04:59:07 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t9-20020adfeb89000000b002be0b1e556esm10382182wrn.59.2023.02.13.04.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 04:59:07 -0800 (PST)
Message-ID: <d6b158ff-382c-c659-04c8-930b2681e8d6@redhat.com>
Date: Mon, 13 Feb 2023 13:59:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/4] drm/vc4: hdmi: Enable power domain before setting
 minimum
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230126-rpi-display-fw-clk-cleanup-v1-0-d646ff6fb842@cerno.tech>
 <20230126-rpi-display-fw-clk-cleanup-v1-2-d646ff6fb842@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230126-rpi-display-fw-clk-cleanup-v1-2-d646ff6fb842@cerno.tech>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/23 18:05, Maxime Ripard wrote:
> On the RaspberryPi0-3, the HSM clock was provided by the clk-bcm2835
> driver, but on the Pi4 it was provided by the firmware through the
> clk-raspberrypi driver.
> 
> The clk-bcm2835 driver registers the HSM clock using the
> CLK_SET_RATE_GATE flag that prevents any modification to the rate while
> the clock is active.
> 
> This meant that we needed to call clk_set_min_rate() before our call to
> pm_runtime_resume_and_get() since our runtime_resume implementation
> needs to enable the HSM clock for the HDMI controller registers to be
> functional.
> 
> However, the HSM clock is part of the HDMI power domain which might not
> be powered prior to the pm_runtime_resume_and_get() call, so we could
> end up changing the rate of the HSM clock while its power domain was
> disabled.
> 
> We recently changed the backing driver for the RaspberryPi0-3 to
> clk-raspberrypi though, which doesn't have such restrictions. We can
> thus move the clk_set_min_rate() after our call to runtime_resume and
> avoid the access while the power domain is disabled.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

I'm not familiar with the RPi clock hierarchy but the commit message explains
why a clk_set_min_rate() was needed before the pm_runtime_resume_and_get(),
and why that isn't needed anymore after the switch to clk-raspberrypi driver.

And certainly, the correct thing to do is to enable the power domain that a
controller is part of, before attempting to change the rate for one of its
clocks. So the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

