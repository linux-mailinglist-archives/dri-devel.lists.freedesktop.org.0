Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0556FBAB9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341576EE7A;
	Wed, 13 Nov 2019 21:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 61F836EE79
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 21:30:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5EBFF720E2; Wed, 13 Nov 2019 21:30:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112265] Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no
 graphics
Date: Wed, 13 Nov 2019 21:30:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/other
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: John.p.donnelly@oracle.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-112265-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1672003415=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1672003415==
Content-Type: multipart/alternative; boundary="15736806111.c88D2bcF.17600"
Content-Transfer-Encoding: 7bit


--15736806111.c88D2bcF.17600
Date: Wed, 13 Nov 2019 21:30:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112265

            Bug ID: 112265
           Summary: Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no
                    graphics
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: not set
         Component: DRM/other
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: John.p.donnelly@oracle.com

bisect took to me to  this change that certainly reflects the behavior I am
seeing :

 5.1.0-rc5


commit 81da87f63a1edebcf8cbb811d387e353d9f89c7a (refs/bisect/bad)
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Tue May 21 13:08:29 2019 +0200

   drm: Replace drm_gem_vram_push_to_system() with kunmap + unpin

   The push-to-system function forces a buffer out of video RAM. This decis=
ion
   should rather be made by the memory manager. By replacing the function w=
ith
   calls to the kunmap and unpin functions, the buffer's memory becomes
available,
   but the buffer remains in VRAM until it's evicted by a pin operation.

   This patch replaces the remaining instances of drm_gem_vram_push_to_syst=
em()
   in ast and mgag200, and removes the function from DRM.


My 1st impression is we need a method  that restores the previous behavior =
that
pushes the content to the device .=20=20=20=20



I found this issue using=20

gnome-desktop3-3.28.2-1.el8.x86_64

If there is a more specific. RPM  I can look at for guidance I will .

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15736806111.c88D2bcF.17600
Date: Wed, 13 Nov 2019 21:30:11 +0000
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
   title=3D"NEW - Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no gra=
phics"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112265">112265</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no graphics
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>DRI git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/other
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>John.p.donnelly&#64;oracle.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>bisect took to me to  this change that certainly reflects the =
behavior I am
seeing :

 5.1.0-rc5


commit 81da87f63a1edebcf8cbb811d387e353d9f89c7a (refs/bisect/bad)
Author: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann&#64;suse.de">tz=
immermann&#64;suse.de</a>&gt;
Date:   Tue May 21 13:08:29 2019 +0200

   drm: Replace drm_gem_vram_push_to_system() with kunmap + unpin

   The push-to-system function forces a buffer out of video RAM. This decis=
ion
   should rather be made by the memory manager. By replacing the function w=
ith
   calls to the kunmap and unpin functions, the buffer's memory becomes
available,
   but the buffer remains in VRAM until it's evicted by a pin operation.

   This patch replaces the remaining instances of drm_gem_vram_push_to_syst=
em()
   in ast and mgag200, and removes the function from DRM.


My 1st impression is we need a method  that restores the previous behavior =
that
pushes the content to the device .=20=20=20=20



I found this issue using=20

gnome-desktop3-3.28.2-1.el8.x86_64

If there is a more specific. RPM  I can look at for guidance I will .</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15736806111.c88D2bcF.17600--

--===============1672003415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1672003415==--
