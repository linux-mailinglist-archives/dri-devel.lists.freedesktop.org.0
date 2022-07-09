Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D39856C942
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 13:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D32E112DFC;
	Sat,  9 Jul 2022 11:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981FB112DFC
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 11:49:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 22D3060F2D
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 11:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 767A3C3411C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 11:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657367380;
 bh=X+cXVDIN9cIW/dTZzZZIZfopeVZyjvF6NMSrimDgvoo=;
 h=From:To:Subject:Date:From;
 b=Nh2yV8eShJtnA8F2TS4LnedfhPU11ZPELMtsP5c2aF0eAYoiioRiy6abjw3M56THn
 7zO9hs6DQG9cwtge2wmu4upnKNHYRAf3fCN6u/KSN2Lg2m2KVtWqDJkxIByTqZC1xG
 r++nzzni2fmphDsXX4tvuGY20RFAyzb8xgtbyJ0fnFpIa9N64uZWEt1a+1bedwPALP
 2q58uU81LPb+hIotnGAW9b0dkN6UQIdsBkAW1LsHbFTweQ8M0fZUYPNf2ndPWwiLKq
 Yoa/G0pDfvvXPd56P04YW82qDojNaDozeblI154qyXbxXmizxEZVOOz5Nhw7PzH3aQ
 M6v/Ddg9kFGUw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5CAD7CC13B1; Sat,  9 Jul 2022 11:49:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216226] New: [amdgpu] BUG: kernel NULL pointer dereference
Date: Sat, 09 Jul 2022 11:49:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216226-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216226

            Bug ID: 216226
           Summary: [amdgpu] BUG: kernel NULL pointer dereference
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.19.0-rc5-next-20220708
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: spasswolf@web.de
        Regression: No

A very simple hsa test program triggers a NULL pointer dereference when ope=
ning
/dev/kdf.
Program:

#include <stdlib.h>
#include <stdio.h>
#include <hsakmt.h>
#include <hsakmttypes.h>

int main()
{

        HSAKMT_STATUS ret;

        ret =3D hsaKmtOpenKFD();
        if (ret !=3D HSAKMT_STATUS_SUCCESS) {
                printf("hsaKmtOpenKDF failed with status %d\n", ret);
        }

        /* If the NULL pointer dereference is triggered, it is triggered by
hsaKmtOpenKFD */

        ret =3D hsaKmtCloseKFD();
        if (ret !=3D HSAKMT_STATUS_SUCCESS) {
                printf("hsaKmtClosesKDF failed with status %d\n", ret);
        }

        return 0;
}

Version of libhsakmt:
5.2.0+dfsg-1 (from the debian sid repository)
The test program does not trigger any error with linux-5.18.5.

Error message:
Jul  9 10:39:32 lisa kernel: [   35.814297] ------------[ cut here
]------------
Jul  9 10:39:32 lisa kernel: [   35.814298] WARNING: CPU: 8 PID: 126 at
drivers/gpu/drm/ttm/ttm_bo.c:704 ttm_bo_unpin+0x5a/0x70 [ttm]
Jul  9 10:39:32 lisa kernel: [   35.814307] Modules linked in: ccm(EN)
rfcomm(EN) bnep(EN) cpufreq_conservative(EN) cpufreq_ondemand(EN)
cpufreq_powersave(EN) cpufreq_userspace(EN) snd_ctl_led(EN) btusb(EN) btrtl=
(EN)
snd_hda_codec_realtek(EN) btbcm(EN) btintel(EN) btmtk(EN)
snd_hda_codec_generic(EN) ledtrig_audio(EN) bluetooth(EN)
snd_hda_codec_hdmi(EN) snd_hda_intel(EN) snd_soc_dmic(EN) snd_intel_dspcfg(=
EN)
snd_acp3x_rn(EN) snd_acp3x_pdm_dma(EN) snd_hda_codec(EN) jitterentropy_rng(=
EN)
snd_soc_core(EN) uvcvideo(EN) snd_hwdep(EN) snd_hda_core(EN)
videobuf2_vmalloc(EN) snd_pcm_oss(EN) videobuf2_memops(EN) sha512_generic(E=
N)
videobuf2_v4l2(EN) nls_ascii(EN) snd_mixer_oss(EN) nls_cp437(EN) videodev(E=
N)
ccp(EN) snd_rn_pci_acp3x(EN) snd_pcm(EN) joydev(EN) snd_acp_config(EN)
msi_wmi(EN) vfat(EN) snd_timer(EN) ctr(EN) drbg(EN) snd(EN) ecdh_generic(EN)
evdev(EN) sparse_keymap(EN) wmi_bmof(EN) fat(EN) ecc(EN) videobuf2_common(E=
N)
serio_raw(EN) hid_multitouch(EN) soundcore(EN) snd_soc_acpi(EN) efi_pstore(=
EN)
rng_core(EN)
Jul  9 10:39:32 lisa kernel: [   35.814329]  k10temp(EN) battery(EN) wmi(EN)
ac(EN) button(EN) video(EN) hid_sensor_accel_3d(EN) hid_sensor_magn_3d(EN)
hid_sensor_prox(EN) hid_sensor_als(EN) hid_sensor_gyro_3d(EN)
hid_sensor_trigger(EN) industrialio_triggered_buffer(EN) kfifo_buf(EN)
industrialio(EN) hid_sensor_iio_common(EN) amd_pmc(EN) acpi_cpufreq(EN)
mt7921e(EN) mt7921_common(EN) mt76_connac_lib(EN) mt76(EN) mac80211(EN)
libarc4(EN) cfg80211(EN) rfkill(EN) ipmi_devintf(EN) ipmi_msghandler(EN)
msr(EN) fuse(EN) configfs(EN) efivarfs(EN) autofs4(EN) ext4(EN)
crc32c_generic(EN) crc32c_intel(EN) crc16(EN) mbcache(EN) jbd2(EN) usbhid(E=
N)
amdgpu(EN) drm_ttm_helper(EN) ttm(EN) gpu_sched(EN) i2c_algo_bit(EN)
drm_buddy(EN) drm_display_helper(EN) nvme(EN) xhci_pci(EN) drm_kms_helper(E=
N)
xhci_hcd(EN) nvme_core(EN) r8169(EN) syscopyarea(EN) sysfillrect(EN)
hid_sensor_hub(EN) sysimgblt(EN) t10_pi(EN) mfd_core(EN) fb_sys_fops(EN)
hid_generic(EN) drm(EN) usbcore(EN) realtek(EN) i2c_hid_acpi(EN)
mdio_devres(EN) psmouse(EN)
Jul  9 10:39:32 lisa kernel: [   35.814352]  i2c_hid(EN) amd_sfh(EN) libphy=
(EN)
crc64_rocksoft(EN) hid(EN) backlight(EN) crc64(EN) crc_t10dif(EN) i2c_piix4=
(EN)
cec(EN) usb_common(EN) crct10dif_generic(EN) crct10dif_common(EN)
i2c_designware_platform(EN) i2c_designware_core(EN)
Jul  9 10:39:32 lisa kernel: [   35.814359] CPU: 8 PID: 126 Comm: kworker/8=
:1
Tainted: G        W   E    N 5.19.0-rc5-next-20220708 #89
Jul  9 10:39:32 lisa kernel: [   35.814361] Hardware name: Micro-Star
International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.107 11/10/2021
Jul  9 10:39:32 lisa kernel: [   35.814362] Workqueue: kfd_process_wq
kfd_process_wq_release [amdgpu]
Jul  9 10:39:32 lisa kernel: [   35.814479] RIP: 0010:ttm_bo_unpin+0x5a/0x70
[ttm]
Jul  9 10:39:32 lisa kernel: [   35.814485] Code: 00 00 83 ab 8c 01 00 00 0=
1 48
85 ff 74 08 48 89 de e8 5a 44 00 00 48 8b bb 38 01 00 00 5b 48 81 c7 20 08 =
00
00 e9 f6 a6 18 c5 <0f> 0b 5b c3 0f 0b eb ac 66 66 2e 0f 1f 84 00 00 00 00 0=
0 0f
1f 00
Jul  9 10:39:32 lisa kernel: [   35.814486] RSP: 0018:ffffb06b005cfd00 EFLA=
GS:
00010246
Jul  9 10:39:32 lisa kernel: [   35.814487] RAX: 0000000000000000 RBX:
ffff911c2410ac58 RCX: 0000000000000000
Jul  9 10:39:32 lisa kernel: [   35.814488] RDX: ffff911bed7acc40 RSI:
0000000000000000 RDI: ffff911c2410ac58
Jul  9 10:39:32 lisa kernel: [   35.814489] RBP: ffff911c2410ac00 R08:
ffff911be0da5d68 R09: ffff911be0da5d68
Jul  9 10:39:32 lisa kernel: [   35.814490] R10: ffff911bc7fb7140 R11:
0000000000000001 R12: ffff911be0da5128
Jul  9 10:39:32 lisa kernel: [   35.814490] R13: ffff911c2410ac00 R14:
ffff911bd83be800 R15: ffffd06aff804b05
Jul  9 10:39:32 lisa kernel: [   35.814491] FS:  0000000000000000(0000)
GS:ffff911e9e800000(0000) knlGS:0000000000000000
Jul  9 10:39:32 lisa kernel: [   35.814492] CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jul  9 10:39:32 lisa kernel: [   35.814493] CR2: 000055704d312208 CR3:
000000012ce10000 CR4: 0000000000750ee0
Jul  9 10:39:32 lisa kernel: [   35.814493] PKRU: 55555554
Jul  9 10:39:32 lisa kernel: [   35.814494] Call Trace:
Jul  9 10:39:32 lisa kernel: [   35.814495]  <TASK>
Jul  9 10:39:32 lisa kernel: [   35.814497]  amdgpu_bo_unpin+0x15/0x80 [amd=
gpu]
Jul  9 10:39:32 lisa kernel: [   35.814586]=20
amdgpu_amdkfd_gpuvm_free_memory_of_gpu+0x350/0x420 [amdgpu]
Jul  9 10:39:32 lisa kernel: [   35.814691]=20
kfd_process_device_free_bos+0x98/0xe0 [amdgpu]
Jul  9 10:39:32 lisa kernel: [   35.814786]  kfd_process_wq_release+0x27f/0=
x340
[amdgpu]
Jul  9 10:39:32 lisa kernel: [   35.814876]  process_one_work+0x1bd/0x310
Jul  9 10:39:32 lisa kernel: [   35.814880]  ? rescuer_thread+0x390/0x390
Jul  9 10:39:32 lisa kernel: [   35.814881]  worker_thread+0x4b/0x390
Jul  9 10:39:32 lisa kernel: [   35.814883]  ? rescuer_thread+0x390/0x390
Jul  9 10:39:32 lisa kernel: [   35.814884]  kthread+0xd4/0x100
Jul  9 10:39:32 lisa kernel: [   35.814886]  ?
kthread_complete_and_exit+0x20/0x20
Jul  9 10:39:32 lisa kernel: [   35.814888]  ret_from_fork+0x22/0x30
Jul  9 10:39:32 lisa kernel: [   35.814891]  </TASK>
Jul  9 10:39:32 lisa kernel: [   35.814891] ---[ end trace 0000000000000000
]---
Jul  9 10:39:33 lisa kernel: [   35.816088] BUG: kernel NULL pointer
dereference, address: 0000000000000008
Jul  9 10:39:33 lisa kernel: [   35.816091] #PF: supervisor read access in
kernel mode
Jul  9 10:39:33 lisa kernel: [   35.816093] #PF: error_code(0x0000) -
not-present page
Jul  9 10:39:33 lisa kernel: [   35.816095] PGD 0 P4D 0=20
Jul  9 10:39:33 lisa kernel: [   35.816097] Oops: 0000 [#1] PREEMPT SMP NOP=
TI
Jul  9 10:39:33 lisa kernel: [   35.816100] CPU: 8 PID: 126 Comm: kworker/8=
:1
Tainted: G        W   E    N 5.19.0-rc5-next-20220708 #89
Jul  9 10:39:33 lisa kernel: [   35.816103] Hardware name: Micro-Star
International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.107 11/10/2021
Jul  9 10:39:33 lisa kernel: [   35.816104] Workqueue: events delayed_fput
Jul  9 10:39:33 lisa kernel: [   35.816107] RIP:
0010:dma_resv_add_fence+0x3e/0x1a0
Jul  9 10:39:33 lisa kernel: [   35.816112] Code: 89 54 24 04 48 85 f6 74 2=
1 48
8d 7e 38 b8 01 00 00 00 f0 0f c1 46 38 85 c0 0f 84 0e 01 00 00 8d 50 01 09 =
c2
0f 88 12 01 00 00 <49> 8b 46 08 48 3d 80 0a ad 85 0f 84 ec 00 00 00 48 3d 2=
0 0a
ad 85
Jul  9 10:39:33 lisa kernel: [   35.816114] RSP: 0018:ffffb06b005cfc98 EFLA=
GS:
00010246
Jul  9 10:39:33 lisa kernel: [   35.816116] RAX: 0000000000000000 RBX:
ffff911bd03a8158 RCX: 0000000080200013
Jul  9 10:39:33 lisa kernel: [   35.816117] RDX: 0000000000000001 RSI:
0000000000000000 RDI: ffff911bd03a8158
Jul  9 10:39:33 lisa kernel: [   35.816119] RBP: ffff911bd03a8000 R08:
0000000000000000 R09: 0000000000000000
Jul  9 10:39:33 lisa kernel: [   35.816120] R10: ffff911bc7916900 R11:
0000000000000000 R12: ffff911bd0499400
Jul  9 10:39:33 lisa kernel: [   35.816121] R13: ffff911be09e5128 R14:
0000000000000000 R15: 00000000c0991f00
Jul  9 10:39:33 lisa kernel: [   35.816122] FS:  0000000000000000(0000)
GS:ffff911e9e800000(0000) knlGS:0000000000000000
Jul  9 10:39:33 lisa kernel: [   35.816124] CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jul  9 10:39:33 lisa kernel: [   35.816125] CR2: 0000000000000008 CR3:
000000010409c000 CR4: 0000000000750ee0
Jul  9 10:39:33 lisa kernel: [   35.816127] PKRU: 55555554
Jul  9 10:39:33 lisa kernel: [   35.816128] Call Trace:
Jul  9 10:39:33 lisa kernel: [   35.816129]  <TASK>
Jul  9 10:39:33 lisa kernel: [   35.816131]=20
amdgpu_amdkfd_gpuvm_destroy_cb+0x53/0x1c0 [amdgpu]
Jul  9 10:39:33 lisa kernel: [   35.816223]  amdgpu_vm_fini+0x39/0x4e0 [amd=
gpu]
Jul  9 10:39:33 lisa kernel: [   35.816295]  ?
amdgpu_ctx_mgr_entity_fini+0x4b/0xd0 [amdgpu]
Jul  9 10:39:33 lisa kernel: [   35.816366]=20
amdgpu_driver_postclose_kms+0x1cb/0x2b0 [amdgpu]
Jul  9 10:39:33 lisa kernel: [   35.816433]  drm_file_free.part.0+0x201/0x2=
50
[drm]
Jul  9 10:39:33 lisa kernel: [   35.816448]  drm_release+0x60/0x110 [drm]
Jul  9 10:39:33 lisa kernel: [   35.816459]  __fput+0x87/0x240
Jul  9 10:39:33 lisa kernel: [   35.816461]  delayed_fput+0x1a/0x30
Jul  9 10:39:33 lisa kernel: [   35.816462]  process_one_work+0x1bd/0x310
Jul  9 10:39:33 lisa kernel: [   35.816464]  ? rescuer_thread+0x390/0x390
Jul  9 10:39:33 lisa kernel: [   35.816465]  worker_thread+0x4b/0x390
Jul  9 10:39:33 lisa kernel: [   35.816466]  ? rescuer_thread+0x390/0x390
Jul  9 10:39:33 lisa kernel: [   35.816467]  kthread+0xd4/0x100
Jul  9 10:39:33 lisa kernel: [   35.816469]  ?
kthread_complete_and_exit+0x20/0x20
Jul  9 10:39:33 lisa kernel: [   35.816471]  ret_from_fork+0x22/0x30
Jul  9 10:39:33 lisa kernel: [   35.816473]  </TASK>
Jul  9 10:39:33 lisa kernel: [   35.816473] Modules linked in: ccm(EN)
rfcomm(EN) bnep(EN) cpufreq_conservative(EN) cpufreq_ondemand(EN)
cpufreq_powersave(EN) cpufreq_userspace(EN) snd_ctl_led(EN) btusb(EN) btrtl=
(EN)
snd_hda_codec_realtek(EN) btbcm(EN) btintel(EN) btmtk(EN)
snd_hda_codec_generic(EN) ledtrig_audio(EN) bluetooth(EN)
snd_hda_codec_hdmi(EN) snd_hda_intel(EN) snd_soc_dmic(EN) snd_intel_dspcfg(=
EN)
snd_acp3x_rn(EN) snd_acp3x_pdm_dma(EN) snd_hda_codec(EN) jitterentropy_rng(=
EN)
snd_soc_core(EN) uvcvideo(EN) snd_hwdep(EN) snd_hda_core(EN)
videobuf2_vmalloc(EN) snd_pcm_oss(EN) videobuf2_memops(EN) sha512_generic(E=
N)
videobuf2_v4l2(EN) nls_ascii(EN) snd_mixer_oss(EN) nls_cp437(EN) videodev(E=
N)
ccp(EN) snd_rn_pci_acp3x(EN) snd_pcm(EN) joydev(EN) snd_acp_config(EN)
msi_wmi(EN) vfat(EN) snd_timer(EN) ctr(EN) drbg(EN) snd(EN) ecdh_generic(EN)
evdev(EN) sparse_keymap(EN) wmi_bmof(EN) fat(EN) ecc(EN) videobuf2_common(E=
N)
serio_raw(EN) hid_multitouch(EN) soundcore(EN) snd_soc_acpi(EN) efi_pstore(=
EN)
rng_core(EN)
Jul  9 10:39:33 lisa kernel: [   35.816495]  k10temp(EN) battery(EN) wmi(EN)
ac(EN) button(EN) video(EN) hid_sensor_accel_3d(EN) hid_sensor_magn_3d(EN)
hid_sensor_prox(EN) hid_sensor_als(EN) hid_sensor_gyro_3d(EN)
hid_sensor_trigger(EN) industrialio_triggered_buffer(EN) kfifo_buf(EN)
industrialio(EN) hid_sensor_iio_common(EN) amd_pmc(EN) acpi_cpufreq(EN)
mt7921e(EN) mt7921_common(EN) mt76_connac_lib(EN) mt76(EN) mac80211(EN)
libarc4(EN) cfg80211(EN) rfkill(EN) ipmi_devintf(EN) ipmi_msghandler(EN)
msr(EN) fuse(EN) configfs(EN) efivarfs(EN) autofs4(EN) ext4(EN)
crc32c_generic(EN) crc32c_intel(EN) crc16(EN) mbcache(EN) jbd2(EN) usbhid(E=
N)
amdgpu(EN) drm_ttm_helper(EN) ttm(EN) gpu_sched(EN) i2c_algo_bit(EN)
drm_buddy(EN) drm_display_helper(EN) nvme(EN) xhci_pci(EN) drm_kms_helper(E=
N)
xhci_hcd(EN) nvme_core(EN) r8169(EN) syscopyarea(EN) sysfillrect(EN)
hid_sensor_hub(EN) sysimgblt(EN) t10_pi(EN) mfd_core(EN) fb_sys_fops(EN)
hid_generic(EN) drm(EN) usbcore(EN) realtek(EN) i2c_hid_acpi(EN)
mdio_devres(EN) psmouse(EN)
Jul  9 10:39:33 lisa kernel: [   35.816516]  i2c_hid(EN) amd_sfh(EN) libphy=
(EN)
crc64_rocksoft(EN) hid(EN) backlight(EN) crc64(EN) crc_t10dif(EN) i2c_piix4=
(EN)
cec(EN) usb_common(EN) crct10dif_generic(EN) crct10dif_common(EN)
i2c_designware_platform(EN) i2c_designware_core(EN)
Jul  9 10:39:33 lisa kernel: [   35.816521] CR2: 0000000000000008
Jul  9 10:39:33 lisa kernel: [   35.816523] ---[ end trace 0000000000000000
]---
Jul  9 10:39:33 lisa kernel: [   35.895575] RIP:
0010:dma_resv_add_fence+0x3e/0x1a0
Jul  9 10:39:33 lisa kernel: [   35.895585] Code: 89 54 24 04 48 85 f6 74 2=
1 48
8d 7e 38 b8 01 00 00 00 f0 0f c1 46 38 85 c0 0f 84 0e 01 00 00 8d 50 01 09 =
c2
0f 88 12 01 00 00 <49> 8b 46 08 48 3d 80 0a ad 85 0f 84 ec 00 00 00 48 3d 2=
0 0a
ad 85
Jul  9 10:39:33 lisa kernel: [   35.895588] RSP: 0018:ffffb06b005cfc98 EFLA=
GS:
00010246
Jul  9 10:39:33 lisa kernel: [   35.895591] RAX: 0000000000000000 RBX:
ffff911bd03a8158 RCX: 0000000080200013
Jul  9 10:39:33 lisa kernel: [   35.895592] RDX: 0000000000000001 RSI:
0000000000000000 RDI: ffff911bd03a8158
Jul  9 10:39:33 lisa kernel: [   35.895593] RBP: ffff911bd03a8000 R08:
0000000000000000 R09: 0000000000000000
Jul  9 10:39:33 lisa kernel: [   35.895594] R10: ffff911bc7916900 R11:
0000000000000000 R12: ffff911bd0499400
Jul  9 10:39:33 lisa kernel: [   35.895595] R13: ffff911be09e5128 R14:
0000000000000000 R15: 00000000c0991f00
Jul  9 10:39:33 lisa kernel: [   35.895597] FS:  0000000000000000(0000)
GS:ffff911e9e800000(0000) knlGS:0000000000000000
Jul  9 10:39:33 lisa kernel: [   35.895598] CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jul  9 10:39:33 lisa kernel: [   35.895599] CR2: 0000000000000008 CR3:
000000010409c000 CR4: 0000000000750ee0
Jul  9 10:39:33 lisa kernel: [   35.895600] PKRU: 55555554
Jul  9 10:39:38 lisa kernel: [   41.995638] [drm] free PSP TMR buffer

lspci
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne Root
Complex
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne IOMMU
00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy H=
ost
Bridge
00:01.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Brid=
ge
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy H=
ost
Bridge
00:02.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe =
GPP
Bridge
00:02.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe =
GPP
Bridge
00:02.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe =
GPP
Bridge
00:02.4 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PCIe =
GPP
Bridge
00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dummy H=
ost
Bridge
00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir Internal PCIe=
 GPP
Bridge to Bus
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev=
 51)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev =
51)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric;
Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric;
Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric;
Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric;
Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric;
Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric;
Function 5
00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric;
Function 6
00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fabric;
Function 7
01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstr=
eam
Port of PCI Express Switch (rev c3)
02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL
Downstream Port of PCI Express Switch
03:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Navi 23
[Radeon RX 6600/6600 XT/6600M] (rev c3)
03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDM=
I/DP
Audio Controller
04:00.0 Network controller: MEDIATEK Corp. MT7921K (RZ608) Wi-Fi 6E 80MHz
05:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8=
411
PCI Express Gigabit Ethernet Controller (rev 15)
06:00.0 Non-Volatile memory controller: Micron/Crucial Technology P1 NVMe P=
CIe
SSD (rev 03)
07:00.0 Non-Volatile memory controller: Kingston Technology Company, Inc.
Device 500c (rev 01)
08:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Cezanne (rev c5)
08:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Renoir Radeon =
High
Definition Audio Controller
08:00.2 Encryption controller: Advanced Micro Devices, Inc. [AMD] Family 17h
(Models 10h-1fh) Platform Security Processor
08:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne U=
SB
3.1
08:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne U=
SB
3.1
08:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD]
ACP/ACP3X/ACP6x Audio Coprocessor (rev 01)
08:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h/19h HD
Audio Controller
08:00.7 Signal processing controller: Advanced Micro Devices, Inc. [AMD] Se=
nsor
Fusion Hub


Bisection gives

548e7432dc2da475a18077b612e8d55b8ff51891 is the first bad commit
commit 548e7432dc2da475a18077b612e8d55b8ff51891
Author: Christian K=C3=B6nig <christian.koenig@amd.com>
Date:   Fri Sep 24 10:55:45 2021 +0200

    dma-buf: add dma_resv_replace_fences v2

    This function allows to replace fences from the shared fence list when
    we can gurantee that the operation represented by the original fence has
    finished or no accesses to the resources protected by the dma_resv
    object any more when the new fence finishes.

    Then use this function in the amdkfd code when BOs are unmapped from the
    process.

    v2: add an example when this is usefull.

    Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
    Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
    Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
    Link:
https://patchwork.freedesktop.org/patch/msgid/20220321135856.1331-1-christi=
an.koenig@amd.com

 drivers/dma-buf/dma-resv.c                       | 45 ++++++++++++++++++++=
++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 49 ++++----------------=
----
 include/linux/dma-resv.h                         |  2 +
 3 files changed, 54 insertions(+), 42 deletions(-)
as the first commit that triggers the NULL pointer dereference.
But even before this commit errors occur:
Jul  9 13:07:50 lisa kernel: [   38.775734] ------------[ cut here
]------------
Jul  9 13:07:50 lisa kernel: [   38.775736] WARNING: CPU: 2 PID: 2509 at
kernel/workqueue.c:3084 __flush_work.isra.0+0x209/0x220
Jul  9 13:07:50 lisa kernel: [   38.775741] Modules linked in: ccm rfcomm b=
nep
cpufreq_conservative cpufreq_ondemand cpufreq_powersave cpufreq_userspace
snd_ctl_led btusb btrtl btbcm btintel btmtk bluetooth snd_hda_codec_realtek
jitterentropy_rng snd_hda_codec_generic joydev ledtrig_audio snd_hda_codec_=
hdmi
sha512_generic snd_hda_intel ctr snd_intel_dspcfg nls_ascii snd_soc_dmic
snd_acp3x_pdm_dma snd_acp3x_rn snd_hda_codec uvcvideo drbg nls_cp437 snd_hw=
dep
snd_soc_core videobuf2_vmalloc snd_hda_core videobuf2_memops vfat msi_wmi
videobuf2_v4l2 ecdh_generic wmi_bmof sparse_keymap videodev ecc snd_pcm_oss=
 fat
videobuf2_common snd_mixer_oss snd_pcm snd_timer evdev ccp snd soundcore
snd_rn_pci_acp3x serio_raw rng_core efi_pstore hid_multitouch k10temp
hid_sensor_magn_3d hid_sensor_gyro_3d hid_sensor_als hid_sensor_accel_3d wmi
hid_sensor_prox hid_sensor_trigger battery button ac video
industrialio_triggered_buffer kfifo_buf industrialio hid_sensor_iio_common
acpi_cpufreq amd_pmc mt7921e mt7921_common mt76_connac_lib mt76
Jul  9 13:07:50 lisa kernel: [   38.775774]  mac80211 libarc4 cfg80211 rfki=
ll
ipmi_devintf ipmi_msghandler msr fuse configfs efivarfs autofs4 ext4
crc32c_generic crc32c_intel crc16 mbcache jbd2 usbhid amdgpu drm_ttm_helper=
 ttm
gpu_sched i2c_algo_bit drm_dp_helper drm_kms_helper syscopyarea hid_sensor_=
hub
sysfillrect xhci_pci sysimgblt mfd_core fb_sys_fops xhci_hcd hid_generic r8=
169
drm nvme realtek usbcore nvme_core i2c_hid_acpi mdio_devres i2c_hid psmouse
t10_pi amd_sfh crc_t10dif libphy backlight hid i2c_piix4 crct10dif_generic =
cec
usb_common crct10dif_common i2c_designware_platform i2c_designware_core
Jul  9 13:07:50 lisa kernel: [   38.775796] CPU: 2 PID: 2509 Comm:
very_simple_tes Tainted: G        W         5.17.0-rc2-00359-g701920ca9822 =
#104
Jul  9 13:07:50 lisa kernel: [   38.775798] Hardware name: Micro-Star
International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.107 11/10/2021
Jul  9 13:07:50 lisa kernel: [   38.775799] RIP:
0010:__flush_work.isra.0+0x209/0x220
Jul  9 13:07:50 lisa kernel: [   38.775801] Code: 8b 4d 00 4c 8b 45 08 89 c=
a 48
c1 e9 04 83 e2 08 83 e1 0f 83 ca 02 89 c8 48 0f ba 6d 00 03 e9 29 ff ff ff =
0f
0b e9 52 ff ff ff <0f> 0b 45 31 ed e9 48 ff ff ff e8 38 c9 69 00 0f 1f 84 0=
0 00
00 00
Jul  9 13:07:50 lisa kernel: [   38.775802] RSP: 0018:ffffc071c100bc68 EFLA=
GS:
00010246
Jul  9 13:07:50 lisa kernel: [   38.775804] RAX: 0000000000000000 RBX:
0000000000000000 RCX: 0000000000000002
Jul  9 13:07:50 lisa kernel: [   38.775804] RDX: 0000000000000001 RSI:
0000000000000001 RDI: ffffa0f6a3179728
Jul  9 13:07:50 lisa kernel: [   38.775805] RBP: ffffa0f6a3179728 R08:
0000000000000000 R09: 0000000000000000
Jul  9 13:07:50 lisa kernel: [   38.775806] R10: 0000000000000000 R11:
0000000000000002 R12: ffffa0f6a3179728
Jul  9 13:07:50 lisa kernel: [   38.775806] R13: 0000000000000001 R14:
ffffa0f6400ffc78 R15: ffffa0f7403d0798
Jul  9 13:07:50 lisa kernel: [   38.775807] FS:  0000000000000000(0000)
GS:ffffa0f91e680000(0000) knlGS:0000000000000000
Jul  9 13:07:50 lisa kernel: [   38.775808] CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jul  9 13:07:50 lisa kernel: [   38.775809] CR2: 00007fcd5c070000 CR3:
00000001016f0000 CR4: 0000000000750ee0
Jul  9 13:07:50 lisa kernel: [   38.775809] PKRU: 55555554
Jul  9 13:07:50 lisa kernel: [   38.775810] Call Trace:
Jul  9 13:07:50 lisa kernel: [   38.775811]  <TASK>
Jul  9 13:07:50 lisa kernel: [   38.775813]  ? wait_for_completion+0xa0/0xe0
Jul  9 13:07:50 lisa kernel: [   38.775816]  __cancel_work_timer+0xfa/0x180
Jul  9 13:07:50 lisa kernel: [   38.775818]=20
kfd_process_notifier_release+0x86/0x150 [amdgpu]
Jul  9 13:07:50 lisa kernel: [   38.775943]  __mmu_notifier_release+0x6e/0x=
200
Jul  9 13:07:50 lisa kernel: [   38.775946]  exit_mmap+0x191/0x1c0
Jul  9 13:07:50 lisa kernel: [   38.775948]  ? futex_cleanup+0xa9/0x440
Jul  9 13:07:50 lisa kernel: [   38.775952]  mmput+0x49/0x130
Jul  9 13:07:50 lisa kernel: [   38.775954]  do_exit+0x2b0/0xa20
Jul  9 13:07:50 lisa kernel: [   38.775957]  do_group_exit+0x28/0x90
Jul  9 13:07:50 lisa kernel: [   38.775959]  __x64_sys_exit_group+0xf/0x10
Jul  9 13:07:50 lisa kernel: [   38.775960]  do_syscall_64+0x3b/0x90
Jul  9 13:07:50 lisa kernel: [   38.775962]=20
entry_SYSCALL_64_after_hwframe+0x44/0xae
Jul  9 13:07:50 lisa kernel: [   38.775964] RIP: 0033:0x7fcd5bf10f49
Jul  9 13:07:50 lisa kernel: [   38.775966] Code: Unable to access opcode b=
ytes
at RIP 0x7fcd5bf10f1f.
Jul  9 13:07:50 lisa kernel: [   38.775966] RSP: 002b:00007fff55a37058 EFLA=
GS:
00000246 ORIG_RAX: 00000000000000e7
Jul  9 13:07:50 lisa kernel: [   38.775968] RAX: ffffffffffffffda RBX:
00007fcd5c014920 RCX: 00007fcd5bf10f49
Jul  9 13:07:50 lisa kernel: [   38.775968] RDX: 000000000000003c RSI:
00000000000000e7 RDI: 0000000000000000
Jul  9 13:07:50 lisa kernel: [   38.775969] RBP: 0000000000000000 R08:
ffffffffffffff88 R09: 00007fcd5ceeb950
Jul  9 13:07:50 lisa kernel: [   38.775969] R10: 0000000000000005 R11:
0000000000000246 R12: 00007fcd5c014920
Jul  9 13:07:50 lisa kernel: [   38.775970] R13: 0000000000000001 R14:
00007fcd5c019e28 R15: 0000000000000000
Jul  9 13:07:50 lisa kernel: [   38.775971]  </TASK>
Jul  9 13:07:50 lisa kernel: [   38.775972] ---[ end trace 0000000000000000
]---
these are non fatal though while the NULL pointer dereference errors either
lead to an immediate hang or and hang on rebooting. Bisection for this erro=
r is
currently under way.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
