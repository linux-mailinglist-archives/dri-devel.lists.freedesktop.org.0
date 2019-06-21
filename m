Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 329504EF8E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 21:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F726E91D;
	Fri, 21 Jun 2019 19:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB0D26E91D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 19:41:00 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A835C72167; Fri, 21 Jun 2019 19:41:00 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110956] List of 19.20-812932 release mistakes
Date: Fri, 21 Jun 2019 19:41:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ashark@linuxcomp.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110956-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0082890773=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0082890773==
Content-Type: multipart/alternative; boundary="15611460601.F9f27.30022"
Content-Transfer-Encoding: 7bit


--15611460601.F9f27.30022
Date: Fri, 21 Jun 2019 19:41:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110956

            Bug ID: 110956
           Summary: List of 19.20-812932 release mistakes
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu-pro
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: ashark@linuxcomp.ru

I was repacking amdgpu-pro (ubuntu archive) for Arch linux, and while doing
this, I have noticed many probable mistakes. Here is my list.

- wsa-amdgpu package has empty copyright file
- Release page says that it supports ubuntu x86_64, but actually it can be
installed on ubuntu x86. Is this an error?
- In clinfo package description Homepage link is broken (404 page)
- In alternative dependencies there are such occurances: libva1-amdgpu,
libva2-amdgpu, libvdpau-1-amdgpu. But these are not provided neither by ubu=
ntu
repos, nor in bundled archive. So is it an error?
- Provided libdrm packages have MIT licence. But are they built completely =
from
open source? In the changelog I can see that it is some
amd-mainline-hybrid-master20190125. And actually if I omit these packages, =
then
proprietay libgl driver and clinfo utility crashes. I want to avoid needing=
 of
installation of these libdrm packages (libdrm-amdgpu-amdgpu1,
libdrm-amdgpu-common, libdrm2-amdgpu). Is that possible?
- amdgpu-pro(-hwe) and amdgpu-pro-lib32 depend on amdgpu(-hwe), but actually
they should depend on amdgpu-lib(-hwe) (just like open variant packages).
Because of that even when running installer with --no-dkms, it still is in
packages list (because amdgpu(-hwe) depends on it). Is it intensional ar ju=
st a
mistake?
- In libgl1-amdgpu-mesa-dri in postinst script in Support I+A hybrid graphi=
cs
there is such condition:
if [ -f ... ] && [ "str1" !=3D "str2" ]; then
You just compare two different strings? I guess you wanted to compare folder
contents. But now that condition will always be false.
in if [ "${f%%/*}"... there is extra percent symbol, you should remove it. =
Btw,
in rpm variants scriptlets, it is already fixed.
- In the documentation at readthedocs there is missing information about Op=
en
Vulkan component
- There is actually no PX package in bundled archive, so maybe remove it
completely from installer script and from the documentation?
- Release page says that you need to install lunar_sdk for vulkan to work. =
Is
it really true? And even then, it says that you need version 1.1.106.0, but=
 in
vulkan-amdgpu-pro inside json file we have 1.1.108. The documentation is
outdated?
- roct-amdgpu-pro and roct-amdgpu-pro-dev have MIT licence. Are they actual=
ly
open souce components? If yes, then why do they called with -pro suffix?
- Can you remove hardcoded declining of installation on unsupported ubuntu
release? Just leave a warning (as you let it for non-ubuntu systems), but l=
et
the users to decide. Otherwise, they need to edit release version or modify
debian packages internals (I even did a special script for this and publish=
ed
in this bugtracking system).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15611460601.F9f27.30022
Date: Fri, 21 Jun 2019 19:41:00 +0000
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
   title=3D"NEW - List of 19.20-812932 release mistakes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110956">110956</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>List of 19.20-812932 release mistakes
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu-pro
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ashark&#64;linuxcomp.ru
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I was repacking amdgpu-pro (ubuntu archive) for Arch linux, an=
d while doing
this, I have noticed many probable mistakes. Here is my list.

- wsa-amdgpu package has empty copyright file
- Release page says that it supports ubuntu x86_64, but actually it can be
installed on ubuntu x86. Is this an error?
- In clinfo package description Homepage link is broken (404 page)
- In alternative dependencies there are such occurances: libva1-amdgpu,
libva2-amdgpu, libvdpau-1-amdgpu. But these are not provided neither by ubu=
ntu
repos, nor in bundled archive. So is it an error?
- Provided libdrm packages have MIT licence. But are they built completely =
from
open source? In the changelog I can see that it is some
amd-mainline-hybrid-master20190125. And actually if I omit these packages, =
then
proprietay libgl driver and clinfo utility crashes. I want to avoid needing=
 of
installation of these libdrm packages (libdrm-amdgpu-amdgpu1,
libdrm-amdgpu-common, libdrm2-amdgpu). Is that possible?
- amdgpu-pro(-hwe) and amdgpu-pro-lib32 depend on amdgpu(-hwe), but actually
they should depend on amdgpu-lib(-hwe) (just like open variant packages).
Because of that even when running installer with --no-dkms, it still is in
packages list (because amdgpu(-hwe) depends on it). Is it intensional ar ju=
st a
mistake?
- In libgl1-amdgpu-mesa-dri in postinst script in Support I+A hybrid graphi=
cs
there is such condition:
if [ -f ... ] &amp;&amp; [ &quot;str1&quot; !=3D &quot;str2&quot; ]; then
You just compare two different strings? I guess you wanted to compare folder
contents. But now that condition will always be false.
in if [ &quot;${f%%/*}&quot;... there is extra percent symbol, you should r=
emove it. Btw,
in rpm variants scriptlets, it is already fixed.
- In the documentation at readthedocs there is missing information about Op=
en
Vulkan component
- There is actually no PX package in bundled archive, so maybe remove it
completely from installer script and from the documentation?
- Release page says that you need to install lunar_sdk for vulkan to work. =
Is
it really true? And even then, it says that you need version 1.1.106.0, but=
 in
vulkan-amdgpu-pro inside json file we have 1.1.108. The documentation is
outdated?
- roct-amdgpu-pro and roct-amdgpu-pro-dev have MIT licence. Are they actual=
ly
open souce components? If yes, then why do they called with -pro suffix?
- Can you remove hardcoded declining of installation on unsupported ubuntu
release? Just leave a warning (as you let it for non-ubuntu systems), but l=
et
the users to decide. Otherwise, they need to edit release version or modify
debian packages internals (I even did a special script for this and publish=
ed
in this bugtracking system).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15611460601.F9f27.30022--

--===============0082890773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0082890773==--
