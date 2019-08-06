Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A453282DBC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 10:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9466E32B;
	Tue,  6 Aug 2019 08:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7936B6E32B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 08:30:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6FD1472167; Tue,  6 Aug 2019 08:30:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110354] Confusing Junk in the results: Last errno: 25,
 Inappropriate ioctl for device
Date: Tue, 06 Aug 2019 08:30:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: arkadiusz.hiler@intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-110354-502-n6EGxeKv1v@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110354-502@http.bugs.freedesktop.org/>
References: <bug-110354-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1795890421=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1795890421==
Content-Type: multipart/alternative; boundary="15650802380.7F2B3eB0.19047"
Content-Transfer-Encoding: 7bit


--15650802380.7F2B3eB0.19047
Date: Tue, 6 Aug 2019 08:30:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110354

Arek Hiler <arkadiusz.hiler@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Arek Hiler <arkadiusz.hiler@intel.com> ---
There was a patch merged that resets errno in the few places where errno
pollution is likely and in the few places where it may require resetting:

commit a558c2e2405473f4157ca71638e5a111ebfa80d1
Author: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date:   Tue Apr 9 17:21:41 2019 +0300

    lib: Reset errno to 0 after isatty

    Since igt_assert family of functions logs last errno we get a lot of
    those: "Last errno: 25, Inappropriate ioctl for device"

    isatty() seems to be the biggest offender in that area, so this patch
    should limit amount of confusing messages significantly.

    Cc: Martin Peres <martin.peres@linux.intel.com>
    Cc: Petri Latvala <petri.latvala@intel.com>
    Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
    Reviewed-by: Petri Latvala <petri.latvala@intel.com>

commit 02b1706e8b1ca93a53d4ef0f9c484a6f1a0d18f2
Author: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date:   Thu Apr 4 16:17:40 2019 +0300

    lib/igt_kms: Be more verbose about failure in kmstest_wait_for_pageflip

    First, we set errno to 0 before doing select() to avoid random pollution
    of the assert message with things like:
    "Last errno: 25, Inappropriate ioctl for device"

    Second, we log explicitly if we exceeded the timeout (ret =3D=3D 0).

    Third, if we fail the select() we log that with some explanation.

    Cc: Petri Latvala <petri.latvala@intel.com>
    Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
    Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
    Reviewed-by: Petri Latvala <petri.latvala@intel.com>

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15650802380.7F2B3eB0.19047
Date: Tue, 6 Aug 2019 08:30:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:arkadiusz=
.hiler&#64;intel.com" title=3D"Arek Hiler &lt;arkadiusz.hiler&#64;intel.com=
&gt;"> <span class=3D"fn">Arek Hiler</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Confusing Junk in the results: Last errno: 25,=
 Inappropriate ioctl for device"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110354">bug 11035=
4</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Confusing Junk in the results: Last errno: 25,=
 Inappropriate ioctl for device"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110354#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Confusing Junk in the results: Last errno: 25,=
 Inappropriate ioctl for device"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110354">bug 11035=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
arkadiusz.hiler&#64;intel.com" title=3D"Arek Hiler &lt;arkadiusz.hiler&#64;=
intel.com&gt;"> <span class=3D"fn">Arek Hiler</span></a>
</span></b>
        <pre>There was a patch merged that resets errno in the few places w=
here errno
pollution is likely and in the few places where it may require resetting:

commit a558c2e2405473f4157ca71638e5a111ebfa80d1
Author: Arkadiusz Hiler &lt;<a href=3D"mailto:arkadiusz.hiler&#64;intel.com=
">arkadiusz.hiler&#64;intel.com</a>&gt;
Date:   Tue Apr 9 17:21:41 2019 +0300

    lib: Reset errno to 0 after isatty

    Since igt_assert family of functions logs last errno we get a lot of
    those: &quot;Last errno: 25, Inappropriate ioctl for device&quot;

    isatty() seems to be the biggest offender in that area, so this patch
    should limit amount of confusing messages significantly.

    Cc: Martin Peres &lt;<a href=3D"mailto:martin.peres&#64;linux.intel.com=
">martin.peres&#64;linux.intel.com</a>&gt;
    Cc: Petri Latvala &lt;<a href=3D"mailto:petri.latvala&#64;intel.com">pe=
tri.latvala&#64;intel.com</a>&gt;
    Signed-off-by: Arkadiusz Hiler &lt;<a href=3D"mailto:arkadiusz.hiler&#6=
4;intel.com">arkadiusz.hiler&#64;intel.com</a>&gt;
    Reviewed-by: Petri Latvala &lt;<a href=3D"mailto:petri.latvala&#64;inte=
l.com">petri.latvala&#64;intel.com</a>&gt;

commit 02b1706e8b1ca93a53d4ef0f9c484a6f1a0d18f2
Author: Arkadiusz Hiler &lt;<a href=3D"mailto:arkadiusz.hiler&#64;intel.com=
">arkadiusz.hiler&#64;intel.com</a>&gt;
Date:   Thu Apr 4 16:17:40 2019 +0300

    lib/igt_kms: Be more verbose about failure in kmstest_wait_for_pageflip

    First, we set errno to 0 before doing select() to avoid random pollution
    of the assert message with things like:
    &quot;Last errno: 25, Inappropriate ioctl for device&quot;

    Second, we log explicitly if we exceeded the timeout (ret =3D=3D 0).

    Third, if we fail the select() we log that with some explanation.

    Cc: Petri Latvala &lt;<a href=3D"mailto:petri.latvala&#64;intel.com">pe=
tri.latvala&#64;intel.com</a>&gt;
    Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter&#64;ffwll.ch">dan=
iel.vetter&#64;ffwll.ch</a>&gt;
    Signed-off-by: Arkadiusz Hiler &lt;<a href=3D"mailto:arkadiusz.hiler&#6=
4;intel.com">arkadiusz.hiler&#64;intel.com</a>&gt;
    Reviewed-by: Petri Latvala &lt;<a href=3D"mailto:petri.latvala&#64;inte=
l.com">petri.latvala&#64;intel.com</a>&gt;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15650802380.7F2B3eB0.19047--

--===============1795890421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1795890421==--
