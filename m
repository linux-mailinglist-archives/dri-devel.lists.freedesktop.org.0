Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 185BBFFA36
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 15:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3E189F47;
	Sun, 17 Nov 2019 14:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id EA75389FD9
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 14:24:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E6541720E2; Sun, 17 Nov 2019 14:24:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sun, 17 Nov 2019 14:24:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rodamorris@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-q7xwkJOGGW@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0792946836=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0792946836==
Content-Type: multipart/alternative; boundary="15740006793.f0F24F.25556"
Content-Transfer-Encoding: 7bit


--15740006793.f0F24F.25556
Date: Sun, 17 Nov 2019 14:24:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #135 from Rodney A Morris <rodamorris@gmail.com> ---
(In reply to haro41 from comment #127)
> (In reply to Rodney A Morris from comment #126)
> > If you want someone to apply your changes in bug report no. 110777 to t=
he
> > kernel for testing, I can so but will not be to it until this weekend.=
=20
>=20=20
> ... thanks for you reply. Yes, that was the idea and would be very nice...
>=20
> Since i thing the proposed fix is more relevant to this very thread, let =
me
> repeat the proposed patch here:
>=20
> in 'drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c':
>=20
> static void vega10_notify_smc_display_change(struct pp_hwmgr *hwmgr,
>                 bool has_disp)
> {
> 	smum_send_msg_to_smc_with_parameter(hwmgr,
> 	                                    PPSMC_MSG_SetUclkFastSwitch,
> 	                                    has_disp ? 1 : 0);
> /* proposed fix for crashes because of frequently mclk level 0/1 switchin=
g */
> 	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_SetUclkDownHyst, 1);
> }
>=20
> Only module 'amdgpu.ko' needs to be rebuild and copied, like this:
>=20
> $ cd /home/user/linux-5.x.x && make -j8 -C . M=3Ddrivers/gpu/drm/amd/amdg=
pu
>=20
> # cp /home/user/linux-5.x.x/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
> /lib/modules/5.x.x/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko &&
> update-initramfs -u
>=20
> ... 'user' and 'x.x' have to be adapted, most likely ...

I applied the patch and recompiled the kernel with the modified amdgpu driv=
er.=20
Unfortunately, the patch did not resolve my issues.  I experienced a crash =
with
the same symptoms as before within 20 minutes of playing Battletech and wit=
hin
40 minutes of playing Stellaris.  Again, limiting the HMB memory clock to
levels 1,2, and 3 prevents the system from crashing, indicating that someth=
ing
with the switching of the memory clock between level 0 and 1, 2, and 3 are
causing the crash.

Interestingly, the debug output indicates a possible problem in
amdgpu/../display/dc/dc_helper.c at, I am guessing, line 332.  If I have ti=
me
later this week, I may take a look at the code in that file.  Here are the
pertinent details from the Stellaris crash.

Distro:  Fedora
Kernel:  5.3.11

dmesg crash output:

[19792.781681] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D3875204, emitted seq=3D3875205
[19792.781727] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process stellaris pid 13309 thread stellaris:cs0 pid 13310
[19792.781731] amdgpu 0000:06:00.0: GPU reset begin!
[19792.798997] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19792.799004] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19792.799006] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19792.799007] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19792.800004] pcieport 0000:00:03.0: AER: Device recovery failed
[19794.419525] amdgpu: [powerplay] No response from smu
[19794.419542] amdgpu: [powerplay] Failed message: 0xe, input parameter: 0x=
0,
error code: 0x0
[19796.043441] amdgpu: [powerplay] No response from smu
[19797.665903] amdgpu: [powerplay] No response from smu
[19797.665907] amdgpu: [powerplay] Failed message: 0x42, input parameter: 0=
x1,
error code: 0x0
[19799.287749] amdgpu: [powerplay] No response from smu
[19800.910845] amdgpu: [powerplay] No response from smu
[19800.910850] amdgpu: [powerplay] Failed message: 0x24, input parameter: 0=
x0,
error code: 0x0
[19800.977846] [drm] REG_WAIT timeout 10us * 3500 tries - dce_mi_free_dmif
line:634
[19800.977855] ------------[ cut here ]------------
[19800.977967] WARNING: CPU: 10 PID: 15123 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:332
generic_reg_wait.cold+0x31/0x53 [amdgpu]
[19800.977968] Modules linked in: rfcomm xt_CHECKSUM xt_MASQUERADE nf_nat_t=
ftp
nf_conntrack_tftp tun bridge stp llc nf_conntrack_netbios_ns
nf_conntrack_broadcast xt_CT ip6t_REJECT nf_reject_ipv6 ip6t_rpfilter
ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ebtable_broute ip6table_=
nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter cmac bnep nct6775 hwmon_vid vfat =
fat
intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal intel_powerclamp core=
temp
kvm_intel kvm iTCO_wdt iTCO_vendor_support irqbypass iwlmvm crct10dif_pclmul
snd_hda_codec_realtek crc32_pclmul snd_hda_codec_generic ledtrig_audio
snd_hda_codec_hdmi ghash_clmulni_intel mac80211 snd_hda_intel intel_cstate
snd_hda_codec libarc4 intel_uncore snd_hda_core btusb snd_hwdep btrtl
intel_rapl_perf btbcm iwlwifi snd_seq btintel snd_seq_device
[19800.977994]  bluetooth joydev mxm_wmi snd_pcm cfg80211 snd_timer
ecdh_generic ecc rfkill snd mei_me soundcore i2c_i801 lpc_ich mei binfmt_mi=
sc
auth_rpcgss sunrpc ip_tables amdgpu amd_iommu_v2 gpu_sched ttm drm_kms_help=
er
drm crc32c_intel mpt3sas igb nvme e1000e dca raid_class i2c_algo_bit
scsi_transport_sas nvme_core wmi usb_storage fuse
[19800.978009] CPU: 10 PID: 15123 Comm: kworker/10:1 Not tainted
5.3.11-300.RAM.local.fc31.x86_64+debug #1
[19800.978011] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M.=
/X99
Taichi, BIOS P1.80 04/06/2018
[19800.978014] Workqueue: events drm_sched_job_timedout [gpu_sched]
[19800.978082] RIP: 0010:generic_reg_wait.cold+0x31/0x53 [amdgpu]
[19800.978084] Code: 4c 24 18 44 89 fa 89 ee 48 c7 c7 a8 ee 7e c0 e8 82 00 =
a5
fa 83 7b 20 01 0f 84 94 ee fd ff 48 c7 c7 a0 ed 7e c0 e8 6c 00 a5 fa <0f> 0=
b e9
81 ee fd ff 48 c7 c7 a0 ed 7e c0 89 54 24 04 e8 55 00 a5
[19800.978086] RSP: 0018:ffff957a0520f690 EFLAGS: 00010246
[19800.978087] RAX: 0000000000000024 RBX: ffff88d6a8030780 RCX:
0000000000000006
[19800.978089] RDX: 0000000000000000 RSI: ffff88d645a10e50 RDI:
ffff88d6bf9d9e00
[19800.978090] RBP: 000000000000000a R08: 0000120246405906 R09:
0000000000000000
[19800.978091] R10: 0000000000000000 R11: 0000000000000000 R12:
00000000000035af
[19800.978092] R13: 0000000000000dad R14: 0000000000000001 R15:
0000000000000dac
[19800.978093] FS:  0000000000000000(0000) GS:ffff88d6bf800000(0000)
knlGS:0000000000000000
[19800.978095] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19800.978096] CR2: 0000289e30054000 CR3: 0000000278612003 CR4:
00000000003606e0
[19800.978097] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[19800.978098] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[19800.978100] Call Trace:
[19800.978152]  dce_mi_free_dmif+0xef/0x150 [amdgpu]
[19800.978200]  dce110_reset_hw_ctx_wrap+0x15f/0x200 [amdgpu]
[19800.978261]  dce110_apply_ctx_to_hw+0x4b/0x530 [amdgpu]
[19800.978316]  ? amdgpu_pm_compute_clocks+0xc9/0x5f0 [amdgpu]
[19800.978383]  ? dm_pp_apply_display_requirements+0x1a8/0x1c0 [amdgpu]
[19800.978429]  dc_commit_state+0x26b/0x590 [amdgpu]
[19800.978479]  amdgpu_dm_atomic_commit_tail+0xd18/0x1cf0 [amdgpu]
[19800.978486]  ? check_irq_usage+0xa7/0x460
[19800.978488]  ? find_held_lock+0x32/0x90
[19800.978494]  ? check_path+0x22/0x40
[19800.978496]  ? check_noncircular+0xaf/0x1b0
[19800.978501]  ? __lock_acquire+0x247/0x1910
[19800.978507]  ? find_held_lock+0x32/0x90
[19800.978511]  ? mark_held_locks+0x50/0x80
[19800.978513]  ? _raw_spin_unlock_irq+0x29/0x40
[19800.978516]  ? lockdep_hardirqs_on+0xf0/0x180
[19800.978518]  ? _raw_spin_unlock_irq+0x29/0x40
[19800.978521]  ? wait_for_completion_timeout+0x75/0x190
[19800.978534]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[19800.978578]  ? amdgpu_dm_audio_eld_notify+0x60/0x60 [amdgpu]
[19800.978583]  commit_tail+0x3c/0x70 [drm_kms_helper]
[19800.978588]  drm_atomic_helper_commit+0xe3/0x150 [drm_kms_helper]
[19800.978595]  drm_atomic_helper_disable_all+0x14c/0x160 [drm_kms_helper]
[19800.978601]  drm_atomic_helper_suspend+0x66/0x100 [drm_kms_helper]
[19800.978652]  dm_suspend+0x20/0x60 [amdgpu]
[19800.978679]  amdgpu_device_ip_suspend_phase1+0x91/0xc0 [amdgpu]
[19800.978707]  amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
[19800.978753]  amdgpu_device_pre_asic_reset+0x191/0x1a4 [amdgpu]
[19800.978799]  amdgpu_device_gpu_recover+0x260/0x934 [amdgpu]
[19800.978843]  amdgpu_job_timedout+0x115/0x140 [amdgpu]
[19800.978848]  drm_sched_job_timedout+0x44/0xa0 [gpu_sched]
[19800.978852]  process_one_work+0x272/0x5a0
[19800.978858]  worker_thread+0x50/0x3b0
[19800.978863]  kthread+0x108/0x140
[19800.978865]  ? process_one_work+0x5a0/0x5a0
[19800.978867]  ? kthread_park+0x80/0x80
[19800.978870]  ret_from_fork+0x3a/0x50
[19800.978878] irq event stamp: 211500
[19800.978881] hardirqs last  enabled at (211499): [<ffffffffbb1715db>]
console_unlock+0x46b/0x5d0
[19800.978885] hardirqs last disabled at (211500): [<ffffffffbb0038da>]
trace_hardirqs_off_thunk+0x1a/0x20
[19800.978887] softirqs last  enabled at (211486): [<ffffffffbbe0035d>]
__do_softirq+0x35d/0x45d
[19800.978889] softirqs last disabled at (211479): [<ffffffffbb0f20c7>]
irq_exit+0xf7/0x100
[19800.978891] ---[ end trace 722d34fe8b4d4012 ]---
[19802.595549] amdgpu: [powerplay] No response from smu
[19804.214995] amdgpu: [powerplay] No response from smu
[19804.215000] amdgpu: [powerplay] Failed message: 0x4c, input parameter: 0=
x1,
error code: 0x0
[19805.837985] amdgpu: [powerplay] No response from smu
[19807.458610] amdgpu: [powerplay] No response from smu
[19807.458614] amdgpu: [powerplay] Failed message: 0x4c, input parameter: 0=
x3,
error code: 0x0
[19809.078189] amdgpu: [powerplay] No response from smu
[19810.698831] amdgpu: [powerplay] No response from smu
[19810.698835] amdgpu: [powerplay] Failed message: 0x9, input parameter: 0x=
f4,
error code: 0x0
[19812.321202] amdgpu: [powerplay] No response from smu
[19813.938039] amdgpu: [powerplay] No response from smu
[19813.938043] amdgpu: [powerplay] Failed message: 0xa, input parameter:
0xa0b000, error code: 0x0
[19815.558461] amdgpu: [powerplay] No response from smu
[19817.179965] amdgpu: [powerplay] No response from smu
[19817.179969] amdgpu: [powerplay] Failed message: 0xe, input parameter: 0x=
0,
error code: 0x0
[19818.790507] amdgpu: [powerplay] No response from smu
[19820.409551] amdgpu: [powerplay] No response from smu
[19820.409555] amdgpu: [powerplay] Failed message: 0x42, input parameter: 0=
x1,
error code: 0x0
[19822.030397] amdgpu: [powerplay] No response from smu
[19823.648860] amdgpu: [powerplay] No response from smu
[19823.648864] amdgpu: [powerplay] Failed message: 0x43, input parameter: 0=
x1,
error code: 0x0
[19825.269615] amdgpu: [powerplay] No response from smu
[19826.890755] amdgpu: [powerplay] No response from smu
[19826.890760] amdgpu: [powerplay] Failed message: 0x24, input parameter: 0=
x0,
error code: 0x0
[19826.907783] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19826.907789] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19826.907791] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19826.907793] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19826.907853] pcieport 0000:00:03.0: AER: Device recovery failed
[19826.925319] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19826.925325] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19826.925326] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19826.925328] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19826.925371] pcieport 0000:00:03.0: AER: Device recovery failed
[19826.942858] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19826.942863] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19826.942865] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19826.942867] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19826.942922] pcieport 0000:00:03.0: AER: Device recovery failed
[19826.960471] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19826.960477] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19826.960480] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19826.960483] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19826.960532] pcieport 0000:00:03.0: AER: Device recovery failed
[19826.977940] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19826.977945] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19826.977947] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19826.977949] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19826.977988] pcieport 0000:00:03.0: AER: Device recovery failed
[19826.995481] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19826.995486] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19826.995487] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19826.995489] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19826.995529] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.013021] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.013026] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.013027] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.013029] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.013091] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.030562] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.030567] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.030568] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.030570] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.030610] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.048102] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.048106] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.048108] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.048110] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.048148] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.065644] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.065648] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.065650] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.065652] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.065692] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.083183] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.083188] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.083190] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.083192] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.083231] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.100724] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.100729] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.100731] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.100732] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.100772] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.118264] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.118269] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.118270] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.118272] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.118310] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.135804] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.135809] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.135811] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.135812] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.135852] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.153345] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.153350] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.153352] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.153353] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.153393] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.170887] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.170892] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.170893] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.170895] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.170934] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.188426] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.188431] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.188433] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.188435] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.188473] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.205966] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.205971] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.205973] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.205974] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.206013] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.223507] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.223512] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.223514] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.223515] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.223554] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.241053] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.241058] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.241059] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.241061] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.241120] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.258589] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.258594] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.258595] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.258597] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.258637] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.276129] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.276134] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.276135] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.276137] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.276176] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.293670] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.293675] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.293676] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.293678] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.293718] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.311211] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.311215] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.311217] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.311219] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.311259] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.328751] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.328756] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.328758] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.328759] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.328800] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.346291] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.346295] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.346297] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.346299] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.346344] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.363831] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.363836] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.363838] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.363839] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.363886] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.381372] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.381376] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.381378] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.381380] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.381425] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.398913] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.398917] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.398919] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.398921] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.398959] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.416453] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.416458] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.416460] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.416467] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.416507] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.433994] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.433999] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.434001] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.434002] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.434042] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.451536] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.451542] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.451544] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.451545] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.451588] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.469085] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.469091] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.469092] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.469094] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.469136] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.486616] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.486626] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.486628] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.486630] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.486670] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.504161] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.504167] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.504170] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.504171] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.504218] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.521697] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.521702] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.521704] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.521706] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.521934] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.539242] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.539247] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.539249] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.539250] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.539290] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.556778] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.556782] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.556784] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.556786] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.556836] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.574325] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.574330] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.574332] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.574334] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.574373] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.591858] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.591863] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.591865] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.591867] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.591908] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.609401] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.609405] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.609407] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.609409] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.609448] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.626939] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.626944] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.626946] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.626947] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.626986] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.644481] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.644486] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.644488] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.644489] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.644528] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.662021] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.662026] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.662028] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.662029] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.662087] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.679561] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.679566] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.679568] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.679570] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.679608] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.697101] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.697106] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.697108] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.697110] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.697149] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.714648] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.714653] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.714655] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.714656] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.714703] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.732183] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.732188] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.732190] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.732191] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.732230] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.749724] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.749729] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.749730] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.749732] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.767327] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.767330] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.767335] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.767336] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.767338] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.767364] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.784805] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.784810] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.784812] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.784813] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.784853] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.802345] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.802350] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.802352] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.802354] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.802394] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.819886] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.819891] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.819893] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.819894] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.819934] pcieport 0000:00:03.0: AER: Device recovery failed

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15740006793.f0F24F.25556
Date: Sun, 17 Nov 2019 14:24:39 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c135">Comm=
ent # 135</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rodamorris&#64;gmail.com" title=3D"Rodney A Morris &lt;rodamorris&#64;gmail=
.com&gt;"> <span class=3D"fn">Rodney A Morris</span></a>
</span></b>
        <pre>(In reply to haro41 from <a href=3D"show_bug.cgi?id=3D109955#c=
127">comment #127</a>)
<span class=3D"quote">&gt; (In reply to Rodney A Morris from <a href=3D"sho=
w_bug.cgi?id=3D109955#c126">comment #126</a>)
&gt; &gt; If you want someone to apply your changes in bug report no. 11077=
7 to the
&gt; &gt; kernel for testing, I can so but will not be to it until this wee=
kend.=20
&gt;=20=20
&gt; ... thanks for you reply. Yes, that was the idea and would be very nic=
e...
&gt;=20
&gt; Since i thing the proposed fix is more relevant to this very thread, l=
et me
&gt; repeat the proposed patch here:
&gt;=20
&gt; in 'drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c':
&gt;=20
&gt; static void vega10_notify_smc_display_change(struct pp_hwmgr *hwmgr,
&gt;                 bool has_disp)
&gt; {
&gt; 	smum_send_msg_to_smc_with_parameter(hwmgr,
&gt; 	                                    PPSMC_MSG_SetUclkFastSwitch,
&gt; 	                                    has_disp ? 1 : 0);
&gt; /* proposed fix for crashes because of frequently mclk level 0/1 switc=
hing */
&gt; 	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_SetUclkDownHyst,=
 1);
&gt; }
&gt;=20
&gt; Only module 'amdgpu.ko' needs to be rebuild and copied, like this:
&gt;=20
&gt; $ cd /home/user/linux-5.x.x &amp;&amp; make -j8 -C . M=3Ddrivers/gpu/d=
rm/amd/amdgpu
&gt;=20
&gt; # cp /home/user/linux-5.x.x/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
&gt; /lib/modules/5.x.x/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko &amp;&a=
mp;
&gt; update-initramfs -u
&gt;=20
&gt; ... 'user' and 'x.x' have to be adapted, most likely ...</span >

I applied the patch and recompiled the kernel with the modified amdgpu driv=
er.=20
Unfortunately, the patch did not resolve my issues.  I experienced a crash =
with
the same symptoms as before within 20 minutes of playing Battletech and wit=
hin
40 minutes of playing Stellaris.  Again, limiting the HMB memory clock to
levels 1,2, and 3 prevents the system from crashing, indicating that someth=
ing
with the switching of the memory clock between level 0 and 1, 2, and 3 are
causing the crash.

Interestingly, the debug output indicates a possible problem in
amdgpu/../display/dc/dc_helper.c at, I am guessing, line 332.  If I have ti=
me
later this week, I may take a look at the code in that file.  Here are the
pertinent details from the Stellaris crash.

Distro:  Fedora
Kernel:  5.3.11

dmesg crash output:

[19792.781681] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D3875204, emitted seq=3D3875205
[19792.781727] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process stellaris pid 13309 thread stellaris:cs0 pid 13310
[19792.781731] amdgpu 0000:06:00.0: GPU reset begin!
[19792.798997] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19792.799004] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19792.799006] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19792.799007] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19792.800004] pcieport 0000:00:03.0: AER: Device recovery failed
[19794.419525] amdgpu: [powerplay] No response from smu
[19794.419542] amdgpu: [powerplay] Failed message: 0xe, input parameter: 0x=
0,
error code: 0x0
[19796.043441] amdgpu: [powerplay] No response from smu
[19797.665903] amdgpu: [powerplay] No response from smu
[19797.665907] amdgpu: [powerplay] Failed message: 0x42, input parameter: 0=
x1,
error code: 0x0
[19799.287749] amdgpu: [powerplay] No response from smu
[19800.910845] amdgpu: [powerplay] No response from smu
[19800.910850] amdgpu: [powerplay] Failed message: 0x24, input parameter: 0=
x0,
error code: 0x0
[19800.977846] [drm] REG_WAIT timeout 10us * 3500 tries - dce_mi_free_dmif
line:634
[19800.977855] ------------[ cut here ]------------
[19800.977967] WARNING: CPU: 10 PID: 15123 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:332
generic_reg_wait.cold+0x31/0x53 [amdgpu]
[19800.977968] Modules linked in: rfcomm xt_CHECKSUM xt_MASQUERADE nf_nat_t=
ftp
nf_conntrack_tftp tun bridge stp llc nf_conntrack_netbios_ns
nf_conntrack_broadcast xt_CT ip6t_REJECT nf_reject_ipv6 ip6t_rpfilter
ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ebtable_broute ip6table_=
nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter cmac bnep nct6775 hwmon_vid vfat =
fat
intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal intel_powerclamp core=
temp
kvm_intel kvm iTCO_wdt iTCO_vendor_support irqbypass iwlmvm crct10dif_pclmul
snd_hda_codec_realtek crc32_pclmul snd_hda_codec_generic ledtrig_audio
snd_hda_codec_hdmi ghash_clmulni_intel mac80211 snd_hda_intel intel_cstate
snd_hda_codec libarc4 intel_uncore snd_hda_core btusb snd_hwdep btrtl
intel_rapl_perf btbcm iwlwifi snd_seq btintel snd_seq_device
[19800.977994]  bluetooth joydev mxm_wmi snd_pcm cfg80211 snd_timer
ecdh_generic ecc rfkill snd mei_me soundcore i2c_i801 lpc_ich mei binfmt_mi=
sc
auth_rpcgss sunrpc ip_tables amdgpu amd_iommu_v2 gpu_sched ttm drm_kms_help=
er
drm crc32c_intel mpt3sas igb nvme e1000e dca raid_class i2c_algo_bit
scsi_transport_sas nvme_core wmi usb_storage fuse
[19800.978009] CPU: 10 PID: 15123 Comm: kworker/10:1 Not tainted
5.3.11-300.RAM.local.fc31.x86_64+debug #1
[19800.978011] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M.=
/X99
Taichi, BIOS P1.80 04/06/2018
[19800.978014] Workqueue: events drm_sched_job_timedout [gpu_sched]
[19800.978082] RIP: 0010:generic_reg_wait.cold+0x31/0x53 [amdgpu]
[19800.978084] Code: 4c 24 18 44 89 fa 89 ee 48 c7 c7 a8 ee 7e c0 e8 82 00 =
a5
fa 83 7b 20 01 0f 84 94 ee fd ff 48 c7 c7 a0 ed 7e c0 e8 6c 00 a5 fa &lt;0f=
&gt; 0b e9
81 ee fd ff 48 c7 c7 a0 ed 7e c0 89 54 24 04 e8 55 00 a5
[19800.978086] RSP: 0018:ffff957a0520f690 EFLAGS: 00010246
[19800.978087] RAX: 0000000000000024 RBX: ffff88d6a8030780 RCX:
0000000000000006
[19800.978089] RDX: 0000000000000000 RSI: ffff88d645a10e50 RDI:
ffff88d6bf9d9e00
[19800.978090] RBP: 000000000000000a R08: 0000120246405906 R09:
0000000000000000
[19800.978091] R10: 0000000000000000 R11: 0000000000000000 R12:
00000000000035af
[19800.978092] R13: 0000000000000dad R14: 0000000000000001 R15:
0000000000000dac
[19800.978093] FS:  0000000000000000(0000) GS:ffff88d6bf800000(0000)
knlGS:0000000000000000
[19800.978095] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[19800.978096] CR2: 0000289e30054000 CR3: 0000000278612003 CR4:
00000000003606e0
[19800.978097] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[19800.978098] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[19800.978100] Call Trace:
[19800.978152]  dce_mi_free_dmif+0xef/0x150 [amdgpu]
[19800.978200]  dce110_reset_hw_ctx_wrap+0x15f/0x200 [amdgpu]
[19800.978261]  dce110_apply_ctx_to_hw+0x4b/0x530 [amdgpu]
[19800.978316]  ? amdgpu_pm_compute_clocks+0xc9/0x5f0 [amdgpu]
[19800.978383]  ? dm_pp_apply_display_requirements+0x1a8/0x1c0 [amdgpu]
[19800.978429]  dc_commit_state+0x26b/0x590 [amdgpu]
[19800.978479]  amdgpu_dm_atomic_commit_tail+0xd18/0x1cf0 [amdgpu]
[19800.978486]  ? check_irq_usage+0xa7/0x460
[19800.978488]  ? find_held_lock+0x32/0x90
[19800.978494]  ? check_path+0x22/0x40
[19800.978496]  ? check_noncircular+0xaf/0x1b0
[19800.978501]  ? __lock_acquire+0x247/0x1910
[19800.978507]  ? find_held_lock+0x32/0x90
[19800.978511]  ? mark_held_locks+0x50/0x80
[19800.978513]  ? _raw_spin_unlock_irq+0x29/0x40
[19800.978516]  ? lockdep_hardirqs_on+0xf0/0x180
[19800.978518]  ? _raw_spin_unlock_irq+0x29/0x40
[19800.978521]  ? wait_for_completion_timeout+0x75/0x190
[19800.978534]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[19800.978578]  ? amdgpu_dm_audio_eld_notify+0x60/0x60 [amdgpu]
[19800.978583]  commit_tail+0x3c/0x70 [drm_kms_helper]
[19800.978588]  drm_atomic_helper_commit+0xe3/0x150 [drm_kms_helper]
[19800.978595]  drm_atomic_helper_disable_all+0x14c/0x160 [drm_kms_helper]
[19800.978601]  drm_atomic_helper_suspend+0x66/0x100 [drm_kms_helper]
[19800.978652]  dm_suspend+0x20/0x60 [amdgpu]
[19800.978679]  amdgpu_device_ip_suspend_phase1+0x91/0xc0 [amdgpu]
[19800.978707]  amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
[19800.978753]  amdgpu_device_pre_asic_reset+0x191/0x1a4 [amdgpu]
[19800.978799]  amdgpu_device_gpu_recover+0x260/0x934 [amdgpu]
[19800.978843]  amdgpu_job_timedout+0x115/0x140 [amdgpu]
[19800.978848]  drm_sched_job_timedout+0x44/0xa0 [gpu_sched]
[19800.978852]  process_one_work+0x272/0x5a0
[19800.978858]  worker_thread+0x50/0x3b0
[19800.978863]  kthread+0x108/0x140
[19800.978865]  ? process_one_work+0x5a0/0x5a0
[19800.978867]  ? kthread_park+0x80/0x80
[19800.978870]  ret_from_fork+0x3a/0x50
[19800.978878] irq event stamp: 211500
[19800.978881] hardirqs last  enabled at (211499): [&lt;ffffffffbb1715db&gt=
;]
console_unlock+0x46b/0x5d0
[19800.978885] hardirqs last disabled at (211500): [&lt;ffffffffbb0038da&gt=
;]
trace_hardirqs_off_thunk+0x1a/0x20
[19800.978887] softirqs last  enabled at (211486): [&lt;ffffffffbbe0035d&gt=
;]
__do_softirq+0x35d/0x45d
[19800.978889] softirqs last disabled at (211479): [&lt;ffffffffbb0f20c7&gt=
;]
irq_exit+0xf7/0x100
[19800.978891] ---[ end trace 722d34fe8b4d4012 ]---
[19802.595549] amdgpu: [powerplay] No response from smu
[19804.214995] amdgpu: [powerplay] No response from smu
[19804.215000] amdgpu: [powerplay] Failed message: 0x4c, input parameter: 0=
x1,
error code: 0x0
[19805.837985] amdgpu: [powerplay] No response from smu
[19807.458610] amdgpu: [powerplay] No response from smu
[19807.458614] amdgpu: [powerplay] Failed message: 0x4c, input parameter: 0=
x3,
error code: 0x0
[19809.078189] amdgpu: [powerplay] No response from smu
[19810.698831] amdgpu: [powerplay] No response from smu
[19810.698835] amdgpu: [powerplay] Failed message: 0x9, input parameter: 0x=
f4,
error code: 0x0
[19812.321202] amdgpu: [powerplay] No response from smu
[19813.938039] amdgpu: [powerplay] No response from smu
[19813.938043] amdgpu: [powerplay] Failed message: 0xa, input parameter:
0xa0b000, error code: 0x0
[19815.558461] amdgpu: [powerplay] No response from smu
[19817.179965] amdgpu: [powerplay] No response from smu
[19817.179969] amdgpu: [powerplay] Failed message: 0xe, input parameter: 0x=
0,
error code: 0x0
[19818.790507] amdgpu: [powerplay] No response from smu
[19820.409551] amdgpu: [powerplay] No response from smu
[19820.409555] amdgpu: [powerplay] Failed message: 0x42, input parameter: 0=
x1,
error code: 0x0
[19822.030397] amdgpu: [powerplay] No response from smu
[19823.648860] amdgpu: [powerplay] No response from smu
[19823.648864] amdgpu: [powerplay] Failed message: 0x43, input parameter: 0=
x1,
error code: 0x0
[19825.269615] amdgpu: [powerplay] No response from smu
[19826.890755] amdgpu: [powerplay] No response from smu
[19826.890760] amdgpu: [powerplay] Failed message: 0x24, input parameter: 0=
x0,
error code: 0x0
[19826.907783] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19826.907789] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19826.907791] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19826.907793] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19826.907853] pcieport 0000:00:03.0: AER: Device recovery failed
[19826.925319] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19826.925325] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19826.925326] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19826.925328] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19826.925371] pcieport 0000:00:03.0: AER: Device recovery failed
[19826.942858] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19826.942863] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19826.942865] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19826.942867] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19826.942922] pcieport 0000:00:03.0: AER: Device recovery failed
[19826.960471] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19826.960477] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19826.960480] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19826.960483] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19826.960532] pcieport 0000:00:03.0: AER: Device recovery failed
[19826.977940] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19826.977945] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19826.977947] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19826.977949] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19826.977988] pcieport 0000:00:03.0: AER: Device recovery failed
[19826.995481] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19826.995486] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19826.995487] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19826.995489] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19826.995529] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.013021] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.013026] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.013027] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.013029] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.013091] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.030562] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.030567] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.030568] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.030570] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.030610] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.048102] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.048106] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.048108] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.048110] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.048148] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.065644] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.065648] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.065650] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.065652] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.065692] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.083183] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.083188] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.083190] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.083192] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.083231] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.100724] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.100729] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.100731] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.100732] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.100772] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.118264] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.118269] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.118270] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.118272] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.118310] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.135804] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.135809] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.135811] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.135812] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.135852] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.153345] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.153350] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.153352] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.153353] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.153393] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.170887] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.170892] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.170893] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.170895] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.170934] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.188426] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.188431] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.188433] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.188435] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.188473] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.205966] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.205971] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.205973] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.205974] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.206013] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.223507] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.223512] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.223514] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.223515] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.223554] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.241053] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.241058] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.241059] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.241061] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.241120] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.258589] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.258594] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.258595] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.258597] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.258637] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.276129] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.276134] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.276135] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.276137] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.276176] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.293670] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.293675] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.293676] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.293678] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.293718] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.311211] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.311215] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.311217] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.311219] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.311259] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.328751] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.328756] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.328758] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.328759] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.328800] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.346291] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.346295] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.346297] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.346299] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.346344] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.363831] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.363836] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.363838] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.363839] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.363886] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.381372] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.381376] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.381378] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.381380] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.381425] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.398913] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.398917] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.398919] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.398921] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.398959] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.416453] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.416458] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.416460] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.416467] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.416507] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.433994] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.433999] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.434001] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.434002] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.434042] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.451536] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.451542] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.451544] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.451545] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.451588] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.469085] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.469091] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.469092] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.469094] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.469136] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.486616] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.486626] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.486628] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.486630] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.486670] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.504161] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.504167] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.504170] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.504171] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.504218] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.521697] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.521702] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.521704] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.521706] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.521934] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.539242] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.539247] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.539249] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.539250] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.539290] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.556778] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.556782] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.556784] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.556786] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.556836] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.574325] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.574330] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.574332] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.574334] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.574373] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.591858] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.591863] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.591865] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.591867] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.591908] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.609401] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.609405] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.609407] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.609409] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.609448] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.626939] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.626944] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.626946] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.626947] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.626986] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.644481] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.644486] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.644488] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.644489] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.644528] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.662021] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.662026] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.662028] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.662029] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.662087] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.679561] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.679566] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.679568] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.679570] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.679608] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.697101] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.697106] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.697108] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.697110] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.697149] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.714648] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.714653] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.714655] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.714656] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.714703] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.732183] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.732188] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.732190] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.732191] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.732230] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.749724] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.749729] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.749730] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.749732] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.767327] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.767330] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.767335] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.767336] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.767338] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.767364] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.784805] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.784810] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.784812] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.784813] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.784853] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.802345] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.802350] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.802352] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.802354] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.802394] pcieport 0000:00:03.0: AER: Device recovery failed
[19827.819886] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[19827.819891] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[19827.819893] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[19827.819894] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[19827.819934] pcieport 0000:00:03.0: AER: Device recovery failed</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15740006793.f0F24F.25556--

--===============0792946836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0792946836==--
