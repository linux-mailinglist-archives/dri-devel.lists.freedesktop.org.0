Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BAE6F01F
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 19:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92256E8C4;
	Sat, 20 Jul 2019 17:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D976C6E8C2
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2019 17:05:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D53EB72167; Sat, 20 Jul 2019 17:05:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105251] [Vega10]  GPU lockup on boot: VMC page fault
Date: Sat, 20 Jul 2019 17:05:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: ds2.bugs.freedesktop@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-105251-502-xaroGB7pga@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105251-502@http.bugs.freedesktop.org/>
References: <bug-105251-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0451100203=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0451100203==
Content-Type: multipart/alternative; boundary="15636423433.Ddee754.22076"
Content-Transfer-Encoding: 7bit


--15636423433.Ddee754.22076
Date: Sat, 20 Jul 2019 17:05:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105251

--- Comment #71 from deltasquared <ds2.bugs.freedesktop@gmail.com> ---
I would like to pitch into this as it seems this particular problem has been
plaguing me for some months now. Currently running kernel 5.2.1-arch1-1-ARCH
and I will still occasionally get errors like this when running minetest (t=
hey
seem to be subtly different from the others in this thread upon reading):

[ 5699.136659] amdgpu 0000:0b:00.0: [gfxhub] no-retry page fault (src_id:0
ring:155 vmid:5 pasid:32770, for process minetest pid 7127 thread minetest:=
cs0
pid 7133)
[ 5699.136662] amdgpu 0000:0b:00.0:   in page starting at address
0x000080014034d000 from 27
[ 5699.136664] amdgpu 0000:0b:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00501136
[ 5704.343299] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5709.259775] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D443165, emitted seq=3D443167
[ 5709.259860] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process minetest pid 7127 thread minetest:cs0 pid 7133
[ 5709.259862] [drm] GPU recovery disabled.
*repeat last four lines endlessly...*

Relevant hardware is a ryzen 2200G (vega 8 GPU). The issue has survived
swapping almost every component in my system so I think it is safe to rule =
out
hardware brokenness in my case at least. Mercifully it seems the rest of the
system survives this hence being able to capture the dmesg output, but with=
 the
gpu hard locked obviously the only recourse is to then reboot (after gather=
ing
some output for a while).

I haven't yet been able to obtain an API trace from minetest when it becomes
difficult. Furthermore it doesn't do so reliably - I can often play for hou=
rs,
but then the crash will strike and then the issue can sometimes persist acr=
oss
a few reboots if I press minetest to try and load a world again fast enough.
Heck idk, is it a case of the precise 3D cloud pattern in the menu backgrou=
nd
at the time? Sounds like it would be useful for me to have apitrace running=
 in
the background whenever I run it on the off chance I can catch it in the ac=
t.

zzyxpaw's "vega crasher" in message #52 has reliably been able to cause GPU
lock-up. Same sort of story: black window will pop up, nothing happens, and
either lock-up occurs after a moment, or (interestingly) attempting to move=
 the
window in X11 will cause the lock-up immediately.

If there is any more data (such as attempting to get an apitrace) that woul=
d be
useful I am willing to attempt to gather it, as this issue is the only blem=
ish
on an otherwise perfectly stable system.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15636423433.Ddee754.22076
Date: Sat, 20 Jul 2019 17:05:43 +0000
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
   title=3D"NEW - [Vega10] GPU lockup on boot: VMC page fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105251#c71">Comme=
nt # 71</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Vega10] GPU lockup on boot: VMC page fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105251">bug 10525=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ds2.bugs.freedesktop&#64;gmail.com" title=3D"deltasquared &lt;ds2.bugs.free=
desktop&#64;gmail.com&gt;"> <span class=3D"fn">deltasquared</span></a>
</span></b>
        <pre>I would like to pitch into this as it seems this particular pr=
oblem has been
plaguing me for some months now. Currently running kernel 5.2.1-arch1-1-ARCH
and I will still occasionally get errors like this when running minetest (t=
hey
seem to be subtly different from the others in this thread upon reading):

[ 5699.136659] amdgpu 0000:0b:00.0: [gfxhub] no-retry page fault (src_id:0
ring:155 vmid:5 pasid:32770, for process minetest pid 7127 thread minetest:=
cs0
pid 7133)
[ 5699.136662] amdgpu 0000:0b:00.0:   in page starting at address
0x000080014034d000 from 27
[ 5699.136664] amdgpu 0000:0b:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00501136
[ 5704.343299] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5709.259775] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D443165, emitted seq=3D443167
[ 5709.259860] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process minetest pid 7127 thread minetest:cs0 pid 7133
[ 5709.259862] [drm] GPU recovery disabled.
*repeat last four lines endlessly...*

Relevant hardware is a ryzen 2200G (vega 8 GPU). The issue has survived
swapping almost every component in my system so I think it is safe to rule =
out
hardware brokenness in my case at least. Mercifully it seems the rest of the
system survives this hence being able to capture the dmesg output, but with=
 the
gpu hard locked obviously the only recourse is to then reboot (after gather=
ing
some output for a while).

I haven't yet been able to obtain an API trace from minetest when it becomes
difficult. Furthermore it doesn't do so reliably - I can often play for hou=
rs,
but then the crash will strike and then the issue can sometimes persist acr=
oss
a few reboots if I press minetest to try and load a world again fast enough.
Heck idk, is it a case of the precise 3D cloud pattern in the menu backgrou=
nd
at the time? Sounds like it would be useful for me to have apitrace running=
 in
the background whenever I run it on the off chance I can catch it in the ac=
t.

zzyxpaw's &quot;vega crasher&quot; in message #52 has reliably been able to=
 cause GPU
lock-up. Same sort of story: black window will pop up, nothing happens, and
either lock-up occurs after a moment, or (interestingly) attempting to move=
 the
window in X11 will cause the lock-up immediately.

If there is any more data (such as attempting to get an apitrace) that woul=
d be
useful I am willing to attempt to gather it, as this issue is the only blem=
ish
on an otherwise perfectly stable system.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15636423433.Ddee754.22076--

--===============0451100203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0451100203==--
