Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D1413B494
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 22:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA446E570;
	Tue, 14 Jan 2020 21:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600216E570
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 21:41:00 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 9so11024425lfq.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 13:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QsgxnxcHC/cN4ApnlrKYl7HnbIPs+RbojekPGxP19Ko=;
 b=RSJpXyqM5nkOMEMp6NJlIZ/O5iRofZweBa5tRQYm8oLecHWcTs42Dne1pDZJAqUT/o
 rrWLTgqMm9bYQXdPd/aQurI1mQA99Ycranvj76itHuuUYhPDY7QDdW/WVYgq+/0WhVMp
 dam6jawaadc+Pt5wjQ+AUav0k9ntKZU5mTfHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QsgxnxcHC/cN4ApnlrKYl7HnbIPs+RbojekPGxP19Ko=;
 b=iHypscEqCvj3o8BXDokKvC7UOnJONCsAD39+RUlthf9+ziQpGJyu8RBzRlyYNOIZXX
 UWQTIt1ElpPqWU7yPsMUbCYb4Ld0vj3mPymQfXKzcuNOFTVu9PgHOv3iyYRyy9c7AwCx
 GrUz/mgjRvDnvq+z8rLF0KghtjOcTpBP95Q2dAdfMXsZ/so9K/GhCCvznDO4iFJyeX/n
 R3oc1S/TAJqHcE7AhHyjY97uIlaKvQMHyMd1dHngazsPqGiTXHSvmlii4l4RsU8hJrZn
 us5EtyCXKgnqhqm5r/MZErpK48nwf/a61aHRh7JLzAM4iIVom9bAyxTxsq2Mt7AwV24a
 JJOA==
X-Gm-Message-State: APjAAAWwIyypJXzQ8nzNs8vPtD47zroisSzNwkAt0Lu6oBRY196w+k9A
 tUBrQYUJVcqUK7yNCwzbEPc/ZN+KkZI=
X-Google-Smtp-Source: APXvYqxrvB0/99xev1tmNACUxfEI8nCbckPCKyiPZUmgnvbhOj88HRDvwoZTmLa45O/i6nfuixgSXA==
X-Received: by 2002:ac2:4194:: with SMTP id z20mr2947959lfh.20.1579038058417; 
 Tue, 14 Jan 2020 13:40:58 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id n3sm7839348lfk.61.2020.01.14.13.40.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 13:40:57 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id u1so16109654ljk.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 13:40:57 -0800 (PST)
X-Received: by 2002:a2e:93d5:: with SMTP id p21mr15460959ljh.50.1579038057285; 
 Tue, 14 Jan 2020 13:40:57 -0800 (PST)
MIME-Version: 1.0
References: <bug-206175-5873@https.bugzilla.kernel.org/>
 <bug-206175-5873-dSmrOaqbiZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206175-5873-dSmrOaqbiZ@https.bugzilla.kernel.org/>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Jan 2020 13:40:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjDzHKweQfnMSyGdXo1ber-Hm-fYDC9TiE8xZZaEzZ8sw@mail.gmail.com>
Message-ID: <CAHk-=wjDzHKweQfnMSyGdXo1ber-Hm-fYDC9TiE8xZZaEzZ8sw@mail.gmail.com>
Subject: Re: [Bug 206175] Fedora >= 5.4 kernels instantly freeze on boot
 without producing any display output
To: Dave Airlie <airlied@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dave, Alex,
 there's an odd bugreport on bugzilla, where Artem is seeing an odd
early-boot failure.

That one almost certainly has nothing to do with you guys, but see the
later odd (and apparently unrelated) report about some AMD graphics
firmware issue and a black screen.

                     Linus

On Tue, Jan 14, 2020 at 1:17 PM <bugzilla-daemon@bugzilla.kernel.org> wrote:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=206175
>
> --- Comment #9 from Matt Yates (matt@fast-mail.org) ---
> My BIOS vendor is "Insyde Corp.".  There is a TPM module.  When I disabled it,
> it caused my EFI boot entry to disappear, so I couldn't test it.
>
> However, I think we may have two separate problems.  I switched back from
> Fedora to Debian Testing, and the Debian installer upgraded the kernel from 5.3
> to 5.4 series prior to the first boot.  The 5.4 kernel booted up on first boot.
>  I could see boot messages scrolling, but the screen went to a black while
> trying to load lightdm because I did not have the "firmware-amd-graphics"
> package installed required for graphics.  After installing the amd graphics
> package, the 5.4 kernel freezes as before (right at the start of the boot
> process).  The 5.3 kernel boots as normal, and graphics work.
>
> The "firmware-amd-graphics" package (version 20190717-2) was the only thing I
> changed, so I guess the problem must be some sort of conflict with the amd
> graphics firmware and the 5.4 kernel.
>
> --
> You are receiving this mail because:
> You are on the CC list for the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
