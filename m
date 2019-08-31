Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E67EA4630
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2019 22:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC9E6E150;
	Sat, 31 Aug 2019 20:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E0836E150
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 20:26:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1AC9472161; Sat, 31 Aug 2019 20:26:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111527] obs-studio + latest mesa on amdgpu/vega64 leaks kernel
 memory rapidly
Date: Sat, 31 Aug 2019 20:26:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: john@pointysoftware.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-111527-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1201926424=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1201926424==
Content-Type: multipart/alternative; boundary="15672831710.A350DECc.8055"
Content-Transfer-Encoding: 7bit


--15672831710.A350DECc.8055
Date: Sat, 31 Aug 2019 20:26:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111527

            Bug ID: 111527
           Summary: obs-studio + latest mesa on amdgpu/vega64 leaks kernel
                    memory rapidly
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: john@pointysoftware.net
        QA Contact: dri-devel@lists.freedesktop.org

As of at least mesa 19.3/bfac462d929 on a Vega 64:

Running obs-studio, even without starting a broadcast, will begin a seeming=
ly
exponential memory leak.  It will be fine for a few minutes, until it rapid=
ly
begins consuming what appears to be kernel memory (nothing attributed to ap=
p,
but total usage skyrockets).  With 32G of ram I exhaust system memory after
about three minutes, but the OOM killer doesn't know what to take down as O=
BS
itself remains low in the list.  This can then murder the whole system.

However, killing OBS causes most of the memory to be freed.  I say most bec=
ause
after reproducing on a fresh boot, there were apparently a few gigabytes of
unaccounted for memory that never returned.  Subsequent repros of the bug on
that same boot returned to the same baseline, however.  Some caching mechan=
ism
gone wrong?

I've noticed this going back at least a few weeks, but haven't a proper bis=
ect.
 It should be very easy to reproduce, and happens on both Vega 64 systems I
have available.

Steps to reproduce, may not all be necessary but I confirmed this does it f=
rom
a fresh state:
- Launch obs-studio
- Enable Studio Mode by clicking the button the right
- Add two sources: "desktop capture" (select any monitor) and a single "Ima=
ge"
source (any image)
- Press Fade/Cut up top to make that state live.  No need to actually start
recording/broadcasting.
- Wait a few minutes or until your system hangs.  Memory usage will appear
stable for at least a full minute before taking off unprompted.  It will no=
t be
attributed to the app, however, being apparently kernel memory.

Reproduces with 19.3 - bfac462d929
Does not reproduce with 19.1.4

Kernel versions 5.2.8/5.2.11 same behavior

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15672831710.A350DECc.8055
Date: Sat, 31 Aug 2019 20:26:11 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - obs-studio + latest mesa on amdgpu/vega64 leaks kernel me=
mory rapidly"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111527">111527</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>obs-studio + latest mesa on amdgpu/vega64 leaks kernel memory=
 rapidly
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/Gallium/radeonsi
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>john&#64;pointysoftware.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>As of at least mesa 19.3/bfac462d929 on a Vega 64:

Running obs-studio, even without starting a broadcast, will begin a seeming=
ly
exponential memory leak.  It will be fine for a few minutes, until it rapid=
ly
begins consuming what appears to be kernel memory (nothing attributed to ap=
p,
but total usage skyrockets).  With 32G of ram I exhaust system memory after
about three minutes, but the OOM killer doesn't know what to take down as O=
BS
itself remains low in the list.  This can then murder the whole system.

However, killing OBS causes most of the memory to be freed.  I say most bec=
ause
after reproducing on a fresh boot, there were apparently a few gigabytes of
unaccounted for memory that never returned.  Subsequent repros of the bug on
that same boot returned to the same baseline, however.  Some caching mechan=
ism
gone wrong?

I've noticed this going back at least a few weeks, but haven't a proper bis=
ect.
 It should be very easy to reproduce, and happens on both Vega 64 systems I
have available.

Steps to reproduce, may not all be necessary but I confirmed this does it f=
rom
a fresh state:
- Launch obs-studio
- Enable Studio Mode by clicking the button the right
- Add two sources: &quot;desktop capture&quot; (select any monitor) and a s=
ingle &quot;Image&quot;
source (any image)
- Press Fade/Cut up top to make that state live.  No need to actually start
recording/broadcasting.
- Wait a few minutes or until your system hangs.  Memory usage will appear
stable for at least a full minute before taking off unprompted.  It will no=
t be
attributed to the app, however, being apparently kernel memory.

Reproduces with 19.3 - bfac462d929
Does not reproduce with 19.1.4

Kernel versions 5.2.8/5.2.11 same behavior</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15672831710.A350DECc.8055--

--===============1201926424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1201926424==--
