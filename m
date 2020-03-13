Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDDF185168
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 22:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CDC6E054;
	Fri, 13 Mar 2020 21:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBC36E04B;
 Fri, 13 Mar 2020 21:53:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id 6so13954467wre.4;
 Fri, 13 Mar 2020 14:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F1ggqG8zLpfklIUhtsKqqhmAK1SrCt0QqulQEoEWP5g=;
 b=AnFDMk782pNuCdpamDK3FbcquUHjgajeTbfyDydJi4bbkdcBXyjozJHZSoxk4gKGx0
 r70UO5pj7igzYLiBxKhUsEFhOn0jhdT9Tx2GiNe8wu617dANSrwaLvU/7rnKaBUt3raY
 HeOzthqGEdtrLGqBezym0vVJuzZateFipd6GnWZqh1SYg/DoAoUeGZbiOBK6Sm3XzdhO
 CQm2RsmJXDNJX46yBoQX4bCYmjbIE5KNUC4rMna16G0hoEKpHZG7Pt5nPz65+Kc9WXD6
 tyZjbW69jcbg8q3B+AzIMcdB32gvxu/XiCFE2x3eudvKZ+tyCNcJRRZFu5U0TbFqjnxm
 C98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F1ggqG8zLpfklIUhtsKqqhmAK1SrCt0QqulQEoEWP5g=;
 b=YhGmvwNG8qktqGQFwJmxzZmIlovAXRdELSD66qEWovAVEecsjXGEdaNwAKwuWwlFe1
 lMejxADJyqpvmv2zgAnspWMIG0K0SEG9CRxtc+We9karkOzFQL97FWXNqZCs9/RnIMkZ
 C4t0HgGZ+HW679dYyunxMBoBsu3OolLEwE/zgyBjSPi73FECf1w3VhlE+tDIju0DkECN
 /ib6PNzq9i8kudPGNZEvoLrL7hDGgkb7iIIeZCmg2v4xcL1D+v/OLirjDvkJhZJWd152
 4RNoNfufNopCEHgawQlvMzLfSREuOPuQ4lzk0pc4dtqMAxQxjFsT6SMqFHlRDFs2BfMN
 tF9A==
X-Gm-Message-State: ANhLgQ0S/3spGDZWVguF5PRkan1Jl9NvnQ7ehTn23oXQpPKuwmXhc6oM
 WA/m43RGcHPtXm9fvbQNuBNSsraYN7fE5gKW93u9NA==
X-Google-Smtp-Source: ADFU+vu/Rfqh3OZs9grJOy4ux64pc/ZSQfz5oSjxV62odZ3LRQ9OEfomtYG3tE/gU8thbmwhJVTEWhLVytwROTVzzHQ=
X-Received: by 2002:a5d:6146:: with SMTP id y6mr20163557wrt.107.1584136391311; 
 Fri, 13 Mar 2020 14:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200305212044.3857-1-mario.kleiner.de@gmail.com>
 <CADnq5_PoEbgyQ1a+DMkSpTkN2QHHEpHie53Wxo7eRktsKxKs7Q@mail.gmail.com>
 <cd4b7cfd-1fec-db5a-ded1-65e89b14ea35@amd.com>
 <41ab0520-e29a-b6ed-bf5e-fbdf1eec0ceb@daenzer.net>
In-Reply-To: <41ab0520-e29a-b6ed-bf5e-fbdf1eec0ceb@daenzer.net>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Fri, 13 Mar 2020 22:52:59 +0100
Message-ID: <CAEsyxyhzWFgqzWBC-==WUgbWtT4MAEVt_B0HmS=75_OJevm3tw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix pageflip event race condition for
 DCN. (v2)
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Harry Wentland <hwentlan@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Content-Type: multipart/mixed; boundary="===============0933230698=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0933230698==
Content-Type: multipart/alternative; boundary="000000000000e146a805a0c37e53"

--000000000000e146a805a0c37e53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2020 at 5:02 PM Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:

> On 2020-03-13 1:35 p.m., Kazlauskas, Nicholas wrote:
> > On 2020-03-12 10:32 a.m., Alex Deucher wrote:
> >> On Thu, Mar 5, 2020 at 4:21 PM Mario Kleiner
> >> <mario.kleiner.de@gmail.com> wrote:
> >>>
> >>> Commit '16f17eda8bad ("drm/amd/display: Send vblank and user
> >>> events at vsartup for DCN")' introduces a new way of pageflip
> >>> completion handling for DCN, and some trouble.
> >>>
> >>> The current implementation introduces a race condition, which
> >>> can cause pageflip completion events to be sent out one vblank
> >>> too early, thereby confusing userspace and causing flicker:
> >>>
> >>> prepare_flip_isr():
> >>>
> >>> 1. Pageflip programming takes the ddev->event_lock.
> >>> 2. Sets acrtc->pflip_status =3D=3D AMDGPU_FLIP_SUBMITTED
> >>> 3. Releases ddev->event_lock.
> >>>
> >>> --> Deadline for surface address regs double-buffering passes on
> >>>      target pipe.
> >>>
> >>> 4. dc_commit_updates_for_stream() MMIO programs the new pageflip
> >>>     into hw, but too late for current vblank.
> >>>
> >>> =3D> pflip_status =3D=3D AMDGPU_FLIP_SUBMITTED, but flip won't comple=
te
> >>>     in current vblank due to missing the double-buffering deadline
> >>>     by a tiny bit.
> >>>
> >>> 5. VSTARTUP trigger point in vblank is reached, VSTARTUP irq fires,
> >>>     dm_dcn_crtc_high_irq() gets called.
> >>>
> >>> 6. Detects pflip_status =3D=3D AMDGPU_FLIP_SUBMITTED and assumes the
> >>>     pageflip has been completed/will complete in this vblank and
> >>>     sends out pageflip completion event to userspace and resets
> >>>     pflip_status =3D AMDGPU_FLIP_NONE.
> >>>
> >>> =3D> Flip completion event sent out one vblank too early.
> >>>
> >>> This behaviour has been observed during my testing with measurement
> >>> hardware a couple of time.
> >>>
> >>> The commit message says that the extra flip event code was added to
> >>> dm_dcn_crtc_high_irq() to prevent missing to send out pageflip events
> >>> in case the pflip irq doesn't fire, because the "DCH HUBP" component
> >>> is clock gated and doesn't fire pflip irqs in that state. Also that
> >>> this clock gating may happen if no planes are active. According to
> >>> Nicholas, the clock gating can also happen if psr is active, and the
> >>> gating is controlled independently by the hardware, so difficult to
> >>> detect if and when the completion code in above commit is needed.
> >>>
> >>> This patch tries the following solution: It only executes the extra
> >>> pflip
> >>> completion code in dm_dcn_crtc_high_irq() iff the hardware reports
> >>> that there aren't any surface updated pending in the double-buffered
> >>> surface scanout address registers. Otherwise it leaves pflip completi=
on
> >>> to the pflip irq handler, for a more race-free experience.
> >>>
> >>> This would only guard against the order of events mentioned above.
> >>> If Step 5 (VSTARTUP trigger) happens before step 4 then this won't he=
lp
> >>> at all, because 1-3 + 5 might happen even without the hw being
> >>> programmed
> >>> at all, ie. no surface update pending because none yet programmed
> >>> into hw.
> >>>
> >>> Therefore this patch also changes locking in amdgpu_dm_commit_planes(=
),
> >>> so that prepare_flip_isr() and dc_commit_updates_for_stream() are don=
e
> >>> under event_lock protection within the same critical section.
> >>>
> >>> v2: Take Nicholas comments into account, try a different solution.
> >>>
> >>> Lightly tested on Polaris (locking) and Raven (the whole DCN stuff).
> >>> Seems to work without causing obvious new trouble.
> >>
> >> Nick, any comments on this?  Can we get this committed or do you think
> >> it needs additional rework?
> >>
> >> Thanks,
> >>
> >> Alex
> >
> > Hi Alex, Mario,
> >
> > This might be a little strange, but if we want to get this in as a fix
> > for regressions caused by the original vblank and user events at
> > vstartup patch then I'm actually going to give my reviewed by on the
> > *v1* of this patch (but not this v2):
> >
> > Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> >
> > You can feel free to apply that one.
> >
> > Reason 1: After having thought about it some more I don't think we
> > enable anything today that has hubp powered down at the same time we
> > expect to be waiting for a flip - eg. DMCU powering down HUBP during PS=
R
> > entry. Static screen interrupt should happen after that flip finishes I
> > think.
> >
> > The CRTC can still be powered on with zero planes, and I don't think an=
y
> > userspace explicitly asks for vblank events in this case but it doesn't
> > hurt to have the check.
> >
>

Ok, so the original commit that causes the races currently solves a
non-existing - but potential future - problem?

I guess then my v1 patch makes sense for the moment and fixes the immediate
problem for Linux 5.6-rc.

Maybe there's a way to ask the hw if hubp is clock-gated and so if that
code needs to run or not in the future?

As mentioned before, it would be helpful at least for me to get a better
overview about which hw events happen when in vblank, which irq's fire in
response etc., how this relates to things like power management actions,
psr, vrr / drr, etc. A lot has changed in the hw during the last 10 years,
and my guideline are still the public pdf files with the DCE register specs
for DCE-1'ish hw from sometime around the year 2007.

> Reason 2: This new patch will need much more thorough testing from side
> > to fully understand the consequences of locking the entire DC commit
> > sequence. For just a page flip that sounds fine, but for anything more
> > than (eg. full updates, modesets, etc) I don't think we want to be
> > disabling interrupts for potentially many milliseconds.
>
> Ah! I was wondering where the attached splat comes from, but I think
> this explains it: With this patch amdgpu_dm_commit_planes keeps the
> pcrtc->dev->event_lock spinlock locked while calling
> dc_commit_updates_for_stream, which ends up calling
> smu_set_display_count, which tries to lock a mutex.
>
>
Yep, sorry about that. My most modern machine has Raven Ridge / DCN1, and
that function only gets called on Navi /DCN2 afaics. All my testing is
limited to Polaris / DCE11 and Raven DCN1, my most modern hw atm.

thanks,
-mario

--=20
> Earthling Michel D=C3=A4nzer               |               https://redhat=
.com
> Libre software enthusiast             |             Mesa and X developer
>

--000000000000e146a805a0c37e53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 13, 2020 at 5:02 PM Miche=
l D=C3=A4nzer &lt;<a href=3D"mailto:michel@daenzer.net">michel@daenzer.net<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n 2020-03-13 1:35 p.m., Kazlauskas, Nicholas wrote:<br>
&gt; On 2020-03-12 10:32 a.m., Alex Deucher wrote:<br>
&gt;&gt; On Thu, Mar 5, 2020 at 4:21 PM Mario Kleiner<br>
&gt;&gt; &lt;<a href=3D"mailto:mario.kleiner.de@gmail.com" target=3D"_blank=
">mario.kleiner.de@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Commit &#39;16f17eda8bad (&quot;drm/amd/display: Send vblank a=
nd user<br>
&gt;&gt;&gt; events at vsartup for DCN&quot;)&#39; introduces a new way of =
pageflip<br>
&gt;&gt;&gt; completion handling for DCN, and some trouble.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The current implementation introduces a race condition, which<=
br>
&gt;&gt;&gt; can cause pageflip completion events to be sent out one vblank=
<br>
&gt;&gt;&gt; too early, thereby confusing userspace and causing flicker:<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; prepare_flip_isr():<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 1. Pageflip programming takes the ddev-&gt;event_lock.<br>
&gt;&gt;&gt; 2. Sets acrtc-&gt;pflip_status =3D=3D AMDGPU_FLIP_SUBMITTED<br=
>
&gt;&gt;&gt; 3. Releases ddev-&gt;event_lock.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --&gt; Deadline for surface address regs double-buffering pass=
es on<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 target pipe.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 4. dc_commit_updates_for_stream() MMIO programs the new pagefl=
ip<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 into hw, but too late for current vblank.<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =3D&gt; pflip_status =3D=3D AMDGPU_FLIP_SUBMITTED, but flip wo=
n&#39;t complete<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 in current vblank due to missing the double=
-buffering deadline<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 by a tiny bit.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 5. VSTARTUP trigger point in vblank is reached, VSTARTUP irq f=
ires,<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 dm_dcn_crtc_high_irq() gets called.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 6. Detects pflip_status =3D=3D AMDGPU_FLIP_SUBMITTED and assum=
es the<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 pageflip has been completed/will complete i=
n this vblank and<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 sends out pageflip completion event to user=
space and resets<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 pflip_status =3D AMDGPU_FLIP_NONE.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =3D&gt; Flip completion event sent out one vblank too early.<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This behaviour has been observed during my testing with measur=
ement<br>
&gt;&gt;&gt; hardware a couple of time.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The commit message says that the extra flip event code was add=
ed to<br>
&gt;&gt;&gt; dm_dcn_crtc_high_irq() to prevent missing to send out pageflip=
 events<br>
&gt;&gt;&gt; in case the pflip irq doesn&#39;t fire, because the &quot;DCH =
HUBP&quot; component<br>
&gt;&gt;&gt; is clock gated and doesn&#39;t fire pflip irqs in that state. =
Also that<br>
&gt;&gt;&gt; this clock gating may happen if no planes are active. Accordin=
g to<br>
&gt;&gt;&gt; Nicholas, the clock gating can also happen if psr is active, a=
nd the<br>
&gt;&gt;&gt; gating is controlled independently by the hardware, so difficu=
lt to<br>
&gt;&gt;&gt; detect if and when the completion code in above commit is need=
ed.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This patch tries the following solution: It only executes the =
extra<br>
&gt;&gt;&gt; pflip<br>
&gt;&gt;&gt; completion code in dm_dcn_crtc_high_irq() iff the hardware rep=
orts<br>
&gt;&gt;&gt; that there aren&#39;t any surface updated pending in the doubl=
e-buffered<br>
&gt;&gt;&gt; surface scanout address registers. Otherwise it leaves pflip c=
ompletion<br>
&gt;&gt;&gt; to the pflip irq handler, for a more race-free experience.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This would only guard against the order of events mentioned ab=
ove.<br>
&gt;&gt;&gt; If Step 5 (VSTARTUP trigger) happens before step 4 then this w=
on&#39;t help<br>
&gt;&gt;&gt; at all, because 1-3 + 5 might happen even without the hw being=
<br>
&gt;&gt;&gt; programmed<br>
&gt;&gt;&gt; at all, ie. no surface update pending because none yet program=
med<br>
&gt;&gt;&gt; into hw.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Therefore this patch also changes locking in amdgpu_dm_commit_=
planes(),<br>
&gt;&gt;&gt; so that prepare_flip_isr() and dc_commit_updates_for_stream() =
are done<br>
&gt;&gt;&gt; under event_lock protection within the same critical section.<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; v2: Take Nicholas comments into account, try a different solut=
ion.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Lightly tested on Polaris (locking) and Raven (the whole DCN s=
tuff).<br>
&gt;&gt;&gt; Seems to work without causing obvious new trouble.<br>
&gt;&gt;<br>
&gt;&gt; Nick, any comments on this?=C2=A0 Can we get this committed or do =
you think<br>
&gt;&gt; it needs additional rework?<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt;<br>
&gt;&gt; Alex<br>
&gt; <br>
&gt; Hi Alex, Mario,<br>
&gt; <br>
&gt; This might be a little strange, but if we want to get this in as a fix=
<br>
&gt; for regressions caused by the original vblank and user events at<br>
&gt; vstartup patch then I&#39;m actually going to give my reviewed by on t=
he<br>
&gt; *v1* of this patch (but not this v2):<br>
&gt; <br>
&gt; Reviewed-by: Nicholas Kazlauskas &lt;<a href=3D"mailto:nicholas.kazlau=
skas@amd.com" target=3D"_blank">nicholas.kazlauskas@amd.com</a>&gt;<br>
&gt; <br>
&gt; You can feel free to apply that one.<br>
&gt; <br>
&gt; Reason 1: After having thought about it some more I don&#39;t think we=
<br>
&gt; enable anything today that has hubp powered down at the same time we<b=
r>
&gt; expect to be waiting for a flip - eg. DMCU powering down HUBP during P=
SR<br>
&gt; entry. Static screen interrupt should happen after that flip finishes =
I<br>
&gt; think.<br>
&gt; <br>
&gt; The CRTC can still be powered on with zero planes, and I don&#39;t thi=
nk any<br>
&gt; userspace explicitly asks for vblank events in this case but it doesn&=
#39;t<br>
&gt; hurt to have the check.<br>
&gt;<br></blockquote><div><br></div><div>Ok, so the original commit that ca=
uses the races currently solves a non-existing - but potential future - pro=
blem?<br></div><div>=C2=A0</div><div>I guess then my v1 patch makes sense f=
or the moment and fixes the immediate problem for Linux 5.6-rc.<br></div><d=
iv><br></div><div>Maybe there&#39;s a way to ask the hw if hubp is clock-ga=
ted and so if that code needs to run or not in the future?</div><div><br></=
div><div>As mentioned before, it would be helpful at least for me to get a =
better overview about which hw events happen when in vblank, which irq&#39;=
s fire in response etc., how this relates to things like power management a=
ctions, psr, vrr / drr, etc. A lot has changed in the hw during the last 10=
 years, and my guideline are still the public pdf files with the DCE regist=
er specs for DCE-1&#39;ish hw from sometime around the year 2007.<br></div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Reason 2: This new patch will need much more thorough testing from sid=
e<br>
&gt; to fully understand the consequences of locking the entire DC commit<b=
r>
&gt; sequence. For just a page flip that sounds fine, but for anything more=
<br>
&gt; than (eg. full updates, modesets, etc) I don&#39;t think we want to be=
<br>
&gt; disabling interrupts for potentially many milliseconds.<br>
<br>
Ah! I was wondering where the attached splat comes from, but I think<br>
this explains it: With this patch amdgpu_dm_commit_planes keeps the<br>
pcrtc-&gt;dev-&gt;event_lock spinlock locked while calling<br>
dc_commit_updates_for_stream, which ends up calling<br>
smu_set_display_count, which tries to lock a mutex.<br>
<br></blockquote><div><br></div><div>Yep, sorry about that. My most modern =
machine has Raven Ridge / DCN1, and that function only gets called on Navi =
/DCN2 afaics. All my testing is limited to Polaris / DCE11 and Raven DCN1, =
my most modern hw atm.<br></div><div><br></div><div>thanks,<br></div><div>-=
mario</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
-- <br>
Earthling Michel D=C3=A4nzer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=
=3D"https://redhat.com" rel=3D"noreferrer" target=3D"_blank">https://redhat=
.com</a><br>
Libre software enthusiast=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mesa and X developer<br>
</blockquote></div></div>

--000000000000e146a805a0c37e53--

--===============0933230698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0933230698==--
