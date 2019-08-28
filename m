Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 233369FCE5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F172F898F3;
	Wed, 28 Aug 2019 08:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5DA2F898F3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:26:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5A6F472161; Wed, 28 Aug 2019 08:26:53 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111506] [amdgpu] VRR/Freesync below the range (LFC) flickering
 (5700 XT)
Date: Wed, 28 Aug 2019 08:26:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: asheldon55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111506-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0177898310=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0177898310==
Content-Type: multipart/alternative; boundary="15669808130.37fc07.14271"
Content-Transfer-Encoding: 7bit


--15669808130.37fc07.14271
Date: Wed, 28 Aug 2019 08:26:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111506

            Bug ID: 111506
           Summary: [amdgpu] VRR/Freesync below the range (LFC) flickering
                    (5700 XT)
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: asheldon55@gmail.com

I'm getting heavy flickering when dropping below the minimum refresh rate
(default of 40-92, but I also tested 35-92) with Freesync enabled.

It seems to be LFC related as the higher the minimum, the earlier the
flickering kicks in (so it's not a case of the monitor not being able to ha=
ndle
it at the low end).

I can workaround the problem by changing block of code in freesync.c:

if (in_out_vrr->max_refresh_in_uhz <
            (2 * in_out_vrr->min_refresh_in_uhz))
                in_out_vrr->btr.btr_enabled =3D false;

with:

if (in_out_vrr->max_refresh_in_uhz <
            (3 * in_out_vrr->min_refresh_in_uhz))
                in_out_vrr->btr.btr_enabled =3D false;

effectively forcing LFC to only kick in at ~30fps or lower.=20

It's possibly a regression as I don't remember the issue occurring with Veg=
a or
Polaris and 5.2 kernel. It's also possible that it's the monitor itself at
fault, and maybe LFC wasn't kicking in properly in older kernels/hardware,
effectively hiding the problem. I will try to get around to testing with Ve=
ga
and an older kernel in the future.


System:
MSI 5700 XT
amd-staging-drm-next
Mesa git

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15669808130.37fc07.14271
Date: Wed, 28 Aug 2019 08:26:53 +0000
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
   title=3D"NEW - [amdgpu] VRR/Freesync below the range (LFC) flickering (5=
700 XT)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111506">111506</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[amdgpu] VRR/Freesync below the range (LFC) flickering (5700 =
XT)
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
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>asheldon55&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I'm getting heavy flickering when dropping below the minimum r=
efresh rate
(default of 40-92, but I also tested 35-92) with Freesync enabled.

It seems to be LFC related as the higher the minimum, the earlier the
flickering kicks in (so it's not a case of the monitor not being able to ha=
ndle
it at the low end).

I can workaround the problem by changing block of code in freesync.c:

if (in_out_vrr-&gt;max_refresh_in_uhz &lt;
            (2 * in_out_vrr-&gt;min_refresh_in_uhz))
                in_out_vrr-&gt;btr.btr_enabled =3D false;

with:

if (in_out_vrr-&gt;max_refresh_in_uhz &lt;
            (3 * in_out_vrr-&gt;min_refresh_in_uhz))
                in_out_vrr-&gt;btr.btr_enabled =3D false;

effectively forcing LFC to only kick in at ~30fps or lower.=20

It's possibly a regression as I don't remember the issue occurring with Veg=
a or
Polaris and 5.2 kernel. It's also possible that it's the monitor itself at
fault, and maybe LFC wasn't kicking in properly in older kernels/hardware,
effectively hiding the problem. I will try to get around to testing with Ve=
ga
and an older kernel in the future.


System:
MSI 5700 XT
amd-staging-drm-next
Mesa git</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15669808130.37fc07.14271--

--===============0177898310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0177898310==--
