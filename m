Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC984FD2D3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 10:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C667E10FEFE;
	Tue, 12 Apr 2022 08:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF19E10FEFE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 08:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649750875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c1YyOBaSlUAB1FecJdXpHWi3Q4lLTndl19zr2Spu2No=;
 b=eRdoo+y+hlBPwFuOePOY7KPDNS1muoytKvzxkWfK3R+LLM9GNbUhr/TaIqCa0/fjr91+s+
 IZwFYrPEYnlT7XQ6H3y9Mdz5YXJG121ksTRaW9B/Jg4QxR0Zy0BRC286pCmzM4G8s7Iq+q
 fGzb76fKUWw4XEoCon+tcgy2e5QoKds=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-Y9_p0mIpNNa8FA6kOV6gxA-1; Tue, 12 Apr 2022 04:07:54 -0400
X-MC-Unique: Y9_p0mIpNNa8FA6kOV6gxA-1
Received: by mail-wm1-f69.google.com with SMTP id
 o35-20020a05600c512300b0038e83a52c71so5646675wms.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 01:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c1YyOBaSlUAB1FecJdXpHWi3Q4lLTndl19zr2Spu2No=;
 b=tuHl0IDkmXFy2lf3UGBEwVKQIsY02jODnyECFM4WGQ9PuyLL/FdlOKhW8ZnQGpJJxo
 oopZzofwQxHOuVDJBs5bK4UqFHcmuzXddLig0CzE3jdcox62s0jyJJzwlHHZIWmHtqcN
 qDM+I5BLrdeVuYHpHACVuL10hTouCUNYBOB3mGL/Jwj1rI9aJEv/UiJP/xmp/PNbl3Xl
 jSsRQF9OG+c2Qs83pCtiuIuvC157CiB1UCg+Ch4J4M09Ffstvw6t5v9hT5B76fYN9iXl
 lconwbDj08gKSf+nQAe35WCFa1u41U/BUHnRGuyW1Di2E9Fv8g7m/Z84f4+NNsifPqrU
 1BkQ==
X-Gm-Message-State: AOAM5336h2TNBM5E09OH+1u2ReMQIngV5EDZlaAjWsJKTAHcXtwqYhGX
 gRXNv0CpQSnf6vlRf7IgSkT0d/RfozJahGiOK6SFV0scklRx/RVGhB2fJd1SlM5z0ff8qzn4Wss
 3Fe0AwlDr/vfi+VIbehhrRFiAtXZm
X-Received: by 2002:a05:600c:3487:b0:38c:9a42:4d49 with SMTP id
 a7-20020a05600c348700b0038c9a424d49mr2952292wmq.29.1649750872749; 
 Tue, 12 Apr 2022 01:07:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDglW+gKXgj96dHt92B2SeHkQs0c4KFSOD9iFaRTxgb+0c2t9/xh8a8ox8ht2X97EXHVi9og==
X-Received: by 2002:a05:600c:3487:b0:38c:9a42:4d49 with SMTP id
 a7-20020a05600c348700b0038c9a424d49mr2952269wmq.29.1649750872365; 
 Tue, 12 Apr 2022 01:07:52 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037fa93193a8sm1922805wmp.44.2022.04.12.01.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 01:07:51 -0700 (PDT)
Message-ID: <6be74110-a65b-7b77-ceac-9da640964ba0@redhat.com>
Date: Tue, 12 Apr 2022 10:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 5/5] drm/solomon: Add SSD130x OLED displays SPI support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-6-javierm@redhat.com>
 <CAMuHMdWsmtBdcV=LL4yqprtbum4f9cSu8orjoPACECa5QENmsg@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdWsmtBdcV=LL4yqprtbum4f9cSu8orjoPACECa5QENmsg@mail.gmail.com>
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
Cc: Chen-Yu Tsai <wens@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/12/22 09:31, Geert Uytterhoeven wrote:

[snip]

>> +
>> +       t->spi = spi;
>> +
>> +       t->dc = ssd130x_spi_get_dc(&spi->dev);
>> +       if (IS_ERR(t->dc))
>> +               return PTR_ERR(t->dc);
> 
> This can be simplified (no need for the PTR_ERR(ERR_PTR(...) dance)
> by open-coding ssd130x_spi_get_dc() here.
>

Right, that will be better indeed.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

