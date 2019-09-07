Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 728E6AC6BF
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2019 15:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AF089CF1;
	Sat,  7 Sep 2019 13:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3815E89CE1
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2019 13:20:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 34C4272161; Sat,  7 Sep 2019 13:20:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111527] obs-studio + latest mesa on amdgpu/vega64 leaks kernel
 memory rapidly
Date: Sat, 07 Sep 2019 13:20:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: tele42k3@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-111527-502-hOry3u6h85@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111527-502@http.bugs.freedesktop.org/>
References: <bug-111527-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1081580969=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1081580969==
Content-Type: multipart/alternative; boundary="15678624201.148dc.2358"
Content-Transfer-Encoding: 7bit


--15678624201.148dc.2358
Date: Sat, 7 Sep 2019 13:20:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111527

tele42k3@hotmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tele42k3@hotmail.com

--- Comment #2 from tele42k3@hotmail.com ---
Thanks for the clear steps to reproduce this issue. I managed to reproduce =
this
on my RX 480 and it bisected to:

commit 11a3679e3aba3524cf987f1f808d92c25f16e080
Author: Michel D=C3=A4nzer <michel.daenzer@amd.com>
Date:   Fri Jun 28 18:35:56 2019 +0200

    winsys/amdgpu: Make KMS handles valid for original DRM file descriptor

    Getting a DMA-buf fd and converting that to a handle using our duplicate
    of that file descriptor (getting at which requires passing a
    radeon_winsys pointer to the buffer_get_handle hook) makes sure of this,
    since duplicated file descriptors reference the same file description
    and therefore the same GEM handle namespace.

    This is necessary because libdrm_amdgpu may use a different DRM file
    descriptor with a separate handle namespace internally, e.g. because it
    always reuses any existing amdgpu_device_handle for the same device.
    amdgpu_bo_export returns a handle which is valid for that internal
    file descriptor.

    Bugzilla: https://bugs.freedesktop.org/110903
    Reviewed-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
    Tested-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.c=
om>

While testing I saw a .8 to 1 MB/s slow leak which appeared immediately on
opening OBS with the test scene. It felt like it consistently hit some obsc=
ured
value like 64MB before the major memory leak started, which helped bisect t=
he
issue.

I reverted the commit on top of f8887909c6683986990474b61afd6d4335a69e41 wi=
th
good results.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15678624201.148dc.2358
Date: Sat, 7 Sep 2019 13:20:20 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:tele42k3&=
#64;hotmail.com" title=3D"tele42k3&#64;hotmail.com">tele42k3&#64;hotmail.co=
m</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - obs-studio + latest mesa on amdgpu/vega64 leaks kernel me=
mory rapidly"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111527">bug 11152=
7</a>
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
           <td>tele42k3&#64;hotmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - obs-studio + latest mesa on amdgpu/vega64 leaks kernel me=
mory rapidly"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111527#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - obs-studio + latest mesa on amdgpu/vega64 leaks kernel me=
mory rapidly"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111527">bug 11152=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tele42k3&#64;hotmail.com" title=3D"tele42k3&#64;hotmail.com">tele42k3&#64;h=
otmail.com</a>
</span></b>
        <pre>Thanks for the clear steps to reproduce this issue. I managed =
to reproduce this
on my RX 480 and it bisected to:

commit 11a3679e3aba3524cf987f1f808d92c25f16e080
Author: Michel D=C3=A4nzer &lt;<a href=3D"mailto:michel.daenzer&#64;amd.com=
">michel.daenzer&#64;amd.com</a>&gt;
Date:   Fri Jun 28 18:35:56 2019 +0200

    winsys/amdgpu: Make KMS handles valid for original DRM file descriptor

    Getting a DMA-buf fd and converting that to a handle using our duplicate
    of that file descriptor (getting at which requires passing a
    radeon_winsys pointer to the buffer_get_handle hook) makes sure of this,
    since duplicated file descriptors reference the same file description
    and therefore the same GEM handle namespace.

    This is necessary because libdrm_amdgpu may use a different DRM file
    descriptor with a separate handle namespace internally, e.g. because it
    always reuses any existing amdgpu_device_handle for the same device.
    amdgpu_bo_export returns a handle which is valid for that internal
    file descriptor.

    Bugzilla: <a href=3D"https://bugs.freedesktop.org/110903">https://bugs.=
freedesktop.org/110903</a>
    Reviewed-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak&#6=
4;amd.com">marek.olsak&#64;amd.com</a>&gt;
    Tested-by: Pierre-Eric Pelloux-Prayer &lt;<a href=3D"mailto:pierre-eric=
.pelloux-prayer&#64;amd.com">pierre-eric.pelloux-prayer&#64;amd.com</a>&gt;

While testing I saw a .8 to 1 MB/s slow leak which appeared immediately on
opening OBS with the test scene. It felt like it consistently hit some obsc=
ured
value like 64MB before the major memory leak started, which helped bisect t=
he
issue.

I reverted the commit on top of f8887909c6683986990474b61afd6d4335a69e41 wi=
th
good results.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15678624201.148dc.2358--

--===============1081580969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1081580969==--
