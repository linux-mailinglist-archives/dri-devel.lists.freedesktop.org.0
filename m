Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D1F53AEB6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 00:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE5410FCF6;
	Wed,  1 Jun 2022 22:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BD910FCFA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 22:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654123102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ceGgR5cdPBLP1zNOzwY1AoGqwuSAXgokhvZyfTTzqKM=;
 b=imiDQR80G3R0NzNP6Str8bh2HvnR7/ZhTjoBlf0HbsHk5uzsuXLuoOe21uTgOxd7QoWjPk
 sjg4O+klS6CXnI4yLtIACOaoFyqqZf2HLPMkXTF38cLj0R7l2k5iVkTSiOqiKMfT3AnxET
 r2GXpF4dOgv3y9XKgVMnyAVADskFp+o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-14g16JGtPUKiu1z_ZVU9qQ-1; Wed, 01 Jun 2022 18:38:21 -0400
X-MC-Unique: 14g16JGtPUKiu1z_ZVU9qQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so1585693wmr.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 15:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ceGgR5cdPBLP1zNOzwY1AoGqwuSAXgokhvZyfTTzqKM=;
 b=wNgmdeK6YTXakznjaP9TyB+e3zq7Pq6eCsqL/iS/V4r/E6FLUj7aYoCNxRyubw+e8Q
 VtfF/658FE6nDlxHFC9XvDqyaPcdTI8KqnQHUDJCmIINMGRrvheTQNOYO3do9yDCWN/u
 kTSnlDS5qyBprXXKtGzYg+O+dPAglK0pRYqWgVdq6Ir63Wc5nTXtNgw8Gj1RPU+X7/DR
 +hH7nxXBSb3TRnFjzwDbX/3AXSqudFOikOaR0rQfkzfPiqBDjIQ10AWoKJFWtV7EuwFN
 7dxZ3+V90Fpco1wd2w/cAsI0cUwICH1ZEkChbxS8BiTpraTvX/PLwIn8gHRLlB3NMT+X
 Ha7w==
X-Gm-Message-State: AOAM532t/yXMg6MWW8Y0ti2ldHqbSXYL69kFW7L42nZucIJV+XRoChEj
 mO0/AvEfDz8pw8U+eoEq2eTP7bze9xBMza4W8iqv1AFDcTafXdtSahXjtMcXZI+qhuA0q2PYAsz
 edFGfmyHYegFtbCX+PXoaE8NKuRWx
X-Received: by 2002:a5d:4e86:0:b0:210:1f1d:978e with SMTP id
 e6-20020a5d4e86000000b002101f1d978emr1275359wru.172.1654123100322; 
 Wed, 01 Jun 2022 15:38:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybB2S2p1Gb9EF9Cn2Pz8DdIgk8Ji4oxYM9kOIXJbYDoOLRWYoYt21HP+1xDltDqbRQf1deZQ==
X-Received: by 2002:a5d:4e86:0:b0:210:1f1d:978e with SMTP id
 e6-20020a5d4e86000000b002101f1d978emr1275340wru.172.1654123100032; 
 Wed, 01 Jun 2022 15:38:20 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c349500b003958af7d0c8sm3166647wmq.45.2022.06.01.15.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 15:38:19 -0700 (PDT)
Message-ID: <a4cf5b0f-40df-467a-e606-9a7d7eafba11@redhat.com>
Date: Thu, 2 Jun 2022 00:38:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] drm/ssd130x: Only define a SPI device ID table when built
 as a module
To: Nathan Chancellor <nathan@kernel.org>
References: <20220530140246.742469-1-javierm@redhat.com>
 <YpYv8islaEySOEtg@dev-arch.thelio-3990X>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YpYv8islaEySOEtg@dev-arch.thelio-3990X>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: kernel test robot <lkp@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/31/22 17:10, Nathan Chancellor wrote:
> On Mon, May 30, 2022 at 04:02:46PM +0200, Javier Martinez Canillas wrote:
>> The kernel test robot reports a compile warning due the ssd130x_spi_table
>> variable being defined but not used. This happen when ssd130x-spi driver
>> is built-in instead of being built as a module, i.e:
>>
>>   CC      drivers/gpu/drm/solomon/ssd130x-spi.o
>>   AR      drivers/base/firmware_loader/built-in.a
>>   AR      drivers/base/built-in.a
>>   CC      kernel/trace/trace.o
>> drivers/gpu/drm/solomon/ssd130x-spi.c:155:35: warning: ‘ssd130x_spi_table’ defined but not used [-Wunused-const-variable=]
>>   155 | static const struct spi_device_id ssd130x_spi_table[] = {
>>       |                                   ^~~~~~~~~~~~~~~~~
>>
>> The driver shouldn't need a SPI device ID table and only have an OF device
>> ID table, but the former is needed to workaround an issue in the SPI core.
>> This always reports a MODALIAS of the form "spi:<device>" even for devices
>> registered through Device Trees.
>>
>> But the table is only needed when the driver built as a module to populate
>> the .ko alias info. It's not needed when the driver is built-in the kernel.
>>
>> Fixes: 74373977d2ca ("drm/solomon: Add SSD130x OLED displays SPI support")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
Thanks! Pushed this to drm-misc (drm-misc-next).

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

