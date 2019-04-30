Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C22EE5E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 03:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8959D89361;
	Tue, 30 Apr 2019 01:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7249289361
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 01:26:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6E9D872155; Tue, 30 Apr 2019 01:26:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110509] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
 timeout
Date: Tue, 30 Apr 2019 01:26:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110509-502-d9ZlarR5ud@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110509-502@http.bugs.freedesktop.org/>
References: <bug-110509-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0448776659=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0448776659==
Content-Type: multipart/alternative; boundary="15565876091.65c877.4165"
Content-Transfer-Encoding: 7bit


--15565876091.65c877.4165
Date: Tue, 30 Apr 2019 01:26:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110509

--- Comment #9 from Alex Deucher <alexdeucher@gmail.com> ---
(In reply to James.Dutton from comment #8)
> Thank you for the feedback.
> Is there a data sheet somewhere that might help me work out a fix for thi=
s.
> What I would like is:
> 1) A way to scan all the engines and detect which ones have hung.

If the gpu scheduler for a queue on a particular engine times out, you can =
be
pretty sure the engine has hung.  At that point you can check the current b=
usy
status for the block (IP is_idle() callback).

> 2) A way to intentionally halt an engine and tidy up. So that the modprob=
e,
> rmmod, modprobe scenario works.=20

hw_fini() IP callback.

> 3) data sheet details regarding how to un-hang each engine.
> Specifically, in this case the IP block <dm>.

Each IP has a soft reset (implemented via the IP soft_reset() callback), but
depending on the hang, in some cases, you may have to do a full GPU reset to
recover.  This is not a hw hang, it's a sw deadlock.=20=20

>=20
> Maybe that is not possible, and (I think you are hinting at it), one cann=
ot
> reset an individual IP block. So the approach is to suspend the card, and
> then do a full reset of the entire card, then resume.

All asics support full GPU reset which is implemented via the SOC level
amdgpu_asic_funcs reset() callback.

>=20
> I think a different suspend process would be better.
> We have a for_each within the suspend code. The output of that code should
> not be a single error code, but instead an array indicating the current
> state of each engine (running/hung), the intended state and status of
> whether the intention worked or failed. If the loop through the for_each,=
 it
> could compare the current state and intended state, and attempt to reach =
the
> intended state, and report an error code for each engine. Then the code to
> achieve the transition can been different depending on the current ->
> intended transition.
> i.e. code for running -> suspended, can be different than code for hung ->
> suspended. The code already needs to know which engines are enabled/disab=
led
> (Vega 56 vs Vega 64)

We don't really care of the suspend fails or not.  See
amdgpu_device_gpu_recover() for the full sequence.

>=20
> I can hang this IP block <dm> at will. I have 2 games that hang it within
> seconds of starting.

There was a deadlock in the dm code which has been fixed.  Please try a new
code base.  e.g.,
https://cgit.freedesktop.org/~agd5f/linux/log/?h=3Damd-staging-drm-next
https://cgit.freedesktop.org/~agd5f/linux/log/?h=3Ddrm-next-5.2-wip

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15565876091.65c877.4165
Date: Tue, 30 Apr 2019 01:26:49 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110509#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110509">bug 11050=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexdeucher&#64;gmail.com" title=3D"Alex Deucher &lt;alexdeucher&#64;gmail.=
com&gt;"> <span class=3D"fn">Alex Deucher</span></a>
</span></b>
        <pre>(In reply to James.Dutton from <a href=3D"show_bug.cgi?id=3D11=
0509#c8">comment #8</a>)
<span class=3D"quote">&gt; Thank you for the feedback.
&gt; Is there a data sheet somewhere that might help me work out a fix for =
this.
&gt; What I would like is:
&gt; 1) A way to scan all the engines and detect which ones have hung.</spa=
n >

If the gpu scheduler for a queue on a particular engine times out, you can =
be
pretty sure the engine has hung.  At that point you can check the current b=
usy
status for the block (IP is_idle() callback).

<span class=3D"quote">&gt; 2) A way to intentionally halt an engine and tid=
y up. So that the modprobe,
&gt; rmmod, modprobe scenario works. </span >

hw_fini() IP callback.

<span class=3D"quote">&gt; 3) data sheet details regarding how to un-hang e=
ach engine.
&gt; Specifically, in this case the IP block &lt;dm&gt;.</span >

Each IP has a soft reset (implemented via the IP soft_reset() callback), but
depending on the hang, in some cases, you may have to do a full GPU reset to
recover.  This is not a hw hang, it's a sw deadlock.=20=20

<span class=3D"quote">&gt;=20
&gt; Maybe that is not possible, and (I think you are hinting at it), one c=
annot
&gt; reset an individual IP block. So the approach is to suspend the card, =
and
&gt; then do a full reset of the entire card, then resume.</span >

All asics support full GPU reset which is implemented via the SOC level
amdgpu_asic_funcs reset() callback.

<span class=3D"quote">&gt;=20
&gt; I think a different suspend process would be better.
&gt; We have a for_each within the suspend code. The output of that code sh=
ould
&gt; not be a single error code, but instead an array indicating the current
&gt; state of each engine (running/hung), the intended state and status of
&gt; whether the intention worked or failed. If the loop through the for_ea=
ch, it
&gt; could compare the current state and intended state, and attempt to rea=
ch the
&gt; intended state, and report an error code for each engine. Then the cod=
e to
&gt; achieve the transition can been different depending on the current -&g=
t;
&gt; intended transition.
&gt; i.e. code for running -&gt; suspended, can be different than code for =
hung -&gt;
&gt; suspended. The code already needs to know which engines are enabled/di=
sabled
&gt; (Vega 56 vs Vega 64)</span >

We don't really care of the suspend fails or not.  See
amdgpu_device_gpu_recover() for the full sequence.

<span class=3D"quote">&gt;=20
&gt; I can hang this IP block &lt;dm&gt; at will. I have 2 games that hang =
it within
&gt; seconds of starting.</span >

There was a deadlock in the dm code which has been fixed.  Please try a new
code base.  e.g.,
<a href=3D"https://cgit.freedesktop.org/~agd5f/linux/log/?h=3Damd-staging-d=
rm-next">https://cgit.freedesktop.org/~agd5f/linux/log/?h=3Damd-staging-drm=
-next</a>
<a href=3D"https://cgit.freedesktop.org/~agd5f/linux/log/?h=3Ddrm-next-5.2-=
wip">https://cgit.freedesktop.org/~agd5f/linux/log/?h=3Ddrm-next-5.2-wip</a=
></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15565876091.65c877.4165--

--===============0448776659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0448776659==--
