Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F5B3CFB75
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 15:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B136E193;
	Tue, 20 Jul 2021 13:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6996E193
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 13:59:13 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l7so26109558wrv.7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 06:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=4PzjYhUEKqwf9rpMim3c4GSraf9DBD8+oBQWlOrJstY=;
 b=AI35rGqFmoDtZhMThgKNFgUNoYDIf/Mv9ZklyKOQZalq+AMl7YLVcjrZWirr9cA4yo
 sKbC4G1SWhrZuNvvWd/s+tASUCHW2urdvLdU/fGsg7m7gz4UJqkLwhSo75ZdBcWM5aan
 ACfNWR23Qn0SiA+6OIT5YQxeAfXWZ5CXMJ0s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=4PzjYhUEKqwf9rpMim3c4GSraf9DBD8+oBQWlOrJstY=;
 b=mwBZYoJf4670ESydWQtdBEewBadHYpS5K345XmoGOzAYksVAO2KsAKcvBEUvD5K7RE
 w7OF3x7/Z1W72861jebb/JVvTLCFYn0xZNlAf/lD7809gnNLJ/a61w8de3B+IeDyIOTJ
 Ceesz/q/i7azHK8L0viH2YDssM2fCiCoEeClfcWBcXr/jieLtnsyZJQG943zbjstUjp8
 /f083HT2gL6vb94gGyBkbTFR47JkZIddFZ3a0DtJLpzCohL685ORfC+/fxzB41Durd4k
 kXy02IvVruVokrdE+P+kqP8Z/KWsEOlT28uxXSwTJ2TuqdPrX6q2YNcbIf3wDaXBFscK
 EoAw==
X-Gm-Message-State: AOAM531trOmd7uQKu36e3zISjlNYK8cvZPmsWl2Ivz3LC/RGyZPbMLDZ
 oYnuCPFERlFgiBOu9HpH1XBdDw==
X-Google-Smtp-Source: ABdhPJwsdFs8q+1yTXrNA7AHfumD9vqplXTE6zNI6BrnjDfVy+jzMEAdzrUlq1Fu/ILnx4cnr5axUA==
X-Received: by 2002:adf:f405:: with SMTP id g5mr17004193wro.277.1626789551781; 
 Tue, 20 Jul 2021 06:59:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm2632333wmm.37.2021.07.20.06.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:59:11 -0700 (PDT)
Date: Tue, 20 Jul 2021 15:59:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on
 non-x86 EFI platforms
Message-ID: <YPbWrV/cIODdgu6A@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Dave Airlie <airlied@gmail.com>,
 linux-efi <linux-efi@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>,
 Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>, Borislav Petkov <bp@suse.de>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Hans de Goede <hdegoede@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20210625130947.1803678-1-javierm@redhat.com>
 <e61cf77c-6bff-dfcc-d3df-2fb6b48e5897@redhat.com>
 <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
 <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
 <CAMj1kXErHteZ+MKYvp=yYmwVxV3A=vjtnG351hZHV+3BPwDQvw@mail.gmail.com>
 <YPbJJ/0tSO/fuW7a@phenom.ffwll.local>
 <03f0edef-e54e-8a2a-4b50-683d3d42e249@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03f0edef-e54e-8a2a-4b50-683d3d42e249@redhat.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: linux-efi <linux-efi@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>, Borislav Petkov <bp@suse.de>,
 Albert Ou <aou@eecs.berkeley.edu>, Hans de Goede <hdegoede@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 20, 2021 at 03:42:45PM +0200, Javier Martinez Canillas wrote:
> On 7/20/21 3:01 PM, Daniel Vetter wrote:
> > On Mon, Jul 19, 2021 at 09:10:52AM +0200, Ard Biesheuvel wrote:
> >> On Mon, 19 Jul 2021 at 04:59, Dave Airlie <airlied@gmail.com> wrote:
> 
> [snip]
> 
> >>>
> >>> Can we just merge via drm-misc and make sure the acks are present and
> >>> I'll deal with the fallout if any.
> >>>
> >>
> >> Fine with me. Could you stick it on a separate branch so I can double
> >> check whether there are any issues wrt the EFI tree?
> > 
> > It'll pop up in linux-next for integration testing or you can pick up the
> > patch here for test-merge if you want.
> >
> 
> Thanks a lot Dave and Daniel!

Oh I haven't merged them, I'm assuming Thomas will do that. Just figured
I'll throw my ack on top:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> > And since Dave has given a blanket cheque for handling fallout he'll deal
> > with the need for fixups too if there's any.
> 
> I also plan to look at any regression that might had been introduced by these.
> 
> Best regards,
> -- 
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
