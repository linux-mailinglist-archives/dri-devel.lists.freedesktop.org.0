Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F583FEFBF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 16:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750B16E598;
	Thu,  2 Sep 2021 14:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9526E598
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 14:56:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 121B3610D2
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 14:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630594568;
 bh=aPkc9810gRXyjgSTsL1EnpeU/7Fm9yB2/doe2L5V66E=;
 h=From:To:Subject:Date:From;
 b=AWYAuatIcLwLrXOimSblJJ3S9URa9/Kp3wTuSQkkobKhzjiUaRmPLoE5lDG+3ypGd
 dfNUqSWee9yU5U5n3ubgpRC5YKvZGN07Bwurpzr2U2BGdWXy5zQ2pWrS49gtslrGAh
 xADpyloEuXJFgDCmw5EOn+LgS8rrCYeHahzoWQyo/5APnRDYlpMuX3YuugK7ccWNIo
 8ne/T3MOyNwsU1yhgeME2mdp35HHTUn6WTnQdTJoGb3vRSI2F5E1BLsrP32XWDTUhi
 5AfUDefbRo1Lle/CrPHJ3nuy/zJ0BJK6DF83KV1aU1eZi6JqK/8PgLiuo9R/es4IBO
 ak6WFE4sffkgQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 06054610F7; Thu,  2 Sep 2021 14:56:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214289] New: amdgpu Msg issuing pre-check failed and SMU may be
 not in the right state!
Date: Thu, 02 Sep 2021 14:56:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.przybylowicz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214289-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D214289

            Bug ID: 214289
           Summary: amdgpu Msg issuing pre-check failed and SMU may be not
                    in the right state!
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.13.13
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: michal.przybylowicz@gmail.com
        Regression: No

I am using kernel 5.13.13 with amdgpu drivers. My graphics card is: PowerCo=
lor
RX 6800 XT (connected through riser cable - if that means something).

I don't have issues when using card with windows 10 (playing games etc.)

$ inxi -Gx
Graphics:  Device-1: Advanced Micro Devices [AMD/ATI] Navi 21 [Radeon RX
6800/6800 XT / 6900 XT] vendor: Tul=20
           driver: amdgpu v: kernel bus-ID: 03:00.0=20
           Display: server: X.Org 1.20.11 driver: loaded: amdgpu resolution:
3440x1440~144Hz=20
           OpenGL: renderer: AMD Radeon RX 6800 XT (SIENNA_CICHLID DRM 3.41=
.0
5.13.13-051313-lowlatency LLVM 12.0.1)=20
           v: 4.6 Mesa 21.3.0-devel (git-dfef775 2021-09-02 hirsute-oibaf-p=
pa)
direct render: Yes

Almost everyday during normal browser usage (watching youtube videos or twi=
tch)
I see these messages in the journalctl:

ep 02 16:39:13 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing pre-c=
heck
failed and SMU may be not in the right state!
Sep 02 16:39:13 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:20 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:20 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:20 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:20 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:21 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:21 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:22 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:22 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:24 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:24 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Failed to power =
gate
VCN!
Sep 02 16:39:24 dagon kernel: [drm:amdgpu_dpm_enable_uvd [amdgpu]] *ERROR* =
Dpm
disable uvd failed, ret =3D -5.=20
Sep 02 16:39:24 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:24 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:24 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Failed to enable
gfxoff!
Sep 02 16:39:26 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:26 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:26 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:27 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:27 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Failed to power =
gate
VCN!
Sep 02 16:39:27 dagon kernel: [drm:amdgpu_dpm_enable_uvd [amdgpu]] *ERROR* =
Dpm
disable uvd failed, ret =3D -5.=20
Sep 02 16:39:27 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:27 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:27 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Failed to enable
gfxoff!
Sep 02 16:39:29 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:29 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:30 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:30 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Failed to enable
gfxoff!
Sep 02 16:39:31 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:31 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:31 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:31 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:31 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:32 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:32 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Failed to power =
gate
VCN!
Sep 02 16:39:32 dagon kernel: [drm:amdgpu_dpm_enable_uvd [amdgpu]] *ERROR* =
Dpm
disable uvd failed, ret =3D -5.=20
Sep 02 16:39:32 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:32 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:32 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Failed to enable
gfxoff!
Sep 02 16:39:34 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:34 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:34 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:35 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:39:35 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:40:33 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:40:33 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:40:38 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:40:39 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:42:10 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:42:10 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:44:05 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:44:05 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Failed to power =
gate
VCN!
Sep 02 16:44:05 dagon kernel: [drm:amdgpu_dpm_enable_uvd [amdgpu]] *ERROR* =
Dpm
disable uvd failed, ret =3D -5.=20
Sep 02 16:44:05 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:44:05 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:44:05 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Failed to enable
gfxoff!
Sep 02 16:44:19 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:44:20 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Msg issuing
pre-check failed and SMU may be not in the right state!
Sep 02 16:44:20 dagon kernel: amdgpu 0000:03:00.0: amdgpu: Failed to power =
gate
VCN!
Sep 02 16:44:20 dagon kernel: [drm:amdgpu_dpm_enable_uvd [amdgpu]] *ERROR* =
Dpm
disable uvd failed, ret =3D -5.=20

I don't know what do these mean, so I am posting them here.

My amdgpu module settings:

$ cat /etc/modprobe.d/amdgpu.conf
options amdgpu msi=3D1 aspm=3D0 audio=3D0 ppfeaturemask=3D0xffffffff

$ systool -vm amdgpu=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
Module =3D "amdgpu"

  Attributes:
    coresize            =3D "6381568"
    initsize            =3D "0"
    initstate           =3D "live"
    refcnt              =3D "17"
    srcversion          =3D "426501DD3A5EEAA91AC749F"
    taint               =3D ""
    uevent              =3D <store method only>

  Parameters:
    abmlevel            =3D "0"
    aspm                =3D "0"
    async_gfx_ring      =3D "1"
    audio               =3D "0"
    backlight           =3D "-1"
    bad_page_threshold  =3D "-1"
    bapm                =3D "-1"
    benchmark           =3D "0"
    cg_mask             =3D "4294967295"
    cik_support         =3D "0"
    compute_multipipe   =3D "-1"
    cwsr_enable         =3D "1"
    dc                  =3D "-1"
    dcdebugmask         =3D "0"
    dcfeaturemask       =3D "2"
    debug_evictions     =3D "N"
    debug_largebar      =3D "0"
    deep_color          =3D "0"
    disable_cu          =3D "(null)"
    discovery           =3D "-1"
    disp_priority       =3D "0"
    dpm                 =3D "-1"
    emu_mode            =3D "0"
    exp_hw_support      =3D "0"
    force_asic_type     =3D "-1"
    forcelongtraining   =3D "0"
    freesync_video      =3D "0"
    fw_load_type        =3D "-1"
    gpu_recovery        =3D "-1"
    halt_if_hws_hang    =3D "0"
    hw_i2c              =3D "0"
    hws_gws_support     =3D "N"
    hws_max_conc_proc   =3D "8"
    ignore_crat         =3D "0"
    ip_block_mask       =3D "4294967295"
    job_hang_limit      =3D "0"
    lbpw                =3D "-1"
    lockup_timeout      =3D ""
    max_num_of_queues_per_device=3D "4096"
    mcbp                =3D "0"
    mes                 =3D "0"
    msi                 =3D "1"
    no_queue_eviction_on_vm_fault=3D "0"
    no_system_mem_limit =3D "N"
    noretry             =3D "-1"
    num_kcq             =3D "-1"
    pcie_gen2           =3D "-1"
    pcie_gen_cap        =3D "0"
    pcie_lane_cap       =3D "0"
    pg_mask             =3D "4294967295"
    ppfeaturemask       =3D "0xffffffff"
    queue_preemption_timeout_ms=3D "9000"
    ras_enable          =3D "-1"
    ras_mask            =3D "4294967295"
    reset_method        =3D "-1"
    runpm               =3D "-1"
    sched_hw_submission =3D "2"
    sched_jobs          =3D "32"
    sched_policy        =3D "0"
    sdma_phase_quantum  =3D "32"
    send_sigterm        =3D "0"
    si_support          =3D "0"
    smu_memory_pool_size=3D "0"
    smu_pptable_id      =3D "-1"
    test                =3D "0"
    timeout_fatal_disable=3D "N"
    timeout_period      =3D "0"
    tmz                 =3D "-1"
    virtual_display     =3D "(null)"
    vis_vramlimit       =3D "0"
    vm_block_size       =3D "-1"
    vm_debug            =3D "0"
    vm_fault_stop       =3D "0"
    vm_fragment_size    =3D "-1"
    vm_size             =3D "-1"
    vm_update_mode      =3D "-1"

  Sections:

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
