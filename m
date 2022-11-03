Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873A9617BF2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 12:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C8810E5D8;
	Thu,  3 Nov 2022 11:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1449110E5DD
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 11:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667476398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v84JZEMOTpneHRjU+4aahq00pj4cEi9BPmEyqyDwNuI=;
 b=Tydubu4eDB+HzdnqYqKcKCVwi/yA2MdR/EyH3xnbdUcWgmCqi2Mm3KzSKJAe9iuAJLR+xY
 4XWB62lENQ/TYFo/XyBFn2piMOjMi1hlqvjzyRe37jIPIqHia6xeVEg7maJkCyO5X4EGD8
 9o5Jp3i8dG1/epLbOvNxYdo9NYx/qL0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-30-88zU1SztO_u_0Agds53AIQ-1; Thu, 03 Nov 2022 07:53:17 -0400
X-MC-Unique: 88zU1SztO_u_0Agds53AIQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 r22-20020adfa156000000b0023660e969ddso403611wrr.19
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 04:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v84JZEMOTpneHRjU+4aahq00pj4cEi9BPmEyqyDwNuI=;
 b=wFSiDQC7H7NGYZs3r4f3rXFwkG/CUkd94mJHnQPtkLtT6eqhUl1rnh+1x5DbfvWxVB
 IDxbT5o9e6KKSEN9gvCBC+F5HYVXNuayTQVOmkz+VQ8WIJ9XUmzkToGa1iG2jDLmAzt2
 WgQ9Yl+c01EgwbpTvNLeYrpQnw2xTwII0HKDJXRId/wF2wPGsddHvM/yP3dL+spe8cjE
 bYr2Uarjh01eUSPc/0b181mbtUB0bpdpNnnc6qPWsSaXWWL2wke19hp5qNKXubLZdT5l
 lWom/13nkZFcs4Ugt0/HZkoK4jUo1HYmH7v1hucbwzEjC6Oo+dPVDedCPn/31OYczkRX
 jQNg==
X-Gm-Message-State: ACrzQf0WAHmWFMonQajvsA5racMFVhzNRgvDkABIjP7f2NjlhUVOpuCx
 AIvLJpp7JQwkLCXhF96xAFIcVvNdsRoMT8M9RHvZ8dtwrtHJKU0Tn+YM3YGoUsZRhTud6d6iVec
 WEWUcF7hbFqiHUgJZBuDd4nT91FkJ
X-Received: by 2002:adf:e446:0:b0:236:773b:c6f0 with SMTP id
 t6-20020adfe446000000b00236773bc6f0mr18747864wrm.55.1667476396417; 
 Thu, 03 Nov 2022 04:53:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7tg9WlNqpEeBsorrVmfpoW8aMy3ZwDl4qGsf1OwV7SMXeHd0xrPDtiVhqzBhDK3nBqxF0o6A==
X-Received: by 2002:adf:e446:0:b0:236:773b:c6f0 with SMTP id
 t6-20020adfe446000000b00236773bc6f0mr18747848wrm.55.1667476396133; 
 Thu, 03 Nov 2022 04:53:16 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bg41-20020a05600c3ca900b003a3170a7af9sm1167582wmb.4.2022.11.03.04.53.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 04:53:15 -0700 (PDT)
Message-ID: <c9064cc6-2a9d-1094-53fb-cf56f9cbf191@redhat.com>
Date: Thu, 3 Nov 2022 12:53:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] drm: rcar_du: DRM_RCAR_DU optionally depends on
 RCAR_MIPI_DSI
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20221018181828.19528-1-rdunlap@infradead.org>
 <a68a24a0-eda3-8711-21c1-334289eca0d3@infradead.org>
 <166747314442.3962897.9754510086268412956@Monstersaurus>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <166747314442.3962897.9754510086268412956@Monstersaurus>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Kieran,

On 11/3/22 11:59, Kieran Bingham wrote:
> Hi Randy,
> 
> Quoting Randy Dunlap (2022-11-03 06:06:45)
>> ping. I have verified (on linux-next-20221103) that this is still needed.
>> Thanks.
>>
>> On 10/18/22 11:18, Randy Dunlap wrote:
>>> When CONFIG_DRM_RCAR_DU=y and CONFIG_DRM_RCAR_MIPI_DSI=m, calls
>>> from the builtin driver to the mipi driver fail due to linker
>>> errors.
>>> Since the RCAR_MIPI_DSI driver is not always required, fix the
>>> build error by making DRM_RCAR_DU optionally depend on the
>>> RCAR_MIPI_DSI Kconfig symbol. This prevents the problematic
>>> kconfig combination without requiring that RCAR_MIPI_DSI always
>>> be enabled.
>>>
>>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
>>> rcar_du_crtc.c:(.text+0x3a18): undefined reference to `rcar_mipi_dsi_pclk_enable'
>>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
>>> rcar_du_crtc.c:(.text+0x47cc): undefined reference to `rcar_mipi_dsi_pclk_disable'
>>>
>>> Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence")
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>> Cc: LUU HOAI <hoai.luu.ub@renesas.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: linux-renesas-soc@vger.kernel.org
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> ---
>>>  drivers/gpu/drm/rcar-du/Kconfig |    1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff -- a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
>>> --- a/drivers/gpu/drm/rcar-du/Kconfig
>>> +++ b/drivers/gpu/drm/rcar-du/Kconfig
>>> @@ -4,6 +4,7 @@ config DRM_RCAR_DU
>>>       depends on DRM && OF
>>>       depends on ARM || ARM64
>>>       depends on ARCH_RENESAS || COMPILE_TEST
>>> +     depends on DRM_RCAR_MIPI_DSI || DRM_RCAR_MIPI_DSI=n
> 
> Please forgive my ignorance, but I don't understand how this works.
> Could you explain what this is doing please?
> 
> I know you've explained above that it fixes it to optionally depend on
> DRM_RCAR_MIPI_DSI ... but it's not making sense to me.
> 
> To me - this is saying we depend on DRM_RCAR_MIPI_DSI being enabled, or
> not being enabled ... ? Which is like saying if (0 || 1) ?
> 
> I'm guessing I'm missing something obvious :-S
>

What this Kconfig expression is saying is that it depends on DRM_RCAR_MIPI_DSI=y
if DRM_RCAR_DU=y and DRM_RCAR_MIPI_DSI=m if DRM_RCAR_DU=m. But that the it can
also be satisfied if is not set DRM_RCAR_MIPI_DSI.

This is usually used to make sure that you don't end with a configuration where
DRM_RCAR_MIPI_DSI=y and DRM_RCAR_DU=m or DRM_RCAR_MIPI_DSI=m and DRM_RCAR_DU=y.

Randy, I think that it's more idiomatic though to it express as following:

depends on DRM_RCAR_MIPI_DSI || !DRM_RCAR_MIPI_DSI

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

