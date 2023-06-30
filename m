Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF397744168
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 19:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF73710E4D0;
	Fri, 30 Jun 2023 17:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED5810E4D0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 17:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688146685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kVYUQaLIlYzTkSSGVDZ9hVc8AmWln/G3KSgwkF5UBS4=;
 b=VHtxW9Jiz4MzjsWZNXiKDRqKIwGWTH3hed6tMQgxhU4gJrlF8HgwHhJO6iDXKLiXqn7LA2
 j6QLkBfTHnOksewQ7RiZkqDuy4tIdFej0DcBnND1QTPqJ8iiZVzuONaQv5Mijlu2Zlj8Mj
 5+ILuh6mtiNZx0CCvxRiys7Al6lZZVA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-3STClRyqPAqoBwFRRK1G8A-1; Fri, 30 Jun 2023 13:38:04 -0400
X-MC-Unique: 3STClRyqPAqoBwFRRK1G8A-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-313f376d2adso2726756f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 10:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688146683; x=1690738683;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kVYUQaLIlYzTkSSGVDZ9hVc8AmWln/G3KSgwkF5UBS4=;
 b=cRpt4K/oasI1ok3jVDoC6Xc1F7sp+UtPXeyYMLseryohgcDzrxai4fl9ClzAKpohL5
 FFRFf6YVop91aIqidXLa4SFH2SGggwvIl+pyeLUgnmoZzTaxrtLmCw33/jjzOw08i3kQ
 GDLLk3wYgu9SX/ret2QmjaDTGBBUnlKQ3DncBpY/OlM588FkxuXJMpMrZB7ZaZGZzIIp
 nNQ8mqdt9VYNHQoAMfmq8cHg68YHGmfRUsXgjLGLz4LdSg0b+jVXMB5qexyRTF5fn2yD
 JE0SASjULJaC8qmZAabp6TPS+OoMdTaLhx1iMo2xRGCNetV6Us6L8OO4WSVZvhtsgCCm
 tPGQ==
X-Gm-Message-State: ABy/qLbBFAcok0MM/vJ0TMiTLfbFOcsp6HD1/DKmJkgFM45x1YF30DKv
 I3g56coegjPMSvV8eKupXf0EwfdsjEUvRMQahK2P4IfgrvwIgFL/oT3oLQfSW81aLUE2deG7ZoB
 YlrV+/CJyoPdLf420Iqjg9vRRb+dW+m8s0Gf0
X-Received: by 2002:a05:6000:118b:b0:2fb:1d3a:93ff with SMTP id
 g11-20020a056000118b00b002fb1d3a93ffmr3144636wrx.61.1688146683308; 
 Fri, 30 Jun 2023 10:38:03 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGNvUqGRtSpV8GYS4YvqUz/RSiCqQm8TkeXUu3ip49084GlOjfQ0N7UqSkJYBy9eyJgB2uFhw==
X-Received: by 2002:a05:6000:118b:b0:2fb:1d3a:93ff with SMTP id
 g11-20020a056000118b00b002fb1d3a93ffmr3144605wrx.61.1688146683015; 
 Fri, 30 Jun 2023 10:38:03 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c13-20020adfe74d000000b0030ae499da59sm3745589wrn.111.2023.06.30.10.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 10:38:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 0/2] Allow disabling all native fbdev drivers and only
 keeping DRM emulation
In-Reply-To: <ZJ8RY7ZUlryrPB50@smile.fi.intel.com>
References: <20230629225113.297512-1-javierm@redhat.com>
 <ZJ8RY7ZUlryrPB50@smile.fi.intel.com>
Date: Fri, 30 Jun 2023 19:38:01 +0200
Message-ID: <878rc0etqe.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: x86@kernel.org, linux-fbdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

Hello Andy,

> On Fri, Jun 30, 2023 at 12:51:02AM +0200, Javier Martinez Canillas wrote:
>> This patch series splits the fbdev core support in two different Kconfig
>> symbols: FB and FB_CORE. The motivation for this is to allow CONFIG_FB to
>> be disabled, while still having the the core fbdev support needed for the
>> CONFIG_DRM_FBDEV_EMULATION to be enabled. The motivation is automatically
>> disabling all fbdev drivers instead of having to be disabled individually.
>> 
>> The reason for doing this is that now with simpledrm, there's no need for
>> the legacy fbdev (e.g: efifb or vesafb) drivers anymore and many distros
>
> How does simpledrm works with earlycon=efi?
>

simpledrm isn't for earlycon. For that you use a different driver (i.e:
drivers/firmware/efi/earlycon.c). I'm just talking about fbdev drivers
here that could be replaced by simpledrm.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

