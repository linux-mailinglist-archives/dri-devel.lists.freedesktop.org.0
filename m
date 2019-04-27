Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E3EB4A5
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2019 01:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15088922B;
	Sat, 27 Apr 2019 23:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5B0CD8922B
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2019 23:33:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 572B17215F; Sat, 27 Apr 2019 23:33:53 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108487] Wayland compositors are unable to use hardware
 acceleration on i915
Date: Sat, 27 Apr 2019 23:33:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/i915
X-Bugzilla-Version: 18.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexvillacislasso@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108487-502-oIa1gBY8Or@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108487-502@http.bugs.freedesktop.org/>
References: <bug-108487-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1152122190=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1152122190==
Content-Type: multipart/alternative; boundary="15564080331.C597E.8173"
Content-Transfer-Encoding: 7bit


--15564080331.C597E.8173
Date: Sat, 27 Apr 2019 23:33:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108487

--- Comment #17 from Alex Villac=C3=ADs Lasso <alexvillacislasso@hotmail.co=
m> ---
I see the exact same issue on my machine when trying weston. This bug is ve=
ry
similar to one I had a hand in working around in mutter:
https://gitlab.gnome.org/GNOME/mutter/issues/127 . The mutter workaround
essentially tries calling gbm_bo_get_handle_for_plane() on plane 0 of the b=
o,
sees if the call succeeded, and if not, falls back on calling
gbm_bo_get_handle() while storing DRM_FORMAT_MOD_INVALID, which in turn cau=
ses
the subsequent code to call drmModeAddFB[2]() instead of the unsupported
drmModeAddFB2WithModifiers().

This should really be fixed in mesa. Quoting myself from the mutter bug rep=
ort:
----- BEGIN QUOTE -----
@daniels I think I found the cause why mesa code fails the
gbm_bo_get_handle_for_plane call with the i915 driver. However, it is not c=
lear
to me whether it is an actual bug, or just the code "working" as designed.

The gbm_bo_get_handle_for_plane implementation was introduced by commit
f9567ab435217a72cbae628336ead84dc0b2a803 (gbm: Export a getter for per plane
handles). This implementation contains the following check, which remains to
this day:

   if (!dri->image || dri->image->base.version < 13 || !dri->image->fromPla=
nar)
   {
      errno =3D ENOSYS;
      return ret;
   }

One of the conditions for the call is that the base.version member is 13 or
above. This member (dri->image) is a __DRIimageExtension *, according to
src/gbm/backends/dri/gbm_driint.h in the Mesa code.

There are several DRI drivers that define a static __DRIimageExtension with
type __DRI_IMAGE, along with an API version. In the case of i965
(src/mesa/drivers/dri/i965/intel_screen.c), the api is at version 16. Howev=
er,
in the case of i915 (src/mesa/drivers/dri/i915/intel_screen.c) the api is at
version 7.

At first sight, it looks as though the version check in the initial commit =
is
too restrictive. According to include/GL/internal/dri_interface.h in the Me=
sa
code, the fromPlanar member of __DRIimage should be available since __DRI_I=
MAGE
API version 5. However, the commit does not include comments on why version=
 13
is the minimum required for fetching the plane handle. Again, according to
include/GL/internal/dri_interface.h, the one property that requires 13 as a
minimum is __DRI_IMAGE_ATTRIB_OFFSET. So maybe the code assumes that whoever
calls  gbm_bo_get_handle_for_plane will also fetch the offset.

----- END QUOTE -----

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15564080331.C597E.8173
Date: Sat, 27 Apr 2019 23:33:53 +0000
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
   title=3D"NEW - Wayland compositors are unable to use hardware accelerati=
on on i915"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108487#c17">Comme=
nt # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Wayland compositors are unable to use hardware accelerati=
on on i915"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108487">bug 10848=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexvillacislasso&#64;hotmail.com" title=3D"Alex Villac=C3=ADs Lasso &lt;al=
exvillacislasso&#64;hotmail.com&gt;"> <span class=3D"fn">Alex Villac=C3=ADs=
 Lasso</span></a>
</span></b>
        <pre>I see the exact same issue on my machine when trying weston. T=
his bug is very
similar to one I had a hand in working around in mutter:
<a href=3D"https://gitlab.gnome.org/GNOME/mutter/issues/127">https://gitlab=
.gnome.org/GNOME/mutter/issues/127</a> . The mutter workaround
essentially tries calling gbm_bo_get_handle_for_plane() on plane 0 of the b=
o,
sees if the call succeeded, and if not, falls back on calling
gbm_bo_get_handle() while storing DRM_FORMAT_MOD_INVALID, which in turn cau=
ses
the subsequent code to call drmModeAddFB[2]() instead of the unsupported
drmModeAddFB2WithModifiers().

This should really be fixed in mesa. Quoting myself from the mutter bug rep=
ort:
----- BEGIN QUOTE -----
&#64;daniels I think I found the cause why mesa code fails the
gbm_bo_get_handle_for_plane call with the i915 driver. However, it is not c=
lear
to me whether it is an actual bug, or just the code &quot;working&quot; as =
designed.

The gbm_bo_get_handle_for_plane implementation was introduced by commit
f9567ab435217a72cbae628336ead84dc0b2a803 (gbm: Export a getter for per plane
handles). This implementation contains the following check, which remains to
this day:

   if (!dri-&gt;image || dri-&gt;image-&gt;base.version &lt; 13 || !dri-&gt=
;image-&gt;fromPlanar)
   {
      errno =3D ENOSYS;
      return ret;
   }

One of the conditions for the call is that the base.version member is 13 or
above. This member (dri-&gt;image) is a __DRIimageExtension *, according to
src/gbm/backends/dri/gbm_driint.h in the Mesa code.

There are several DRI drivers that define a static __DRIimageExtension with
type __DRI_IMAGE, along with an API version. In the case of i965
(src/mesa/drivers/dri/i965/intel_screen.c), the api is at version 16. Howev=
er,
in the case of i915 (src/mesa/drivers/dri/i915/intel_screen.c) the api is at
version 7.

At first sight, it looks as though the version check in the initial commit =
is
too restrictive. According to include/GL/internal/dri_interface.h in the Me=
sa
code, the fromPlanar member of __DRIimage should be available since __DRI_I=
MAGE
API version 5. However, the commit does not include comments on why version=
 13
is the minimum required for fetching the plane handle. Again, according to
include/GL/internal/dri_interface.h, the one property that requires 13 as a
minimum is __DRI_IMAGE_ATTRIB_OFFSET. So maybe the code assumes that whoever
calls  gbm_bo_get_handle_for_plane will also fetch the offset.

----- END QUOTE -----</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15564080331.C597E.8173--

--===============1152122190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1152122190==--
