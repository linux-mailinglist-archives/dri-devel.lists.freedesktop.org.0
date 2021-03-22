Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE98934528F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 23:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087FF6E03F;
	Mon, 22 Mar 2021 22:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CBA6E03F;
 Mon, 22 Mar 2021 22:50:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9008D619AF;
 Mon, 22 Mar 2021 22:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616453410;
 bh=uswimGLXSixuyDNhbT1lz8xZrWttoUKDID8KyDH0WG0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=amyVtju7uIURiCWdHdQflKk1Uy5uaUl0jSM14IOTPFAohfgjX6aNW2KNuxCJtYCAo
 Iq3iv0T/Fse0yOGtClBFW9lSZE7aaq5x8nvOG96GevRCer6irU7c+80RceV8EVJ5kx
 MyABhKHnqgLkwgPjFUcsT9rt5Ch7AD6xkqPlfErTbnJ16VSW7CL/8voAWgmiYiZP+2
 FNG8ibSI2xKBl+QJzXjnar4dGoW1lmiY/KAWQjWwKmqPmSQ5aiKJPzyqeCBCT+W6FE
 laR6EilYtVT8DnV5kJgvUwfjeNkVR5uJLU421n3+vr2W/G1PBIgRrNWzYxZ4T75LGD
 pwIqz5PKV+08w==
Received: by mail-oo1-f42.google.com with SMTP id
 i25-20020a4aa1190000b02901bbd9429832so4510366ool.0; 
 Mon, 22 Mar 2021 15:50:10 -0700 (PDT)
X-Gm-Message-State: AOAM533My+GLmweYJsRLy/BoPt77lxv7gvy0adYG0T6N3Ysy0kVEQ+vD
 jw7dWxXkGurZTWEROGsBW+8L/RBHkTZCtqPalMI=
X-Google-Smtp-Source: ABdhPJyFT7IMFvy91F/uYGCzlkCC/fHWW2uOMBKkCcSHVU9m95IK8d72cGqN72gkARj9tN7bu2YOUo8AE/gjduOBJeY=
X-Received: by 2002:a4a:304a:: with SMTP id z10mr1380770ooz.26.1616453409742; 
 Mon, 22 Mar 2021 15:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-3-arnd@kernel.org>
 <20210322202958.GA1955909@gmail.com>
 <b944a853-0e4b-b767-0175-cc2c1edba759@gmail.com>
In-Reply-To: <b944a853-0e4b-b767-0175-cc2c1edba759@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 22 Mar 2021 23:49:53 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0JW0AqQmHXaveD8za1np+W=Q3D4PuHnYKRd8UJqiwhsw@mail.gmail.com>
Message-ID: <CAK8P3a0JW0AqQmHXaveD8za1np+W=Q3D4PuHnYKRd8UJqiwhsw@mail.gmail.com>
Subject: Re: [PATCH 02/11] x86: tboot: avoid Wstringop-overread-warning
To: Martin Sebor <msebor@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 Ingo Molnar <mingo@redhat.com>, Kalle Valo <kvalo@codeaurora.org>,
 ath11k@lists.infradead.org, Serge Hallyn <serge@hallyn.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Ning Sun <ning.sun@intel.com>,
 Anders Larsen <al@alarsen.net>, Borislav Petkov <bp@alien8.de>,
 Cgroups <cgroups@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Martin Sebor <msebor@gcc.gnu.org>, Networking <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 11:09 PM Martin Sebor <msebor@gmail.com> wrote:
> On 3/22/21 2:29 PM, Ingo Molnar wrote:
> > * Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > I.e. the real workaround might be to turn off the -Wstringop-overread-warning,
> > until GCC-11 gets fixed?
>
> In GCC 10 -Wstringop-overread is a subset of -Wstringop-overflow.
> GCC 11 breaks it out as a separate warning to make it easier to
> control.  Both warnings have caught some real bugs but they both
> have a nonzero rate of false positives.  Other than bug reports
> we don't have enough data to say what their S/N ratio might be
> but my sense is that it's fairly high in general.
>
>    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=wstringop-overread
>    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=wstringop-overflow

Unfortunately, stringop-overflow is one of the warnings that is
completely disabled in the kernel at the moment, rather than
enabled at one of the user-selectable higher warning levels.

I have a patch series to change that and to pull some of these
into the lower W=1 or W=2 levels or even enable them by default.

To do this though, I first need to ensure that the actual output
is empty for the normal builds. I added -Wstringop-overflow to
the list of warnings I wanted to address because it is a new
warning and only has a dozen or so occurrences throughout the
kernel.

> In GCC 11, all access warnings expect objects to be either declared
> or allocated.  Pointers with constant values are taken to point to
> nothing valid (as Arnd mentioned above, this is to detect invalid
> accesses to members of structs at address zero).
>
> One possible solution to the known address problem is to extend GCC
> attributes address and io that pin an object to a hardwired address
> to all targets (at the moment they're supported on just one or two
> targets).  I'm not sure this can still happen before GCC 11 releases
> sometime in April or May.
>
> Until then, another workaround is to convert the fixed address to
> a volatile pointer before using it for the access, along the lines
> below.  It should have only a negligible effect on efficiency.
>
> diff --git a/arch/x86/kernel/tboot.c b/arch/x86/kernel/tboot.c
> index 4c09ba110204..76326b906010 100644
> --- a/arch/x86/kernel/tboot.c
> +++ b/arch/x86/kernel/tboot.c
> @@ -67,7 +67,9 @@ void __init tboot_probe(void)
>          /* Map and check for tboot UUID. */
>          set_fixmap(FIX_TBOOT_BASE, boot_params.tboot_addr);
>          tboot = (struct tboot *)fix_to_virt(FIX_TBOOT_BASE);
> -       if (memcmp(&tboot_uuid, &tboot->uuid, sizeof(tboot->uuid))) {
> +       if (memcmp(&tboot_uuid,
> +                  (*(struct tboot* volatile *)(&tboot))->uuid,
> +                  sizeof(tboot->uuid))) {
>                  pr_warn("tboot at 0x%llx is invalid\n",

I think a stray 'volatile' would raise too many red flags here, but
I checked that the RELOC_HIDE() macro has the same effect, e.g.

@@ -66,7 +67,8 @@ void __init tboot_probe(void)

        /* Map and check for tboot UUID. */
        set_fixmap(FIX_TBOOT_BASE, boot_params.tboot_addr);
-       tboot = (struct tboot *)fix_to_virt(FIX_TBOOT_BASE);
+       /* RELOC_HIDE to prevent gcc warnings about NULL pointer */
+       tboot = RELOC_HIDE(NULL, fix_to_virt(FIX_TBOOT_BASE));
        if (memcmp(&tboot_uuid, &tboot->uuid, sizeof(tboot->uuid))) {
                pr_warn("tboot at 0x%llx is invalid\n", boot_params.tboot_addr);
                tboot = NULL;

     Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
