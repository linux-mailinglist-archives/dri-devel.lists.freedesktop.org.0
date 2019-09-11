Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9C7AFDCD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 15:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23C66EB06;
	Wed, 11 Sep 2019 13:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D70EC6EB05
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 13:36:51 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D3E1772167; Wed, 11 Sep 2019 13:36:51 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108917] gamma adjustments cause stuttering with amdgpu.dc=1,
 especially problematic with RedShift etc.
Date: Wed, 11 Sep 2019 13:36:51 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tempel.julian@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108917-502-W4YDGvHBST@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108917-502@http.bugs.freedesktop.org/>
References: <bug-108917-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0266993835=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0266993835==
Content-Type: multipart/alternative; boundary="15682090111.89de5e.11866"
Content-Transfer-Encoding: 7bit


--15682090111.89de5e.11866
Date: Wed, 11 Sep 2019 13:36:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108917

--- Comment #15 from tempel.julian@gmail.com ---
To clarify: There is no connection to any compositor. You can also reproduce
the issue with any desktop environment where you can disable the compositor.
Instead of using a compositor then, simply enable TearFree and run "redshif=
t -t
4500:4500 -l 1:1".
-> It still makes everything stutter. And not just with cursor input, it
affects the whole screen content without further doing. Just look at your
browser window content of www.vsnctester.com, scroll on any webpage or play=
 a
video: The stutter should always be noticeable.
The commit "drm/amd/display: Allow cursor async updates for framebuffer swa=
ps"
has not changed the situation.

I can't explain why this issue was less distinct with some 5.1 kernel versi=
ons.
Anyway: It's back to "really stuttery" since 5.2.

---

Is this perhaps because userspace uses legacy gamma adjustment instead of n=
ew
atomic infrastructure? In that case, it would seem unrealistic to expect it=
 to
adopt to the new infrastructure if not even Gnome Nightlight on Wayland uses
it. So a performance fix for legacy gamma adjustments would be highly welco=
me
(if my assumptions apply ;) ).

I also wonder why there has to be stutter at all. Only the initial setting =
of
new gamma adjustments cause the stutter. When you run redshift in "oneshot"
mode via "redshift -O 4500", there is no more stutter once the initial
adjustment is done and the gamma stays adjusted.
Perhaps it would help to make the kernel delay the adjustments until they c=
an
happen without causing performance issues with vsync + pageflipping?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15682090111.89de5e.11866
Date: Wed, 11 Sep 2019 13:36:51 +0000
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
   title=3D"NEW - gamma adjustments cause stuttering with amdgpu.dc=3D1, es=
pecially problematic with RedShift etc."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108917#c15">Comme=
nt # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - gamma adjustments cause stuttering with amdgpu.dc=3D1, es=
pecially problematic with RedShift etc."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108917">bug 10891=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tempel.julian&#64;gmail.com" title=3D"tempel.julian&#64;gmail.com">tempel.j=
ulian&#64;gmail.com</a>
</span></b>
        <pre>To clarify: There is no connection to any compositor. You can =
also reproduce
the issue with any desktop environment where you can disable the compositor.
Instead of using a compositor then, simply enable TearFree and run &quot;re=
dshift -t
4500:4500 -l 1:1&quot;.
-&gt; It still makes everything stutter. And not just with cursor input, it
affects the whole screen content without further doing. Just look at your
browser window content of www.vsnctester.com, scroll on any webpage or play=
 a
video: The stutter should always be noticeable.
The commit &quot;drm/amd/display: Allow cursor async updates for framebuffe=
r swaps&quot;
has not changed the situation.

I can't explain why this issue was less distinct with some 5.1 kernel versi=
ons.
Anyway: It's back to &quot;really stuttery&quot; since 5.2.

---

Is this perhaps because userspace uses legacy gamma adjustment instead of n=
ew
atomic infrastructure? In that case, it would seem unrealistic to expect it=
 to
adopt to the new infrastructure if not even Gnome Nightlight on Wayland uses
it. So a performance fix for legacy gamma adjustments would be highly welco=
me
(if my assumptions apply ;) ).

I also wonder why there has to be stutter at all. Only the initial setting =
of
new gamma adjustments cause the stutter. When you run redshift in &quot;one=
shot&quot;
mode via &quot;redshift -O 4500&quot;, there is no more stutter once the in=
itial
adjustment is done and the gamma stays adjusted.
Perhaps it would help to make the kernel delay the adjustments until they c=
an
happen without causing performance issues with vsync + pageflipping?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15682090111.89de5e.11866--

--===============0266993835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0266993835==--
