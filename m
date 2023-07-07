Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FB074B423
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 17:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CDE10E5B4;
	Fri,  7 Jul 2023 15:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A6C10E5B4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 15:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688743627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+8qlgKJYI7kB6D1e5SNd04VHZ2yM21oq3nfTt/gANL8=;
 b=Xp3V7QpxR0t4kn3riQcIygCunUkXwI6NZ3Tna1R1/eSSKIttUgnUBIEMa0bUEAsweRM2gc
 U6nnWomAy9UZxVmI7MDDjcPICPUqvUyj2cWWhWFPcUxqtL/gbiqKCzm2QxuPCdKnlNpwQG
 VW5QSR7ucZvmaJXYRS7+9Gx7xwPi09M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-KG40GE5OOumBE0hNNGmAtw-1; Fri, 07 Jul 2023 11:27:05 -0400
X-MC-Unique: KG40GE5OOumBE0hNNGmAtw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fbb34f7224so12206395e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 08:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688743624; x=1691335624;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+8qlgKJYI7kB6D1e5SNd04VHZ2yM21oq3nfTt/gANL8=;
 b=cBFEkkQ4KTLcuslCEIzujP2u17RaZUCtPPNaQSXDWlWjj8bCUmMT+adPhKlrAPFJUn
 YsTQYNF9rwVEK+xKtNfyeKae1Tw7BonY8uZ7SpsSwBk/6vHfkGl5ExN1y44P1JGm6CBs
 aFdPorHrNdpR7fT8ZSfVwpzdkrJcxwTnhOxDWR214cgpv10X1s0AnKidnRFglNWKX5WA
 FjTlkf+rF22TSQIpgBKWvlfl1O8uej1p2dcnOzeAIL04ChZe/sQA2qaM3qTL0Pn66ugU
 RmzGhZiBTJvk8qyNAW8qc8jEsra09/h/jWKwhm0TxMTGXEzIBaugsckPtjmLYsU7rpx4
 KHQA==
X-Gm-Message-State: ABy/qLYldk1x+XPJ8qZcyJUVe2kU3vNZaFkOez2DOJp76DYMvwHWUkm/
 un6yotrJCfbfqEmbF+nbCOJgudNVku8680yZEupqUXZYW5RlyRI6vGm/RsIT1gPq1PwiZTMjBvK
 o/jmL7qexIX8f03mou/foSg1H3k14
X-Received: by 2002:adf:f052:0:b0:30a:a15d:eb2f with SMTP id
 t18-20020adff052000000b0030aa15deb2fmr4668100wro.3.1688743624752; 
 Fri, 07 Jul 2023 08:27:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGmxd1jbrrvV1R0iu/TeFKW/e1nuXfI0DnXijMIXAlyALphvzgzqltgfOe8J565vUOEzxyvoA==
X-Received: by 2002:adf:f052:0:b0:30a:a15d:eb2f with SMTP id
 t18-20020adff052000000b0030aa15deb2fmr4668074wro.3.1688743624480; 
 Fri, 07 Jul 2023 08:27:04 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bl1-20020adfe241000000b003143c9beeaesm4711005wrb.44.2023.07.07.08.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 08:27:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/4] vgacon: rework screen_info #ifdef checks
In-Reply-To: <ff9bfcfa-fa3b-42d2-b429-059b5103bce2@app.fastmail.com>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-2-arnd@kernel.org>
 <87jzvbyh4p.fsf@minerva.mail-host-address-is-not-set>
 <ff9bfcfa-fa3b-42d2-b429-059b5103bce2@app.fastmail.com>
Date: Fri, 07 Jul 2023 17:27:03 +0200
Message-ID: <87bkgnyc6w.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>, Ard Biesheuvel <ardb@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Matt Turner <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Fri, Jul 7, 2023, at 15:40, Javier Martinez Canillas wrote:

[...]

>> And this is only used by mdacon (not supported by ia64), vgacon and
>> vga16fb (not supported by ia64 either).
>>
>> So this could just be guarded just by CONFIG_VGA_CONSOLE for ia64 ?
>
> Right, I though about doing this more accurately, but in the end
> went for the simplest change rather than spending much more time
> trying to clean up the unused variables etc.
>
> Let me know if you'd prefer me to respin this part, otherwise
> I'd call the ia64 bit good enough for the purpose of the series.
>

No need to re-spin, agreed that makes sense to keep it simpler.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

