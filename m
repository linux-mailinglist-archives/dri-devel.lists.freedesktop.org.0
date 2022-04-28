Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CD0512D62
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 09:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF0F10ECC1;
	Thu, 28 Apr 2022 07:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EEF10ECD4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 07:53:06 +0000 (UTC)
Date: Thu, 28 Apr 2022 07:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1651132384;
 bh=ritceg9PElRUAJIYHZcCIAq7zGrcZEqANbgGFRhXGEA=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=XQz63u/t2wvXbh587mGyYRXHZSaYAYObiDAMExM9H+w9+veVd72sAmsDFZmTQCMr1
 0sGkwwNgXWHDW15Jnj4CVBkJg0q4ItSnm68RD/LvkA/1Al/TdQJCppld5LEc23HXGK
 +x6XnupcOfT/CVfds9ioafLncVMPc625aQNei/Eh1CnL8S4DesOtzhw+6XMU8XegQm
 fMTYsedpQPudNlUZXG7DsJATLXmN81M7Q7lpALOex9u3Y6ZJOCFXE7EP3F/ST08YUg
 44lr1OhjNcVqnUUSoILDds3j52KRPRgmyAPf+sfVj3BQ0lbIJhQUIbG2mO6iPCuxk/
 NhfykZ4zU6cLg==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: How should "max bpc" KMS property work?
Message-ID: <LN_QB3Nb1GNVmbIVpDUJ4ZVnK3WVHlLKwEYxIqEMYJYc2BohK-7VrtEXJF7iDytYws4tiq2RnimS1QsqwERDdReixBshVTVzNyAMOcWsE3M=@emersion.fr>
In-Reply-To: <20220428105017.75d9aefe@eldfell>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <20220427135259.5e615945@eldfell>
 <4ceca4d9-c58c-9e33-36a6-dbf0c4bb82a7@amd.com>
 <CA+hFU4ykm-8difozGJ5QtAYc=5RGQTUDiagBNmNccf06sGYGZQ@mail.gmail.com>
 <20220428105017.75d9aefe@eldfell>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, April 28th, 2022 at 09:50, Pekka Paalanen <ppaalanen@gmail.com=
> wrote:

> > > > Also like Alex said, the kernel does not know if the user prefers h=
igh
> > > > color depth or high refresh rate either. One way to solve that is t=
o
> > > > light up the requested video mode any way the kernel can, and then
> > > > report what the resulting color depth is. Another way is to have
> > > > explicit "use this bpc or fail" KMS property, maybe in the form of =
'min
> > > > bpc' as I recall being discussed in the past, and let userspace gue=
ss
> > > > what might work. The former is easier to light up, but probing requ=
ires
> > > > actually setting the modes. The latter may require a lot of
> > > > trial-and-error from userspace to find anything that works, but it
> > > > takes only time and not blinking - as far as things can be detected
> > > > with TEST_ONLY commits. Then one still has to ask the user if it
> > > > actually worked.
> > >
> > > min_bpc sounds like something we might want for HDR use-cases, unless
> > > the compositor has a way to confirm the output box (and format). min_=
bpc
> > > would allow the KMS driver to pick the lowest required bpc so the
> > > compositor always has a guarantee of quality.
> >
> > IMO that would be ideal. The driver should try to reduce bandwidth by l=
owering
> > the bpc down to the min_bpc if the hardware can't drive the selected mo=
de at a
> > higher bpc. User space usually knows which bpc is sufficient for the us=
e case
> > but will never complain about too much bpc. Drivers which don't support
> > lowering the bpc dynamically can then still go with the min_bpc and use=
r space
> > still gets all the modes which work with the minimum required bpc.
>
>
> This would be nice, yes.
>
> I'm fairly sure 'min bpc' was discussed here on the dri-devel mailing
> list in the past, but I don't remember when or by whom.

Yup. I explained there that I'd prefer "current bpc" + "user bpc" props
and let user-space deal with the fallback logic just like it does for
modes, modifiers, etc.
