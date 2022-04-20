Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE376508E00
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 19:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7C410E0B0;
	Wed, 20 Apr 2022 17:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED2F10E0B0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 17:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650474427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sIGAZ2jDx0+plLAU0u/SeCd0hHr+BEblc6NaGFEJosU=;
 b=e53KAnzsKlgOYalpzQMpff9ouXhngOrzImizEufS2SUCLPuq1VJswFshUJJbUDmDj0s2/a
 iXnTJpsY/ecyBdj2sv9cmcgehbBMf8dAjnoKrZdMHgHga3u5HtfaTFJ5vch0+JMKeCt79A
 pA2RcqRYc7pUL8ZnzLnzkIs3YyD9gME=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-k0Y54zYWNhGl9ws24nRjHQ-1; Wed, 20 Apr 2022 13:07:06 -0400
X-MC-Unique: k0Y54zYWNhGl9ws24nRjHQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 d13-20020a05600c3acd00b0038ff865c043so3205912wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 10:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sIGAZ2jDx0+plLAU0u/SeCd0hHr+BEblc6NaGFEJosU=;
 b=x0ssGSzM4/ks3/dbm5whR+X6CSCdldHXkNSH+vWVK/X0sEhqFzAXYX5QqJqckA6YpD
 k2zXMsJVkwa+KVwoSVD0fSiV2gA0qjNWGFpH2G9SjvtuZJg/QJs96/eOXwfTYBwaXUhz
 p+hqZaIXeUCnpvXNRS3IQhLRzfG7kZEhEg9OOZH2pBNtI+g0GLTwL1lgIIaOakL+10iC
 +2B3XEuCdPGxr5/WItV0tjm+o4Mh1hkhC969QJRZYLrKo8R78O3fW+Tke8DyYSMuQOcd
 SreEx3Hu1/02dsjLmOiYKAKGc0llok75oQ5KhXU1CC0rnMJlDz9sN92SOnS4/h9qa4AQ
 z7JQ==
X-Gm-Message-State: AOAM530X6Us5uhYmTVkHH+61ZaaCr0WN1tFyOt6O/M71uTPGoeWz5p5q
 bZKM2aWT7+O+g2SUNIMibomjszIGCYadADkKGVc4ZszSJH5xMun+vz0/IifJyXuWIvC36GWLS5A
 PU9LEvx0qgDrtOcMPMnpBdGuxXqVA
X-Received: by 2002:a5d:64e3:0:b0:20a:87e9:7daa with SMTP id
 g3-20020a5d64e3000000b0020a87e97daamr16098292wri.345.1650474424991; 
 Wed, 20 Apr 2022 10:07:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3MIyuxXwjwVhUfrLMlnJtSGK9dUr6TOQYH9h8BXvsaW7w93EPZQsN3TpA9+R76BikV8V0mw==
X-Received: by 2002:a5d:64e3:0:b0:20a:87e9:7daa with SMTP id
 g3-20020a5d64e3000000b0020a87e97daamr16098268wri.345.1650474424736; 
 Wed, 20 Apr 2022 10:07:04 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d6c63000000b0020a94e82a3dsm323301wrz.64.2022.04.20.10.07.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 10:07:04 -0700 (PDT)
Message-ID: <dc30b2b9-d444-8a3b-59d9-f38c609dd978@redhat.com>
Date: Wed, 20 Apr 2022 19:07:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 0/5] drm/solomon: Add SSD130x OLED displays SPI support
To: linux-kernel@vger.kernel.org
References: <20220419214824.335075-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220419214824.335075-1-javierm@redhat.com>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/19/22 23:48, Javier Martinez Canillas wrote:
> Hello,
> 
> This series adds a ssd130x-spi driver that provides a 4-wire SPI transport
> support for SSD130x OLED controllers that can be accessed over a SPI bus.
> 
> The driver is quite similar to existing ssd130x-i2c driver that is used by
> I2C controllers, but there is a difference in the protocol used by SSD130x
> depending on the transport used. The details are in patch #4 description.
> 
> Patch #1 just makes the current ssd130x-i2c compatible strings in the DT
> binding to be deprecated, and add new ones that don't have an "fb-i2c".
> 
> Patch #2 extends the DT binding with the properties needed to support SPI.
> 
> Patch #3 adds the new compatible strings to the OF device ID table in the
> ssd130x-i2c DRM driver and deprecate the old ones.
> 
> Patch #4 moves the device info for the different SSD130x variants from
> the ssd130x-i2c transport driver to the ssd130x core driver.
> 
> Finally patch #5 adds the ssd130x-spi DRM driver for the OLED controllers
> that come with a 4-wire SPI interface, instead of an I2C interface.
> 
> This is a v5 that addresses the issues pointed out in v4.
> 
Pushed this series to drm-misc-next after adding Rob's Reviewed-by
tags to patch 1/5 and 2/5, since I missed that in v5. Thanks all!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

