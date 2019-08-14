Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072698DDA0
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 21:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74656E816;
	Wed, 14 Aug 2019 19:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E3AC6E816
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 19:04:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9AC857215A; Wed, 14 Aug 2019 19:04:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111402] amdgpu-pro-install fails to install on openSUSE Leap
 15.1 due to insufficient checks of $ID [PATCH included]
Date: Wed, 14 Aug 2019 19:04:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: public_timo.s@silentcreek.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111402-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0750659450=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0750659450==
Content-Type: multipart/alternative; boundary="15658094611.7ea2.9913"
Content-Transfer-Encoding: 7bit


--15658094611.7ea2.9913
Date: Wed, 14 Aug 2019 19:04:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111402

            Bug ID: 111402
           Summary: amdgpu-pro-install fails to install on openSUSE Leap
                    15.1 due to insufficient checks of $ID [PATCH
                    included]
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu-pro
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: public_timo.s@silentcreek.de

Created attachment 145064
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145064&action=3Dedit
Simple fix that allows installing on openSUSE Leap 15.1

Hi,

I downloaded the latest amdgpu-pro-19.30-844693-sle-15.tar.xz package from
amd.com and tried to install it on openSUSE Leap 15.1 following the docs [1=
].

The command
  $ ./amdgpu-pro-install --opencl=3Dlegacy --headless
failed with the following error:
  tee: /etc/yum.repos.d/amdgpu-pro-local.repo: No such file or directory

So, the installer seems to mistake my system for a RHEL/CentOS-based OS.

Looking at the code, I noticed the script gets the $ID from /etc/os-release
which in my case looks like this:
NAME=3D"openSUSE Leap"
VERSION=3D"15.1 "
ID=3D"opensuse-leap"
[...]

The function yum_repo() in the script does not properly check the $ID, howe=
ver.
It only matches against the strings 'sles', 'sled' and 'opensuse', but not
'opensuse-leap'. This is contrary to the function os_release() which matches
opensuse-leap as well (with a wildcard).

So, the solution to the issue is a simple wildcard. I'm attaching a patch t=
hat
allowed me to run the installer on openSUSE Leap 15.1.

Regards,

Timo


[1] https://amdgpu-install.readthedocs.io/en/latest/install-installing.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15658094611.7ea2.9913
Date: Wed, 14 Aug 2019 19:04:21 +0000
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
   title=3D"NEW - amdgpu-pro-install fails to install on openSUSE Leap 15.1=
 due to insufficient checks of $ID [PATCH included]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111402">111402</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>amdgpu-pro-install fails to install on openSUSE Leap 15.1 due=
 to insufficient checks of $ID [PATCH included]
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
          <td>public_timo.s&#64;silentcreek.de
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145064=
" name=3D"attach_145064" title=3D"Simple fix that allows installing on open=
SUSE Leap 15.1">attachment 145064</a> <a href=3D"attachment.cgi?id=3D145064=
&amp;action=3Dedit" title=3D"Simple fix that allows installing on openSUSE =
Leap 15.1">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;=
bug=3D111402&amp;attachment=3D145064'>[review]</a>
Simple fix that allows installing on openSUSE Leap 15.1

Hi,

I downloaded the latest amdgpu-pro-19.30-844693-sle-15.tar.xz package from
amd.com and tried to install it on openSUSE Leap 15.1 following the docs [1=
].

The command
  $ ./amdgpu-pro-install --opencl=3Dlegacy --headless
failed with the following error:
  tee: /etc/yum.repos.d/amdgpu-pro-local.repo: No such file or directory

So, the installer seems to mistake my system for a RHEL/CentOS-based OS.

Looking at the code, I noticed the script gets the $ID from /etc/os-release
which in my case looks like this:
NAME=3D&quot;openSUSE Leap&quot;
VERSION=3D&quot;15.1 &quot;
ID=3D&quot;opensuse-leap&quot;
[...]

The function yum_repo() in the script does not properly check the $ID, howe=
ver.
It only matches against the strings 'sles', 'sled' and 'opensuse', but not
'opensuse-leap'. This is contrary to the function os_release() which matches
opensuse-leap as well (with a wildcard).

So, the solution to the issue is a simple wildcard. I'm attaching a patch t=
hat
allowed me to run the installer on openSUSE Leap 15.1.

Regards,

Timo


[1] <a href=3D"https://amdgpu-install.readthedocs.io/en/latest/install-inst=
alling.html">https://amdgpu-install.readthedocs.io/en/latest/install-instal=
ling.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15658094611.7ea2.9913--

--===============0750659450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0750659450==--
