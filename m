Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014F74AF74C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A9610E3A7;
	Wed,  9 Feb 2022 16:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CBE10E3A7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644425810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NF4y/kDlFrpmc3X7z6yz1NwYmNGUE/++zNAflGm554Q=;
 b=c/yveXtyQjsP1Vr4CnpRUKzVErgpvsoX+d4d3xZo6GiBnhlQaEaiQxHrbW2eTrOj5orDTp
 03Adyynw91B1YNMmLz5WBalPBw2KZcurJViT4niZ2620ego/e6x24FcSioTvykdzlWnXOc
 ZHpSzLsIQtldRzirNW++1tiHQn0VtF4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-7dki_ObOOnSopqH3er_Rfw-1; Wed, 09 Feb 2022 11:56:44 -0500
X-MC-Unique: 7dki_ObOOnSopqH3er_Rfw-1
Received: by mail-wm1-f69.google.com with SMTP id
 p2-20020a05600c430200b0037bb72b5865so280027wme.8
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 08:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NF4y/kDlFrpmc3X7z6yz1NwYmNGUE/++zNAflGm554Q=;
 b=lXAjIX+8ymZ6KtaAw2obbBgGUdOWAu+mDv9zjXDxVNNMKx5UEA1sKu1kNEJQXpvXoH
 KlVNeVM+CZyz1ViwRtUEenLzuk/6e4Yrnm85LrsX/xeAubKlQ554lw+EvfednBTNlGqP
 0oGDizWnYaUH6nVweLmgZhUL64wkdx8GPVTKhTGBRDp6IjnYpPg13tNhAGnPJAwlaYl+
 3jJHfh/z+7oY0kFm3kSrnrZR8pq8mO1eYjZisGIW3a1iw78nay5gP6aNEVA/LtHoCg6Z
 GN5FMtkMeMww6nQElq3EPWnr+leEXjLHFSH2IemCJv4uX1Skatz6glaUKLjI3jBpUXR8
 /FMA==
X-Gm-Message-State: AOAM533PID4qAVQh1T91k+xCLEk3Si+twijHZ5NDSXFggAQm2MqZZKCS
 j4wHHfjf48HTCFzbtBoN2eqRXvidF4OPPpWmL3Rwsyrj5kTppRl3rLbIF0Kpclz7GZ5O+aWLU95
 40zhkgzGp8RID+RFnL3TPO0Ygw2VB
X-Received: by 2002:adf:eed0:: with SMTP id a16mr2962480wrp.111.1644425802941; 
 Wed, 09 Feb 2022 08:56:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzinGZKjDeX2e13vtBZIJDB6Ck7kPmvDuXfLhGPTUgL7ZxsGDbolfCOb1HhpSRjf+ktdR1Trw==
X-Received: by 2002:adf:eed0:: with SMTP id a16mr2962461wrp.111.1644425802702; 
 Wed, 09 Feb 2022 08:56:42 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o16sm4822975wrn.87.2022.02.09.08.56.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 08:56:42 -0800 (PST)
Message-ID: <b8ec21bc-91d4-0f41-2500-db712819fae3@redhat.com>
Date: Wed, 9 Feb 2022 17:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 5/7] (WIP) drm/solomon: Add SSD130X OLED displays SPI
 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209091204.2513437-1-javierm@redhat.com>
 <CAMuHMdWSDBjpYJv6JtgvyaKiFKh_eqbvH78TR6VBtpDeFJvqFQ@mail.gmail.com>
 <YgPbAL0I8Wn7nnNb@smile.fi.intel.com>
 <d32c731b-c06f-2dcb-5a6d-1a84351719b2@redhat.com>
 <CAMuHMdXsAyp18ivtSe-ZVmu6xbBBnvjMuZ=H1w9Gk=Ys4rkCeg@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdXsAyp18ivtSe-ZVmu6xbBBnvjMuZ=H1w9Gk=Ys4rkCeg@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for the long reply but I don't really know how to make it shorter.

On 2/9/22 17:25, Geert Uytterhoeven wrote:
> Hi Javier,

[snip]

>> Did you see my comment about automatic module loading ? I think
>> that would be an issue if we use the same compatible for both
>> I2C and SPI drivers.
> 
> We have several drivers that have a core and separate i2c and spi
> wrappers, see e.g.
> 
> $ git grep -w ltc2947_of_match
> drivers/hwmon/ltc2947-core.c:const struct of_device_id ltc2947_of_match[] = {
> drivers/hwmon/ltc2947-core.c:EXPORT_SYMBOL_GPL(ltc2947_of_match);
> drivers/hwmon/ltc2947-core.c:MODULE_DEVICE_TABLE(of, ltc2947_of_match);
> drivers/hwmon/ltc2947-i2c.c:            .of_match_table = ltc2947_of_match,
> drivers/hwmon/ltc2947-spi.c:            .of_match_table = ltc2947_of_match,
> drivers/hwmon/ltc2947.h:extern const struct of_device_id ltc2947_of_match[];
> 
> Are they all broken?
>

It doesn't have an easy answer. It depends on what device ID tables have to
match, what modalias are present in the kernel modules and for what buses
are since not all subsystem reports the modalias uevent in the same manner.

Let's take this particular driver for example, the module aliases are the
following for each kernel module:

$ modinfo drivers/hwmon/ltc2947-core.ko | grep alias
alias:          of:N*T*Cadi,ltc2947C*
alias:          of:N*T*Cadi,ltc2947

$ modinfo drivers/hwmon/ltc2947-i2c.ko | grep alias
alias:          i2c:ltc2947

$ modinfo drivers/hwmon/ltc2947-spi.ko | grep alias
alias:          spi:ltc2947

The DT node will just contain a node with compatible = "adi,ltc2947", and
depending if the device is on a I2C or SPI bus, the OF subsystem will do
a device registration with the proper bus_type.

If is SPI, the subsystem always report a modalias uevent of the type
"spi:ltc2947", even if the device was registered by OF. So for SPI the
proper module will be loaded since it contains an alias "spi:ltc2947".

But I2C does report a proper OF modalias, so it will report instead
"of:N*T*Cadi,ltc2947" which will match the core module but not the I2C.

The I2C ltc2947-i2c.ko module is missing a "of:N*T*Cadi,ltc2947" alias
and the module loading likely isn't working and needs to be done manually.

Conversely, if ltc2947-spi.ko only add "of:N*T*Cadi,ltc2947", then the
automatic module loading wouldn't work because the modalias uevent will
be "spi:ltc2947" which won't match "of:N*T*Cadi,ltc2947". So everything
is really fragile.

Note also that the "T*" in the alias, that's to denote the device type
according to the ePAPR spec but that's only filled in the DT node has a
device_type DT property, and most DT nodes don't fill this.

So the driver module is greedy and will match any device type. And also
the modalias reported by the kernel won't set this, i.e:

$ cat /sys/bus/i2c/drivers/ssd130x-i2c/1-003c/modalias 
of:NoledT(null)Csolomon,ssd1306fb-i2c

The only way I found to make this robust and always working is with each
driver to define its own tables depending on what is used to match and
report the modalias to user-space. That means having an of_device_id and
spi_device_id (just for modalias reporting and alias table in module) for
SPI and a of_device_id table for I2C and platform devices.

And also having different compatible strings with a "-i2c" and "-spi" as
suffixes to allow kmod / udev to differentiate and match the modules.

Otherwise you will get "of:N(null)T(null)Cadi,ltc2947" in both cases and
user-space won't be able to figure out which module to match AFAICT.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

