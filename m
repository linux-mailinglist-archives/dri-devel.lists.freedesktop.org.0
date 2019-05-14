Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 737931CDF5
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 19:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3B6892AC;
	Tue, 14 May 2019 17:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 03661892FD
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 17:29:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F2261721CD; Tue, 14 May 2019 17:29:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110677] Can't invert screen colors by adjusting the gamma ramp
Date: Tue, 14 May 2019 17:29:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nicholas.kazlauskas@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110677-502-v1aawxmHaW@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110677-502@http.bugs.freedesktop.org/>
References: <bug-110677-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1263899503=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1263899503==
Content-Type: multipart/alternative; boundary="15578549412.d0AF3ec3a.16713"
Content-Transfer-Encoding: 7bit


--15578549412.d0AF3ec3a.16713
Date: Tue, 14 May 2019 17:29:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110677

--- Comment #7 from Nicholas Kazlauskas <nicholas.kazlauskas@amd.com> ---
The issue is in the display driver.

The driver does an sRGB degamma, CTM, then sRGB regamma + user regamma - wh=
ich
explains why the screen is mostly white (since the curve is inverse).

If the the degamma block was put into linear bypass and the user regamma was
applied directly to the regamma block that should give the correct result.

Not sure if mapping the legacy gamma to the full LUT would break any IGT co=
lor
or standard X11 gamma operations.

I do have some changes that fix this kind of operation for atomic userspace=
 but
I'd have to take a look at the legacy one again to know if this is easy to
support or not.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15578549412.d0AF3ec3a.16713
Date: Tue, 14 May 2019 17:29:01 +0000
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
   title=3D"NEW - Can't invert screen colors by adjusting the gamma ramp"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110677#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Can't invert screen colors by adjusting the gamma ramp"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110677">bug 11067=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nicholas.kazlauskas&#64;amd.com" title=3D"Nicholas Kazlauskas &lt;nicholas.=
kazlauskas&#64;amd.com&gt;"> <span class=3D"fn">Nicholas Kazlauskas</span><=
/a>
</span></b>
        <pre>The issue is in the display driver.

The driver does an sRGB degamma, CTM, then sRGB regamma + user regamma - wh=
ich
explains why the screen is mostly white (since the curve is inverse).

If the the degamma block was put into linear bypass and the user regamma was
applied directly to the regamma block that should give the correct result.

Not sure if mapping the legacy gamma to the full LUT would break any IGT co=
lor
or standard X11 gamma operations.

I do have some changes that fix this kind of operation for atomic userspace=
 but
I'd have to take a look at the legacy one again to know if this is easy to
support or not.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15578549412.d0AF3ec3a.16713--

--===============1263899503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1263899503==--
