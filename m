Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABF46F9CF1
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 02:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E6510E081;
	Mon,  8 May 2023 00:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982C210E04E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 00:26:36 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f13d8f74abso4407770e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 17:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683505592; x=1686097592;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3tLJSDMVtwwpwvuG3Tz4CKOuOdpxzB/oKYhWDXH440k=;
 b=DuMi0LbbVFEMfYdGCyl1MStg+1tFl4rg4FoemUFn2RJnUA6AGHRZ9X8q2bmnSG8c6B
 Y1xGkW+Go4r86SAYr2GmxUqhGlApI9Z5CUxmfrZeuKaj8620iJcTV4MwmkN0CGnTbphW
 cF7v8jNVouT1c+44dSI70dBnqlYHaId+6pp+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683505592; x=1686097592;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3tLJSDMVtwwpwvuG3Tz4CKOuOdpxzB/oKYhWDXH440k=;
 b=HPKFtKes/tPkbYBQN7J2SCuIu8Ppqt6Z1n20HesM0RuUdNSm3Qub1pBjadN1s9atey
 m0ysrY8t63qopB39LFI6usMyMnmAMkBuhjFPy16Zj0RUe+iQ8OB5yqxQYknMYq5YG9/x
 nvZ6a6NYpd5leuO7cDaSjcVBYBlU7a6pkDOr7JndiLLaD7ItH1wPoE71ebCRG8UwqBZx
 0cqgkxIgZS35qxGP0TVJW1IxP1cZ5jkJHmBxVL24YfXh0v7uYAAVuO87A095Zj4Tlbxo
 rVUnuQlTInNnH9cQQ///o1hJDpbQZin99ScKLEyGIRhvGdU/VFkjaVIa2tmzbgRNiCTP
 /M0g==
X-Gm-Message-State: AC+VfDyu3uwNkSVyfC5hZHcJeC981Eloec/PgZ7a5Dk+Q9ynZkzf3Sgm
 NnZAvzBcylmOZ43gL6aKT0CSBKTd1RycED17B/Y=
X-Google-Smtp-Source: ACHHUZ6ZvMVfU3sxDC+y9JCqNEBEky8ipUji+w8eybdYBo6RyF0Ff8H1r08M7Z7uW5x6+KchlP7xTw==
X-Received: by 2002:a19:c517:0:b0:4f0:5b4:4863 with SMTP id
 w23-20020a19c517000000b004f005b44863mr2081991lfe.0.1683505592311; 
 Sun, 07 May 2023 17:26:32 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44]) by smtp.gmail.com with ESMTPSA id
 f2-20020a19ae02000000b004f20d10c62asm571170lfc.224.2023.05.07.17.26.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 May 2023 17:26:31 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-4efea87c578so22376e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 17:26:31 -0700 (PDT)
X-Received: by 2002:ac2:5f1a:0:b0:4f1:4726:7574 with SMTP id
 26-20020ac25f1a000000b004f147267574mr77049lfq.5.1683505590438; Sun, 07 May
 2023 17:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230425073012.11036-1-marius.vlad@collabora.com>
 <CALWYx-a90Zee0_js5h=53bxsN-BXxumiGid-qc=9405ZkUE-gg@mail.gmail.com>
 <a2239e16-31e8-3163-b349-8fc3328f33ed@collabora.com>
 <CALWYx-ZoNU82Z2Z28uH8ZsABvZFBGtMi55x6e386QBTbDsECZA@mail.gmail.com>
 <CACmi3jE=6hj21yu2ZCyA_vn-0vY==BPNBfHrxVc+Hi-oq_Cpgw@mail.gmail.com>
In-Reply-To: <CACmi3jE=6hj21yu2ZCyA_vn-0vY==BPNBfHrxVc+Hi-oq_Cpgw@mail.gmail.com>
From: Brandon Ross Pollack <brpol@chromium.org>
Date: Mon, 8 May 2023 09:26:19 +0900
X-Gmail-Original-Message-ID: <CALWYx-bprLOubfwi=Z1H0=z+8Pm32eKpSwN=A-o01ca=pGDc3A@mail.gmail.com>
Message-ID: <CALWYx-bprLOubfwi=Z1H0=z+8Pm32eKpSwN=A-o01ca=pGDc3A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/vkms: Add support for multiple pipes
To: Jim Shargo <jshargo@chromium.org>
Content-Type: multipart/alternative; boundary="000000000000b2905905fb23b075"
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
Cc: melissa.srw@gmail.com, rodrigosiqueiramelo@gmail.com, yixie@chromium.org,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 tzimmermann@suse.de, Marius Vlad <marius.vlad@collabora.com>,
 igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000b2905905fb23b075
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the late reply on my end (last week was a holiday week in Japan).

I'm just getting to looking through these closer now, I spent much of my
vacation reading about kernel/drivers and things make much more sense now
to me so I'll have some notes (hopefully) as well shortly.


On Sat, Apr 29, 2023 at 12:10=E2=80=AFPM Jim Shargo <jshargo@chromium.org> =
wrote:

> Hey, all!
>
> I am so excited to see other folks excited about extending VKMS. I
> think it's a great project and has outstanding potential!
>
> Life stuff made me AFK for the last few months, but I'm back now and
> I've been wrapping up the work on the patchset Brandon linked.
>
> The current WIP patches are here:
>
> https://gitlab.freedesktop.org/jshargo/compositor-kernel-explorations/-/m=
erge_requests/4
>
> They even come with matching IGT tests!
>
> https://gitlab.freedesktop.org/jshargo/igt-gpu-tools/-/commit/8375cf128f0=
811d54ecb4a0b5cf044942ffc67b9
>
> I'm hoping to send them out again soon, hopefully next week.
>
> As a suggestion for how to move forward: the first three patches are
> little refactors that are separable from the core ConfigFS ones (which
> might have more back-and-forth design iterations). With those three,
> the param you're adding should be easy to put on top. I can try to get
> those out sooner for review.
>
> What do you think?
>
>
> On Thu, Apr 27, 2023 at 10:51=E2=80=AFPM Brandon Ross Pollack
> <brpol@chromium.org> wrote:
> >
> > I'm adding the original offer of those changes.  We talked recently
> > and they have the intent to push forward and merge them.  I'm still
> > getting up to speed a bit, but I will probably have a stronger opinion
> > by early next week.
> >
> >
> > On Wed, Apr 26, 2023 at 9:54=E2=80=AFPM Marius Vlad <marius.vlad@collab=
ora.com>
> wrote:
> > >
> > > Hi Brandon, Xie,
> > >
> > > Thanks for reaching out, and for the heads-up. I need to take a close=
r
> > > look, but by glancing over it, using configFS would be really awesome=
.
> > > Think we could really benefit from having that in our CI and being ab=
le
> > > to customize the entire pipeline. I'm totally for that.
> > >
> > > It looks like it requires some infra work so I guess landing that mig=
ht
> > > require quite a bit of time. Not sure if there are recent updates for
> it.
> > >
> > > My changes are quite trivial and much more focused on just having
> > > multiple virtual displays, so IDK, I've submitted a version that seem=
s
> > > to work, so I guess others should or would decide if we should drop
> mine
> > > and focus on the configFS series, or we should go with configFS as a
> > > follow-up. Would have liked to get something in the tree so we can at
> > > least have something to work with.
> > >
> > > Thoughts on the matter on how should we go about it?
> > >
> > > On 4/26/23 05:06, Brandon Ross Pollack wrote:
> > > > We're doing/planning on doing similar or related work here at
> chromium.
> > > >
> > > >
> https://patchwork.kernel.org/project/dri-devel/list/?series=3D662676&subm=
itter=3D&state=3D&q=3D&delegate=3D&archive=3Dboth
> <
> https://patchwork.kernel.org/project/dri-devel/list/?series=3D662676&subm=
itter=3D&state=3D&q=3D&delegate=3D&archive=3Dboth
> >
> > > >
> > > > Here's the stuff we have now (we're currently rebasing and touching
> it
> > > > up, myself and @Yi Xie <mailto:yixie@google.com> will be taking ove=
r
> > > > this work.
> > > >
> > > > Our plans are to add configFS changes and DRI VKMS changes to be
> able to
> > > > add and remove virtual displays at runtime (among other things need=
ed
> > > > for our own testing purposes for our Exo wayland implementation).
> > > >
> > > > We're still learning how this all works and comes together, but it =
is
> > > > worth letting you know "us too"
> > > >
> > > > We can chat more and see where we overlap and can learn from each
> other :)
> > > >
> > > > On Tue, Apr 25, 2023 at 4:30=E2=80=AFPM Marius Vlad <
> marius.vlad@collabora.com
> > > > <mailto:marius.vlad@collabora.com>> wrote:
> > > >
> > > >     With multiple pipe available we can perform management of
> outputs at
> > > >     a more granular level, such that we're able to turn off or on
> several
> > > >     outputs at a time, or combinations that arise from doing that.
> > > >
> > > >     The Weston project use VKMS when running its test suite in CI,
> and we
> > > >     have now uses cases which would need to ability to set-up the
> outputs
> > > >     DPMS/state individually, rather than globally -- which would
> affect all
> > > >     outputs. This an attempt on fixing that by giving the
> possibility to
> > > >     create more than one pipe, and thus allowing to run tests that
> could
> > > >     exercise code paths in the compositor related to management of
> outputs.
> > > >
> > > >     v3:
> > > >        - Apply the series against drm-misc-next (Ma=C3=ADra Canal)
> > > >        - Add a lower range check to avoid passing negative values t=
o
> > > >        max_pipes (Ma=C3=ADra Canal)
> > > >
> > > >     v2:
> > > >        - Replace 'outputs' with 'pipes' as to use the proper
> terminology
> > > >          (Thomas Zimmermann, Ma=C3=ADra Canal)
> > > >        - Fixed passing wrong possible_crtc bitmask when initializin=
g
> the
> > > >          write back connector which address kms_writeback failure
> (Ma=C3=ADra
> > > >     Canal)
> > > >        - Add a feat. note about moving overlay planes between CRTCs
> > > >     (Melissa Wen)
> > > >
> > > >     Marius Vlad (3):
> > > >        vkms: Pass the correct bitmask for possible crtcs
> > > >        vkms: Add support for multiple pipes
> > > >        Documentation/gpu/vkms.rst: Added a note about plane migrati=
on
> > > >
> > > >       Documentation/gpu/vkms.rst            |  5 +++--
> > > >       drivers/gpu/drm/vkms/vkms_crtc.c      |  3 +--
> > > >       drivers/gpu/drm/vkms/vkms_drv.c       | 31
> +++++++++++++++++++++------
> > > >       drivers/gpu/drm/vkms/vkms_drv.h       | 12 ++++++++---
> > > >       drivers/gpu/drm/vkms/vkms_output.c    |  7 +++---
> > > >       drivers/gpu/drm/vkms/vkms_writeback.c | 24
> ++++++++++-----------
> > > >       6 files changed, 53 insertions(+), 29 deletions(-)
> > > >
> > > >     --
> > > >     2.39.2
> > > >
>

--000000000000b2905905fb23b075
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry for the=C2=A0late reply on my end (last week was a h=
oliday week in Japan).<div><br></div><div>I&#39;m just getting to looking t=
hrough these closer now, I spent much of my vacation reading about kernel/d=
rivers and things make much more sense now to me so I&#39;ll have some note=
s (hopefully) as well shortly.</div></div><br><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 29, 2023 at 12:10=E2=80=
=AFPM Jim Shargo &lt;<a href=3D"mailto:jshargo@chromium.org">jshargo@chromi=
um.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hey, all!<br>
<br>
I am so excited to see other folks excited about extending VKMS. I<br>
think it&#39;s a great project and has outstanding potential!<br>
<br>
Life stuff made me AFK for the last few months, but I&#39;m back now and<br=
>
I&#39;ve been wrapping up the work on the patchset Brandon linked.<br>
<br>
The current WIP patches are here:<br>
<a href=3D"https://gitlab.freedesktop.org/jshargo/compositor-kernel-explora=
tions/-/merge_requests/4" rel=3D"noreferrer" target=3D"_blank">https://gitl=
ab.freedesktop.org/jshargo/compositor-kernel-explorations/-/merge_requests/=
4</a><br>
<br>
They even come with matching IGT tests!<br>
<a href=3D"https://gitlab.freedesktop.org/jshargo/igt-gpu-tools/-/commit/83=
75cf128f0811d54ecb4a0b5cf044942ffc67b9" rel=3D"noreferrer" target=3D"_blank=
">https://gitlab.freedesktop.org/jshargo/igt-gpu-tools/-/commit/8375cf128f0=
811d54ecb4a0b5cf044942ffc67b9</a><br>
<br>
I&#39;m hoping to send them out again soon, hopefully next week.<br>
<br>
As a suggestion for how to move forward: the first three patches are<br>
little refactors that are separable from the core ConfigFS ones (which<br>
might have more back-and-forth design iterations). With those three,<br>
the param you&#39;re adding should be easy to put on top. I can try to get<=
br>
those out sooner for review.<br>
<br>
What do you think?<br>
<br>
<br>
On Thu, Apr 27, 2023 at 10:51=E2=80=AFPM Brandon Ross Pollack<br>
&lt;<a href=3D"mailto:brpol@chromium.org" target=3D"_blank">brpol@chromium.=
org</a>&gt; wrote:<br>
&gt;<br>
&gt; I&#39;m adding the original offer of those changes.=C2=A0 We talked re=
cently<br>
&gt; and they have the intent to push forward and merge them.=C2=A0 I&#39;m=
 still<br>
&gt; getting up to speed a bit, but I will probably have a stronger opinion=
<br>
&gt; by early next week.<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Apr 26, 2023 at 9:54=E2=80=AFPM Marius Vlad &lt;<a href=3D"mai=
lto:marius.vlad@collabora.com" target=3D"_blank">marius.vlad@collabora.com<=
/a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Brandon, Xie,<br>
&gt; &gt;<br>
&gt; &gt; Thanks for reaching out, and for the heads-up. I need to take a c=
loser<br>
&gt; &gt; look, but by glancing over it, using configFS would be really awe=
some.<br>
&gt; &gt; Think we could really benefit from having that in our CI and bein=
g able<br>
&gt; &gt; to customize the entire pipeline. I&#39;m totally for that.<br>
&gt; &gt;<br>
&gt; &gt; It looks like it requires some infra work so I guess landing that=
 might<br>
&gt; &gt; require quite a bit of time. Not sure if there are recent updates=
 for it.<br>
&gt; &gt;<br>
&gt; &gt; My changes are quite trivial and much more focused on just having=
<br>
&gt; &gt; multiple virtual displays, so IDK, I&#39;ve submitted a version t=
hat seems<br>
&gt; &gt; to work, so I guess others should or would decide if we should dr=
op mine<br>
&gt; &gt; and focus on the configFS series, or we should go with configFS a=
s a<br>
&gt; &gt; follow-up. Would have liked to get something in the tree so we ca=
n at<br>
&gt; &gt; least have something to work with.<br>
&gt; &gt;<br>
&gt; &gt; Thoughts on the matter on how should we go about it?<br>
&gt; &gt;<br>
&gt; &gt; On 4/26/23 05:06, Brandon Ross Pollack wrote:<br>
&gt; &gt; &gt; We&#39;re doing/planning on doing similar or related work he=
re at chromium.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://patchwork.kernel.org/project/dri-devel/li=
st/?series=3D662676&amp;submitter=3D&amp;state=3D&amp;q=3D&amp;delegate=3D&=
amp;archive=3Dboth" rel=3D"noreferrer" target=3D"_blank">https://patchwork.=
kernel.org/project/dri-devel/list/?series=3D662676&amp;submitter=3D&amp;sta=
te=3D&amp;q=3D&amp;delegate=3D&amp;archive=3Dboth</a> &lt;<a href=3D"https:=
//patchwork.kernel.org/project/dri-devel/list/?series=3D662676&amp;submitte=
r=3D&amp;state=3D&amp;q=3D&amp;delegate=3D&amp;archive=3Dboth" rel=3D"noref=
errer" target=3D"_blank">https://patchwork.kernel.org/project/dri-devel/lis=
t/?series=3D662676&amp;submitter=3D&amp;state=3D&amp;q=3D&amp;delegate=3D&a=
mp;archive=3Dboth</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Here&#39;s the stuff we have now (we&#39;re currently rebasi=
ng and touching it<br>
&gt; &gt; &gt; up, myself and @Yi Xie &lt;mailto:<a href=3D"mailto:yixie@go=
ogle.com" target=3D"_blank">yixie@google.com</a>&gt; will be taking over<br=
>
&gt; &gt; &gt; this work.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Our plans are to add configFS changes and DRI VKMS changes t=
o be able to<br>
&gt; &gt; &gt; add and remove virtual displays at runtime (among other thin=
gs needed<br>
&gt; &gt; &gt; for our own testing purposes for our Exo wayland implementat=
ion).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We&#39;re still learning how this all works and comes togeth=
er, but it is<br>
&gt; &gt; &gt; worth letting you know &quot;us too&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We can chat more and see where we overlap and can learn from=
 each other :)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Tue, Apr 25, 2023 at 4:30=E2=80=AFPM Marius Vlad &lt;<a h=
ref=3D"mailto:marius.vlad@collabora.com" target=3D"_blank">marius.vlad@coll=
abora.com</a><br>
&gt; &gt; &gt; &lt;mailto:<a href=3D"mailto:marius.vlad@collabora.com" targ=
et=3D"_blank">marius.vlad@collabora.com</a>&gt;&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0With multiple pipe available we can perfo=
rm management of outputs at<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a more granular level, such that we&#39;r=
e able to turn off or on several<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0outputs at a time, or combinations that a=
rise from doing that.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0The Weston project use VKMS when running =
its test suite in CI, and we<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0have now uses cases which would need to a=
bility to set-up the outputs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0DPMS/state individually, rather than glob=
ally -- which would affect all<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0outputs. This an attempt on fixing that b=
y giving the possibility to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0create more than one pipe, and thus allow=
ing to run tests that could<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0exercise code paths in the compositor rel=
ated to management of outputs.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0v3:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Apply the series against drm-mi=
sc-next (Ma=C3=ADra Canal)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Add a lower range check to avoi=
d passing negative values to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_pipes (Ma=C3=ADra Canal)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0v2:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Replace &#39;outputs&#39; with =
&#39;pipes&#39; as to use the proper terminology<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (Thomas Zimmermann, Ma=C3=
=ADra Canal)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Fixed passing wrong possible_cr=
tc bitmask when initializing the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write back connector which=
 address kms_writeback failure (Ma=C3=ADra<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Canal)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Add a feat. note about moving o=
verlay planes between CRTCs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0(Melissa Wen)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Marius Vlad (3):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 vkms: Pass the correct bitmask fo=
r possible crtcs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 vkms: Add support for multiple pi=
pes<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Documentation/gpu/vkms.rst: Added=
 a note about plane migration<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Documentation/gpu/vkms.rst=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++--<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/vkms/vkms_crtc.c=
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +--<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/vkms/vkms_drv.c=C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 31 +++++++++++++++++++++------<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/vkms/vkms_drv.h=C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++++++---<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/vkms/vkms_output.c=
=C2=A0 =C2=A0 |=C2=A0 7 +++---<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/vkms/vkms_writebac=
k.c | 24 ++++++++++-----------<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A06 files changed, 53 insertions(+),=
 29 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02.39.2<br>
&gt; &gt; &gt;<br>
</blockquote></div>

--000000000000b2905905fb23b075--
