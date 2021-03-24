Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC6634768E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 11:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597D26E9B8;
	Wed, 24 Mar 2021 10:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615796E9B4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 10:53:39 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id k25so8868985iob.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 03:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2whUJhCraBEtP2pdulfjOoK298h0/6QvmdXnzhHH7vY=;
 b=UP3R8Qy1B74mWtYoMs4KmmyNNnZDjyx4cg8jfeHBmLeQ9C5V4EAumFvnYR7WHCZXHO
 PXYWaK7U/XzZuYYZA7jETSkgdU9BCLgNo1/vHkAO3yPNed1SEdr/ntr7IQXtaycQqf74
 OjBKsFciZiTrlzFqXabAiyD4dNd9y5mZlLwYIYI6QlOBOGjS+0ippiBt5HpXJugI/K45
 TnvrAje6IMqRPZ5r3Av3Rv3SCj7gXSmNCWgB9wa4aOH9pZ78Cg9/Ced3776pqy8jHKBh
 mOD4KRipeNhYDZ3Spq64+DzYsIwtlwkNbFHdUY7pXZwj2B9avdqdwjCqLxF2Ww6eTdJQ
 Vrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2whUJhCraBEtP2pdulfjOoK298h0/6QvmdXnzhHH7vY=;
 b=EpjZf9F3V5qgw6jLvugqKmqHIUuVdBHWDEss5rCErjLx43r6pSebLk93dV+/+Oqd5G
 NEPsIe/wZpEq/yGEs1BR0YaAa9bso5xHHw8rFQhp0R16v9BPrropaU5uV2q2zJksZUCD
 ZY7hKxjyTNMEJ6NNhqHH5yNBsvW+Wu+5ImL6h5i9e5GR447aacAVv6n4UX1LdwzQzTGP
 /rJr2SaFO1ndOzISPnPrWypPQDRvQjwSpbsDD1waZUHBh3fmxPBAtwIQ0gItQXJ8lRu6
 biqjwgqnsWcMWy74/GCRjiYH3q2RrIqfo6xeFRW5I9LAqOu3OkyAx5fPkdJSgmG27jtt
 xC/Q==
X-Gm-Message-State: AOAM5300O+KY5rxmUZnTAFOnfb7F0VfFq16ZqwEUMXabRrQJckvgVYf+
 ByV6r8noBB2uAhyhwIKj3YtGZPNya3wC5ur9V/OsgQ==
X-Google-Smtp-Source: ABdhPJyBSscQzBDgOrKAdPjSqblTlrU+heucKcUqaR0Wk2vuyrVYPA2N0/ZmH371HFYRWns+vzwNLrJbs//eNoIs9bQ=
X-Received: by 2002:a5e:c908:: with SMTP id z8mr1959110iol.136.1616583218825; 
 Wed, 24 Mar 2021 03:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210310161444.1015500-1-markyacoub@chromium.org>
 <CADnq5_P9aYcedOP2qduSz7VN1fCSnmQEtPa+FdjYu9Co7TwPog@mail.gmail.com>
 <CAC0gqY7Y2WxtAZ3GnWmASPYq7ahYTfmPhOHAAX5UjMNS9k098w@mail.gmail.com>
 <b4070483-5aa5-c712-6435-dcb4a206ca76@daenzer.net>
In-Reply-To: <b4070483-5aa5-c712-6435-dcb4a206ca76@daenzer.net>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Wed, 24 Mar 2021 11:53:30 +0100
Message-ID: <CAP+8YyExtmmZbFfAO_YR=XWHE+HbH6m7JqyJV4LB_hbGwsihBA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Ensure that the modifier requested is
 supported by plane.
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: Mark Yacoub <markyacoub@chromium.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Mark Yacoub <markyacoub@google.com>
Content-Type: multipart/mixed; boundary="===============1355159342=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1355159342==
Content-Type: multipart/alternative; boundary="000000000000822d1105be461c77"

--000000000000822d1105be461c77
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 11:13 AM Michel D=C3=A4nzer <michel@daenzer.net> wr=
ote:

> On 2021-03-23 4:32 p.m., Mark Yacoub wrote:
> > On Tue, Mar 23, 2021 at 11:02 AM Alex Deucher <alexdeucher@gmail.com>
> wrote:
> >>
> >> On Wed, Mar 10, 2021 at 11:15 AM Mark Yacoub <markyacoub@chromium.org>
> wrote:
> >>>
> >>> From: Mark Yacoub <markyacoub@google.com>
> >>>
> >>> On initializing the framebuffer, call drm_any_plane_has_format to do =
a
> >>> check if the modifier is supported. drm_any_plane_has_format calls
> >>> dm_plane_format_mod_supported which is extended to validate that the
> >>> modifier is on the list of the plane's supported modifiers.
> >>>
> >>> The bug was caught using igt-gpu-tools test:
> kms_addfb_basic.addfb25-bad-modifier
> >>>
> >>> Tested on ChromeOS Zork by turning on the display, running an overlay
> >>> test, and running a YT video.
> >>>
> >>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> >>> Signed-off-by: default avatarMark Yacoub <markyacoub@chromium.org>
> >>
> >> I'm not an expert with modifiers yet.  Will this break chips which
> >> don't currently support modifiers?
> > No it shouldn't. When you don't support modifiers yet, your will
> > default to Linear Modifier (DRM_FORMAT_MOD_LINEAR),
> > [...]
> No modifier support does not imply linear. It's generally signalled via
> DRM_FORMAT_MOD_INVALID, which roughly means "tiling is determined by driv=
er
> specific mechanisms".
>

Doesn't quite work that way in the kernel sadly. If you don't set
DRM_MODE_FB_MODIFIERS then the modifier fields have to be 0 (which happens
to alias DRM_FORMAT_MOD_LINEAR and then now deprecated
DRM_FORMAT_MOD_NONE). This is verified in shared drm code.

(and all userspace code I've seen simply doesn't set DRM_MODE_FB_MODIFIERS
if the incoming modifier is DRM_FORMAT_MOD_INVALID)

>
>
> --
> Earthling Michel D=C3=A4nzer               |               https://redhat=
.com
> Libre software enthusiast             |             Mesa and X developer
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>

--000000000000822d1105be461c77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 24, 2021 at 11:13 AM Mich=
el D=C3=A4nzer &lt;<a href=3D"mailto:michel@daenzer.net">michel@daenzer.net=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On 2021-03-23 4:32 p.m., Mark Yacoub wrote:<br>
&gt; On Tue, Mar 23, 2021 at 11:02 AM Alex Deucher &lt;<a href=3D"mailto:al=
exdeucher@gmail.com" target=3D"_blank">alexdeucher@gmail.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Mar 10, 2021 at 11:15 AM Mark Yacoub &lt;<a href=3D"mailto=
:markyacoub@chromium.org" target=3D"_blank">markyacoub@chromium.org</a>&gt;=
 wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; From: Mark Yacoub &lt;<a href=3D"mailto:markyacoub@google.com"=
 target=3D"_blank">markyacoub@google.com</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On initializing the framebuffer, call drm_any_plane_has_format=
 to do a<br>
&gt;&gt;&gt; check if the modifier is supported. drm_any_plane_has_format c=
alls<br>
&gt;&gt;&gt; dm_plane_format_mod_supported which is extended to validate th=
at the<br>
&gt;&gt;&gt; modifier is on the list of the plane&#39;s supported modifiers=
.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The bug was caught using igt-gpu-tools test: kms_addfb_basic.a=
ddfb25-bad-modifier<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Tested on ChromeOS Zork by turning on the display, running an =
overlay<br>
&gt;&gt;&gt; test, and running a YT video.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Cc: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.c=
om" target=3D"_blank">alexander.deucher@amd.com</a>&gt;<br>
&gt;&gt;&gt; Cc: Bas Nieuwenhuizen &lt;<a href=3D"mailto:bas@basnieuwenhuiz=
en.nl" target=3D"_blank">bas@basnieuwenhuizen.nl</a>&gt;<br>
&gt;&gt;&gt; Signed-off-by: default avatarMark Yacoub &lt;<a href=3D"mailto=
:markyacoub@chromium.org" target=3D"_blank">markyacoub@chromium.org</a>&gt;=
<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m not an expert with modifiers yet.=C2=A0 Will this break ch=
ips which<br>
&gt;&gt; don&#39;t currently support modifiers?<br>
&gt; No it shouldn&#39;t. When you don&#39;t support modifiers yet, your wi=
ll<br>
&gt; default to Linear Modifier (DRM_FORMAT_MOD_LINEAR),<br>
&gt; [...]<br>
No modifier support does not imply linear. It&#39;s generally signalled via=
 DRM_FORMAT_MOD_INVALID, which roughly means &quot;tiling is determined by =
driver specific mechanisms&quot;.<br></blockquote><div><br></div><div>Doesn=
&#39;t quite work that way in the kernel sadly. If you don&#39;t set DRM_MO=
DE_FB_MODIFIERS then the modifier fields have to be 0 (which happens to ali=
as DRM_FORMAT_MOD_LINEAR and then now deprecated DRM_FORMAT_MOD_NONE). This=
 is verified in shared drm code.</div><div><br></div><div>(and all userspac=
e code I&#39;ve seen simply doesn&#39;t set DRM_MODE_FB_MODIFIERS if the in=
coming modifier is DRM_FORMAT_MOD_INVALID)<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
<br>
-- <br>
Earthling Michel D=C3=A4nzer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=
=3D"https://redhat.com" rel=3D"noreferrer" target=3D"_blank">https://redhat=
.com</a><br>
Libre software enthusiast=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mesa and X developer<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank">amd-gfx@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/amd-gfx</a><br>
</blockquote></div></div>

--000000000000822d1105be461c77--

--===============1355159342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1355159342==--
