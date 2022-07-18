Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A79577E68
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 11:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE6EAE19E;
	Mon, 18 Jul 2022 09:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57813AE19C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 09:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658135617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4YHQhKuUA0qrCJAM8mGzKA3vSJV63FUpFph/DNHn0yI=;
 b=OlNWX8jDvNZcDMyEdyByJ+X/kWiSSORvqyyTn3iSZSUgI2GPZ21155EcF81/IXhhssMlD5
 k1v1zC0StlYosqQQQI3U2t3tAMbiEE3T/uIcvCxDK1+E1XF2E7/Y+oUVEE3BZ46tyfEGzZ
 L5wpzIYR/uHl+6ZbW2sTLEaTdrE93+M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-DN2rRaSfN8yz4dZmSp8g9g-1; Mon, 18 Jul 2022 05:13:35 -0400
X-MC-Unique: DN2rRaSfN8yz4dZmSp8g9g-1
Received: by mail-wm1-f71.google.com with SMTP id
 i132-20020a1c3b8a000000b003a2fe4c345cso5314681wma.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 02:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4YHQhKuUA0qrCJAM8mGzKA3vSJV63FUpFph/DNHn0yI=;
 b=SX0z/c7WPKKJhmmS5z9yXeGq9XKSEZ8vEgbPjVy6gOhXQQQgC6mGGJgSJBZWuDzetP
 uti80Q8zRVdRik8XtwOy495POIXJSlghZ9rFfvBLtvI97XT+fZNhRKpOaWK4ZUM7Pfpf
 uG16hBTj2FooGMSP1NtkVPZPEtjVtTiraDlI0cMHjfou3Hg2Aw6afjU6+jLUqg+2nTld
 NX5ZI4W1bAG/e6hfpa81e0k2juePkDBY5OufliCaGp9N1rf538ZrMDQ08qDAdhvqqy8B
 lL+ycETTiV/W+FxGYtTzhyMW5Lc3dvb1lHu/DE26FkonuCpzj9fonQbL+kgqo1JowYhf
 irIQ==
X-Gm-Message-State: AJIora9mVh1CcyT10xWY/LWw24rrGWSI+8cSat+mg4rGxrmDe0ft2/uY
 zaaXSK6GNIRgzjc0wNPaULl5NVcVix6OUdyDp2x1ffzp2DJfrRj1y8jsLMH6gXeCJ6U30HkdwIP
 DU0WC0lEfkkze7OKxTtmVkqJIx3Wp
X-Received: by 2002:a5d:4608:0:b0:21d:a5b4:20a2 with SMTP id
 t8-20020a5d4608000000b0021da5b420a2mr22836802wrq.276.1658135614606; 
 Mon, 18 Jul 2022 02:13:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sY83c0sHrS2e/KcEsqINyTA830XmFnkM/jxp3KNTu3FfpHmVEOdL2BvxlQ9J3l/YdhyW/QNQ==
X-Received: by 2002:a5d:4608:0:b0:21d:a5b4:20a2 with SMTP id
 t8-20020a5d4608000000b0021da5b420a2mr22836776wrq.276.1658135614382; 
 Mon, 18 Jul 2022 02:13:34 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c358900b003a319bd3278sm4261037wmq.40.2022.07.18.02.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 02:13:33 -0700 (PDT)
Message-ID: <51214426-a893-cac3-b984-97688838c896@redhat.com>
Date: Mon, 18 Jul 2022 11:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/ssd130x: Use new regmap bulk write support to drop
 custom bus
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220618174338.2253021-1-javierm@redhat.com>
 <YrYSd5x1JKJJeklJ@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YrYSd5x1JKJJeklJ@ravnborg.org>
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam,

On 6/24/22 21:37, Sam Ravnborg wrote:
> Hi Javier,
> 
> On Sat, Jun 18, 2022 at 07:43:38PM +0200, Javier Martinez Canillas wrote:
>> Data writes for the ssd130x 4-wire SPI protocol need special handling, due
>> the Data/Command control (D/C) pin having to be toggled prior to the write.
>>
>> The regmap API only allowed drivers to provide .reg_{read,write} callbacks
>> to do per register read/write, but didn't provide a way for drivers to do
>> the same for bulk read/writes.
>>
>> For this reason, a custom regmap bus was used by the driver just to define
>> a bulk write callback that implements the D/C pin toggling. But the regmap
>> API has been extended to support defining bulk read/write handlers, so the
>> custom regmap bus is not needed anymore and could just be dropped.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Patch looks good, but obviously needs the dependencies sorted out.
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>

Thanks. The regmap fixes that were the dependencies landed in v5.19-rc4
and drm-misc-next is already at v5.19-rc6, so I'll push this patch now.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

