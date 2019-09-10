Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA950AE334
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 07:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121FA89026;
	Tue, 10 Sep 2019 05:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 451DC89026
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 05:07:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3B03C72167; Tue, 10 Sep 2019 05:07:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111622] VAAPI vaDeriveImage returns
 VA_STATUS_ERROR_OPERATION_FAILED
Date: Tue, 10 Sep 2019 05:07:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: reject5514@naver.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-111622-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1537768457=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1537768457==
Content-Type: multipart/alternative; boundary="15680920300.F4BbF.27327"
Content-Transfer-Encoding: 7bit


--15680920300.F4BbF.27327
Date: Tue, 10 Sep 2019 05:07:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111622

            Bug ID: 111622
           Summary: VAAPI vaDeriveImage returns
                    VA_STATUS_ERROR_OPERATION_FAILED
           Product: Mesa
           Version: 19.1
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: reject5514@naver.com
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 145311
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145311&action=3Dedit
Sample C code to reproduce error

Operating System: archlinux 5.2.13-arch1-1-ARCH
GPU: Radeon RX 570
Mesa version: 19.1.6
Libva version: 2.5.0

vaDeriveImage() VAAPI returns VA_STATUS_ERROR_OPERATION_FAILED when
radeonsi_drv_video.so used as driver. It runs successfully with
i965_drv_video.so on intel integrated GPU.

https://bugs.freedesktop.org/show_bug.cgi?id=3D110850 related to this.

I found by debugging that error return occurs in the vlVaDeriveImage functi=
on.
//vlVaDeriveImage function is in src/gallium/state_trackers/va/image.c
if (surf->buffer->interlaced)
     return VA_STATUS_ERROR_OPERATION_FAILED;

Is there a problem with interlaced video in Mesa? I don't know much about
computer graphics and how Mesa works, but Intel driver has no problem about=
 it,
so I think it's a bug.

Sample C code attached to reproduce error. This code was written by referri=
ng
to the VLC's VAAPI source code. Compile command: gcc -o va va.c -lX11 -lva
-lva-x11 -g

Result on Radeon GPU system:
libva info: VA-API version 1.5.0
libva info: va_getDriverName() returns 0
libva info: Trying to open /usr/lib/dri/radeonsi_drv_video.so
libva info: Found init function __vaDriverInit_1_5
libva info: va_openDriver() returns 0
vendor string : Mesa Gallium driver 19.1.6 for Radeon RX 570 Series (POLARI=
S10,
DRM 3.32.0, 5.2.13-arch1-1-ARCH, LLVM 8.0.1)
vaDeriveImage error : operation failed

Result on Intel GPU system:
libva info: VA-API version 1.5.0
libva info: va_getDriverName() returns 0
libva info: Trying to open /usr/lib/dri/i965_drv_video.so
libva info: Found init function __vaDriverInit_1_3
libva info: va_openDriver() returns 0
vendor string : Intel i965 driver for Intel(R) Broadwell - 2.3.0

vaDeriveImage : success (no error)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15680920300.F4BbF.27327
Date: Tue, 10 Sep 2019 05:07:10 +0000
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
   title=3D"NEW - VAAPI vaDeriveImage returns VA_STATUS_ERROR_OPERATION_FAI=
LED"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111622">111622</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>VAAPI vaDeriveImage returns VA_STATUS_ERROR_OPERATION_FAILED
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.1
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
          <td>normal
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
          <td>reject5514&#64;naver.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145311=
" name=3D"attach_145311" title=3D"Sample C code to reproduce error">attachm=
ent 145311</a> <a href=3D"attachment.cgi?id=3D145311&amp;action=3Dedit" tit=
le=3D"Sample C code to reproduce error">[details]</a></span>
Sample C code to reproduce error

Operating System: archlinux 5.2.13-arch1-1-ARCH
GPU: Radeon RX 570
Mesa version: 19.1.6
Libva version: 2.5.0

vaDeriveImage() VAAPI returns VA_STATUS_ERROR_OPERATION_FAILED when
radeonsi_drv_video.so used as driver. It runs successfully with
i965_drv_video.so on intel integrated GPU.

<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Vlc fails to decode video using vaapi"
   href=3D"show_bug.cgi?id=3D110850">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110850</a> related to this.

I found by debugging that error return occurs in the vlVaDeriveImage functi=
on.
//vlVaDeriveImage function is in src/gallium/state_trackers/va/image.c
if (surf-&gt;buffer-&gt;interlaced)
     return VA_STATUS_ERROR_OPERATION_FAILED;

Is there a problem with interlaced video in Mesa? I don't know much about
computer graphics and how Mesa works, but Intel driver has no problem about=
 it,
so I think it's a bug.

Sample C code attached to reproduce error. This code was written by referri=
ng
to the VLC's VAAPI source code. Compile command: gcc -o va va.c -lX11 -lva
-lva-x11 -g

Result on Radeon GPU system:
libva info: VA-API version 1.5.0
libva info: va_getDriverName() returns 0
libva info: Trying to open /usr/lib/dri/radeonsi_drv_video.so
libva info: Found init function __vaDriverInit_1_5
libva info: va_openDriver() returns 0
vendor string : Mesa Gallium driver 19.1.6 for Radeon RX 570 Series (POLARI=
S10,
DRM 3.32.0, 5.2.13-arch1-1-ARCH, LLVM 8.0.1)
vaDeriveImage error : operation failed

Result on Intel GPU system:
libva info: VA-API version 1.5.0
libva info: va_getDriverName() returns 0
libva info: Trying to open /usr/lib/dri/i965_drv_video.so
libva info: Found init function __vaDriverInit_1_3
libva info: va_openDriver() returns 0
vendor string : Intel i965 driver for Intel(R) Broadwell - 2.3.0

vaDeriveImage : success (no error)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15680920300.F4BbF.27327--

--===============1537768457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1537768457==--
