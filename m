Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABA2ECDF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 00:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F071589359;
	Mon, 29 Apr 2019 22:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3B0D889359
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 22:41:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2F73D72155; Mon, 29 Apr 2019 22:41:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110509] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
 timeout
Date: Mon, 29 Apr 2019 22:41:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: James.Dutton@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110509-502-OtVQEsFpkj@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1355276537=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1355276537==
Content-Type: multipart/alternative; boundary="15565776860.BDA49f.1320"
Content-Transfer-Encoding: 7bit


--15565776860.BDA49f.1320
Date: Mon, 29 Apr 2019 22:41:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110509

--- Comment #8 from James.Dutton@gmail.com ---
Thank you for the feedback.
Is there a data sheet somewhere that might help me work out a fix for this.
What I would like is:
1) A way to scan all the engines and detect which ones have hung.
2) A way to intentionally halt an engine and tidy up. So that the modprobe,
rmmod, modprobe scenario works.=20
3) data sheet details regarding how to un-hang each engine.
Specifically, in this case the IP block <dm>.

Maybe that is not possible, and (I think you are hinting at it), one cannot
reset an individual IP block. So the approach is to suspend the card, and t=
hen
do a full reset of the entire card, then resume.

I think a different suspend process would be better.
We have a for_each within the suspend code. The output of that code should =
not
be a single error code, but instead an array indicating the current state of
each engine (running/hung), the intended state and status of whether the
intention worked or failed. If the loop through the for_each, it could comp=
are
the current state and intended state, and attempt to reach the intended sta=
te,
and report an error code for each engine. Then the code to achieve the
transition can been different depending on the current -> intended transiti=
on.
i.e. code for running -> suspended, can be different than code for hung ->
suspended. The code already needs to know which engines are enabled/disable=
d=20
(Vega 56 vs Vega 64)

I can hang this IP block <dm> at will. I have 2 games that hang it within
seconds of starting.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15565776860.BDA49f.1320
Date: Mon, 29 Apr 2019 22:41:26 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110509#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110509">bug 11050=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
James.Dutton&#64;gmail.com" title=3D"James.Dutton&#64;gmail.com">James.Dutt=
on&#64;gmail.com</a>
</span></b>
        <pre>Thank you for the feedback.
Is there a data sheet somewhere that might help me work out a fix for this.
What I would like is:
1) A way to scan all the engines and detect which ones have hung.
2) A way to intentionally halt an engine and tidy up. So that the modprobe,
rmmod, modprobe scenario works.=20
3) data sheet details regarding how to un-hang each engine.
Specifically, in this case the IP block &lt;dm&gt;.

Maybe that is not possible, and (I think you are hinting at it), one cannot
reset an individual IP block. So the approach is to suspend the card, and t=
hen
do a full reset of the entire card, then resume.

I think a different suspend process would be better.
We have a for_each within the suspend code. The output of that code should =
not
be a single error code, but instead an array indicating the current state of
each engine (running/hung), the intended state and status of whether the
intention worked or failed. If the loop through the for_each, it could comp=
are
the current state and intended state, and attempt to reach the intended sta=
te,
and report an error code for each engine. Then the code to achieve the
transition can been different depending on the current -&gt; intended trans=
ition.
i.e. code for running -&gt; suspended, can be different than code for hung =
-&gt;
suspended. The code already needs to know which engines are enabled/disable=
d=20
(Vega 56 vs Vega 64)

I can hang this IP block &lt;dm&gt; at will. I have 2 games that hang it wi=
thin
seconds of starting.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15565776860.BDA49f.1320--

--===============1355276537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1355276537==--
