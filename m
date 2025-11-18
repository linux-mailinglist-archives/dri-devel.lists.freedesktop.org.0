Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F01C6ABE2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 17:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DD810E4F9;
	Tue, 18 Nov 2025 16:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SyNoXJq4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949DB10E4F9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 16:52:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B936461103
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 16:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29146C2BCB7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763484745;
 bh=/UYbgwArONFdvk5Zr+rtS+c/GYFVhvmgd+R153ybqGY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SyNoXJq4jqfUAHQHyTiqEz9LkvLvKoyPVCWUygPrHGjdxKHyZtAh/0rofTzJJiOJv
 QGO+N1GFrcndODXDQtyA9Dl2ctgZ2+jylsXszcIbvDGH4w0h8DTt0XIeOKhd7+US09
 CrXtRg5mV8GaB5E2zR5OJ0mWc28Zfk4b8cPEm53PQHe+mYFmbd7POgX9ZvlJpR1hhh
 4RGuABPqVb0/iFJ5EyIL8Y+saWmcA/nIaOGbGGCRo7bZV/ChfeoRXxqpDJ8TIrdgQS
 LChIeLsq1jTPXzdxRQ2bu9s0O8VjH9kqHedUmRjvPZ7DpokZv5mHagSS/aFRZhJU0z
 0ryOx6wYUYWoQ==
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-59578e38613so6226311e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:52:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVrCgg+w9r//DF8kaYSwqJyzULSqM92jgjzBzREupuYhlR8UPFQX6UuBGZ/uWl5Auv8qIRXcdoUlZ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzU/LQoZnIDHwzpuvhZrNRCrnYD0VywDKVOKxSiY5vtrdc7+KGy
 zqvAYACaLHEpClc+mMATXWdJsHAI9SX0djWJhQ+K3CyrRZFxKwEHL24XjcBje+dH82bwjBtPtA9
 fbqoXGzo0wJhceew3/7kVaV+PMU4usqs=
X-Google-Smtp-Source: AGHT+IFksk9/clMmZi7mOOu8rAadkOumT7VeVOL++ibIDj8QdKllEdllcxF8SVt5pBbMxZLv1hClzabPHWc/9O7alyo=
X-Received: by 2002:a05:6512:32ca:b0:595:7e2d:986a with SMTP id
 2adb3069b0e04-595841b664emr5509917e87.24.1763484742954; Tue, 18 Nov 2025
 08:52:22 -0800 (PST)
MIME-Version: 1.0
References: <20251015160816.525825-1-tzimmermann@suse.de>
 <CAMj1kXF62pEMUJAM12HnF7qMt5xhZaZXpPoMdebMUKCfoAYisQ@mail.gmail.com>
 <b6801420-6ae4-44cb-9d86-e9353a2a59d8@suse.de>
In-Reply-To: <b6801420-6ae4-44cb-9d86-e9353a2a59d8@suse.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 18 Nov 2025 17:52:11 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHKc4jJnQ9x+sUhAO54PeZ6QN6yzcHVTovGvunp2QYnDA@mail.gmail.com>
X-Gm-Features: AWmQ_bl7etIV5p_8fkgiaE4DIbmT-ztJJoP0b_jbGjWYhamjdP8Q_QlshQ_xgdY
Message-ID: <CAMj1kXHKc4jJnQ9x+sUhAO54PeZ6QN6yzcHVTovGvunp2QYnDA@mail.gmail.com>
Subject: Re: [PATCH 0/5] efi: x86: Provide EDID from GOP device
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jonathan@marek.ca, javierm@redhat.com, linux-efi@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, 17 Nov 2025 at 09:02, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 14.11.25 um 09:31 schrieb Ard Biesheuvel:
> > On Wed, 15 Oct 2025 at 18:08, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >> Add support for EFI_EDID_ACTIVE_PROTOCOL and EFI_EDID_DISCOVERED_PROTOCOL
> >> on x86. Refactor the GOP helpers for EDID support, then retrieve the EDID
> >> into x86 boot_params.
> >>
> >> Later boot code copies the EDID from the boot parameters into the global
> >> variable edid_info. Graphics drivers, such as efidrm, can pick up the
> >> information from there. In the case of efidrm, it provides the EDID to
> >> user-space compositors, which use it for improved QoS on the display
> >> output. Similar functionality is already available on old VESA systems
> >> with vesadrm.
> >>
> >> Tested on x86 EFI systems.
> >>
> >> Another patch is required to provide EDID on non-x86 systems via the
> >> generic EFI stub. The implementation can directly build upon this
> >> series.
> >>
> >> Thomas Zimmermann (5):
> >>    efi: Fix trailing whitespace in header file
> >>    efi/libstub: gop: Find GOP handle instead of GOP data
> >>    efi/libstub: gop: Initialize screen_info in helper function
> >>    efi/libstub: gop: Add support for reading EDID
> >>    efi/libstub: x86: Store EDID in boot_params
> >>
> > Hi,
> >
> > Apologies for the delay. This series looks fine to me, although I
> > would prefer it if we could make things a bit more generic?
> >
> > Everything you are adding here is arch-agnostic, except for the bit
> > where we use x86-specific plumbing to pass the EDID info between the
> > EFI stub and the core kernel.
>
> Attached is an RFC patch that I already have. This would be the next
> step for EDID support. I've not yet sent the generic-EFI patch, as I did
> not have opportunity to test it. The patch addresses most of what you
> ask for, I think.
>
> >
> > More specifically, could we do the following:
> > - move struct edid_info edid_info into common code
>
> edid_info is related to screen_info, so it follows the same conventions.
> Arnd Bergmann made x86-specific changes for screen_info in commit
> b8466fe82b79 ("efi: move screen_info into efi init code"). x86 has it's
> own thing, sort of. See the attached patch for my non-x86 solution.
>
> > - pass the detected EDID info block via a EFI config table instead of
> > boot_params
>
> The x86 code uses boot params for screen_info already and also transfers
> edid_info on VESA systems via boot params (or if grub set up boot_params
> for us). [1] It's all there and working already. If we transfer
> edid_info via config table, we'd need extra code on x86.
>

I understand the x86 already uses edid_info for non-EFI boot, but that
doesn't mean we have to introduce new dependencies on legacy bits like
boot_params to the EFI stub.

For generic EFI, I don't think it is necessary to clone all the config
table logic with GUIDs and stuff. Instead, given that the EFI stub is
tightly coupled with the kernel anyway, we can just decide that the
config table has both a screen_info and a edid_info struct, and the
generic EFI code consuming the config table populates both.
