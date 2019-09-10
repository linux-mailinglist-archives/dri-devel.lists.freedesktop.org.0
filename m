Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ADAAF274
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 23:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08C46E9A6;
	Tue, 10 Sep 2019 21:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 20D346E9B1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 21:02:45 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1D88072167; Tue, 10 Sep 2019 21:02:45 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Tue, 10 Sep 2019 21:02:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: mail@bastimeyer.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111481-502-krSuiDrtxf@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0757206598=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0757206598==
Content-Type: multipart/alternative; boundary="15681493651.3A67Fb3Cf.6020"
Content-Transfer-Encoding: 7bit


--15681493651.3A67Fb3Cf.6020
Date: Tue, 10 Sep 2019 21:02:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #36 from Sebastian Meyer <mail@bastimeyer.de> ---
Created attachment 145326
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145326&action=3Dedit
umr output of sdma0/sdma1 after RotTR freeze

Applied the provided WIP patch to linux-mainline 5.3-rc8 and started RotTR
again in order to trigger a system freeze.
This time I also got a ring sdma0 and sdma1 timeout:

[  632.175837] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[  632.175973] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[  637.299049] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=3D313757, emitted seq=3D313759
[  637.299110] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process RiseOfTheTombRa pid 2584 thread RiseOfTheT:cs0 pid 2590
[  637.299111] [drm] GPU recovery disabled.
[  646.468871] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeou=
t,
signaled seq=3D278259, emitted seq=3D278263
[  646.468961] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 timeou=
t,
signaled seq=3D21116, emitted seq=3D21119
[  646.469052] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[  646.469141] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process plasmashell pid 989 thread plasmashel:cs0 pid 1155
[  646.469141] [drm] GPU recovery disabled.
[  646.469142] [drm] GPU recovery disabled.

Stdout of `umr -R sdma0` and `umr -R sdma1` is attached to this post, howev=
er,
I also got a couple of stderr messages like "[ERROR]: No valid mapping for
3@800000023f00" which I didn't include in the output.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15681493651.3A67Fb3Cf.6020
Date: Tue, 10 Sep 2019 21:02:45 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c36">Comme=
nt # 36</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mail&#64;bastimeyer.de" title=3D"Sebastian Meyer &lt;mail&#64;bastimeyer.de=
&gt;"> <span class=3D"fn">Sebastian Meyer</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145326=
" name=3D"attach_145326" title=3D"umr output of sdma0/sdma1 after RotTR fre=
eze">attachment 145326</a> <a href=3D"attachment.cgi?id=3D145326&amp;action=
=3Dedit" title=3D"umr output of sdma0/sdma1 after RotTR freeze">[details]</=
a></span>
umr output of sdma0/sdma1 after RotTR freeze

Applied the provided WIP patch to linux-mainline 5.3-rc8 and started RotTR
again in order to trigger a system freeze.
This time I also got a ring sdma0 and sdma1 timeout:

[  632.175837] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[  632.175973] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[  637.299049] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=3D313757, emitted seq=3D313759
[  637.299110] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process RiseOfTheTombRa pid 2584 thread RiseOfTheT:cs0 pid 2590
[  637.299111] [drm] GPU recovery disabled.
[  646.468871] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeou=
t,
signaled seq=3D278259, emitted seq=3D278263
[  646.468961] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 timeou=
t,
signaled seq=3D21116, emitted seq=3D21119
[  646.469052] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[  646.469141] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process plasmashell pid 989 thread plasmashel:cs0 pid 1155
[  646.469141] [drm] GPU recovery disabled.
[  646.469142] [drm] GPU recovery disabled.

Stdout of `umr -R sdma0` and `umr -R sdma1` is attached to this post, howev=
er,
I also got a couple of stderr messages like &quot;[ERROR]: No valid mapping=
 for
3&#64;800000023f00&quot; which I didn't include in the output.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15681493651.3A67Fb3Cf.6020--

--===============0757206598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0757206598==--
