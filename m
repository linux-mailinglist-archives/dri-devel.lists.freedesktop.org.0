Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F84506677
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 10:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0434D10E09A;
	Tue, 19 Apr 2022 08:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781B110E09A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 08:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650355357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jLbux2EHSPeAoMYJRPZNPjs6jbsNJeFhQg/FtKIUcjk=;
 b=chFAMNdA7nrHsRz+jWr9Hmi+/fS7gGbPA70OHTWybAPBdjQmtUvW9Qp7jwRb/LvscWpM5P
 YAWqNzFILp9fVxNymDZPf86mDz+cA4hyx0iibrtDdZHK8iD2Y4w0eq9vuWUD7N34k8nHMn
 vYaIAlAQzZnHGwZdHASED13ixNBpZU4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-PIVMk98vNkSwCuLsqBGxkQ-1; Tue, 19 Apr 2022 04:02:36 -0400
X-MC-Unique: PIVMk98vNkSwCuLsqBGxkQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v9-20020adfc409000000b002079e379921so1714127wrf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 01:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jLbux2EHSPeAoMYJRPZNPjs6jbsNJeFhQg/FtKIUcjk=;
 b=krAA/IdMEqlUUMNc6kRuUQuKOYYoXqOWf6lRFGdTzaC5uo6N9UFVIag603Hr4Fp1tk
 480cZse4M/EUXfg9PzeExEXXQjF+rHntVbaS+1n3cbaRTPglPGLMGJL3VTC1LLr2n/wh
 Am/pQPRuciywoPGsiKtybfHjNNU/k9VCGlhFLBn9RVdEizNMsgnKJicoZlA85Y8zZkkU
 Lg77AEdV1emBIplYuiugAsAXQfaIgIcpr7YbTT4fDxsIEHYUNY/niIjjvK23lXcTxt28
 F1GT17/PSAZhT/lBjiG4hUPUs2IxxA/d7qElQAFE+2CwZ7HwdxETQnqmlv26e1aRy3TI
 VvuQ==
X-Gm-Message-State: AOAM533fq4Q8tfwBhYU3Vbze4w/cAVORyIZZ5j7nSxWmKamSxNfb5wz8
 tmvRDgWVpLiGOnbAy8D++v6leOvdOZa4DWSDDPVHtA9+kCgftlqKOcLhOpwiUeRTLT7rbYNr46w
 Heyoh+ulqH7Y0IcdN9cW2S3ywJlx0
X-Received: by 2002:a05:600c:3ca7:b0:38e:50d2:27fe with SMTP id
 bg39-20020a05600c3ca700b0038e50d227femr18789741wmb.159.1650355354957; 
 Tue, 19 Apr 2022 01:02:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoYFbDlizyT41mBRw7KoxJ7TK8LkCRHtUbAAn98T1/ev5GAkMLzD2inzodoQ48+/YZbjyOCg==
X-Received: by 2002:a05:600c:3ca7:b0:38e:50d2:27fe with SMTP id
 bg39-20020a05600c3ca700b0038e50d227femr18789726wmb.159.1650355354671; 
 Tue, 19 Apr 2022 01:02:34 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 p125-20020a1c2983000000b0038e6c62f527sm17599649wmp.14.2022.04.19.01.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 01:02:34 -0700 (PDT)
Message-ID: <ef51a171-790e-1c13-fc9a-a4c9a2ab5863@redhat.com>
Date: Tue, 19 Apr 2022 10:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 5/5] drm/solomon: Add SSD130x OLED displays SPI support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220413162359.325021-1-javierm@redhat.com>
 <20220413162359.325021-6-javierm@redhat.com>
 <CAMuHMdX_myNcA1eG=-qOHhtCEMnnV_eMjQF3dWakd7O6JbXskQ@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdX_myNcA1eG=-qOHhtCEMnnV_eMjQF3dWakd7O6JbXskQ@mail.gmail.com>
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

Hello Geert,

Thanks a lot for your feedback.

On 4/19/22 09:52, Geert Uytterhoeven wrote:

[snip]

>> +static int ssd130x_spi_write(void *context, const void *data, size_t count)
>> +{
>> +       struct ssd130x_spi_transport *t = context;
>> +       struct spi_device *spi = t->spi;
>> +       const u8 *reg = data;
>> +
>> +       if (*reg == SSD130X_COMMAND)
>> +               gpiod_set_value_cansleep(t->dc, 0);
>> +
>> +       if (*reg == SSD130X_DATA)
>> +               gpiod_set_value_cansleep(t->dc, 1);
>> +
>> +       /* Remove the control byte since is not used by the 4-wire SPI */
>> +       return spi_write(spi, ((u8 *)data) + 1, count - 1);
> 
> As I don't like casts, perhaps
> 
>     spi_write(spi, reg + 1, count - 1);
> 
> ? But this is up to you.
>

It's true that is easier to read. I just wanted to make it clear that we
were removing one byte from the data but I believe the comment is enough.

Andy also pointed out an unnecessary blank line in patch 4/5, so I think
these two changes + your R-b warrants a v5. I will post one later today.
 
[snip]

>> +static const struct spi_device_id ssd130x_spi_table[] = {
>> +       { "sh1106",  SH1106_ID },
>> +       { "ssd1305", SSD1305_ID },
>> +       { "ssd1306", SSD1306_ID },
>> +       { "ssd1307", SSD1307_ID },
>> +       { "ssd1309", SSD1309_ID },
>> +       { /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(spi, ssd130x_spi_table);
> 
> I'm not sure about the need for this part, but as Mark provided his
> Ac-ed--by, I assume it's correct.
>

Right, I'm quite sure about this. See for example [0] vs [1]. The latter
does of_device_uevent_modalias(dev, env) while the former always does
add_uevent_var(env, "MODALIAS=%s%s", SPI_MODULE_PREFIX, spi->modalias)
even for devices registered through OF.

Also, commits 3ce6c9e2617e ("spi: add of_device_uevent_modalias support")
and 96c8395e2166 ("spi: Revert modalias changes") have some more context.

[0]: https://elixir.bootlin.com/linux/latest/source/drivers/spi/spi.c#L360
[1]: https://elixir.bootlin.com/linux/latest/source/drivers/i2c/i2c-core-base.c#L139
 
> The rest LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>

Thanks!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

