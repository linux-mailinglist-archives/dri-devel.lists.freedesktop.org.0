Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F9C69467F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 14:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B79C10E5AF;
	Mon, 13 Feb 2023 13:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E5610E5AF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 13:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676293536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OYkTV4tyLAcRG/rU/+4tGzBQIIPIsZ3hjAeuxGShtI0=;
 b=bYEeZDrYXgZyTSI/uY/LEC0WLAG4eVLkZvXhz2oUZnBpiM7WW4/xpyyYrUjqiwOgo7ij2L
 cHS9qlthIOLVCj9/iImAvF4STIj7wFhwTeBYyOGhJX57jbmMSdsMghQ0RFmkalR49z2IPl
 daPcRgyGULxBhJzTQbXdcWgS3+ACAzQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-9Qhg0G6YNU-TYMeciFZyPQ-1; Mon, 13 Feb 2023 08:05:35 -0500
X-MC-Unique: 9Qhg0G6YNU-TYMeciFZyPQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 u10-20020a5d6daa000000b002bfc2f61048so2416315wrs.23
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 05:05:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OYkTV4tyLAcRG/rU/+4tGzBQIIPIsZ3hjAeuxGShtI0=;
 b=ukqpNs0ZP/FRgevux36N5bFvtd35EoaPZz6vpvMCUl1SafprxTWxFNm7ll5SUNjQzN
 EcD8cm6xmdDWDixfxoiHrw0aSmoE9J5S8RcVvzwYpcFbWdwgfCIywtbpNb7XYu0G7q01
 CX9i+ryt6S+U3zb1Iuobs8UDKQtP55yaZkrasRG4wy5csUCUAHG1lU5NJoTXLIcLMCwZ
 APERr9mmJ030Ej1i1hFJgThiyydw/dSzoIeEvi1yJc7gigziz5VWz0l6HRdP7Ex34NZP
 W19y3sKb6fy5iBNDEoheXvfnXeA1G9uw2FsDu0OBiD/r+9TjhvBMaZev94FWx4gVoPBm
 bvyw==
X-Gm-Message-State: AO0yUKXF9SZp0GKFAVYoDcS9xRzGnexFGN/aKbg0LbSxR+UGGE2A7b2S
 m+J2uO03ZCo2n9LrSmquP9tIxU4WPbylSG58M57bPCLqtOITnesOzFp4JtTGXSjoQbMRW+BjR/c
 sAD6MNXa/BoylkbWkZqt+4LVwz9mL
X-Received: by 2002:a05:600c:16c5:b0:3d6:ecc4:6279 with SMTP id
 l5-20020a05600c16c500b003d6ecc46279mr19035306wmn.27.1676293534253; 
 Mon, 13 Feb 2023 05:05:34 -0800 (PST)
X-Google-Smtp-Source: AK7set8FPuXkfVk83D9UQRYyECQ/K1rXbN2t+4k28Kku0b12C+mK4WR0jl69pa62ChZt11IwVmoBDA==
X-Received: by 2002:a05:600c:16c5:b0:3d6:ecc4:6279 with SMTP id
 l5-20020a05600c16c500b003d6ecc46279mr19035293wmn.27.1676293534095; 
 Mon, 13 Feb 2023 05:05:34 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k12-20020a7bc40c000000b003dfe549da4fsm16701912wmi.18.2023.02.13.05.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 05:05:33 -0800 (PST)
Message-ID: <f8ec5586-7ac1-be33-76d8-48b62c253465@redhat.com>
Date: Mon, 13 Feb 2023 14:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/4] Revert "drm/vc4: hdmi: Enforce the minimum rate at
 runtime_resume"
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230126-rpi-display-fw-clk-cleanup-v1-0-d646ff6fb842@cerno.tech>
 <20230126-rpi-display-fw-clk-cleanup-v1-4-d646ff6fb842@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230126-rpi-display-fw-clk-cleanup-v1-4-d646ff6fb842@cerno.tech>
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
> This reverts commit ae71ab585c819f83aec84f91eb01157a90552ef2.
> 
> Commit ae71ab585c81 ("drm/vc4: hdmi: Enforce the minimum rate at
> runtime_resume") was introduced to work around an issue partly due to
> the clk-bcm2835 driver on the RaspberryPi0-3.
> 
> Since we're not using that driver for our HDMI clocks, we can now revert
> it.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

