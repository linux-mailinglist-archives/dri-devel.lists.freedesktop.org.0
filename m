Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C06C7FEBCE
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 12:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EB76E0AF;
	Sat, 16 Nov 2019 11:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7DD076E0AF
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2019 11:26:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7892F720E2; Sat, 16 Nov 2019 11:26:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112302] [kernel 5.4-rc7][amdgpu] kmemleak reports various leaks
Date: Sat, 16 Nov 2019 11:26:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-112302-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0268063225=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0268063225==
Content-Type: multipart/alternative; boundary="15739036171.eFDacAcEe.26428"
Content-Transfer-Encoding: 7bit


--15739036171.eFDacAcEe.26428
Date: Sat, 16 Nov 2019 11:26:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112302

            Bug ID: 112302
           Summary: [kernel 5.4-rc7][amdgpu] kmemleak reports various
                    leaks
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: All
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: erhard_f@mailbox.org

Created attachment 145972
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145972&action=3Dedit
cat /sys/kernel/debug/kmemleak

[ 1306.389652] kmemleak: 28 new suspected memory leaks (see
/sys/kernel/debug/kmemleak)

Running X I get various kmemleak dumps for amdgpu:
[...]
unreferenced object 0xffffa2501f3374c0 (size 208):
  comm "Xorg", pid 694, jiffies 4294885609 (age 1870.427s)
  hex dump (first 32 bytes):
    50 75 33 1f 50 a2 ff ff a0 41 47 c0 ff ff ff ff  Pu3.P....AG.....
    b6 d7 06 a0 06 00 00 00 48 fe aa 8c b5 b1 ff ff  ........H.......
  backtrace:
    [<00000000502b8475>] drm_sched_fence_create+0x1d/0xc0 [gpu_sched]
    [<0000000067f89939>] drm_sched_job_init+0x5b/0xa0 [gpu_sched]
    [<0000000097e803db>] amdgpu_job_submit+0x1e/0x90 [amdgpu]
    [<000000008af66624>] amdgpu_copy_buffer+0x1ab/0x290 [amdgpu]
    [<000000005723dc17>] amdgpu_ttm_copy_mem_to_mem+0x25b/0x540 [amdgpu]
    [<000000009372cf45>] amdgpu_move_blit.constprop.0+0x85/0x1b0 [amdgpu]
    [<00000000b09834ab>] amdgpu_bo_move+0x168/0x2b0 [amdgpu]
    [<000000009f1ae718>] ttm_bo_handle_move_mem+0x126/0x5c0 [ttm]
    [<00000000d0c0e30f>] ttm_bo_validate+0x174/0x1b0 [ttm]
    [<00000000812e63d8>] amdgpu_bo_fault_reserve_notify+0xe2/0x130 [amdgpu]
    [<00000000340ebb51>] ttm_bo_vm_fault+0xa7/0x650 [ttm]
    [<00000000a9630d5e>] __do_fault+0x31/0xf0
    [<000000008cecfe93>] __handle_mm_fault+0xccc/0x1390
    [<00000000984b2f55>] handle_mm_fault+0x15b/0x2f0
    [<0000000053ca6a37>] __do_page_fault+0x1a2/0x420
    [<00000000c546a67a>] page_fault+0x31/0x40
unreferenced object 0xffffa24c4471b040 (size 72):
  comm "sdma0", pid 402, jiffies 4294885609 (age 1870.427s)
  hex dump (first 32 bytes):
    a0 c7 36 59 4c a2 ff ff e0 95 fd c0 ff ff ff ff  ..6YL...........
    a4 2b 08 a0 06 00 00 00 58 e4 2a 61 50 a2 ff ff  .+......X.*aP...
  backtrace:
    [<0000000078aa5208>] amdgpu_fence_emit+0x2b/0x270 [amdgpu]
    [<00000000a223cd76>] amdgpu_ib_schedule+0x311/0x540 [amdgpu]
    [<000000004db3d964>] amdgpu_job_run+0xfc/0x1e0 [amdgpu]
    [<00000000bfb92cc3>] drm_sched_main+0xf7/0x2e0 [gpu_sched]
    [<00000000a857f89f>] kthread+0xf6/0x130
    [<0000000046d81882>] ret_from_fork+0x27/0x50
[...]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15739036171.eFDacAcEe.26428
Date: Sat, 16 Nov 2019 11:26:57 +0000
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
   title=3D"NEW - [kernel 5.4-rc7][amdgpu] kmemleak reports various leaks"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112302">112302</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[kernel 5.4-rc7][amdgpu] kmemleak reports various leaks
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
          <td>All
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
          <td>erhard_f&#64;mailbox.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145972=
" name=3D"attach_145972" title=3D"cat /sys/kernel/debug/kmemleak">attachmen=
t 145972</a> <a href=3D"attachment.cgi?id=3D145972&amp;action=3Dedit" title=
=3D"cat /sys/kernel/debug/kmemleak">[details]</a></span>
cat /sys/kernel/debug/kmemleak

[ 1306.389652] kmemleak: 28 new suspected memory leaks (see
/sys/kernel/debug/kmemleak)

Running X I get various kmemleak dumps for amdgpu:
[...]
unreferenced object 0xffffa2501f3374c0 (size 208):
  comm &quot;Xorg&quot;, pid 694, jiffies 4294885609 (age 1870.427s)
  hex dump (first 32 bytes):
    50 75 33 1f 50 a2 ff ff a0 41 47 c0 ff ff ff ff  Pu3.P....AG.....
    b6 d7 06 a0 06 00 00 00 48 fe aa 8c b5 b1 ff ff  ........H.......
  backtrace:
    [&lt;00000000502b8475&gt;] drm_sched_fence_create+0x1d/0xc0 [gpu_sched]
    [&lt;0000000067f89939&gt;] drm_sched_job_init+0x5b/0xa0 [gpu_sched]
    [&lt;0000000097e803db&gt;] amdgpu_job_submit+0x1e/0x90 [amdgpu]
    [&lt;000000008af66624&gt;] amdgpu_copy_buffer+0x1ab/0x290 [amdgpu]
    [&lt;000000005723dc17&gt;] amdgpu_ttm_copy_mem_to_mem+0x25b/0x540 [amdg=
pu]
    [&lt;000000009372cf45&gt;] amdgpu_move_blit.constprop.0+0x85/0x1b0 [amd=
gpu]
    [&lt;00000000b09834ab&gt;] amdgpu_bo_move+0x168/0x2b0 [amdgpu]
    [&lt;000000009f1ae718&gt;] ttm_bo_handle_move_mem+0x126/0x5c0 [ttm]
    [&lt;00000000d0c0e30f&gt;] ttm_bo_validate+0x174/0x1b0 [ttm]
    [&lt;00000000812e63d8&gt;] amdgpu_bo_fault_reserve_notify+0xe2/0x130 [a=
mdgpu]
    [&lt;00000000340ebb51&gt;] ttm_bo_vm_fault+0xa7/0x650 [ttm]
    [&lt;00000000a9630d5e&gt;] __do_fault+0x31/0xf0
    [&lt;000000008cecfe93&gt;] __handle_mm_fault+0xccc/0x1390
    [&lt;00000000984b2f55&gt;] handle_mm_fault+0x15b/0x2f0
    [&lt;0000000053ca6a37&gt;] __do_page_fault+0x1a2/0x420
    [&lt;00000000c546a67a&gt;] page_fault+0x31/0x40
unreferenced object 0xffffa24c4471b040 (size 72):
  comm &quot;sdma0&quot;, pid 402, jiffies 4294885609 (age 1870.427s)
  hex dump (first 32 bytes):
    a0 c7 36 59 4c a2 ff ff e0 95 fd c0 ff ff ff ff  ..6YL...........
    a4 2b 08 a0 06 00 00 00 58 e4 2a 61 50 a2 ff ff  .+......X.*aP...
  backtrace:
    [&lt;0000000078aa5208&gt;] amdgpu_fence_emit+0x2b/0x270 [amdgpu]
    [&lt;00000000a223cd76&gt;] amdgpu_ib_schedule+0x311/0x540 [amdgpu]
    [&lt;000000004db3d964&gt;] amdgpu_job_run+0xfc/0x1e0 [amdgpu]
    [&lt;00000000bfb92cc3&gt;] drm_sched_main+0xf7/0x2e0 [gpu_sched]
    [&lt;00000000a857f89f&gt;] kthread+0xf6/0x130
    [&lt;0000000046d81882&gt;] ret_from_fork+0x27/0x50
[...]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15739036171.eFDacAcEe.26428--

--===============0268063225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0268063225==--
