Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB414FFC2B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 19:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5980C10E008;
	Wed, 13 Apr 2022 17:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078C410E008
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 17:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649869930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YJ72N2/GrlRUJ/thxMpQZyE2ELbmhrFrZFQ/W3EawNk=;
 b=bHW/msb7GNBVwc09bWTw7btjaJHx57Qfbtg0V8FyUC0/mQ8/QjavIHV381Vd/poWRWIh7s
 y8s62NRxi/2hbj8Cjew3/xhR4ePw7K/L9s3sBdsrV+KL7vGQPmVP9hj1vS8Ny5SRviRCBo
 QaxGpbq9ahou+A153PIeFgCAnqmelOw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-ohohXr7KPZGeoZ2KMYuyUQ-1; Wed, 13 Apr 2022 13:12:08 -0400
X-MC-Unique: ohohXr7KPZGeoZ2KMYuyUQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 j67-20020adf9149000000b00203e6b7d151so533116wrj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 10:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YJ72N2/GrlRUJ/thxMpQZyE2ELbmhrFrZFQ/W3EawNk=;
 b=ooPNAIjVUjMVYuR68aMzMJVkYEbH7STpgtbRI4R2odk9CC2PcLZIWxgKsLrydFUGVm
 skIAvrdmjX5rx3xHs6TxwJVcNhrchZr0Q6Qd7TkuqNfIxCetDVUFwXr1kHnsgaJxZCab
 ZPqX2m0kpwhtW26tAfMQ8I3fwNNX4bmFU0DuRap/+H9lMGWQF+wHLhLBQWIfpMkuTpSO
 bXCaoC0IxGF6/fyDMsnePJQlVdf0kJeqxUvSutzORSDMvQ/naqEOZCMEPyxa6497uRQw
 HpDpkBYCZAXfyK4Rcu95XOLFTp6tN8BhBkK/1UsOIiRLamSYTOuGRqnhpE6ZPAotPf43
 URRA==
X-Gm-Message-State: AOAM532vFEvGDgV9L2qDta6VNeqE5QjGxD+ynSSamhxnEO51pT6WrrDx
 ZMKdrXjg7sxgQjUxhkTk2BypnYFwq8VNrlw3jZPCfamcyXpKPwTOAs4ORnup2j7F8syfrQJ3KLB
 fUJyBWc2E8TwSvFc+E4TRHZaOhRl+
X-Received: by 2002:a5d:47cc:0:b0:204:1c9d:2157 with SMTP id
 o12-20020a5d47cc000000b002041c9d2157mr32488638wrc.294.1649869927674; 
 Wed, 13 Apr 2022 10:12:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzarKNWqHMOXtjJXHfCHXYpL7/O0TZGX0CRZAp0JslWTZbGjWFUGAPY0CcHHwuyyFWpDVNUHA==
X-Received: by 2002:a5d:47cc:0:b0:204:1c9d:2157 with SMTP id
 o12-20020a5d47cc000000b002041c9d2157mr32488619wrc.294.1649869927436; 
 Wed, 13 Apr 2022 10:12:07 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm31623645wrv.10.2022.04.13.10.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 10:12:07 -0700 (PDT)
Message-ID: <e81c5902-e401-c6d5-0e03-6984e7d4a547@redhat.com>
Date: Wed, 13 Apr 2022 19:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 4/5] drm/solomon: Move device info from ssd130x-i2c to
 the core driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220413162359.325021-1-javierm@redhat.com>
 <20220413162359.325021-5-javierm@redhat.com>
 <YlcCEP8ADyJNxd/Z@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YlcCEP8ADyJNxd/Z@smile.fi.intel.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/13/22 19:02, Andy Shevchenko wrote:
> On Wed, Apr 13, 2022 at 06:23:57PM +0200, Javier Martinez Canillas wrote:
>> These are declared in the ssd130x-i2c transport driver but the information
>> is not I2C specific, and could be used by other SSD130x transport drivers.
>>
>> Move them to the ssd130x core driver and just set the OF device entries to
>> an ID that could be used to lookup the correct device info from an array.
>>
>> While being there, also move the SSD130X_DATA and SSD130X_COMMAND control
>> bytes. Since even though they are used by the I2C interface, they could
>> also be useful for other transport protocols such as SPI.
> 
> Thanks!
> 
> ...
> 
>> @@ -139,6 +106,8 @@ static struct i2c_driver ssd130x_i2c_driver = {
>>  };
>>  module_i2c_driver(ssd130x_i2c_driver);
>>  
>> +
> 
> Seems stray change. Dunno if maintainers can fix this when applying.
>

Ups, indeed. I can fix it when applying.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

