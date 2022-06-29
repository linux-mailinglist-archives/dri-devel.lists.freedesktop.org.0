Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9110755F9FB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 10:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C7210E5C3;
	Wed, 29 Jun 2022 08:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16ED110E038
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 08:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656490149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hQQnP6ElkRz6EikrOqVkat5RAwQAYxqOhDbZ9zjeug=;
 b=Oxo53p/fRlsSMA3GK80B0wxaV+6dXETfzm7WdLOVZ6ix/DWgAC4nx09DRv2BO5T3ohmv20
 WFpRdwRzwIbXgLzlxSwbe0a0TGiN1FLVjwVL2nrpk7uL5xzPTqbhjom+lLFue6AafELb3x
 Mdn4CcLpWouX/V4cSNrOhKmZTH845mo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-cuvLq9jiOYKV62Z5q1WI4Q-1; Wed, 29 Jun 2022 04:09:05 -0400
X-MC-Unique: cuvLq9jiOYKV62Z5q1WI4Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 6-20020a1c0206000000b003a02cd754d1so6265483wmc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 01:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7hQQnP6ElkRz6EikrOqVkat5RAwQAYxqOhDbZ9zjeug=;
 b=fljfC6XznjalQ/DqwA7bl9cRgOrCjeaWWHa46Vy7xU71zWY9IzMKiflfzRXpWGQRa7
 QHy/yXl5DlxISLu2TxYO4mCJ/5TyZiKQp4nXryhDRj1bGpJKReA5LclWCyeGsuYCMb/v
 kOMvv3XOYLmCq9drrnvMby7VHnc6qzBrAqGWEgc6AssVZZm2LNoY+pZLtvoO4nzFrcAd
 7wBcWZI/r2NeHdYmiuTE5GCW+VasssrB7wkyvsBNXPJ9OQmkJkbgyoWZV+IURH1BDzpf
 87SGDmvYyAY0F4tv4aeg7a+pPVjy5og5yt5YQM6PFOcqrEZIWTH5oAH5zm0ElZ8RYhPE
 hFEQ==
X-Gm-Message-State: AJIora94knYWmB4D01ueZRFv34v9W5cEzlG3SDIN497sbxCt+FYUpysh
 42FZMJX0GemPKGWcZMmTPVCb6v20f0mtDAQ2j75UkEqPrt3ovnYNh8j9ux0QIgdQ7HV15hdg3Zj
 CHCFy0oda+pOJkXfQ4wAE89vnWCSJ
X-Received: by 2002:a05:600c:2246:b0:3a0:4d14:e9d5 with SMTP id
 a6-20020a05600c224600b003a04d14e9d5mr2201668wmm.70.1656490144655; 
 Wed, 29 Jun 2022 01:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1usFW/96xeCeX9gWa5EcwEsowhB540yEb4Gaanj9433iMcJH3n1uDXhdEWzSLPQicn1TmuJ9w==
X-Received: by 2002:a05:600c:2246:b0:3a0:4d14:e9d5 with SMTP id
 a6-20020a05600c224600b003a04d14e9d5mr2201616wmm.70.1656490144372; 
 Wed, 29 Jun 2022 01:09:04 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c358200b003942a244f47sm2507134wmq.32.2022.06.29.01.09.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 01:09:03 -0700 (PDT)
Message-ID: <a5a3e2ca-030a-4838-296e-50dbb6d87330@redhat.com>
Date: Wed, 29 Jun 2022 10:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jeremy Kerr <jk@codeconstruct.com.au>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <60cc6796236f23c028a9ae76dbe00d1917df82a5.camel@codeconstruct.com.au>
 <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
 <5517f329-b6ba-efbd-ccab-3d5caa658b80@csgroup.eu>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <5517f329-b6ba-efbd-ccab-3d5caa658b80@csgroup.eu>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "acpi4asus-user@lists.sourceforge.net" <acpi4asus-user@lists.sourceforge.net>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 Wolfram Sang <wsa@kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/29/22 09:55, Christophe Leroy wrote:
> 
> 
> Le 29/06/2022 à 09:23, Uwe Kleine-König a écrit :
>> Hello,
>>
>> [I dropped nearly all individuals from the Cc: list because various
>> bounces reported to be unhappy about the long (logical) line.]
> 
> Good idea, even patchwork made a mess of it, see 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220628140313.74984-7-u.kleine-koenig@pengutronix.de/
> 

FYI, for patches like these what I usually use is:

./scripts/get_maintainer.pl --nogit-fallback --no-m --no-r

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

