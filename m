Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 273B2746B50
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 09:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A3010E2AC;
	Tue,  4 Jul 2023 07:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F6B10E02E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 07:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688457484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T+z65LvmorUornhZW4Ei6pDZqxls4YGQhYkabgi/Fgo=;
 b=WBEt7dd7syc03TPau8wik3DEC5IkDAbc2Bq6s49bXvq6+ixH0//adgCbaCtlJtLLnYW31p
 ZyJTXwuMgDExC/eABoKsLvYVpNEqGeBoTdebci8+3QuTPszvvB8ALn2EHAZCfFx+6hyT7C
 F1rDWpmez0FbFn+68YduIqCj6yJ6sBA=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-p9tKeG8kMn-WHVpMOhbkWQ-1; Tue, 04 Jul 2023 03:58:03 -0400
X-MC-Unique: p9tKeG8kMn-WHVpMOhbkWQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b6a6cb42f1so48193831fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 00:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688457482; x=1691049482;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T+z65LvmorUornhZW4Ei6pDZqxls4YGQhYkabgi/Fgo=;
 b=Sf3eeSkOk3Ieqy9UiKL52lok/4Mk1bVS8m2SyyEN4Rr9NWIHe/U0Rr+Zv7frofLLHP
 pyPS0grchRmm9mt9AoLA+Uk4T2uxj4EUvm9/WareBfnh5KoeaHgrdRvuHnp1ahKdJvTV
 rUL4dXFpmvGwrCyN3NFf1aoDHwY00tvi2ytZK72pbrwWe1AS5QM2Dn2GEvsWk7KblBSo
 Tx1HxHMc34GZyE1jJIxWYEGkXl/aw5tSc4p3FWFfkjAMB/Yz1Jrmr1ocKcxpKej0myyS
 yFWkcKBoCsdO20g4I17Hb/QDAzgvfhWU9jI8t5gTYZmutWrxoaMVY5mXXgMu6enoedyH
 A0CQ==
X-Gm-Message-State: ABy/qLZjFCp0kfUQ0qd57ZL3b7WXOS+yPFsmpHd2luc9IDkeMhK2X59o
 xwgTcDrlDERqpd4ATwst1kNYfk1QxJ3ZcvqVd0hvWbiZEww8zrzKmI9ktGrxr6t4gIaRat4BjM2
 DvkEu23cXx73/P4MgrgfA/wnMNoge
X-Received: by 2002:a2e:9159:0:b0:2b4:78f6:d335 with SMTP id
 q25-20020a2e9159000000b002b478f6d335mr9686699ljg.8.1688457482306; 
 Tue, 04 Jul 2023 00:58:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGP5ieUAuoHkl1LDfFH6zWVviU5R2QJOtqbelgfD+Ggwr/XJ6o+iJfxnnHrp7TPWS1RTCoQZA==
X-Received: by 2002:a2e:9159:0:b0:2b4:78f6:d335 with SMTP id
 q25-20020a2e9159000000b002b478f6d335mr9686681ljg.8.1688457482001; 
 Tue, 04 Jul 2023 00:58:02 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p8-20020a7bcc88000000b003fb225d414fsm22874960wma.21.2023.07.04.00.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 00:58:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 2/5] fbdev: Move core fbdev symbols to a separate
 Kconfig file
In-Reply-To: <ZKPHmJDsUtG7nROo@smile.fi.intel.com>
References: <20230703230534.997525-1-javierm@redhat.com>
 <20230703230534.997525-3-javierm@redhat.com>
 <ZKPHmJDsUtG7nROo@smile.fi.intel.com>
Date: Tue, 04 Jul 2023 09:58:00 +0200
Message-ID: <87bkgsyupj.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> On Tue, Jul 04, 2023 at 01:05:26AM +0200, Javier Martinez Canillas wrote:
>> The drivers/video/fbdev/Kconfig defines both symbols for fbdev drivers and
>> core fbdev symbols, that can be enabled independently of the fbdev drivers.
>> 
>> Split the Kconfig in two, one that only has the symbols for fbdev drivers
>> and another one that contains the fbdev core symbols.
>
> ...
>
>>  source "drivers/video/fbdev/omap/Kconfig"
>>  source "drivers/video/fbdev/omap2/Kconfig"
>>  source "drivers/video/fbdev/mmp/Kconfig"
>> +
>> +source "drivers/video/fbdev/core/Kconfig"
>
> Hmm... Shan't we start Kconfig from core options?
>

I added after the drivers because Geert said that preferred that way
(unless I misunderstood him from our conversations in IRC).

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

