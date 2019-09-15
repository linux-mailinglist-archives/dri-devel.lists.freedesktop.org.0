Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E22DB31D0
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2019 21:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BC56E0C0;
	Sun, 15 Sep 2019 19:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 02B616E0C0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 19:44:45 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0009172167; Sun, 15 Sep 2019 19:44:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111689] gnome-shell stuck because of amdgpu driver 5.3 kernel
Date: Sun, 15 Sep 2019 19:44:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111689-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1985751081=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1985751081==
Content-Type: multipart/alternative; boundary="15685766841.e0Ee.6487"
Content-Transfer-Encoding: 7bit


--15685766841.e0Ee.6487
Date: Sun, 15 Sep 2019 19:44:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111689

            Bug ID: 111689
           Summary: gnome-shell stuck because of amdgpu driver 5.3 kernel
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: mikhail.v.gavrilov@gmail.com

Created attachment 145368
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145368&action=3Dedit
dmesg

During 5.3 RC5 cycle, I accidentally noted that when I left unblocked
gnome-shell at noon, and when I returned at the evening I discovered than
monitor not sleeping and show open gnome activity. At first, I thought that
some application did not let fall asleep the system. But when I try to move=
 the
mouse, I realized that the system hanged. So I connect via ssh and tried to
investigate the problem. I did not see anything strange in kernel logs. And=
 my
last idea before trying to kill the gnome-shell process was dumps tasks that
are in uninterruptable (blocked) state.

After [Alt + PrnScr + W] I saw this:

[32840.701909] sysrq: Show Blocked State
[32840.701976]   task                        PC stack   pid father
[32840.702407] gnome-shell     D11240  1900   1830 0x00000000
[32840.702438] Call Trace:
[32840.702446]  ? __schedule+0x352/0x900
[32840.702453]  schedule+0x3a/0xb0
[32840.702457]  schedule_timeout+0x289/0x3c0
[32840.702461]  ? find_held_lock+0x32/0x90
[32840.702464]  ? find_held_lock+0x32/0x90
[32840.702469]  ? mark_held_locks+0x50/0x80
[32840.702473]  ? _raw_spin_unlock_irqrestore+0x4b/0x60
[32840.702478]  dma_fence_default_wait+0x1f5/0x340
[32840.702482]  ? dma_fence_free+0x20/0x20
[32840.702487]  dma_fence_wait_timeout+0x182/0x1e0
[32840.702533]  amdgpu_fence_wait_empty+0xe7/0x210 [amdgpu]
[32840.702577]  amdgpu_pm_compute_clocks+0x70/0x5f0 [amdgpu]
[32840.702641]  dm_pp_apply_display_requirements+0x19e/0x1c0 [amdgpu]
[32840.702705]  dce12_update_clocks+0xd8/0x110 [amdgpu]
[32840.702766]  dc_commit_state+0x414/0x590 [amdgpu]
[32840.702834]  amdgpu_dm_atomic_commit_tail+0xd1e/0x1cf0 [amdgpu]
[32840.702840]  ? reacquire_held_locks+0xed/0x210
[32840.702848]  ? ttm_eu_backoff_reservation+0xa5/0x160 [ttm]
[32840.702853]  ? find_held_lock+0x32/0x90
[32840.702855]  ? find_held_lock+0x32/0x90
[32840.702860]  ? __lock_acquire+0x247/0x1910
[32840.702867]  ? find_held_lock+0x32/0x90
[32840.702871]  ? mark_held_locks+0x50/0x80
[32840.702874]  ? _raw_spin_unlock_irq+0x29/0x40
[32840.702877]  ? lockdep_hardirqs_on+0xf0/0x180
[32840.702881]  ? _raw_spin_unlock_irq+0x29/0x40
[32840.702884]  ? wait_for_completion_timeout+0x75/0x190
[32840.702895]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[32840.702902]  commit_tail+0x3c/0x70 [drm_kms_helper]
[32840.702909]  drm_atomic_helper_commit+0xe3/0x150 [drm_kms_helper]
[32840.702922]  drm_atomic_connector_commit_dpms+0xd7/0x100 [drm]
[32840.702936]  set_property_atomic+0xcc/0x140 [drm]
[32840.702955]  drm_mode_obj_set_property_ioctl+0xcb/0x1c0 [drm]
[32840.702968]  ? drm_mode_obj_find_prop_id+0x40/0x40 [drm]
[32840.702978]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[32840.702990]  drm_ioctl+0x208/0x390 [drm]
[32840.703003]  ? drm_mode_obj_find_prop_id+0x40/0x40 [drm]
[32840.703007]  ? sched_clock_cpu+0xc/0xc0
[32840.703012]  ? lockdep_hardirqs_on+0xf0/0x180
[32840.703053]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[32840.703058]  do_vfs_ioctl+0x411/0x750
[32840.703065]  ksys_ioctl+0x5e/0x90
[32840.703069]  __x64_sys_ioctl+0x16/0x20
[32840.703072]  do_syscall_64+0x5c/0xb0
[32840.703076]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[32840.703079] RIP: 0033:0x7f8bcab0f00b
[32840.703084] Code: Bad RIP value.
[32840.703086] RSP: 002b:00007ffe76c62338 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[32840.703089] RAX: ffffffffffffffda RBX: 00007ffe76c62370 RCX:
00007f8bcab0f00b
[32840.703092] RDX: 00007ffe76c62370 RSI: 00000000c01864ba RDI:
0000000000000009
[32840.703094] RBP: 00000000c01864ba R08: 0000000000000003 R09:
00000000c0c0c0c0
[32840.703096] R10: 000056476c86a018 R11: 0000000000000246 R12:
000056476c8ad940
[32840.703098] R13: 0000000000000009 R14: 0000000000000002 R15:
0000000000000003
[root@localhost ~]#
[root@localhost ~]# ps aux | grep gnome-shell
mikhail     1900  0.3  1.1 6447496 378696 tty2   Dl+  Aug24   2:10
/usr/bin/gnome-shell
mikhail     2099  0.0  0.0 519984 23392 ?        Ssl  Aug24   0:00
/usr/libexec/gnome-shell-calendar-server
mikhail    12214  0.0  0.0 399484 29660 pts/2    Sl+  Aug24   0:00
/usr/bin/python3 /usr/bin/chrome-gnome-shell
chrome-extension://gphhapmejobijbbhgpjhcjognlahblep/
root       22957  0.0  0.0 216120  2456 pts/10   S+   03:59   0:00 grep
--color=3Dauto gnome-shell

After it, I tried to kill gnome-shell process with signal 9, but the process
won't terminate after several unsuccessful attempts.

Only [Alt + PrnScr + B] helped reboot the hanging system.
I am writing here because I hope some ampgpu hackers cal look in the trace =
and
understand that is happening.

In dri-devel mailing list, Hillf Danton proposed two patches [1]
I tested both patches on top of 5.3 RC and didn't seen any problems with th=
em.
But due to the fact that the initial problem was accidental, I can=E2=80=99=
t confirm
that it was definitely fixed by the patch.

Then Daniel Vetter proposed to add debug messages to patch [2] for seen whi=
ch
fence is stuck.

After all the changes I see regularly appearing trace in the kernel logs th=
at
appear only when computer blocked and monitor in power save mode.

Christian K=C3=B6nig supposes that problem is simply that PM turns of a blo=
ck before
all work is done on that block. And suggested writing a bug report because =
it
is very difficult to get all the information from the mail thread.

[1] https://lists.freedesktop.org/archives/dri-devel/2019-August/232853.html
[2] https://lists.freedesktop.org/archives/dri-devel/2019-September/234321.=
html
[3] https://lists.freedesktop.org/archives/dri-devel/2019-September/234821.=
html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15685766841.e0Ee.6487
Date: Sun, 15 Sep 2019 19:44:44 +0000
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
   title=3D"NEW - gnome-shell stuck because of amdgpu driver 5.3 kernel"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111689">111689</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>gnome-shell stuck because of amdgpu driver 5.3 kernel
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
          <td>Other
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
          <td>mikhail.v.gavrilov&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145368=
" name=3D"attach_145368" title=3D"dmesg">attachment 145368</a> <a href=3D"a=
ttachment.cgi?id=3D145368&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg

During 5.3 RC5 cycle, I accidentally noted that when I left unblocked
gnome-shell at noon, and when I returned at the evening I discovered than
monitor not sleeping and show open gnome activity. At first, I thought that
some application did not let fall asleep the system. But when I try to move=
 the
mouse, I realized that the system hanged. So I connect via ssh and tried to
investigate the problem. I did not see anything strange in kernel logs. And=
 my
last idea before trying to kill the gnome-shell process was dumps tasks that
are in uninterruptable (blocked) state.

After [Alt + PrnScr + W] I saw this:

[32840.701909] sysrq: Show Blocked State
[32840.701976]   task                        PC stack   pid father
[32840.702407] gnome-shell     D11240  1900   1830 0x00000000
[32840.702438] Call Trace:
[32840.702446]  ? __schedule+0x352/0x900
[32840.702453]  schedule+0x3a/0xb0
[32840.702457]  schedule_timeout+0x289/0x3c0
[32840.702461]  ? find_held_lock+0x32/0x90
[32840.702464]  ? find_held_lock+0x32/0x90
[32840.702469]  ? mark_held_locks+0x50/0x80
[32840.702473]  ? _raw_spin_unlock_irqrestore+0x4b/0x60
[32840.702478]  dma_fence_default_wait+0x1f5/0x340
[32840.702482]  ? dma_fence_free+0x20/0x20
[32840.702487]  dma_fence_wait_timeout+0x182/0x1e0
[32840.702533]  amdgpu_fence_wait_empty+0xe7/0x210 [amdgpu]
[32840.702577]  amdgpu_pm_compute_clocks+0x70/0x5f0 [amdgpu]
[32840.702641]  dm_pp_apply_display_requirements+0x19e/0x1c0 [amdgpu]
[32840.702705]  dce12_update_clocks+0xd8/0x110 [amdgpu]
[32840.702766]  dc_commit_state+0x414/0x590 [amdgpu]
[32840.702834]  amdgpu_dm_atomic_commit_tail+0xd1e/0x1cf0 [amdgpu]
[32840.702840]  ? reacquire_held_locks+0xed/0x210
[32840.702848]  ? ttm_eu_backoff_reservation+0xa5/0x160 [ttm]
[32840.702853]  ? find_held_lock+0x32/0x90
[32840.702855]  ? find_held_lock+0x32/0x90
[32840.702860]  ? __lock_acquire+0x247/0x1910
[32840.702867]  ? find_held_lock+0x32/0x90
[32840.702871]  ? mark_held_locks+0x50/0x80
[32840.702874]  ? _raw_spin_unlock_irq+0x29/0x40
[32840.702877]  ? lockdep_hardirqs_on+0xf0/0x180
[32840.702881]  ? _raw_spin_unlock_irq+0x29/0x40
[32840.702884]  ? wait_for_completion_timeout+0x75/0x190
[32840.702895]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[32840.702902]  commit_tail+0x3c/0x70 [drm_kms_helper]
[32840.702909]  drm_atomic_helper_commit+0xe3/0x150 [drm_kms_helper]
[32840.702922]  drm_atomic_connector_commit_dpms+0xd7/0x100 [drm]
[32840.702936]  set_property_atomic+0xcc/0x140 [drm]
[32840.702955]  drm_mode_obj_set_property_ioctl+0xcb/0x1c0 [drm]
[32840.702968]  ? drm_mode_obj_find_prop_id+0x40/0x40 [drm]
[32840.702978]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[32840.702990]  drm_ioctl+0x208/0x390 [drm]
[32840.703003]  ? drm_mode_obj_find_prop_id+0x40/0x40 [drm]
[32840.703007]  ? sched_clock_cpu+0xc/0xc0
[32840.703012]  ? lockdep_hardirqs_on+0xf0/0x180
[32840.703053]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[32840.703058]  do_vfs_ioctl+0x411/0x750
[32840.703065]  ksys_ioctl+0x5e/0x90
[32840.703069]  __x64_sys_ioctl+0x16/0x20
[32840.703072]  do_syscall_64+0x5c/0xb0
[32840.703076]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[32840.703079] RIP: 0033:0x7f8bcab0f00b
[32840.703084] Code: Bad RIP value.
[32840.703086] RSP: 002b:00007ffe76c62338 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[32840.703089] RAX: ffffffffffffffda RBX: 00007ffe76c62370 RCX:
00007f8bcab0f00b
[32840.703092] RDX: 00007ffe76c62370 RSI: 00000000c01864ba RDI:
0000000000000009
[32840.703094] RBP: 00000000c01864ba R08: 0000000000000003 R09:
00000000c0c0c0c0
[32840.703096] R10: 000056476c86a018 R11: 0000000000000246 R12:
000056476c8ad940
[32840.703098] R13: 0000000000000009 R14: 0000000000000002 R15:
0000000000000003
[root&#64;localhost ~]#
[root&#64;localhost ~]# ps aux | grep gnome-shell
mikhail     1900  0.3  1.1 6447496 378696 tty2   Dl+  Aug24   2:10
/usr/bin/gnome-shell
mikhail     2099  0.0  0.0 519984 23392 ?        Ssl  Aug24   0:00
/usr/libexec/gnome-shell-calendar-server
mikhail    12214  0.0  0.0 399484 29660 pts/2    Sl+  Aug24   0:00
/usr/bin/python3 /usr/bin/chrome-gnome-shell
chrome-extension://gphhapmejobijbbhgpjhcjognlahblep/
root       22957  0.0  0.0 216120  2456 pts/10   S+   03:59   0:00 grep
--color=3Dauto gnome-shell

After it, I tried to kill gnome-shell process with signal 9, but the process
won't terminate after several unsuccessful attempts.

Only [Alt + PrnScr + B] helped reboot the hanging system.
I am writing here because I hope some ampgpu hackers cal look in the trace =
and
understand that is happening.

In dri-devel mailing list, Hillf Danton proposed two patches [1]
I tested both patches on top of 5.3 RC and didn't seen any problems with th=
em.
But due to the fact that the initial problem was accidental, I can=E2=80=99=
t confirm
that it was definitely fixed by the patch.

Then Daniel Vetter proposed to add debug messages to patch [2] for seen whi=
ch
fence is stuck.

After all the changes I see regularly appearing trace in the kernel logs th=
at
appear only when computer blocked and monitor in power save mode.

Christian K=C3=B6nig supposes that problem is simply that PM turns of a blo=
ck before
all work is done on that block. And suggested writing a bug report because =
it
is very difficult to get all the information from the mail thread.

[1] <a href=3D"https://lists.freedesktop.org/archives/dri-devel/2019-August=
/232853.html">https://lists.freedesktop.org/archives/dri-devel/2019-August/=
232853.html</a>
[2] <a href=3D"https://lists.freedesktop.org/archives/dri-devel/2019-Septem=
ber/234321.html">https://lists.freedesktop.org/archives/dri-devel/2019-Sept=
ember/234321.html</a>
[3] <a href=3D"https://lists.freedesktop.org/archives/dri-devel/2019-Septem=
ber/234821.html">https://lists.freedesktop.org/archives/dri-devel/2019-Sept=
ember/234821.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15685766841.e0Ee.6487--

--===============1985751081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1985751081==--
