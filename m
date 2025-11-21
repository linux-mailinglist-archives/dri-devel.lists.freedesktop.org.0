Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01A5C7A74C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0E310E2BC;
	Fri, 21 Nov 2025 15:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YZZ1uHWX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAAE410E2BC
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:16:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 96EB543E86
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77257C16AAE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763738193;
 bh=4Nw5kzDQ9aadF93520L+loYg4Pe3c7ohExj2x9LkHTc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YZZ1uHWX8jA8h3KqeGr5dk5BqSVqo2ZxZUdgIweTw8ldAfF2BlKGbx9hcCetumLYF
 6Z0Av4erPZ1ceu78hk33NVgzoft53GdBcDHrjLQI208QVTibCUAnQCXJr7dFEKOJzp
 vgyagzRm0Pw7hrUcJLqFULp4DiiDbA7fgHa7kGVIyYElH9FO0ZKbsfr0lXWeW/Etan
 9UrtWfJtqyHR0CmqDBUR48vIDrb0Baro3f00cbZ9KAHq7CW2noZ8PM+tJ3/z8URu75
 6Z9cxuWlBxzHnFoYSYDYrRggRq5Y9axSC4q01vXWPQt8uMMkjzBr553v5fFmpzGmGb
 +QnmP3qW8lTuw==
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-59577c4c7c1so2963594e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 07:16:33 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX6ARUCJbZYZ+p5dSvjPpTK3AIBLoBXBzsGgnJpGF4l5T0i2ia+Xr+PIbuCmZ6gxhy+evvcLvbZAcs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLJTP9ZNmzWg0ckbsS2nXT41cbD7Ketux3vIdvYWfr2tMgX9nd
 EFYKirVhcRjhzVnCaeXnzb1p7pgHJFCPDIBRmfAjxy8atjgxBn+RaDSvv32R4bdRlvyMFXsgl8U
 OD4uuYStPkEfpLBZHgnvYlcCVP2wis7M=
X-Google-Smtp-Source: AGHT+IGPowCSKA7rqmBuuVeVvwKvJAgVwSGnoB8Wq+tDig5gUYW9uVP5SF2rLUXJXBy7GBEfdZMPDjZn9AIuPMCXlv4=
X-Received: by 2002:a05:6512:15a6:b0:594:5f1d:d60d with SMTP id
 2adb3069b0e04-596a377e72dmr1012107e87.14.1763738191788; Fri, 21 Nov 2025
 07:16:31 -0800 (PST)
MIME-Version: 1.0
References: <20251121135624.494768-1-tzimmermann@suse.de>
 <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
In-Reply-To: <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 21 Nov 2025 16:16:20 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF1Dh0RbuqYc0fhAPf-CM0mdYh8BhenM8-ugKVHfwnhBg@mail.gmail.com>
X-Gm-Features: AWmQ_bl_zPBWf1NywIhUPQAGEMUCFj4H1ZabIpySRf4mYN0qS7e_KlhM-cPxo4Y
Message-ID: <CAMj1kXF1Dh0RbuqYc0fhAPf-CM0mdYh8BhenM8-ugKVHfwnhBg@mail.gmail.com>
Subject: Re: [PATCH 0/6] arch,
 sysfb: Move screen and edid info into single place
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, x86@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-efi@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 21 Nov 2025 at 16:10, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Nov 21, 2025, at 14:36, Thomas Zimmermann wrote:
> > Replace screen_info and edid_info with sysfb_primary_device of type
> > struct sysfb_display_info. Update all users.
> >
> > Sysfb DRM drivers currently fetch the global edid_info directly, when
> > they should get that information together with the screen_info from their
> > device. Wrapping screen_info and edid_info in sysfb_primary_display and
> > passing this to drivers enables this.
> >
> > Replacing both with sysfb_primary_display has been motivate by the EFI
> > stub. EFI wants to transfer EDID via config table in a single entry.
> > Using struct sysfb_display_info this will become easily possible. Hence
> > accept some churn in architecture code for the long-term improvements.
>
> This all looks good to me,
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> It should also bring us one step closer to eventually
> disconnecting the x86 boot ABI from the kernel-internal
> sysfb_primary_display.
>

Agreed

Acked-by: Ard Biesheuvel <ardb@kernel.org>

I can take patches 1-2 right away, if that helps during the next cycle.
