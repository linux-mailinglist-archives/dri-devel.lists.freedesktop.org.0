Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D6333E255
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 00:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C456E44A;
	Tue, 16 Mar 2021 23:46:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95F66E44D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 23:46:55 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 r15-20020a05600c35cfb029010e639ca09eso2399165wmq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 16:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NqcHEGtzYszUnRQT2utO15aI8o8Zz2gtnHf8uFMKcXQ=;
 b=TdoVmwoke9Wc0r7e91+zsv2NJeZwaQm2XSO4zY8/gn5VbXIAFFwAd7cRLxx5oAm0mR
 NlCpzJXXIQTUoSMwOgCT3aSGCexkdUhQ6hVrIXw/Jf99QruQ9UvEUeZ6ReUMKCzOo53f
 CN5/hQB53LD0ognh08/uWASWDkgOKJ0m1OK6MdLuX1EO5/BsCs1krvTVfiDVrdWOMFVv
 bIjEUKVPtnfyPDMraEP3EufutjVVw/6vQhU2Zf/CAzVUUFt2LqrUK8ExMDEvRE24if7q
 3IqSxHuhfEflZYIpBcm3iNOwRlREprgR94jsZiKqfJ/0hUAIG9Ot3kBCUHmThywXSrJ6
 kSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NqcHEGtzYszUnRQT2utO15aI8o8Zz2gtnHf8uFMKcXQ=;
 b=UdFHEkZkoXNc69xd7eLPpc853AHzPVO6/o1fRUfoKH14tQBXo/egsGKxpUelT1l2+z
 ODhd/u+9TaqD1YO+cUZv7sz5nlO1E4eAvd75yr8PjUDrcuk6wJdVpnXou4fKucMkvyf4
 dy+NMNsklCN89T/WKkPu6XygoTnZ0JNNqaMnoph8ZQxnm+1b8gpiljkJHYSL12nEPIwc
 0sJVw6fWKfWrx40j/8J2xUxndYbdxA0M6bXOeCshitRLBVHxzf9ELKEfvj0CVjxaPW56
 aFoOcQuPmgzyOKlywJ9f4jK1y+6S4zIU6x1VjDG82E0Xurih3ubUcCyIl6KlCNYiAfRs
 I6hA==
X-Gm-Message-State: AOAM532pW1K3A9tC10c37HQRJ9Y97zGWd7+R1eMurIx9TdJvo8kN7zL9
 nKCqsBLe/o6uzVxT+5FznX4sQCJ00eEG3VvtSjA+HA==
X-Google-Smtp-Source: ABdhPJx6Gk+6ZL58g8FW0I4fZHd0xlCol3zJvk21YJfOqzSRNNVgscREqLFh0+C1aegL60MN9CPmDzyayiUfaySytw0=
X-Received: by 2002:a7b:c047:: with SMTP id u7mr1061018wmc.98.1615938414203;
 Tue, 16 Mar 2021 16:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210302204132.12058-1-manasi.d.navare@intel.com>
 <20210303104744.2c064f09@eldfell> <20210303204433.GA15819@labuser-Z97X-UD5H>
 <20210304104223.6b3490bc@eldfell> <20210309005252.GA27491@labuser-Z97X-UD5H>
 <20210309111350.3be0543f@eldfell>
 <CAKMK7uEak_2YNDZpyho5bBhhYCvoXh6MoPNL6FmV9sU8oELGPA@mail.gmail.com>
In-Reply-To: <CAKMK7uEak_2YNDZpyho5bBhhYCvoXh6MoPNL6FmV9sU8oELGPA@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 16 Mar 2021 23:46:38 +0000
Message-ID: <CAPj87rOtWpBW3u7M+ePPQqT_RKEmCzDA8u4gRfT-HrcRaR7_zg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/atomic: Add the crtc to affected crtc
 only if uapi.enable = true
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>
Content-Type: multipart/mixed; boundary="===============1300844170=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1300844170==
Content-Type: multipart/alternative; boundary="00000000000028646005bdaffbeb"

--00000000000028646005bdaffbeb
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Mar 2021 at 21:35, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Mar 9, 2021 at 10:14 AM Pekka Paalanen <ppaalanen@gmail.com>
> wrote:
> > On Mon, 8 Mar 2021 16:52:58 -0800
> > "Navare, Manasi" <manasi.d.navare@intel.com> wrote:
> > > Hmm well after the actual real commit, since the second crtc is stolen
> > > even though it is not being used for the display output, it is
> > > used for joiner so the uapi.enable will be true after the real commit.
> > >
> > > so actually the assertion would fail in this case.
> > >
> > > @Ville @Danvet any suggestions here in that case?
>
> That is very bad. We can't frob uapi state like that. I think that
> calls for even more checks to make sure kms drivers who try to play
> clever games don't get it wrong, so we probably need to check uapi
> enable and active state in another mask before/after ->atomic_check
> too. Or something like that.
>

Yeah. We can _never_ generate externally-visible completion events. We can
later fail to enable the stolen CRTC - because trying to enable new things
can fail for any reason whatsoever - but we can't generate spurious
completion events, as doing so falls into the uncanny valley.

If the kernel is doing clever things behind userspace's back - such as
stealing planes or CRTCs - then userspace can never know about it, apart
from failing to enable those resources later. The kernel can either never
do anything clever (and make userspace bind them both together), or be
extremely clever (by hiding the entire details from userspace), but it
cannot choose the halfway house of doing clever things behind userspace's
back (such as stealing new CRTCs) whilst also exposing all those details to
userspace (such as delivering spurious completion events for resources
userspace never requested to be programmed).

Cheers,
Daniel

--00000000000028646005bdaffbeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"">On Tue, 16 Mar 2021 at 2=
1:35, Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch<=
/a>&gt; wrote:</span><br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Tue, Mar 9, 2021 at 10:14 AM Pekka Paal=
anen &lt;<a href=3D"mailto:ppaalanen@gmail.com" target=3D"_blank">ppaalanen=
@gmail.com</a>&gt; wrote:<br>&gt; On Mon, 8 Mar 2021 16:52:58 -0800<br>
&gt; &quot;Navare, Manasi&quot; &lt;<a href=3D"mailto:manasi.d.navare@intel=
.com" target=3D"_blank">manasi.d.navare@intel.com</a>&gt; wrote:<br>&gt; &g=
t; Hmm well after the actual real commit, since the second crtc is stolen<b=
r>
&gt; &gt; even though it is not being used for the display output, it is<br=
>
&gt; &gt; used for joiner so the uapi.enable will be true after the real co=
mmit.<br>
&gt; &gt;<br>
&gt; &gt; so actually the assertion would fail in this case.<br>
&gt; &gt;<br>
&gt; &gt; @Ville @Danvet any suggestions here in that case?<br>
<br>
That is very bad. We can&#39;t frob uapi state like that. I think that<br>
calls for even more checks to make sure kms drivers who try to play<br>
clever games don&#39;t get it wrong, so we probably need to check uapi<br>
enable and active state in another mask before/after -&gt;atomic_check<br>
too. Or something like that.<br></blockquote><div><br></div><div>Yeah. We c=
an _never_ generate externally-visible completion events. We can later fail=
 to enable the stolen CRTC - because trying to enable new things can fail f=
or any reason whatsoever - but we can&#39;t generate spurious completion ev=
ents, as doing so falls into the uncanny valley.</div><div><br></div><div>I=
f the kernel is doing clever things behind userspace&#39;s back - such as s=
tealing planes or CRTCs - then userspace can never know about it, apart fro=
m failing to enable those resources later. The kernel can either never do a=
nything clever (and make userspace bind them both together), or be extremel=
y clever (by hiding the entire details from userspace), but it cannot choos=
e the halfway house of doing clever things behind userspace&#39;s back (suc=
h as stealing new CRTCs) whilst also exposing all those details to userspac=
e (such as delivering spurious completion events for resources userspace ne=
ver requested to be programmed).</div><div><br></div><div>Cheers,</div><div=
>Daniel=C2=A0</div></div></div>

--00000000000028646005bdaffbeb--

--===============1300844170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1300844170==--
