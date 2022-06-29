Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A8E55F926
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 09:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711FD10EECC;
	Wed, 29 Jun 2022 07:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9F010EEB6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 07:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656488233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1h0smKgkaQYyMckjg1gEO+92UXCJgyf7f6YfzsCAFg4=;
 b=A9r6z16eLePDP7bGnj4DQvo7y3G6bSPDfVUon8h8UU1fWVxsHhqlS7X5ho2Kg8bsJ94eAB
 ZpiagtHmU1cR+Mbl+pQ9uTE8c3wDDfX5ZBou6CQVNZ5jJ68lAXx9uYydmYJ32oQ+BT7P8w
 R0bVtv950eOUgOiUhg0nh9TLSJUseeI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-qzeadozTOPCJJaUp0Umq4A-1; Wed, 29 Jun 2022 03:37:12 -0400
X-MC-Unique: qzeadozTOPCJJaUp0Umq4A-1
Received: by mail-wm1-f71.google.com with SMTP id
 i184-20020a1c3bc1000000b003a026f48333so6245801wma.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 00:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1h0smKgkaQYyMckjg1gEO+92UXCJgyf7f6YfzsCAFg4=;
 b=1/CmS8p0nSHTY6LAsDUfryWmjdNM3UG+igi/PAqcvs/CIDyT17RJ6p/LJ9XhNG3xvw
 /8SbgJQCbsugGOQhzYLDFD6TGEcOUxPFxhXGPEqqvyJT3W8XB8aZFwYLw4ggKrOVioD6
 xWMiKwuF6L/dMzQDZVXB1KyAs60uXonDxHuZmbTUqKz4bA75FO3JJLdGQlP0YSF75csG
 ExYuBqBzhDbFsQ2tvpngHuWn+ZW7xlYaV7RrjwROZQrTeWVEb+ZGlq+nVgSFz+oKSIaG
 Qd9nRbngdNASW/ze3sJRted/mArsvVBFxV/0bD6GkOP9YYOYblqiHK9XqsSfBjYBHYaG
 3HcA==
X-Gm-Message-State: AJIora+rTqxnNoNagFwukq9NOMBTixmCIxJS4aF3VcEiK6mvvjQAQXWq
 MaH3IeMrn5h3erkdc+53rkr2yHuTR3nIb4U2j9Y/WcG4hTlRKKaOuEh4sNQ/FYgju4p+9y/GklL
 wpYfbmcYl8c64RadslgjeFt1Cx2A7
X-Received: by 2002:a05:6000:1448:b0:21b:b7db:c40b with SMTP id
 v8-20020a056000144800b0021bb7dbc40bmr1650261wrx.279.1656488230978; 
 Wed, 29 Jun 2022 00:37:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vfq7mqFRSJqFJPQOP6rs25Ch1nA7fBeueZwuaRaLaWENw0ay54yTOP4QHXmGLo1NEA4L9c5g==
X-Received: by 2002:a05:6000:1448:b0:21b:b7db:c40b with SMTP id
 v8-20020a056000144800b0021bb7dbc40bmr1650238wrx.279.1656488230741; 
 Wed, 29 Jun 2022 00:37:10 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j10-20020a5d448a000000b0021b8c99860asm15832366wrq.115.2022.06.29.00.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 00:37:10 -0700 (PDT)
Message-ID: <7654a74e-a410-a8a5-c228-d006dbbc200f@redhat.com>
Date: Wed, 29 Jun 2022 09:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jeremy Kerr <jk@codeconstruct.com.au>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <60cc6796236f23c028a9ae76dbe00d1917df82a5.camel@codeconstruct.com.au>
 <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 patches@opensource.cirrus.com, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-staging@lists.linux.dev, kasan-dev@googlegroups.com,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 acpi4asus-user@lists.sourceforge.net, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa@kernel.org>,
 linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 netdev@vger.kernel.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/29/22 09:23, Uwe Kleine-König wrote:
> Hello,
> 
> [I dropped nearly all individuals from the Cc: list because various
> bounces reported to be unhappy about the long (logical) line.]
>

Yes, it also bounced for me when I tried to reply earlier today.

> diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> index 1e0fcec7be47..ddfa0bb5d9c9 100644
> --- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
> +++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> @@ -39,13 +39,11 @@ static int ssd130x_i2c_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int ssd130x_i2c_remove(struct i2c_client *client)
> +static void ssd130x_i2c_remove(struct i2c_client *client)
>  {
>  	struct ssd130x_device *ssd130x = i2c_get_clientdata(client);
>  
>  	ssd130x_remove(ssd130x);
> -
> -	return 0;
>  }
>  
>  static void ssd130x_i2c_shutdown(struct i2c_client *client)

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com> 
-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

