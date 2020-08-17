Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4F2245C66
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 08:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392BE6E41B;
	Mon, 17 Aug 2020 06:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1674B6E051;
 Mon, 17 Aug 2020 06:24:24 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id t10so6988986plz.10;
 Sun, 16 Aug 2020 23:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yhMUZwHvzHAv9CIz2t0G10KDW+iimqS/zlmv/v2XyYE=;
 b=iCSn1SagUarZr4wq1Jf8h92lVujYcuAEGfxmUAdMq1SNM26URdX30wH/7plEjmS0UQ
 68e3lhWJmu2Gd+Ib5PdT5jwttqZ7e1gc46NCTli1xBzJWHN8LesXBfKlWoUoKAX5sxt1
 HY+Eel1j240ZOBQGnjR4nZJ6uiKWYTVz4Dp77C0PBzCZaIwxgxniwchZaLK1qe1J27ot
 HkQzcdoMUQCN6k72sCuoqd+GvJFSJZwDpHkO5lEjzVPhqLrwRLR8h4030YEHDplSCjyO
 l+r0eIcSJMJHouId6opU9CEwkVNMMq5Cn8zVgrAVjnW3JUGALbm1svwn+vsXX7El/Fhj
 vAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yhMUZwHvzHAv9CIz2t0G10KDW+iimqS/zlmv/v2XyYE=;
 b=dQ4dfALhRj+0M5M02DfjkgelAOolHWt1AndTK2nfsZjB1D+7JzVKt1azyWT1e3tMOQ
 DNLfrQofmQ1/lGu12axMwyI5PxtY8KSOpQqx75c1oqaTIlH87Egb8Vc37cFahISFqVtQ
 4wlK9afoaPkakSEGztd8RlJQMJDxweyIXSzSukcjMSHOqWylGt/9jhKc1JVz6Ehh/0h7
 /zWlt1KtMxm5kIyZ1/OOPc8vVsGPYULxx1WqUs0CihHS6UqulrtCoiajBhv0i0/mXNjr
 fmh8lu12n3oIAvGZEfdUCB/8KyiYnXmdAOl+xVgYLrLvWHMDoP0viyuXTlQY4WMbq22K
 eQgg==
X-Gm-Message-State: AOAM531Uk0uNftKJvYNOpti1XaesXV6xvDRjVUfp1skAiGo3e8U+3Cpu
 v3fOSwufSWXJWoXdO1UyQQhzx8imdQ3hH1cuocrvIVSTuPQ=
X-Google-Smtp-Source: ABdhPJx52BDbB8cseHb0WtAYM9pgtTY3aQUO+QL4TNlXK6yV/acmqwyTnMRxa1Xmzw8WXzirV+wHFHf5NkTgD8DWSFc=
X-Received: by 2002:a17:90b:391:: with SMTP id
 ga17mr11253204pjb.75.1597645463565; 
 Sun, 16 Aug 2020 23:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-4-nicholas.kazlauskas@amd.com>
 <20200807083041.GL6419@phenom.ffwll.local>
 <4117cdee-2f5d-a8bd-1e80-1c550c9d9af3@amd.com>
 <20200810122553.GI2352366@phenom.ffwll.local>
 <9fc38b52-6b46-fec8-e511-3fc3e9d2c151@gmail.com>
 <CAAxE2A5BXVJ9xQ=C6F=Df1MCGUKTjV7yR=6x5hu6vfARp1SD7Q@mail.gmail.com>
 <20200812135447.GF2352366@phenom.ffwll.local>
In-Reply-To: <20200812135447.GF2352366@phenom.ffwll.local>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 17 Aug 2020 02:23:47 -0400
Message-ID: <CAAxE2A7TC14u9_kkJnpG7-_rLG-q_vkyjhh6=pCDmL0NcfBWaQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/amd/display: Avoid using unvalidated tiling_flags
 and tmz_surface in prepare_planes
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1469316199=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1469316199==
Content-Type: multipart/alternative; boundary="00000000000055399205ad0cd24d"

--00000000000055399205ad0cd24d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2020 at 9:54 AM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Aug 11, 2020 at 09:42:11AM -0400, Marek Ol=C5=A1=C3=A1k wrote:
> > There are a few cases when the flags can change, for example DCC can be
> > disabled due to a hw limitation in the 3d engine. Modifiers give the
> > misleading impression that they help with that, but they don't. They
> don't
> > really help with anything.
>
> But if that happens, how do you tell the other side that it needs to
> sample new flags? Does that just happen all the time?
>
> Also do the DDC state changes happen for shared buffers too?
>

I thought we were only talking about shared buffers.

If the other side is only a consumer and the producer must disable DCC, the
producer decompresses DCC and then disables it and updates the BO flags.
The consumer doesn't need the new flags, because even if DCC stays enabled
in the consumer, it's in a decompressed state (it has no effect). Only the
producer knows it's disabled, and any new consumer will also know it when
it queries the latest BO flags.

It doesn't work if both sides use writes, because it's not communicated
that DCC is disabled (BO flags are queried only once). This hasn't been a
problem so far.

Is there a way to disable DCC correctly and safely across processes? Yes.
So why don't we do it? Because it would add more GPU overhead.

Marek

--00000000000055399205ad0cd24d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Aug 12, 2020 at 9:54 AM Daniel Vetter &lt;<a href=3D"mailto:=
daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Tue, Aug 11, 2020 at 09:42:11AM -0400, =
Marek Ol=C5=A1=C3=A1k wrote:<br>
&gt; There are a few cases when the flags can change, for example DCC can b=
e<br>
&gt; disabled due to a hw limitation in the 3d engine. Modifiers give the<b=
r>
&gt; misleading impression that they help with that, but they don&#39;t. Th=
ey don&#39;t<br>
&gt; really help with anything.<br>
<br>
But if that happens, how do you tell the other side that it needs to<br>
sample new flags? Does that just happen all the time?<br>
<br>
Also do the DDC state changes happen for shared buffers too?<br></blockquot=
e><div><br></div><div>I thought we were only talking about shared buffers.<=
/div><div><br></div><div><div>If the other side is only a consumer and the =
producer must disable DCC, the producer decompresses DCC and then disables =
it and updates the BO flags. The consumer doesn&#39;t need the new flags, b=
ecause even if DCC stays enabled in the consumer, it&#39;s in a decompresse=
d state (it has no effect). Only the producer knows it&#39;s disabled, and =
any new consumer will also know it when it queries the latest BO flags.<br>=
</div><div><br></div><div>It doesn&#39;t work if both sides use writes, bec=
ause it&#39;s not communicated that DCC is disabled (BO flags are queried o=
nly once). This hasn&#39;t been a problem so far.</div><div><br></div><div>=
Is there a way to disable DCC correctly and safely across processes? Yes. S=
o why don&#39;t we do it? Because it would add more GPU overhead.<br></div>=
<div><br></div><div>Marek<br></div></div></div></div>

--00000000000055399205ad0cd24d--

--===============1469316199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1469316199==--
