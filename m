Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5B53D0C4F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 12:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF75D6E3A0;
	Wed, 21 Jul 2021 10:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210AE6E3A0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626862519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RyyvPAEl0RGdNpzC1zqJ6kwCJCutA9fkHO+0d42bF1M=;
 b=SGf0ipT4nKSwczZoQlUO3B/qQyGJY1T6xOFdh0/LSTswMyjA+US9lKWHpBI48yJtylSHVG
 6hJ+H2rzZ61tWMFnSOs+hBdsAyROPF396Rje9VUrLJhe5Pkp7lLZ1qEZs205ncKEBUDqf7
 nV+EokoEc6khTIZHMYB4mOfWibRXsmk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-gGJ5cClQMlOCx641vrLSlA-1; Wed, 21 Jul 2021 06:15:15 -0400
X-MC-Unique: gGJ5cClQMlOCx641vrLSlA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d9-20020adffbc90000b029011a3b249b10so815162wrs.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 03:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RyyvPAEl0RGdNpzC1zqJ6kwCJCutA9fkHO+0d42bF1M=;
 b=bp8fp5R4x647diOZZ5Z+kWfENNy/LcUxxz0ceUIPNN+jaYOqwZo22XSNQzXF29x5xh
 yniQsh+aK9z0bjfyl32IfJpFXDaHoXfyDftvn0bnOkZyphxXb3F9za7482OwnRDaHFWH
 g+pl2vy16yi7fY1N9/2CeCHuJwOrWJR8blp6Pi+KgOkcKocou2s052WrGcfGRPhiUgzU
 n0LcfAIEPeaEN7TkPDICBlFMtzmg+oqvLQYAfG9neFJMOEI/0NzCO5G6/FWboJLyE2jg
 wDl6gD8YVPNCF/0o2RAIpRZcBJuaUL2YQtMlT9yJkWvcQJfp1mt+8FmtiJSqor0kIcJA
 l4Og==
X-Gm-Message-State: AOAM532jAdZFfIydXDaU8lzqCtlnwtgjD5oo61qSxhbZKjQCMs3lE1Kv
 IoEdGOtrDU8L47IdCQSP5xjrdR7i0S0WAOw4U2kbqFZoXazmk9tBlUAX/7LrVjA3B7676kIl14o
 RKeOaPhUQHax0saCp/DrO0u/GLmgC
X-Received: by 2002:adf:e40d:: with SMTP id g13mr41478951wrm.12.1626862514805; 
 Wed, 21 Jul 2021 03:15:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIFThd2tj7VfPp04ezzlehuYz0UUfR8kKnkyo/eLPDFM6dUDBcvPZYMmqeK3YnHEpOoz/6Nw==
X-Received: by 2002:adf:e40d:: with SMTP id g13mr41478916wrm.12.1626862514626; 
 Wed, 21 Jul 2021 03:15:14 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id a8sm26534248wrt.61.2021.07.21.03.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 03:15:13 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on
 non-x86 EFI platforms
To: Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel
 <ardb@kernel.org>, Dave Airlie <airlied@gmail.com>,
 linux-efi <linux-efi@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon
 <will@kernel.org>, the arch/x86 maintainers <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Peter Robinson <pbrobinson@gmail.com>,
 Borislav Petkov <bp@suse.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Hans de Goede <hdegoede@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20210625130947.1803678-1-javierm@redhat.com>
 <e61cf77c-6bff-dfcc-d3df-2fb6b48e5897@redhat.com>
 <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
 <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
 <CAMj1kXErHteZ+MKYvp=yYmwVxV3A=vjtnG351hZHV+3BPwDQvw@mail.gmail.com>
 <YPbJJ/0tSO/fuW7a@phenom.ffwll.local>
 <03f0edef-e54e-8a2a-4b50-683d3d42e249@redhat.com>
 <YPbWrV/cIODdgu6A@phenom.ffwll.local>
 <37e05f02-b810-0cb1-cc4f-95711cd148d9@suse.de>
 <44a75f18-e3a6-f764-b0ec-ce3ac05805a9@redhat.com>
 <1e85fae7-ef95-b2f7-3463-e90958e54684@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <0ad257ce-44d9-beea-8afb-c879146c523b@redhat.com>
Date: Wed, 21 Jul 2021 12:15:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1e85fae7-ef95-b2f7-3463-e90958e54684@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/21/21 12:07 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 21.07.21 um 07:09 schrieb Javier Martinez Canillas:
> ...
>>>
>>> Can I simply put the patches in to drm-misc-next? There was some talk
>>> about a topic branch?
>>>
>>
>> ... which AFAIU means that there's no need for a topic branch, since the
>> patches will be present in linux-next. And the EFI folks can use that to
>> check if there are any integration issues or regressions caused by these.
> 
> Merged into drm-misc-next.
> 

Thanks a lot Thomas for all your help!

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

