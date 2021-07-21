Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BE33D0D50
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 13:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9A689933;
	Wed, 21 Jul 2021 11:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AA38800B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 11:23:37 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m2so1801405wrq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 04:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=5r4SARj9UXSpcoZXx50eoUO8FuzdCp7+FLIK6b9NrWI=;
 b=Cg//U4Y/1gDgxt7k5xmPgDyo0T0uwh0g+60Sh5AVkHS8/ei3NhtyBF6YUUZECQJ58p
 cUzo7OyBMRL1w7ZINYSSzxOiPjjdfCP8gmgVRIQrnKhlqKVsz4YOjpHWokj0QfreyYfD
 rHb7sejYFAOJAr8kwsiMNxNWVcph5CirgTBgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=5r4SARj9UXSpcoZXx50eoUO8FuzdCp7+FLIK6b9NrWI=;
 b=Csj472rSYdq4jrHthadn7aY2Dwi5eq1lK709FZRnSOnVGuxJ8o/U3OOOBA4zJbFDPp
 p47/yFcD0oK/pzVv2zIUY0abnsI3VrXLXzkee4WnDMvMpcJtGg1+qvQ7ALhEbZQ4EC1B
 pN7YQ3xExmDyTUTcQfeH5tqAeHBYmXSY2qP0sIHWG05DnGsz1QfW6k86nrWppkxsM9Dx
 qnv5qWKMkIJq2CoWVAHLlY46CswH9R2ftWG37VSfX7jGEoB4zTNDGbmWCHP2EfObkN6S
 g8CyO0vo0mTOEisnSTaCMOBh/uMZ2ppQ56+vr/87J4RE5k0iYo11EfQISwTriUJMq2uD
 /+ng==
X-Gm-Message-State: AOAM532stMT5i7/7aslN0S1cbOZv87h6uuAJds1k2ZQO0QK2eYgNpoI9
 axkmUc2RxsWkaZc0xeIgvQ4i2Q==
X-Google-Smtp-Source: ABdhPJz23x9YYT7kn6ADtNpcXFeq0lIiwVkk98kY+doYcdNtjlUQIlafrn5wFGkpRjXik49b18LU5g==
X-Received: by 2002:a5d:6482:: with SMTP id o2mr41030703wri.367.1626866616114; 
 Wed, 21 Jul 2021 04:23:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f26sm21862934wmc.29.2021.07.21.04.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 04:23:35 -0700 (PDT)
Date: Wed, 21 Jul 2021 13:23:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on
 non-x86 EFI platforms
Message-ID: <YPgDtQ0sGRlvNH0F@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
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
 Palmer Dabbelt <palmer@dabbelt.com>
References: <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
 <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
 <CAMj1kXErHteZ+MKYvp=yYmwVxV3A=vjtnG351hZHV+3BPwDQvw@mail.gmail.com>
 <YPbJJ/0tSO/fuW7a@phenom.ffwll.local>
 <03f0edef-e54e-8a2a-4b50-683d3d42e249@redhat.com>
 <YPbWrV/cIODdgu6A@phenom.ffwll.local>
 <37e05f02-b810-0cb1-cc4f-95711cd148d9@suse.de>
 <44a75f18-e3a6-f764-b0ec-ce3ac05805a9@redhat.com>
 <1e85fae7-ef95-b2f7-3463-e90958e54684@suse.de>
 <0ad257ce-44d9-beea-8afb-c879146c523b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ad257ce-44d9-beea-8afb-c879146c523b@redhat.com>
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

On Wed, Jul 21, 2021 at 12:15:12PM +0200, Javier Martinez Canillas wrote:
> On 7/21/21 12:07 PM, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 21.07.21 um 07:09 schrieb Javier Martinez Canillas:
> > ...
> >>>
> >>> Can I simply put the patches in to drm-misc-next? There was some talk
> >>> about a topic branch?
> >>>
> >>
> >> ... which AFAIU means that there's no need for a topic branch, since the
> >> patches will be present in linux-next. And the EFI folks can use that to
> >> check if there are any integration issues or regressions caused by these.
> > 
> > Merged into drm-misc-next.
> > 
> 
> Thanks a lot Thomas for all your help!

Yeah topic branch makes sense when we have further work that will build on
top of a patch sets in at latest _two_ different subsystems, and it
doesn't make sense to just merge it all in one place (because too much
work, or a refactoring that's too invasive and will cause random conflicts
with subsequent work in the same subsystem, or ...).

Otherwise just acks and then merge in one place. We shouldn't do
bureaucratics like topic branches if there's not an actual need for them.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
