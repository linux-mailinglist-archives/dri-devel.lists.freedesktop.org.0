Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 372E54BA6B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 15:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134B06E400;
	Wed, 19 Jun 2019 13:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 22ABF6E3EC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 13:46:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2029E72167; Wed, 19 Jun 2019 13:46:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110949] Continuious warnings from agd5f 5.3-wip branch
Date: Wed, 19 Jun 2019 13:46:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mike@fireburn.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-110949-502-gGxAjqnDpL@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110949-502@http.bugs.freedesktop.org/>
References: <bug-110949-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0601984120=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0601984120==
Content-Type: multipart/alternative; boundary="15609519791.E10b.19238"
Content-Transfer-Encoding: 7bit


--15609519791.E10b.19238
Date: Wed, 19 Jun 2019 13:46:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110949

Mike Lothian <mike@fireburn.co.uk> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mike@fireburn.co.uk

--- Comment #1 from Mike Lothian <mike@fireburn.co.uk> ---
37fb6e8a96fbc9c809c58f9490267ffe7101ac33 is the first bad commit
commit 37fb6e8a96fbc9c809c58f9490267ffe7101ac33
Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Date:   Fri Jun 7 11:16:55 2019 -0400

    drm/amd/display: Enable fast plane updates when state->allow_modeset =
=3D true

    [Why]
    Whenever the a modeset is allowed (but not neccessarily required) we
    currently recreate all the planes in the state. Most IGT tests and
    legacy IOCTLs create atomic commits with this flag set, so the pipes
    are often unnecessarily reprogrammed.

    Poor performance and stuttering can occur when many of these commits
    are frequently issued.

    This flag was needed when the appropriate conditions for checking
    whether the planes needed a reset were not in place, but
    should_reset_plane should cover everything needed now.

    [How]
    Drop the check for state->allow_modeset in should_reset_plane.

    All planes on a CRTC should reset in the following conditions:
    - The CRTC needs a modeset
    - The CRTC degamma changes
    - Planes are added or removed to the CRTC

    These conditions are all covered in should_reset_plane.

    We still can't drop the format change check in should_reset_plane since
    fill_dc_plane_info_and_addr isn't called when validating the state, so
    we can't tell if a FULL update is needed or not.

    Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
    Reviewed-by: David Francis <david.francis@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 --------
 1 file changed, 8 deletions(-)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15609519791.E10b.19238
Date: Wed, 19 Jun 2019 13:46:19 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:mike&#64;=
fireburn.co.uk" title=3D"Mike Lothian &lt;mike&#64;fireburn.co.uk&gt;"> <sp=
an class=3D"fn">Mike Lothian</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Continuious warnings from agd5f 5.3-wip branch"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110949">bug 11094=
9</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>mike&#64;fireburn.co.uk
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Continuious warnings from agd5f 5.3-wip branch"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110949#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Continuious warnings from agd5f 5.3-wip branch"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110949">bug 11094=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mike&#64;fireburn.co.uk" title=3D"Mike Lothian &lt;mike&#64;fireburn.co.uk&=
gt;"> <span class=3D"fn">Mike Lothian</span></a>
</span></b>
        <pre>37fb6e8a96fbc9c809c58f9490267ffe7101ac33 is the first bad comm=
it
commit 37fb6e8a96fbc9c809c58f9490267ffe7101ac33
Author: Nicholas Kazlauskas &lt;<a href=3D"mailto:nicholas.kazlauskas&#64;a=
md.com">nicholas.kazlauskas&#64;amd.com</a>&gt;
Date:   Fri Jun 7 11:16:55 2019 -0400

    drm/amd/display: Enable fast plane updates when state-&gt;allow_modeset=
 =3D true

    [Why]
    Whenever the a modeset is allowed (but not neccessarily required) we
    currently recreate all the planes in the state. Most IGT tests and
    legacy IOCTLs create atomic commits with this flag set, so the pipes
    are often unnecessarily reprogrammed.

    Poor performance and stuttering can occur when many of these commits
    are frequently issued.

    This flag was needed when the appropriate conditions for checking
    whether the planes needed a reset were not in place, but
    should_reset_plane should cover everything needed now.

    [How]
    Drop the check for state-&gt;allow_modeset in should_reset_plane.

    All planes on a CRTC should reset in the following conditions:
    - The CRTC needs a modeset
    - The CRTC degamma changes
    - Planes are added or removed to the CRTC

    These conditions are all covered in should_reset_plane.

    We still can't drop the format change check in should_reset_plane since
    fill_dc_plane_info_and_addr isn't called when validating the state, so
    we can't tell if a FULL update is needed or not.

    Signed-off-by: Nicholas Kazlauskas &lt;<a href=3D"mailto:nicholas.kazla=
uskas&#64;amd.com">nicholas.kazlauskas&#64;amd.com</a>&gt;
    Reviewed-by: David Francis &lt;<a href=3D"mailto:david.francis&#64;amd.=
com">david.francis&#64;amd.com</a>&gt;
    Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64=
;amd.com">alexander.deucher&#64;amd.com</a>&gt;

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 --------
 1 file changed, 8 deletions(-)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15609519791.E10b.19238--

--===============0601984120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0601984120==--
