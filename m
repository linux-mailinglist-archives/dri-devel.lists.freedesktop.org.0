Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F6010CE9
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 20:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE59B892DB;
	Wed,  1 May 2019 18:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D9D51892DB
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 18:56:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D113B7215A; Wed,  1 May 2019 18:56:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110574] System hang after screen power saving
Date: Wed, 01 May 2019 18:56:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: number048@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-110574-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0970068587=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0970068587==
Content-Type: multipart/alternative; boundary="15567370090.8C788.20681"
Content-Transfer-Encoding: 7bit


--15567370090.8C788.20681
Date: Wed, 1 May 2019 18:56:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110574

            Bug ID: 110574
           Summary: System hang after screen power saving
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: number048@gmail.com

Created attachment 144122
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144122&action=3Dedit
dmesg

After updating to Xubuntu 19.04 I started having problems with the screen s=
aver
feature. After a request for the monitor to go into power saving mode I am
unable to recover the system. When the monitor turns on again I get the last
image shown but I cannot move the cursor, nothing on the screen is moving,
everything is frozen and I cannot use ssh to access the machine.

Later I discovered that I could access the computer using ssh before I let =
the
monitor enter power saving mode and I was then able to save a copy of dmesg.

As soon as the monitor is turned off by the system the crash happens:

[ 2674.166451] general protection fault: 0000 [#1] SMP NOPTI
...
[ 2674.166530] RIP: 0010:dce110_vblank_set+0x4f/0xa0 [amdgpu]

with the last 5 entries of the call trace:

[ 2674.166624]  dal_irq_service_set+0x4c/0x90 [amdgpu]
[ 2674.166687]  dc_interrupt_set+0x24/0x30 [amdgpu]
[ 2674.166753]  dm_enable_vblank+0x2a/0x40 [amdgpu]
[ 2674.166768]  drm_vblank_enable+0xe2/0x130 [drm]
[ 2674.166781]  drm_vblank_get+0x92/0xb0 [drm]

I was using the Oibaf PPA both before and after I updated to Xubuntu 19.04.
I tried to use the kernel v5.1-rc7 from the Ubuntu mainline:
https://kernel.ubuntu.com/~kernel-ppa/mainline/

My linux command line:
GRUB_CMDLINE_LINUX_DEFAULT=3D"quiet splash radeon.cik_support=3D0
amdgpu.cik_support=3D1 amdgpu.dc=3D1"

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15567370090.8C788.20681
Date: Wed, 1 May 2019 18:56:49 +0000
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
   title=3D"NEW - System hang after screen power saving"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110574">110574</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>System hang after screen power saving
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
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
          <td>number048&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144122=
" name=3D"attach_144122" title=3D"dmesg">attachment 144122</a> <a href=3D"a=
ttachment.cgi?id=3D144122&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg

After updating to Xubuntu 19.04 I started having problems with the screen s=
aver
feature. After a request for the monitor to go into power saving mode I am
unable to recover the system. When the monitor turns on again I get the last
image shown but I cannot move the cursor, nothing on the screen is moving,
everything is frozen and I cannot use ssh to access the machine.

Later I discovered that I could access the computer using ssh before I let =
the
monitor enter power saving mode and I was then able to save a copy of dmesg.

As soon as the monitor is turned off by the system the crash happens:

[ 2674.166451] general protection fault: 0000 [#1] SMP NOPTI
...
[ 2674.166530] RIP: 0010:dce110_vblank_set+0x4f/0xa0 [amdgpu]

with the last 5 entries of the call trace:

[ 2674.166624]  dal_irq_service_set+0x4c/0x90 [amdgpu]
[ 2674.166687]  dc_interrupt_set+0x24/0x30 [amdgpu]
[ 2674.166753]  dm_enable_vblank+0x2a/0x40 [amdgpu]
[ 2674.166768]  drm_vblank_enable+0xe2/0x130 [drm]
[ 2674.166781]  drm_vblank_get+0x92/0xb0 [drm]

I was using the Oibaf PPA both before and after I updated to Xubuntu 19.04.
I tried to use the kernel v5.1-rc7 from the Ubuntu mainline:
<a href=3D"https://kernel.ubuntu.com/~kernel-ppa/mainline/">https://kernel.=
ubuntu.com/~kernel-ppa/mainline/</a>

My linux command line:
GRUB_CMDLINE_LINUX_DEFAULT=3D&quot;quiet splash radeon.cik_support=3D0
amdgpu.cik_support=3D1 amdgpu.dc=3D1&quot;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15567370090.8C788.20681--

--===============0970068587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0970068587==--
