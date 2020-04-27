Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CFF1BA552
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 15:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E90D6E1BD;
	Mon, 27 Apr 2020 13:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619AB6E1BD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 13:48:00 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207463] New: [amdgpu] System freeze / corrupted graphics
Date: Mon, 27 Apr 2020 13:47:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: rokups+kernel-bugs@zoho.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-207463-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=207463

            Bug ID: 207463
           Summary: [amdgpu] System freeze / corrupted graphics
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.6.7-arch1-1
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: rokups+kernel-bugs@zoho.com
        Regression: No

Created attachment 288763
  --> https://bugzilla.kernel.org/attachment.cgi?id=288763&action=edit
Corrupted graphics

Application i am working on somehow causes AMDGPU driver to fail, which results
in soft-ish system lockup. Graphics get corrupted, system does react to some
keypresses (can switch VT, sysrq works).

Problem is reproducible *always*.

Steps to reproduce:
git clone --branch=hdpi-support-fontscale-viewport
https://github.com/rokups/imgui   
cd imgui/examples/example_sdl_opengl3 
make
./example_sdl_opengl3

Interact with program a bit, try to drag windows outside of main viewport.
Issue happens within seconds.


bal. 27 16:30:21 rk-PC systemd-coredump[15701]: Process 15649 (example_sdl_ope)
of user 1000 dumped core.

                                                Stack trace of thread 15649:
                                                #0  0x00007fed0b12ace5 raise
(libc.so.6 + 0x3bce5)
                                                #1  0x00007fed0b114857 abort
(libc.so.6 + 0x25857)
                                                #2  0x00007fed0b16e2b0
__libc_message (libc.so.6 + 0x7f2b0)
                                                #3  0x00007fed0b1fe06a
__fortify_fail (libc.so.6 + 0x10f06a)
                                                #4  0x00007fed0b1fc904
__chk_fail (libc.so.6 + 0x10d904)
                                                #5  0x00007fed085ab0b3 n/a
(radeonsi_dri.so + 0x6340b3)
                                                #6  0x00007fed080f28b7 n/a
(radeonsi_dri.so + 0x17b8b7)
                                                #7  0x00007fed080b71b8 n/a
(radeonsi_dri.so + 0x1401b8)
                                                #8  0x00007fed080a8fcb n/a
(radeonsi_dri.so + 0x131fcb)
                                                #9  0x00007fed082e8a63 n/a
(radeonsi_dri.so + 0x371a63)
                                                #10 0x00007fed082e8e82 n/a
(radeonsi_dri.so + 0x371e82)
                                                #11 0x00005564903169b5 n/a
(/home/rk/src/games/Libs/imgui/cmake-build-debug/bin/example_sdl_opengl3 +
0x2a9b5)
                                                #12 0x0000556490313e69 n/a
(/home/rk/src/games/Libs/imgui/cmake-build-debug/bin/example_sdl_opengl3 +
0x27e69)
                                                #13 0x00007fed0b116023
__libc_start_main (libc.so.6 + 0x27023)
                                                #14 0x00005564903136ce n/a
(/home/rk/src/games/Libs/imgui/cmake-build-debug/bin/example_sdl_opengl3 +
0x276ce)

<...>

bal. 27 16:30:33 rk-PC kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out!
bal. 27 16:30:37 rk-PC kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out!
bal. 27 16:30:38 rk-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
gfx timeout, signaled seq=542239, emitted seq=542241
bal. 27 16:30:38 rk-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process example_sdl_ope pid 15735 thread example_sd:cs0
pid 15741
bal. 27 16:30:38 rk-PC kernel: amdgpu 0000:08:00.0: GPU reset begin!
bal. 27 16:30:38 rk-PC kernel: amdgpu 0000:08:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed
(-110)
bal. 27 16:30:38 rk-PC kernel: [drm:gfx_v8_0_hw_fini [amdgpu]] *ERROR* KCQ
disable failed
bal. 27 16:30:39 rk-PC kernel: cp is busy, skip halt cp
bal. 27 16:30:39 rk-PC kernel: rlc is busy, skip halt rlc
bal. 27 16:30:39 rk-PC kernel: amdgpu 0000:08:00.0: GPU BACO reset
bal. 27 16:30:39 rk-PC kernel: amdgpu 0000:08:00.0: GPU reset succeeded, trying
to resume
bal. 27 16:30:39 rk-PC kernel: [drm] PCIE GART of 256M enabled (table at
0x000000F400300000).
bal. 27 16:30:39 rk-PC kernel: [drm] VRAM is lost due to GPU reset!
bal. 27 16:30:40 rk-PC kernel: [drm] UVD and UVD ENC initialized successfully.
bal. 27 16:30:40 rk-PC rtkit-daemon[7614]: Supervising 8 threads of 5 processes
of 1 users.
bal. 27 16:30:40 rk-PC rtkit-daemon[7614]: Successfully made thread 15789 of
process 7410 owned by '1000' RT at priority 5.
bal. 27 16:30:40 rk-PC rtkit-daemon[7614]: Supervising 9 threads of 5 processes
of 1 users.
bal. 27 16:30:40 rk-PC kernel: [drm] VCE initialized successfully.
bal. 27 16:30:40 rk-PC kernel: [drm] recover vram bo from shadow start
bal. 27 16:30:40 rk-PC kernel: [drm] recover vram bo from shadow done
bal. 27 16:30:40 rk-PC kernel: [drm] Skip scheduling IBs!
bal. 27 16:30:40 rk-PC kernel: [drm] Skip scheduling IBs!
bal. 27 16:30:40 rk-PC kernel: [drm] Skip scheduling IBs!
bal. 27 16:30:40 rk-PC kernel: [drm] Skip scheduling IBs!
bal. 27 16:30:40 rk-PC kernel: [drm] Skip scheduling IBs!
bal. 27 16:30:40 rk-PC kernel: [drm] Skip scheduling IBs!
bal. 27 16:30:40 rk-PC kernel: [drm] Skip scheduling IBs!
bal. 27 16:30:40 rk-PC kernel: [drm] Skip scheduling IBs!
bal. 27 16:30:40 rk-PC kernel: [drm] Skip scheduling IBs!
bal. 27 16:30:40 rk-PC kernel: [drm] Skip scheduling IBs!
bal. 27 16:30:40 rk-PC kernel: [drm] Skip scheduling IBs!
bal. 27 16:30:40 rk-PC kernel: [drm] Skip scheduling IBs!
bal. 27 16:30:40 rk-PC kernel: [drm] Skip scheduling IBs!
bal. 27 16:30:40 rk-PC kernel: [drm] Skip scheduling IBs!
bal. 27 16:30:40 rk-PC kernel: [drm] Skip scheduling IBs!
bal. 27 16:30:40 rk-PC kernel: amdgpu 0000:08:00.0: GPU reset(2) succeeded!
bal. 27 16:30:41 rk-PC audit[2071]: ANOM_ABEND auid=4294967295 uid=0 gid=0
ses=4294967295 pid=2071 comm="Xorg:gdrv0" exe="/usr/lib/Xorg" sig=11 res=1
bal. 27 16:30:41 rk-PC kernel: audit: type=1701 audit(1587994241.386:339):
auid=4294967295 uid=0 gid=0 ses=4294967295 pid=2071 comm="Xorg:gdrv0"
exe="/usr/lib/Xorg" sig=11 res=1
bal. 27 16:30:41 rk-PC audit: AUDIT1334 prog-id=35 op=LOAD
bal. 27 16:30:41 rk-PC kernel: audit: type=1334 audit(1587994241.399:340):
prog-id=35 op=LOAD
bal. 27 16:30:41 rk-PC audit: AUDIT1334 prog-id=36 op=LOAD
bal. 27 16:30:41 rk-PC systemd[1]: Started Process Core Dump (PID 15795/UID 0).
bal. 27 16:30:41 rk-PC audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295
ses=4294967295 msg='unit=systemd-coredump@1-15795-0 comm="systemd"
exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
bal. 27 16:30:41 rk-PC kernel: audit: type=1334 audit(1587994241.399:341):
prog-id=36 op=LOAD
bal. 27 16:30:41 rk-PC kernel: audit: type=1130 audit(1587994241.399:342):
pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-coredump@1-15795-0
comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=?
res=success'
bal. 27 16:30:41 rk-PC krunner[13252]: The X11 connection broke (error 1). Did
the X11 server die?
bal. 27 16:30:41 rk-PC konsole[11554]: The X11 connection broke (error 1). Did
the X11 server die?
bal. 27 16:30:41 rk-PC pulseaudio[7410]: X connection to :0 broken (explicit
kill or server shutdown).
bal. 27 16:30:41 rk-PC kdeinit5[7253]: kdeinit5: Fatal IO error: client killed
bal. 27 16:30:41 rk-PC org_kde_powerdevil[7414]: The X11 connection broke
(error 1). Did the X11 server die?
bal. 27 16:30:41 rk-PC kdeinit5[7253]: kdeinit5: sending SIGHUP to children.
bal. 27 16:30:41 rk-PC DiscoverNotifier[7388]: The X11 connection broke (error
1). Did the X11 server die?
bal. 27 16:30:41 rk-PC xembedsniproxy[7335]: The X11 connection broke (error
1). Did the X11 server die?
bal. 27 16:30:41 rk-PC plasmashell[7333]: The X11 connection broke (error 1).
Did the X11 server die?
bal. 27 16:30:41 rk-PC kscreen_backend_launcher[7301]: The X11 connection broke
(error 1). Did the X11 server die?
bal. 27 16:30:41 rk-PC kactivitymanagerd[7395]: The X11 connection broke (error
1). Did the X11 server die?
bal. 27 16:30:41 rk-PC kernel: audit: type=1701 audit(1587994241.892:343):
auid=1000 uid=1000 gid=100 ses=1 pid=11413 comm="spotify"
exe="/opt/spotify/spotify" sig=6 res=1
bal. 27 16:30:41 rk-PC audit[11413]: ANOM_ABEND auid=1000 uid=1000 gid=100
ses=1 pid=11413 comm="spotify" exe="/opt/spotify/spotify" sig=6 res=1
bal. 27 16:30:41 rk-PC at-spi-bus-launcher[7858]: X connection to :0 broken
(explicit kill or server shutdown).
bal. 27 16:30:41 rk-PC ksmserver[7322]: The X11 connection broke (error 1). Did
the X11 server die?
bal. 27 16:30:41 rk-PC python[7420]: The X11 connection broke (error 1). Did
the X11 server die?
bal. 27 16:30:41 rk-PC kwalletd5[7086]: The X11 connection broke (error 1). Did
the X11 server die?
bal. 27 16:30:41 rk-PC gmenudbusmenuproxy[7385]: The X11 connection broke
(error 1). Did the X11 server die?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
