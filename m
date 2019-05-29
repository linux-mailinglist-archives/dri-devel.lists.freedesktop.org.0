Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C243C2E40B
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 20:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982466E083;
	Wed, 29 May 2019 18:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6298A6E083
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 18:05:54 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5ADF872167; Wed, 29 May 2019 18:05:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110659] pageflipping seems to cause jittering on mouse input
 when running Hitman 2 in Wine/DXVK with amdgpu.dc=1
Date: Wed, 29 May 2019 18:05:54 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nicholas.kazlauskas@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110659-502-EAKMhqFahd@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110659-502@http.bugs.freedesktop.org/>
References: <bug-110659-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1073940313=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1073940313==
Content-Type: multipart/alternative; boundary="15591531540.7cA96fB37.4585"
Content-Transfer-Encoding: 7bit


--15591531540.7cA96fB37.4585
Date: Wed, 29 May 2019 18:05:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110659

--- Comment #19 from Nicholas Kazlauskas <nicholas.kazlauskas@amd.com> ---
(In reply to tempel.julian from comment #18)
> Huh, with modesetting driver, those patches eliminate the stutter when new
> windows are shown. Does the xf86-video-amdgpu driver need adjustments for
> this?

It should eliminate stuttering for that case in xf86-video-amdgpu if it's t=
he
problem I think it is (double buffering the cursor).

>=20
> However, turning on nightlight in Plasma Wayland still causes stutter, wh=
ich
> is not there with amdgpu.dc=3D0.

1. Gamma updates are slow updates that do a lot of register programming.
Nightlight and RedShift issue a lot of these updates.

2. Gamma updates, like everything that isn't a cursor update, currently tar=
get
the next vblank period.

3. If the pageflip is in a separate commit or update than the gamma update,
then it'll need to wait for the gamma update to finish and for the next vbl=
ank
interval. If this takes too long then we might miss the next vblank interval
and have to wait for the one after that.

I think it's a combination of these 3 issues. Even though it's Wayland and
should be using the full atomic API, I'm not sure if plasma is actually iss=
uing
all that state in the same commit or not.

My guess would be no, since you're seeing the stuttering. We do have a bug =
with
(2) for legacy gamma updates, since there isn't really any reason those sho=
uld
be waiting for the next flip / vblank other than to be consistent with the =
rest
of the atomic commit framework.

> RedShift btw. is completely broken with amdgpu.dc=3D1 + modesetting DDX, =
it
> simply has no effect anymore (not related to the experimental atomic
> modesetting patches).

Not sure what the issue here would be. Gamma seems to work fine for legacy =
and
atomic on amdgpu (we pass the IGT tests for this) and it works fine in lega=
cy
desktops like GNOME on Xorg with the xf86-video-amdgpu DDX.

Was this still on Plasma, but on X?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15591531540.7cA96fB37.4585
Date: Wed, 29 May 2019 18:05:54 +0000
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
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659#c19">Comme=
nt # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659">bug 11065=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nicholas.kazlauskas&#64;amd.com" title=3D"Nicholas Kazlauskas &lt;nicholas.=
kazlauskas&#64;amd.com&gt;"> <span class=3D"fn">Nicholas Kazlauskas</span><=
/a>
</span></b>
        <pre>(In reply to tempel.julian from <a href=3D"show_bug.cgi?id=3D1=
10659#c18">comment #18</a>)
<span class=3D"quote">&gt; Huh, with modesetting driver, those patches elim=
inate the stutter when new
&gt; windows are shown. Does the xf86-video-amdgpu driver need adjustments =
for
&gt; this?</span >

It should eliminate stuttering for that case in xf86-video-amdgpu if it's t=
he
problem I think it is (double buffering the cursor).

<span class=3D"quote">&gt;=20
&gt; However, turning on nightlight in Plasma Wayland still causes stutter,=
 which
&gt; is not there with amdgpu.dc=3D0.</span >

1. Gamma updates are slow updates that do a lot of register programming.
Nightlight and RedShift issue a lot of these updates.

2. Gamma updates, like everything that isn't a cursor update, currently tar=
get
the next vblank period.

3. If the pageflip is in a separate commit or update than the gamma update,
then it'll need to wait for the gamma update to finish and for the next vbl=
ank
interval. If this takes too long then we might miss the next vblank interval
and have to wait for the one after that.

I think it's a combination of these 3 issues. Even though it's Wayland and
should be using the full atomic API, I'm not sure if plasma is actually iss=
uing
all that state in the same commit or not.

My guess would be no, since you're seeing the stuttering. We do have a bug =
with
(2) for legacy gamma updates, since there isn't really any reason those sho=
uld
be waiting for the next flip / vblank other than to be consistent with the =
rest
of the atomic commit framework.

<span class=3D"quote">&gt; RedShift btw. is completely broken with amdgpu.d=
c=3D1 + modesetting DDX, it
&gt; simply has no effect anymore (not related to the experimental atomic
&gt; modesetting patches).</span >

Not sure what the issue here would be. Gamma seems to work fine for legacy =
and
atomic on amdgpu (we pass the IGT tests for this) and it works fine in lega=
cy
desktops like GNOME on Xorg with the xf86-video-amdgpu DDX.

Was this still on Plasma, but on X?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15591531540.7cA96fB37.4585--

--===============1073940313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1073940313==--
