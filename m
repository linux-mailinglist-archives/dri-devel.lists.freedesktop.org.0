Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D07530970
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 08:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D563210EB7C;
	Mon, 23 May 2022 06:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CBB10E0A9
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 14:47:20 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 p12-20020a9d4e0c000000b00606b40860a3so8622003otf.11
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qs1N4izsogFrS0OZ7oEYOqsnkQJp8brscTXYKO0KODg=;
 b=n0ri6GuuRPbaGra3hsQb2Sl6zVFxnndY7NXm+jezsIjAi4V4h/jKv9xmJpQ6I7DZQK
 ZHC18L/3KL9VZJgQ3UfNemR7n6cUs6mvd17BoYNecLqeWeUFjNKHeVSSnWB/YiUuAmgw
 EZzXPq2St3RSIT9ak9KXc22WLER/LuPj8/mD4wpKl+sHPqCFajKOTaaYZTpJo23HlQ9r
 vIyOhlHUtzqZ5aYIbnufJQVr/JrVrKAosPQSbKWl+zRzow3xjiz60kshBliNTxbaiC02
 kGLQWcLi0+eGJMPrnpoZIvQsTgg/DupstjpIz9uiHIMA9zs39gjnzw9bvrcBWJV/32Xn
 I6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qs1N4izsogFrS0OZ7oEYOqsnkQJp8brscTXYKO0KODg=;
 b=zyDRSVubSx/ZHzPr1vg4iTt0e72NE88sPh3Eab6rEW4+453pipNJHqJyCHvvArvV77
 eIykXBTEPa394qDTGd6kLInDLi3SXIM/TNqRPTCNh+Us451LnX6oEEcT0DndcvovlUsQ
 LPJPHC+WAynEh6Myi74JPsiyGNRKFMqOcw/rtN3QQGBRQAiq9GYryoVxdIBXMfPHCnVD
 opvYT31yymj70aMvEuiuFyYSeU7iWqPX45S82paV2k0w9apxy4q16AqIsGmGJq9Fvqf9
 Mcul3hhc9YUFmTEv+/aks00hgkfhGa0nRINUNnwUQAe7MpRtBDU7AhTgKq3MI4EIOigz
 lrNw==
X-Gm-Message-State: AOAM530+eAM57U5MFb/8jgxPxzq1MNcFARiy5AMdQq0jtq2R+WqzWA79
 oG+sQXCO82INgGCPhR/+4/qr28PH7tjkb1C+cXIwLg==
X-Google-Smtp-Source: ABdhPJymhdAfrmIP3RTOY2pkVWLq6TJ5BXlS/aT4ewlndrVWFaHL6w8GFbXgU4aDVUAXyxz4+oecu/U8A24wK/Ylz1Q=
X-Received: by 2002:a05:6830:280e:b0:606:ae45:6110 with SMTP id
 w14-20020a056830280e00b00606ae456110mr6973637otu.14.1653230839109; Sun, 22
 May 2022 07:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-3-mlevitsk@redhat.com>
 <YoZrG3n5fgMp4LQl@google.com>
 <e32f6c904c92e9e9efabcc697917a232f5e88881.camel@redhat.com>
In-Reply-To: <e32f6c904c92e9e9efabcc697917a232f5e88881.camel@redhat.com>
From: Jim Mattson <jmattson@google.com>
Date: Sun, 22 May 2022 07:47:07 -0700
Message-ID: <CALMp9eSVji2CPW1AjFoSbWZ_b-r3y67HyatgdqXEqSyUaD1_BQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/19] KVM: x86: inhibit APICv/AVIC when the guest
 and/or host changes apic id/base from the defaults.
To: Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 23 May 2022 06:25:06 +0000
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 intel-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 22, 2022 at 2:03 AM Maxim Levitsky <mlevitsk@redhat.com> wrote:
>
> On Thu, 2022-05-19 at 16:06 +0000, Sean Christopherson wrote:
> > On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> > > Neither of these settings should be changed by the guest and it is
> > > a burden to support it in the acceleration code, so just inhibit
> > > it instead.
> > >
> > > Also add a boolean 'apic_id_changed' to indicate if apic id ever changed.
> > >
> > > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > > ---
> > > +           return;
> > > +
> > > +   pr_warn_once("APIC ID change is unsupported by KVM");
> >
> > It's supported (modulo x2APIC shenanigans), otherwise KVM wouldn't need to disable
> > APICv.
>
> Here, as I said, it would be nice to see that warning if someone complains.
> Fact is that AVIC code was totally broken in this regard, and there are probably more,
> so it would be nice to see if anybody complains.
>
> If you insist, I'll remove this warning.

This may be fine for a hobbyist, but it's a terrible API in an
enterprise environment. To be honest, I have no way of propagating
this warning from /var/log/messages on a particular host to a
potentially impacted customer. Worse, if they're not the first
impacted customer since the last host reboot, there's no warning to
propagate. I suppose I could just tell every later customer, "Your VM
was scheduled to run on a host that previously reported, 'APIC ID
change is unsupported by KVM.' If you notice any unusual behavior,
that might be the reason for it," but that isn't going to inspire
confidence. I could schedule a drain and reboot of the host, but that
defeats the whole point of the "_once" suffix.

I know that there's a long history of doing this in KVM, but I'd like
to ask that we:
a) stop piling on
b) start fixing the existing uses

If KVM cannot emulate a perfectly valid operation, an exit to
userspace with KVM_EXIT_INTERNAL_ERROR is warranted. Perhaps for
operations that we suspect KVM might get wrong, we should have a new
userspace exit: KVM_EXIT_WARNING?

I'm not saying that you should remove the warning. I'm just asking
that it be augmented with a direct signal to userspace that KVM may no
longer be reliable.
