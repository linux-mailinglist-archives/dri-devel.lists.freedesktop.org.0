Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D5BA4861
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 10:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CB16E1BB;
	Sun,  1 Sep 2019 08:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id F20B76E1BB
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 08:08:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EB02F721AA; Sun,  1 Sep 2019 08:08:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111528] Using Fan-Control causes mmhub-pagefault and
 unresponsive system on Navi
Date: Sun, 01 Sep 2019 08:08:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: saldorin@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111528-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0679960578=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0679960578==
Content-Type: multipart/alternative; boundary="15673253301.703463c.5694"
Content-Transfer-Encoding: 7bit


--15673253301.703463c.5694
Date: Sun, 1 Sep 2019 08:08:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111528

            Bug ID: 111528
           Summary: Using Fan-Control causes mmhub-pagefault and
                    unresponsive system on Navi
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: saldorin@web.de

I first thought my issue was related to
https://bugs.freedesktop.org/show_bug.cgi?id=3D111481 , but it seems it is a
different one.

When using any kind of fan-control software (i tried corectrl and
radeon-profile), after a while i get a strange "stutterting", as if the who=
le
OS halted for a few seconds, then continued for a few seconds...and the hal=
ted
times grew while the "usable seconds" got shorter quickly to the point of a
seemingly unresponsive system.
It's not just the GUI that is halted, but the whole system - i had rsync
running one time and the HDD is audible enough to hear that it was only act=
ive
during the seconds the GUI was responsive.

It doesn't happen regularly (seems like anything between 30min and 120min) =
and
i haven't yet made out a direct cause, but in journalctl, it seems the same
messages appear every time when it begins:

kernel: amdgpu: [powerplay] Failed to send message 0xf, response 0xfffffffb,
param 0xfd6000
kernel: amdgpu: [powerplay] Failed to send message 0xf, response 0xfffffffb,
param 0xfd6000
 kernel: amdgpu 0000:0f:00.0: [mmhub] VMC page fault (src_id:0 ring:169 vmi=
d:0
pasid:0)
 kernel: amdgpu 0000:0f:00.0:   at page 0x0000600000fd6000 from 18
 kernel: amdgpu 0000:0f:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00041152

after that there are a lot of these:

kernel: amdgpu: [powerplay] Failed to send message 0x40, response 0xffffffc2
param 0x2
kernel: amdgpu: [powerplay] Failed to send message 0xe, response 0xffffffc2,
param 0x80

with some other amdgpu-errors sprinkled in until shutdown/hardreset.

It doesn't occur without a fan-control software, so i'm pretty certain it is
somehow related to that.

System:=20
Powercolor 5700xt Red Devil
3800x on X570 Taichi
Manjaro KDE
Manjaro 5.3rc6.d0826.ga55aa89-1
mesa-git 1:19.3.0_devel.114849.0142dcb990e-1
llvm-libs-git 10.0.0_r325376.70e158e09e9-1
And if it matters: firmware from
https://aur.archlinux.org/packages/linux-firmware-agd5f-radeon-navi10/
v2019.08.26.14.36-1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15673253301.703463c.5694
Date: Sun, 1 Sep 2019 08:08:50 +0000
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
   title=3D"NEW - Using Fan-Control causes mmhub-pagefault and unresponsive=
 system on Navi"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111528">111528</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Using Fan-Control causes mmhub-pagefault and unresponsive sys=
tem on Navi
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
          <td>saldorin&#64;web.de
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I first thought my issue was related to
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"show_bug.cgi?id=3D111481">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111481</a> , but it seems it is a
different one.

When using any kind of fan-control software (i tried corectrl and
radeon-profile), after a while i get a strange &quot;stutterting&quot;, as =
if the whole
OS halted for a few seconds, then continued for a few seconds...and the hal=
ted
times grew while the &quot;usable seconds&quot; got shorter quickly to the =
point of a
seemingly unresponsive system.
It's not just the GUI that is halted, but the whole system - i had rsync
running one time and the HDD is audible enough to hear that it was only act=
ive
during the seconds the GUI was responsive.

It doesn't happen regularly (seems like anything between 30min and 120min) =
and
i haven't yet made out a direct cause, but in journalctl, it seems the same
messages appear every time when it begins:

kernel: amdgpu: [powerplay] Failed to send message 0xf, response 0xfffffffb,
param 0xfd6000
kernel: amdgpu: [powerplay] Failed to send message 0xf, response 0xfffffffb,
param 0xfd6000
 kernel: amdgpu 0000:0f:00.0: [mmhub] VMC page fault (src_id:0 ring:169 vmi=
d:0
pasid:0)
 kernel: amdgpu 0000:0f:00.0:   at page 0x0000600000fd6000 from 18
 kernel: amdgpu 0000:0f:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00041152

after that there are a lot of these:

kernel: amdgpu: [powerplay] Failed to send message 0x40, response 0xffffffc2
param 0x2
kernel: amdgpu: [powerplay] Failed to send message 0xe, response 0xffffffc2,
param 0x80

with some other amdgpu-errors sprinkled in until shutdown/hardreset.

It doesn't occur without a fan-control software, so i'm pretty certain it is
somehow related to that.

System:=20
Powercolor 5700xt Red Devil
3800x on X570 Taichi
Manjaro KDE
Manjaro 5.3rc6.d0826.ga55aa89-1
mesa-git 1:19.3.0_devel.114849.0142dcb990e-1
llvm-libs-git 10.0.0_r325376.70e158e09e9-1
And if it matters: firmware from
<a href=3D"https://aur.archlinux.org/packages/linux-firmware-agd5f-radeon-n=
avi10/">https://aur.archlinux.org/packages/linux-firmware-agd5f-radeon-navi=
10/</a>
v2019.08.26.14.36-1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15673253301.703463c.5694--

--===============0679960578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0679960578==--
