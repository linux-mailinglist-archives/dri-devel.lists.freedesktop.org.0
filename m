Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F3EFBDBB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 02:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2216EEB8;
	Thu, 14 Nov 2019 01:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id EBB996EEB8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 01:54:28 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E801C720E2; Thu, 14 Nov 2019 01:54:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112266] [Navi] Pathfinder: Kingmaker is causing a GPU hang:
 flip_done timed out error
Date: Thu, 14 Nov 2019 01:54:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shtetldik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-112266-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1050725887=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1050725887==
Content-Type: multipart/alternative; boundary="15736964681.dE0Aa.2943"
Content-Transfer-Encoding: 7bit


--15736964681.dE0Aa.2943
Date: Thu, 14 Nov 2019 01:54:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112266

            Bug ID: 112266
           Summary: [Navi] Pathfinder: Kingmaker is causing a GPU hang:
                    flip_done timed out error
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: shtetldik@gmail.com

When running Pathfinder: Kingmaker (latest GOG release, which should be the
same as latest Steam one) on Sapphire Pulse RX 5700 XT, it's causing a weird
GPU hang with flip_done timed out error (see below for detailed log), that
doesn't look like the common shader hangs with ring gfx_0.0.0 timeout or co=
mmon
sdma hangs.

The game is using OpenGL, and I run the game on Debian testing, using this
configuration:

kernel: 5.4-rc7
radeonsi: Mesa-master / llvm10:

OpenGL renderer string: AMD NAVI10 (DRM 3.35.0, 5.4.0-rc7, LLVM 10.0.0)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 20.0.0-devel
(git-eb6352162d)

llvm: 10~+201911120943210600592dd459242
from this llvm10 snapshot:
https://tracker.debian.org/news/1079513/accepted-llvm-toolchain-snapshot-11=
0201911120943210600592dd459242-1exp1-source-into-experimental/


DE: KDE Plasma 5.14.5 (X session).
GPU: Sapphire Pulse RX 5700 XT
Monitor: LG 27GL85-B (2560x1440, 144 Hz, DisplayPort 1.4 connection, adapti=
ve
sync activated in Xorg configuration).

When launching, I'm using AMD_DEBUG=3Dnodma,nongg

Recording apitrace doesn't help, since replaying it is not reproducing the
hang. So it could be some amdgpu issue? Please let me know, what additional
info can be useful to help you narrow it down. However the hang is quite
reproducible, and you can try it yourself with Pathfinder: Kingmaker.

The hang produces this in dmesg:

[  659.445501] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CRTC:62:crtc-0] flip_done timed out
[  669.685601] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [PLANE:55:plane-5] flip_done timed out
[  669.685644] ------------[ cut here ]------------
[  669.685729] WARNING: CPU: 6 PID: 1018 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5851
amdgpu_dm_atomic_commit_tail+0x1c56/0x1d70 [amdgpu]
[  669.685730] Modules linked in: rfcomm(E) nf_tables(E) nfnetlink(E) bnep(=
E)
edac_mce_amd(E) kvm_amd(E) kvm(E) irqbypass(E) crct10dif_pclmul(E) btusb(E)
btrtl(E) snd_hda_codec_realtek(E) btbcm(E) crc32_pclmul(E) btintel(E) iwlmv=
m(E)
snd_hda_codec_generic(E) bluetooth(E) ghash_clmulni_intel(E) ledtrig_audio(=
E)
mac80211(E) libarc4(E) snd_hda_codec_hdmi(E) uvcvideo(E) snd_hda_intel(E)
videobuf2_vmalloc(E) snd_usb_audio(E) snd_intel_nhlt(E) videobuf2_memops(E)
drbg(E) snd_hda_codec(E) videobuf2_v4l2(E) snd_usbmidi_lib(E) iwlwifi(E)
nls_ascii(E) snd_hda_core(E) snd_rawmidi(E) videobuf2_common(E)
snd_seq_device(E) snd_hwdep(E) efi_pstore(E) nls_cp437(E) ansi_cprng(E)
snd_pcm(E) videodev(E) sp5100_tco(E) aesni_intel(E) cfg80211(E) vfat(E)
ecdh_generic(E) crypto_simd(E) ecc(E) snd_timer(E) fat(E) ccp(E) snd(E)
cryptd(E) mc(E) glue_helper(E) crc16(E) wmi_bmof(E) pcspkr(E) efivars(E)
k10temp(E) watchdog(E) sg(E) rfkill(E) soundcore(E) rng_core(E) evdev(E)
acpi_cpufreq(E) nct6775(E) hwmon_vid(E)
[  669.685753]  parport_pc(E) ppdev(E) lp(E) parport(E) efivarfs(E)
ip_tables(E) x_tables(E) autofs4(E) xfs(E) btrfs(E) xor(E) zstd_decompress(=
E)
zstd_compress(E) raid6_pq(E) libcrc32c(E) crc32c_generic(E) sd_mod(E)
hid_generic(E) usbhid(E) hid(E) amdgpu(E) gpu_sched(E) mxm_wmi(E) ahci(E)
ttm(E) libahci(E) drm_kms_helper(E) xhci_pci(E) crc32c_intel(E) xhci_hcd(E)
i2c_piix4(E) libata(E) drm(E) igb(E) dca(E) mfd_core(E) ptp(E) scsi_mod(E)
usbcore(E) pps_core(E) i2c_algo_bit(E) nvme(E) nvme_core(E) wmi(E) button(E)
[  669.685770] CPU: 6 PID: 1018 Comm: Xorg Tainted: G            E=20=20=20=
=20
5.4.0-rc7 #31
[  669.685771] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./X570 Taichi, BIOS P2.50 11/02/2019
[  669.685846] RIP: 0010:amdgpu_dm_atomic_commit_tail+0x1c56/0x1d70 [amdgpu]
[  669.685847] Code: 67 fb ff ff 41 8b 4c 24 60 48 c7 c2 60 d6 a2 c0 bf 02 =
00
00 00 48 c7 c6 80 f8 a9 c0 e8 e3 7d bb ff 49 8b 47 08 e9 31 e5 ff ff <0f> 0=
b e9
b4 ec ff ff 0f 0b 0f 0b e9 cb ec ff ff 48 8b 85 b0 fd ff
[  669.685848] RSP: 0018:ffffb80fc1a978d0 EFLAGS: 00010002
[  669.685849] RAX: 0000000000000002 RBX: ffff9454b5d54c00 RCX:
ffff9455ec2c6170
[  669.685850] RDX: 0000000000000001 RSI: 0000000000000206 RDI:
ffff9455eaba6158
[  669.685851] RBP: ffffb80fc1a97b80 R08: 0000000000000005 R09:
0000000000000000
[  669.685851] R10: ffffb80fc1a97838 R11: ffffb80fc1a9783c R12:
0000000000000206
[  669.685852] R13: ffff9455ec2c6000 R14: ffff94559d443800 R15:
ffff9455eda20000
[  669.685853] FS:  00007fc6a5a21f00(0000) GS:ffff9455fe980000(0000)
knlGS:0000000000000000
[  669.685854] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  669.685855] CR2: 00007fc6a5991678 CR3: 00000007f0390000 CR4:
0000000000340ee0
[  669.685856] Call Trace:
[  669.685864]  ? __irq_work_queue_local+0x50/0x60
[  669.685872]  ? commit_tail+0x94/0x110 [drm_kms_helper]
[  669.685878]  commit_tail+0x94/0x110 [drm_kms_helper]
[  669.685884]  drm_atomic_helper_commit+0xb8/0x130 [drm_kms_helper]
[  669.685889]  drm_atomic_helper_set_config+0x79/0x90 [drm_kms_helper]
[  669.685902]  drm_mode_setcrtc+0x194/0x6a0 [drm]
[  669.685956]  ? amdgpu_cs_wait_ioctl+0xeb/0x160 [amdgpu]
[  669.685966]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[  669.685976]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[  669.685986]  drm_ioctl+0x208/0x390 [drm]
[  669.685995]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[  669.686044]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[  669.686048]  do_vfs_ioctl+0x40e/0x670
[  669.686050]  ksys_ioctl+0x5e/0x90
[  669.686052]  __x64_sys_ioctl+0x16/0x20
[  669.686055]  do_syscall_64+0x52/0x160
[  669.686058]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  669.686060] RIP: 0033:0x7fc6a5f6a5b7
[  669.686061] Code: 00 00 90 48 8b 05 d9 78 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d a9 78 0c 00 f7 d8 64 89 01 48
[  669.686062] RSP: 002b:00007ffd36fb37a8 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[  669.686063] RAX: ffffffffffffffda RBX: 00007ffd36fb37e0 RCX:
00007fc6a5f6a5b7
[  669.686064] RDX: 00007ffd36fb37e0 RSI: 00000000c06864a2 RDI:
000000000000000d
[  669.686064] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
000055c668ad0740
[  669.686065] R10: 0000000000000000 R11: 0000000000003246 R12:
0000000000000000
[  669.686065] R13: 000000000000000d R14: 000055c668a607d0 R15:
0000000000000000
[  669.686067] ---[ end trace 47feccd771299f6b ]---
[  669.686082] ------------[ cut here ]------------
[  669.686158] WARNING: CPU: 6 PID: 1018 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5458
amdgpu_dm_atomic_commit_tail+0x1c5f/0x1d70 [amdgpu]
[  669.686158] Modules linked in: rfcomm(E) nf_tables(E) nfnetlink(E) bnep(=
E)
edac_mce_amd(E) kvm_amd(E) kvm(E) irqbypass(E) crct10dif_pclmul(E) btusb(E)
btrtl(E) snd_hda_codec_realtek(E) btbcm(E) crc32_pclmul(E) btintel(E) iwlmv=
m(E)
snd_hda_codec_generic(E) bluetooth(E) ghash_clmulni_intel(E) ledtrig_audio(=
E)
mac80211(E) libarc4(E) snd_hda_codec_hdmi(E) uvcvideo(E) snd_hda_intel(E)
videobuf2_vmalloc(E) snd_usb_audio(E) snd_intel_nhlt(E) videobuf2_memops(E)
drbg(E) snd_hda_codec(E) videobuf2_v4l2(E) snd_usbmidi_lib(E) iwlwifi(E)
nls_ascii(E) snd_hda_core(E) snd_rawmidi(E) videobuf2_common(E)
snd_seq_device(E) snd_hwdep(E) efi_pstore(E) nls_cp437(E) ansi_cprng(E)
snd_pcm(E) videodev(E) sp5100_tco(E) aesni_intel(E) cfg80211(E) vfat(E)
ecdh_generic(E) crypto_simd(E) ecc(E) snd_timer(E) fat(E) ccp(E) snd(E)
cryptd(E) mc(E) glue_helper(E) crc16(E) wmi_bmof(E) pcspkr(E) efivars(E)
k10temp(E) watchdog(E) sg(E) rfkill(E) soundcore(E) rng_core(E) evdev(E)
acpi_cpufreq(E) nct6775(E) hwmon_vid(E)
[  669.686175]  parport_pc(E) ppdev(E) lp(E) parport(E) efivarfs(E)
ip_tables(E) x_tables(E) autofs4(E) xfs(E) btrfs(E) xor(E) zstd_decompress(=
E)
zstd_compress(E) raid6_pq(E) libcrc32c(E) crc32c_generic(E) sd_mod(E)
hid_generic(E) usbhid(E) hid(E) amdgpu(E) gpu_sched(E) mxm_wmi(E) ahci(E)
ttm(E) libahci(E) drm_kms_helper(E) xhci_pci(E) crc32c_intel(E) xhci_hcd(E)
i2c_piix4(E) libata(E) drm(E) igb(E) dca(E) mfd_core(E) ptp(E) scsi_mod(E)
usbcore(E) pps_core(E) i2c_algo_bit(E) nvme(E) nvme_core(E) wmi(E) button(E)
[  669.686187] CPU: 6 PID: 1018 Comm: Xorg Tainted: G        W   E=20=20=20=
=20
5.4.0-rc7 #31
[  669.686187] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./X570 Taichi, BIOS P2.50 11/02/2019
[  669.686258] RIP: 0010:amdgpu_dm_atomic_commit_tail+0x1c5f/0x1d70 [amdgpu]
[  669.686259] Code: 48 c7 c2 60 d6 a2 c0 bf 02 00 00 00 48 c7 c6 80 f8 a9 =
c0
e8 e3 7d bb ff 49 8b 47 08 e9 31 e5 ff ff 0f 0b e9 b4 ec ff ff 0f 0b <0f> 0=
b e9
cb ec ff ff 48 8b 85 b0 fd ff ff 48 8d 8d 18 fe ff ff 48
[  669.686259] RSP: 0018:ffffb80fc1a978d0 EFLAGS: 00010082
[  669.686260] RAX: 0000000000000002 RBX: ffff9454b5d54c00 RCX:
ffff9455ec2c6170
[  669.686261] RDX: 0000000000000001 RSI: 0000000000000206 RDI:
ffff9455eaba6158
[  669.686261] RBP: ffffb80fc1a97b80 R08: 0000000000000005 R09:
0000000000000000
[  669.686262] R10: ffffb80fc1a97838 R11: ffffb80fc1a9783c R12:
0000000000000206
[  669.686263] R13: ffff9455ec2c6000 R14: ffff94559d443800 R15:
ffff9455eda20000
[  669.686264] FS:  00007fc6a5a21f00(0000) GS:ffff9455fe980000(0000)
knlGS:0000000000000000
[  669.686264] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  669.686265] CR2: 00007fc6a5991678 CR3: 00000007f0390000 CR4:
0000000000340ee0
[  669.686266] Call Trace:
[  669.686270]  ? __irq_work_queue_local+0x50/0x60
[  669.686277]  ? commit_tail+0x94/0x110 [drm_kms_helper]
[  669.686282]  commit_tail+0x94/0x110 [drm_kms_helper]
[  669.686288]  drm_atomic_helper_commit+0xb8/0x130 [drm_kms_helper]
[  669.686293]  drm_atomic_helper_set_config+0x79/0x90 [drm_kms_helper]
[  669.686304]  drm_mode_setcrtc+0x194/0x6a0 [drm]
[  669.686357]  ? amdgpu_cs_wait_ioctl+0xeb/0x160 [amdgpu]
[  669.686367]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[  669.686377]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[  669.686386]  drm_ioctl+0x208/0x390 [drm]
[  669.686396]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[  669.686445]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[  669.686447]  do_vfs_ioctl+0x40e/0x670
[  669.686449]  ksys_ioctl+0x5e/0x90
[  669.686451]  __x64_sys_ioctl+0x16/0x20
[  669.686453]  do_syscall_64+0x52/0x160
[  669.686454]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  669.686455] RIP: 0033:0x7fc6a5f6a5b7
[  669.686457] Code: 00 00 90 48 8b 05 d9 78 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d a9 78 0c 00 f7 d8 64 89 01 48
[  669.686457] RSP: 002b:00007ffd36fb37a8 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[  669.686458] RAX: ffffffffffffffda RBX: 00007ffd36fb37e0 RCX:
00007fc6a5f6a5b7
[  669.686459] RDX: 00007ffd36fb37e0 RSI: 00000000c06864a2 RDI:
000000000000000d
[  669.686459] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
000055c668ad0740
[  669.686460] R10: 0000000000000000 R11: 0000000000003246 R12:
0000000000000000
[  669.686461] R13: 000000000000000d R14: 000055c668a607d0 R15:
0000000000000000
[  669.686462] ---[ end trace 47feccd771299f6c ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15736964681.dE0Aa.2943
Date: Thu, 14 Nov 2019 01:54:28 +0000
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
   title=3D"NEW - [Navi] Pathfinder: Kingmaker is causing a GPU hang: flip_=
done timed out error"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112266">112266</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Navi] Pathfinder: Kingmaker is causing a GPU hang: flip_done=
 timed out error
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
          <td>shtetldik&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When running Pathfinder: Kingmaker (latest GOG release, which =
should be the
same as latest Steam one) on Sapphire Pulse RX 5700 XT, it's causing a weird
GPU hang with flip_done timed out error (see below for detailed log), that
doesn't look like the common shader hangs with ring gfx_0.0.0 timeout or co=
mmon
sdma hangs.

The game is using OpenGL, and I run the game on Debian testing, using this
configuration:

kernel: 5.4-rc7
radeonsi: Mesa-master / llvm10:

OpenGL renderer string: AMD NAVI10 (DRM 3.35.0, 5.4.0-rc7, LLVM 10.0.0)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 20.0.0-devel
(git-eb6352162d)

llvm: 10~+201911120943210600592dd459242
from this llvm10 snapshot:
<a href=3D"https://tracker.debian.org/news/1079513/accepted-llvm-toolchain-=
snapshot-110201911120943210600592dd459242-1exp1-source-into-experimental/">=
https://tracker.debian.org/news/1079513/accepted-llvm-toolchain-snapshot-11=
0201911120943210600592dd459242-1exp1-source-into-experimental/</a>


DE: KDE Plasma 5.14.5 (X session).
GPU: Sapphire Pulse RX 5700 XT
Monitor: LG 27GL85-B (2560x1440, 144 Hz, DisplayPort 1.4 connection, adapti=
ve
sync activated in Xorg configuration).

When launching, I'm using AMD_DEBUG=3Dnodma,nongg

Recording apitrace doesn't help, since replaying it is not reproducing the
hang. So it could be some amdgpu issue? Please let me know, what additional
info can be useful to help you narrow it down. However the hang is quite
reproducible, and you can try it yourself with Pathfinder: Kingmaker.

The hang produces this in dmesg:

[  659.445501] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CRTC:62:crtc-0] flip_done timed out
[  669.685601] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [PLANE:55:plane-5] flip_done timed out
[  669.685644] ------------[ cut here ]------------
[  669.685729] WARNING: CPU: 6 PID: 1018 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5851
amdgpu_dm_atomic_commit_tail+0x1c56/0x1d70 [amdgpu]
[  669.685730] Modules linked in: rfcomm(E) nf_tables(E) nfnetlink(E) bnep(=
E)
edac_mce_amd(E) kvm_amd(E) kvm(E) irqbypass(E) crct10dif_pclmul(E) btusb(E)
btrtl(E) snd_hda_codec_realtek(E) btbcm(E) crc32_pclmul(E) btintel(E) iwlmv=
m(E)
snd_hda_codec_generic(E) bluetooth(E) ghash_clmulni_intel(E) ledtrig_audio(=
E)
mac80211(E) libarc4(E) snd_hda_codec_hdmi(E) uvcvideo(E) snd_hda_intel(E)
videobuf2_vmalloc(E) snd_usb_audio(E) snd_intel_nhlt(E) videobuf2_memops(E)
drbg(E) snd_hda_codec(E) videobuf2_v4l2(E) snd_usbmidi_lib(E) iwlwifi(E)
nls_ascii(E) snd_hda_core(E) snd_rawmidi(E) videobuf2_common(E)
snd_seq_device(E) snd_hwdep(E) efi_pstore(E) nls_cp437(E) ansi_cprng(E)
snd_pcm(E) videodev(E) sp5100_tco(E) aesni_intel(E) cfg80211(E) vfat(E)
ecdh_generic(E) crypto_simd(E) ecc(E) snd_timer(E) fat(E) ccp(E) snd(E)
cryptd(E) mc(E) glue_helper(E) crc16(E) wmi_bmof(E) pcspkr(E) efivars(E)
k10temp(E) watchdog(E) sg(E) rfkill(E) soundcore(E) rng_core(E) evdev(E)
acpi_cpufreq(E) nct6775(E) hwmon_vid(E)
[  669.685753]  parport_pc(E) ppdev(E) lp(E) parport(E) efivarfs(E)
ip_tables(E) x_tables(E) autofs4(E) xfs(E) btrfs(E) xor(E) zstd_decompress(=
E)
zstd_compress(E) raid6_pq(E) libcrc32c(E) crc32c_generic(E) sd_mod(E)
hid_generic(E) usbhid(E) hid(E) amdgpu(E) gpu_sched(E) mxm_wmi(E) ahci(E)
ttm(E) libahci(E) drm_kms_helper(E) xhci_pci(E) crc32c_intel(E) xhci_hcd(E)
i2c_piix4(E) libata(E) drm(E) igb(E) dca(E) mfd_core(E) ptp(E) scsi_mod(E)
usbcore(E) pps_core(E) i2c_algo_bit(E) nvme(E) nvme_core(E) wmi(E) button(E)
[  669.685770] CPU: 6 PID: 1018 Comm: Xorg Tainted: G            E=20=20=20=
=20
5.4.0-rc7 #31
[  669.685771] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./X570 Taichi, BIOS P2.50 11/02/2019
[  669.685846] RIP: 0010:amdgpu_dm_atomic_commit_tail+0x1c56/0x1d70 [amdgpu]
[  669.685847] Code: 67 fb ff ff 41 8b 4c 24 60 48 c7 c2 60 d6 a2 c0 bf 02 =
00
00 00 48 c7 c6 80 f8 a9 c0 e8 e3 7d bb ff 49 8b 47 08 e9 31 e5 ff ff &lt;0f=
&gt; 0b e9
b4 ec ff ff 0f 0b 0f 0b e9 cb ec ff ff 48 8b 85 b0 fd ff
[  669.685848] RSP: 0018:ffffb80fc1a978d0 EFLAGS: 00010002
[  669.685849] RAX: 0000000000000002 RBX: ffff9454b5d54c00 RCX:
ffff9455ec2c6170
[  669.685850] RDX: 0000000000000001 RSI: 0000000000000206 RDI:
ffff9455eaba6158
[  669.685851] RBP: ffffb80fc1a97b80 R08: 0000000000000005 R09:
0000000000000000
[  669.685851] R10: ffffb80fc1a97838 R11: ffffb80fc1a9783c R12:
0000000000000206
[  669.685852] R13: ffff9455ec2c6000 R14: ffff94559d443800 R15:
ffff9455eda20000
[  669.685853] FS:  00007fc6a5a21f00(0000) GS:ffff9455fe980000(0000)
knlGS:0000000000000000
[  669.685854] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  669.685855] CR2: 00007fc6a5991678 CR3: 00000007f0390000 CR4:
0000000000340ee0
[  669.685856] Call Trace:
[  669.685864]  ? __irq_work_queue_local+0x50/0x60
[  669.685872]  ? commit_tail+0x94/0x110 [drm_kms_helper]
[  669.685878]  commit_tail+0x94/0x110 [drm_kms_helper]
[  669.685884]  drm_atomic_helper_commit+0xb8/0x130 [drm_kms_helper]
[  669.685889]  drm_atomic_helper_set_config+0x79/0x90 [drm_kms_helper]
[  669.685902]  drm_mode_setcrtc+0x194/0x6a0 [drm]
[  669.685956]  ? amdgpu_cs_wait_ioctl+0xeb/0x160 [amdgpu]
[  669.685966]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[  669.685976]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[  669.685986]  drm_ioctl+0x208/0x390 [drm]
[  669.685995]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[  669.686044]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[  669.686048]  do_vfs_ioctl+0x40e/0x670
[  669.686050]  ksys_ioctl+0x5e/0x90
[  669.686052]  __x64_sys_ioctl+0x16/0x20
[  669.686055]  do_syscall_64+0x52/0x160
[  669.686058]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  669.686060] RIP: 0033:0x7fc6a5f6a5b7
[  669.686061] Code: 00 00 90 48 8b 05 d9 78 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d a9 78 0c 00 f7 d8 64 89 01 48
[  669.686062] RSP: 002b:00007ffd36fb37a8 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[  669.686063] RAX: ffffffffffffffda RBX: 00007ffd36fb37e0 RCX:
00007fc6a5f6a5b7
[  669.686064] RDX: 00007ffd36fb37e0 RSI: 00000000c06864a2 RDI:
000000000000000d
[  669.686064] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
000055c668ad0740
[  669.686065] R10: 0000000000000000 R11: 0000000000003246 R12:
0000000000000000
[  669.686065] R13: 000000000000000d R14: 000055c668a607d0 R15:
0000000000000000
[  669.686067] ---[ end trace 47feccd771299f6b ]---
[  669.686082] ------------[ cut here ]------------
[  669.686158] WARNING: CPU: 6 PID: 1018 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5458
amdgpu_dm_atomic_commit_tail+0x1c5f/0x1d70 [amdgpu]
[  669.686158] Modules linked in: rfcomm(E) nf_tables(E) nfnetlink(E) bnep(=
E)
edac_mce_amd(E) kvm_amd(E) kvm(E) irqbypass(E) crct10dif_pclmul(E) btusb(E)
btrtl(E) snd_hda_codec_realtek(E) btbcm(E) crc32_pclmul(E) btintel(E) iwlmv=
m(E)
snd_hda_codec_generic(E) bluetooth(E) ghash_clmulni_intel(E) ledtrig_audio(=
E)
mac80211(E) libarc4(E) snd_hda_codec_hdmi(E) uvcvideo(E) snd_hda_intel(E)
videobuf2_vmalloc(E) snd_usb_audio(E) snd_intel_nhlt(E) videobuf2_memops(E)
drbg(E) snd_hda_codec(E) videobuf2_v4l2(E) snd_usbmidi_lib(E) iwlwifi(E)
nls_ascii(E) snd_hda_core(E) snd_rawmidi(E) videobuf2_common(E)
snd_seq_device(E) snd_hwdep(E) efi_pstore(E) nls_cp437(E) ansi_cprng(E)
snd_pcm(E) videodev(E) sp5100_tco(E) aesni_intel(E) cfg80211(E) vfat(E)
ecdh_generic(E) crypto_simd(E) ecc(E) snd_timer(E) fat(E) ccp(E) snd(E)
cryptd(E) mc(E) glue_helper(E) crc16(E) wmi_bmof(E) pcspkr(E) efivars(E)
k10temp(E) watchdog(E) sg(E) rfkill(E) soundcore(E) rng_core(E) evdev(E)
acpi_cpufreq(E) nct6775(E) hwmon_vid(E)
[  669.686175]  parport_pc(E) ppdev(E) lp(E) parport(E) efivarfs(E)
ip_tables(E) x_tables(E) autofs4(E) xfs(E) btrfs(E) xor(E) zstd_decompress(=
E)
zstd_compress(E) raid6_pq(E) libcrc32c(E) crc32c_generic(E) sd_mod(E)
hid_generic(E) usbhid(E) hid(E) amdgpu(E) gpu_sched(E) mxm_wmi(E) ahci(E)
ttm(E) libahci(E) drm_kms_helper(E) xhci_pci(E) crc32c_intel(E) xhci_hcd(E)
i2c_piix4(E) libata(E) drm(E) igb(E) dca(E) mfd_core(E) ptp(E) scsi_mod(E)
usbcore(E) pps_core(E) i2c_algo_bit(E) nvme(E) nvme_core(E) wmi(E) button(E)
[  669.686187] CPU: 6 PID: 1018 Comm: Xorg Tainted: G        W   E=20=20=20=
=20
5.4.0-rc7 #31
[  669.686187] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./X570 Taichi, BIOS P2.50 11/02/2019
[  669.686258] RIP: 0010:amdgpu_dm_atomic_commit_tail+0x1c5f/0x1d70 [amdgpu]
[  669.686259] Code: 48 c7 c2 60 d6 a2 c0 bf 02 00 00 00 48 c7 c6 80 f8 a9 =
c0
e8 e3 7d bb ff 49 8b 47 08 e9 31 e5 ff ff 0f 0b e9 b4 ec ff ff 0f 0b &lt;0f=
&gt; 0b e9
cb ec ff ff 48 8b 85 b0 fd ff ff 48 8d 8d 18 fe ff ff 48
[  669.686259] RSP: 0018:ffffb80fc1a978d0 EFLAGS: 00010082
[  669.686260] RAX: 0000000000000002 RBX: ffff9454b5d54c00 RCX:
ffff9455ec2c6170
[  669.686261] RDX: 0000000000000001 RSI: 0000000000000206 RDI:
ffff9455eaba6158
[  669.686261] RBP: ffffb80fc1a97b80 R08: 0000000000000005 R09:
0000000000000000
[  669.686262] R10: ffffb80fc1a97838 R11: ffffb80fc1a9783c R12:
0000000000000206
[  669.686263] R13: ffff9455ec2c6000 R14: ffff94559d443800 R15:
ffff9455eda20000
[  669.686264] FS:  00007fc6a5a21f00(0000) GS:ffff9455fe980000(0000)
knlGS:0000000000000000
[  669.686264] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  669.686265] CR2: 00007fc6a5991678 CR3: 00000007f0390000 CR4:
0000000000340ee0
[  669.686266] Call Trace:
[  669.686270]  ? __irq_work_queue_local+0x50/0x60
[  669.686277]  ? commit_tail+0x94/0x110 [drm_kms_helper]
[  669.686282]  commit_tail+0x94/0x110 [drm_kms_helper]
[  669.686288]  drm_atomic_helper_commit+0xb8/0x130 [drm_kms_helper]
[  669.686293]  drm_atomic_helper_set_config+0x79/0x90 [drm_kms_helper]
[  669.686304]  drm_mode_setcrtc+0x194/0x6a0 [drm]
[  669.686357]  ? amdgpu_cs_wait_ioctl+0xeb/0x160 [amdgpu]
[  669.686367]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[  669.686377]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[  669.686386]  drm_ioctl+0x208/0x390 [drm]
[  669.686396]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[  669.686445]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[  669.686447]  do_vfs_ioctl+0x40e/0x670
[  669.686449]  ksys_ioctl+0x5e/0x90
[  669.686451]  __x64_sys_ioctl+0x16/0x20
[  669.686453]  do_syscall_64+0x52/0x160
[  669.686454]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  669.686455] RIP: 0033:0x7fc6a5f6a5b7
[  669.686457] Code: 00 00 90 48 8b 05 d9 78 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d a9 78 0c 00 f7 d8 64 89 01 48
[  669.686457] RSP: 002b:00007ffd36fb37a8 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[  669.686458] RAX: ffffffffffffffda RBX: 00007ffd36fb37e0 RCX:
00007fc6a5f6a5b7
[  669.686459] RDX: 00007ffd36fb37e0 RSI: 00000000c06864a2 RDI:
000000000000000d
[  669.686459] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
000055c668ad0740
[  669.686460] R10: 0000000000000000 R11: 0000000000003246 R12:
0000000000000000
[  669.686461] R13: 000000000000000d R14: 000055c668a607d0 R15:
0000000000000000
[  669.686462] ---[ end trace 47feccd771299f6c ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15736964681.dE0Aa.2943--

--===============1050725887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1050725887==--
