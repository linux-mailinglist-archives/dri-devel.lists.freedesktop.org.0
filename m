Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 077A9B07A1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2F06EB94;
	Thu, 12 Sep 2019 04:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC6A06E0E2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 23:30:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DE06272167; Wed, 11 Sep 2019 23:30:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111591] [radeonsi/Navi] The Bard's Tale IV causes a GPU hang
Date: Wed, 11 Sep 2019 23:30:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shtetldik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111591-502-jQYVaWKCTY@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111591-502@http.bugs.freedesktop.org/>
References: <bug-111591-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1401418325=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1401418325==
Content-Type: multipart/alternative; boundary="15682446210.8b77dc.1264"
Content-Transfer-Encoding: 7bit


--15682446210.8b77dc.1264
Date: Wed, 11 Sep 2019 23:30:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111591

--- Comment #17 from Shmerl <shtetldik@gmail.com> ---
(In reply to Timothy Arceri from comment #14)
> Are you sure it is hanging? There is a huge amount of stuttering due to t=
he
> game compiling shaders in-game. Its really bad the first time I run the
> apitrace but much better the second time.

It is a hang. Even with allow_glsl_cross_stage_interpolation_mismatch=3Dtru=
e it
gets stuck permanently. I was able to log into the system over ssh when that
happened, and this was shown in dmesg:

[  149.642857] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[  154.762918] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=3D20378, emitted seq=3D20380
[  154.762984] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process BardsTale4-Linu pid 2563 thread BardsTale4:cs0 pid 2597
[  154.762986] [drm] GPU recovery disabled.
[  363.660017] INFO: task BardsTale4-Linu:2563 blocked for more than 120
seconds.
[  363.660021]       Tainted: G            E     5.3.0-rc8+ #14
[  363.660022] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this
message.
[  363.660023] BardsTale4-Linu D    0  2563   2556 0x80004002
[  363.660026] Call Trace:
[  363.660033]  ? __schedule+0x2b9/0x6c0
[  363.660035]  schedule+0x39/0xa0
[  363.660037]  schedule_timeout+0x20f/0x300
[  363.660040]  dma_fence_default_wait+0x1c2/0x2a0
[  363.660042]  ? dma_fence_free+0x20/0x20
[  363.660044]  dma_fence_wait_timeout+0xdd/0xf0
[  363.660106]  gmc_v10_0_flush_gpu_tlb+0x159/0x1a0 [amdgpu]
[  363.660157]  amdgpu_gart_unbind+0x89/0xb0 [amdgpu]
[  363.660206]  amdgpu_ttm_backend_unbind+0x3c/0xe0 [amdgpu]
[  363.660211]  ttm_tt_unbind+0x1d/0x30 [ttm]
[  363.660215]  ttm_tt_destroy.part.0+0xe/0x50 [ttm]
[  363.660219]  ttm_bo_cleanup_memtype_use+0x2e/0x70 [ttm]
[  363.660222]  ttm_bo_put+0x24e/0x2a0 [ttm]
[  363.660269]  amdgpu_bo_unref+0x1a/0x30 [amdgpu]
[  363.660317]  amdgpu_gem_object_free+0x2e/0x50 [amdgpu]
[  363.660328]  drm_gem_object_release_handle+0x5a/0xc0 [drm]
[  363.660339]  ? drm_gem_object_handle_put_unlocked+0x90/0x90 [drm]
[  363.660341]  idr_for_each+0x5e/0xd0
[  363.660344]  ? __inode_wait_for_writeback+0x7e/0xf0
[  363.660354]  drm_gem_release+0x1c/0x30 [drm]
[  363.660363]  drm_file_free.part.0+0x2ab/0x300 [drm]
[  363.660373]  drm_release+0x4b/0x80 [drm]
[  363.660375]  __fput+0xb9/0x250
[  363.660378]  task_work_run+0x8a/0xb0
[  363.660381]  do_exit+0x2f5/0xb60
[  363.660383]  do_group_exit+0x3a/0xa0
[  363.660385]  get_signal+0x15b/0x890
[  363.660387]  do_signal+0x30/0x690
[  363.660390]  ? _copy_from_user+0x37/0x60
[  363.660393]  exit_to_usermode_loop+0x91/0xf0
[  363.660394]  do_syscall_64+0x100/0x110
[  363.660396]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  363.660398] RIP: 0033:0x4540f22
[  363.660403] Code: Bad RIP value.
[  363.660404] RSP: 002b:00007fff54bf6c30 EFLAGS: 00210202
[  363.660406] RAX: 00007fff54bf6c30 RBX: 0000000000000001 RCX:
00000000939f4000
[  363.660406] RDX: 00007fff54bf6c88 RSI: 00007fff54bf6c98 RDI:
00007fff54bf6c80
[  363.660407] RBP: 00007fa81869c430 R08: 000000000000021f R09:
000000000936d890
[  363.660408] R10: 0000000000000001 R11: 0000000000200206 R12:
00007fff54bf6d90
[  363.660408] R13: 0000000000000008 R14: 000000000768bdd8 R15:
00007fff54bf6ce0

May be trace alone isn't enough to reproduce it? Did you try the actual gam=
e?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15682446210.8b77dc.1264
Date: Wed, 11 Sep 2019 23:30:21 +0000
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
   title=3D"NEW - [radeonsi/Navi] The Bard's Tale IV causes a GPU hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111591#c17">Comme=
nt # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [radeonsi/Navi] The Bard's Tale IV causes a GPU hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111591">bug 11159=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
shtetldik&#64;gmail.com" title=3D"Shmerl &lt;shtetldik&#64;gmail.com&gt;"> =
<span class=3D"fn">Shmerl</span></a>
</span></b>
        <pre>(In reply to Timothy Arceri from <a href=3D"show_bug.cgi?id=3D=
111591#c14">comment #14</a>)
<span class=3D"quote">&gt; Are you sure it is hanging? There is a huge amou=
nt of stuttering due to the
&gt; game compiling shaders in-game. Its really bad the first time I run the
&gt; apitrace but much better the second time.</span >

It is a hang. Even with allow_glsl_cross_stage_interpolation_mismatch=3Dtru=
e it
gets stuck permanently. I was able to log into the system over ssh when that
happened, and this was shown in dmesg:

[  149.642857] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[  154.762918] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=3D20378, emitted seq=3D20380
[  154.762984] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process BardsTale4-Linu pid 2563 thread BardsTale4:cs0 pid 2597
[  154.762986] [drm] GPU recovery disabled.
[  363.660017] INFO: task BardsTale4-Linu:2563 blocked for more than 120
seconds.
[  363.660021]       Tainted: G            E     5.3.0-rc8+ #14
[  363.660022] &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&qu=
ot; disables this
message.
[  363.660023] BardsTale4-Linu D    0  2563   2556 0x80004002
[  363.660026] Call Trace:
[  363.660033]  ? __schedule+0x2b9/0x6c0
[  363.660035]  schedule+0x39/0xa0
[  363.660037]  schedule_timeout+0x20f/0x300
[  363.660040]  dma_fence_default_wait+0x1c2/0x2a0
[  363.660042]  ? dma_fence_free+0x20/0x20
[  363.660044]  dma_fence_wait_timeout+0xdd/0xf0
[  363.660106]  gmc_v10_0_flush_gpu_tlb+0x159/0x1a0 [amdgpu]
[  363.660157]  amdgpu_gart_unbind+0x89/0xb0 [amdgpu]
[  363.660206]  amdgpu_ttm_backend_unbind+0x3c/0xe0 [amdgpu]
[  363.660211]  ttm_tt_unbind+0x1d/0x30 [ttm]
[  363.660215]  ttm_tt_destroy.part.0+0xe/0x50 [ttm]
[  363.660219]  ttm_bo_cleanup_memtype_use+0x2e/0x70 [ttm]
[  363.660222]  ttm_bo_put+0x24e/0x2a0 [ttm]
[  363.660269]  amdgpu_bo_unref+0x1a/0x30 [amdgpu]
[  363.660317]  amdgpu_gem_object_free+0x2e/0x50 [amdgpu]
[  363.660328]  drm_gem_object_release_handle+0x5a/0xc0 [drm]
[  363.660339]  ? drm_gem_object_handle_put_unlocked+0x90/0x90 [drm]
[  363.660341]  idr_for_each+0x5e/0xd0
[  363.660344]  ? __inode_wait_for_writeback+0x7e/0xf0
[  363.660354]  drm_gem_release+0x1c/0x30 [drm]
[  363.660363]  drm_file_free.part.0+0x2ab/0x300 [drm]
[  363.660373]  drm_release+0x4b/0x80 [drm]
[  363.660375]  __fput+0xb9/0x250
[  363.660378]  task_work_run+0x8a/0xb0
[  363.660381]  do_exit+0x2f5/0xb60
[  363.660383]  do_group_exit+0x3a/0xa0
[  363.660385]  get_signal+0x15b/0x890
[  363.660387]  do_signal+0x30/0x690
[  363.660390]  ? _copy_from_user+0x37/0x60
[  363.660393]  exit_to_usermode_loop+0x91/0xf0
[  363.660394]  do_syscall_64+0x100/0x110
[  363.660396]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  363.660398] RIP: 0033:0x4540f22
[  363.660403] Code: Bad RIP value.
[  363.660404] RSP: 002b:00007fff54bf6c30 EFLAGS: 00210202
[  363.660406] RAX: 00007fff54bf6c30 RBX: 0000000000000001 RCX:
00000000939f4000
[  363.660406] RDX: 00007fff54bf6c88 RSI: 00007fff54bf6c98 RDI:
00007fff54bf6c80
[  363.660407] RBP: 00007fa81869c430 R08: 000000000000021f R09:
000000000936d890
[  363.660408] R10: 0000000000000001 R11: 0000000000200206 R12:
00007fff54bf6d90
[  363.660408] R13: 0000000000000008 R14: 000000000768bdd8 R15:
00007fff54bf6ce0

May be trace alone isn't enough to reproduce it? Did you try the actual gam=
e?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15682446210.8b77dc.1264--

--===============1401418325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1401418325==--
