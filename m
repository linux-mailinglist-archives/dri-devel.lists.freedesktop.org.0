Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94872531539
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 19:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A1210F5BF;
	Mon, 23 May 2022 17:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2909210F5F6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 17:22:21 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 s32-20020a4a96a3000000b0040e504332adso2198084ooi.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 10:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jyra7hAVNbxUBiQeSeny3J1iXMJn4cpxNxDSkBqSwwc=;
 b=VHi49t2yJ8XZt3l4544whGRcgSG9/chQbJzw/Wb+5ioQ+fsmX3cRpBx6OQxRGk/Ap+
 wPsNDHmdeGfiSYG4yhVoaP8kdesRh7Z3VHHegl8q1JSEQj0W1/AxEFXVJe2KlCYoWN13
 25ePZeus2t/0M9W2csYI07b8jnWviHlnRWgHzXP6/J5XohAxHvEmdaxSNcoc7lfQnDsr
 8T4k7IU1HI2NNx9aZZvGD+J0Egdg5hSd6Pb1Fq4vl+wFkF6Jrauch0gNhrXAGtT7m/+u
 B9nF1ndDN2ey4SNsqLm4DJPsUNy/pqBr0mrYuds8wBJOa6h5x0I5D1XD3LaQVxke7Z+C
 zY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jyra7hAVNbxUBiQeSeny3J1iXMJn4cpxNxDSkBqSwwc=;
 b=Te3BKOCWvDwP3wRz4v6lUUlSWz+BoclinmUF1rz1tkWk+nRS3OvtwTy6lY9e4453ug
 Es2lHSk35zj34TyzhorkKVYgOH6xjWu6KwBMIxOYg3bajR1DiHk65Kbm+WBuz7jdFfkT
 zQ9Jzw7b4Y2rBG59FLZdizbCJHJgXdS11fpi/O2nSE6oKHBQRC/iaz5QHtyOpGhVRxj2
 iMWykCS7yJZBoBLVn0OQ6+lgcp3FrK71uXy4QSjXLeYvvo1M3SOg96vB0KgD4ycHxG4r
 Wi2ihkeiK8HAd1g57/jcy0duq1vRYmT7xSD0cCs+livLbheMupQTEXrROXVOesmKcN+K
 IzNw==
X-Gm-Message-State: AOAM531mJWj+Tf6HrT5E43llAcp91B0R51xTnXq03365nMiiRdbB2Tvd
 IU5JL4+rLO6uxgq5NXB8IHcDVBfwfE7CaE4bdl+TXg==
X-Google-Smtp-Source: ABdhPJzHh/9qmSDYM9XAg5E0fgrqqHi95efq7cL0KZAg+w4CMPYF3qt7r4C+naxClkSjib2q5Q/h0H1EBI7lu9EI0tU=
X-Received: by 2002:a4a:c90a:0:b0:40e:95bf:268d with SMTP id
 v10-20020a4ac90a000000b0040e95bf268dmr1156358ooq.85.1653326540061; Mon, 23
 May 2022 10:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-3-mlevitsk@redhat.com>
 <YoZrG3n5fgMp4LQl@google.com>
 <e32f6c904c92e9e9efabcc697917a232f5e88881.camel@redhat.com>
 <CALMp9eSVji2CPW1AjFoSbWZ_b-r3y67HyatgdqXEqSyUaD1_BQ@mail.gmail.com>
 <65991ac329a32cf4128400b643d5b5ccf3918cfe.camel@redhat.com>
In-Reply-To: <65991ac329a32cf4128400b643d5b5ccf3918cfe.camel@redhat.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 23 May 2022 10:22:09 -0700
Message-ID: <CALMp9eTS4MZPh4fwTPkNxnWgjT-xiqpxhMyVfdP8TZD0x81CMg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/19] KVM: x86: inhibit APICv/AVIC when the guest
 and/or host changes apic id/base from the defaults.
To: Maxim Levitsky <mlevitsk@redhat.com>
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

On Sun, May 22, 2022 at 11:50 PM Maxim Levitsky <mlevitsk@redhat.com> wrote:
>
> On Sun, 2022-05-22 at 07:47 -0700, Jim Mattson wrote:
> > On Sun, May 22, 2022 at 2:03 AM Maxim Levitsky <mlevitsk@redhat.com> wrote:
> > > On Thu, 2022-05-19 at 16:06 +0000, Sean Christopherson wrote:
> > > > On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> > > > > Neither of these settings should be changed by the guest and it is
> > > > > a burden to support it in the acceleration code, so just inhibit
> > > > > it instead.
> > > > >
> > > > > Also add a boolean 'apic_id_changed' to indicate if apic id ever changed.
> > > > >
> > > > > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > > > > ---
> > > > > +           return;
> > > > > +
> > > > > +   pr_warn_once("APIC ID change is unsupported by KVM");
> > > >
> > > > It's supported (modulo x2APIC shenanigans), otherwise KVM wouldn't need to disable
> > > > APICv.
> > >
> > > Here, as I said, it would be nice to see that warning if someone complains.
> > > Fact is that AVIC code was totally broken in this regard, and there are probably more,
> > > so it would be nice to see if anybody complains.
> > >
> > > If you insist, I'll remove this warning.
> >
> > This may be fine for a hobbyist, but it's a terrible API in an
> > enterprise environment. To be honest, I have no way of propagating
> > this warning from /var/log/messages on a particular host to a
> > potentially impacted customer. Worse, if they're not the first
> > impacted customer since the last host reboot, there's no warning to
> > propagate. I suppose I could just tell every later customer, "Your VM
> > was scheduled to run on a host that previously reported, 'APIC ID
> > change is unsupported by KVM.' If you notice any unusual behavior,
> > that might be the reason for it," but that isn't going to inspire
> > confidence. I could schedule a drain and reboot of the host, but that
> > defeats the whole point of the "_once" suffix.
>
> Mostly agree, and I read alrady few discussions about exactly this,
> those warnings are mostly useless, but they are used in the
> cases where we don't have the courage to just exit with KVM_EXIT_INTERNAL_ERROR.
>
> I do not thing though that the warning is completely useless,
> as we often have the kernel log of the target machine when things go wrong,
> so *we* can notice it.
> In other words a kernel warning is mostly useless but better that nothing.

I don't know how this works for you, but *we* are rarely involved when
things go wrong. :-(

> About KVM_EXIT_WARNING, this is IMHO a very good idea, probably combined
> with some form of taint flag, which could be read by qemu and then shown
> over hmp/qmp interfaces.
>
> Best regards,
>         Maxim levitsky
>
>
> >
> > I know that there's a long history of doing this in KVM, but I'd like
> > to ask that we:
> > a) stop piling on
> > b) start fixing the existing uses
> >
> > If KVM cannot emulate a perfectly valid operation, an exit to
> > userspace with KVM_EXIT_INTERNAL_ERROR is warranted. Perhaps for
> > operations that we suspect KVM might get wrong, we should have a new
> > userspace exit: KVM_EXIT_WARNING?
> >
> > I'm not saying that you should remove the warning. I'm just asking
> > that it be augmented with a direct signal to userspace that KVM may no
> > longer be reliable.
> >
>
>
