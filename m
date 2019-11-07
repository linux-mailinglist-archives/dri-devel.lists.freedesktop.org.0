Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E13F309D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 14:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C77C6F6A9;
	Thu,  7 Nov 2019 13:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 168CE6F6A6
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 13:53:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 134B7720E2; Thu,  7 Nov 2019 13:53:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112226] [HadesCanyon] GPU hangs don't anymore recover (although
 kernel still claims that they do)
Date: Thu, 07 Nov 2019 13:53:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: eero.t.tamminen@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-112226-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1608487009=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1608487009==
Content-Type: multipart/alternative; boundary="15731347990.f6fF7A6.2411"
Content-Transfer-Encoding: 7bit


--15731347990.f6fF7A6.2411
Date: Thu, 7 Nov 2019 13:53:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112226

            Bug ID: 112226
           Summary: [HadesCanyon] GPU hangs don't anymore recover
                    (although kernel still claims that they do)
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: eero.t.tamminen@intel.com

Setup:
* HW: KBL HadesCanyon (i7-8809G with Radeon RX Vega M GH)
* OS: Ubuntu 18.04 with Unity desktop (compiz)
* SW: Git builds of drm-tip kernel, Mesa and X server

Issue:
* AMD GPU driver stopped recovering from bug 108898 KBL HadesCanyon GPU han=
gs.

It still claims to recover from the bug:
-------------------------------------------------------
[ 1057.512690] Iteration 2/3: bin/testfw_app --gfx glfw --gl_api desktop_co=
re
--width 1920 --height 1080 --fullscreen 1 --test_id gl_manhattan
[ 1119.867403] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!
[ 1124.987449] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
-------------------------------------------------------
But now all 3D tests run after this error will fail.

This started to happen between following (drm-tip) kernel commits:
* 2019-10-28 16:01:46: 912b87256c: drm-tip: 2019y-10m-28d-16h-00m-10s UTC
integration manifest
* 2019-10-29 17:58:05: a2c9f8ce2a: drm-tip: 2019y-10m-29d-17h-57m-39s UTC
integration manifest

And following Mesa commits:
* 2019-10-28 17:47:06: d298740a1c: iris: Disallow incomplete resource creat=
ion
* 2019-10-29 16:19:34: ff6e148a3d: freedreno/a6xx: add a618 support


Note:
* I'm not seeing the same issue by using few months old Mesa with latest
drm-tip kernel, so some change in Mesa triggers this kernel issue
* If latest Mesa is used with drm-tip kernel 5.3, 4/5 times X fails to star=
t.=20
This started to happen with Mesa version within couple of days of the GPU h=
ang
recovery issue, so potentially there are more issue in Mesa (HadesCanyon) A=
MD
support

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15731347990.f6fF7A6.2411
Date: Thu, 7 Nov 2019 13:53:19 +0000
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
   title=3D"NEW - [HadesCanyon] GPU hangs don't anymore recover (although k=
ernel still claims that they do)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112226">112226</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[HadesCanyon] GPU hangs don't anymore recover (although kerne=
l still claims that they do)
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
          <td>critical
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
          <td>eero.t.tamminen&#64;intel.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Setup:
* HW: KBL HadesCanyon (i7-8809G with Radeon RX Vega M GH)
* OS: Ubuntu 18.04 with Unity desktop (compiz)
* SW: Git builds of drm-tip kernel, Mesa and X server

Issue:
* AMD GPU driver stopped recovering from <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED MOVED - (Recoverable) GPU hangs with GfxBench Manhatta=
n GL tests"
   href=3D"show_bug.cgi?id=3D108898">bug 108898</a> KBL HadesCanyon GPU han=
gs.

It still claims to recover from the bug:
-------------------------------------------------------
[ 1057.512690] Iteration 2/3: bin/testfw_app --gfx glfw --gl_api desktop_co=
re
--width 1920 --height 1080 --fullscreen 1 --test_id gl_manhattan
[ 1119.867403] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!
[ 1124.987449] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
-------------------------------------------------------
But now all 3D tests run after this error will fail.

This started to happen between following (drm-tip) kernel commits:
* 2019-10-28 16:01:46: 912b87256c: drm-tip: 2019y-10m-28d-16h-00m-10s UTC
integration manifest
* 2019-10-29 17:58:05: a2c9f8ce2a: drm-tip: 2019y-10m-29d-17h-57m-39s UTC
integration manifest

And following Mesa commits:
* 2019-10-28 17:47:06: d298740a1c: iris: Disallow incomplete resource creat=
ion
* 2019-10-29 16:19:34: ff6e148a3d: freedreno/a6xx: add a618 support


Note:
* I'm not seeing the same issue by using few months old Mesa with latest
drm-tip kernel, so some change in Mesa triggers this kernel issue
* If latest Mesa is used with drm-tip kernel 5.3, 4/5 times X fails to star=
t.=20
This started to happen with Mesa version within couple of days of the GPU h=
ang
recovery issue, so potentially there are more issue in Mesa (HadesCanyon) A=
MD
support</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15731347990.f6fF7A6.2411--

--===============1608487009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1608487009==--
