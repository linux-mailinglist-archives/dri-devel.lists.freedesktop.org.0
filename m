Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44011741D46
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 02:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198C710E013;
	Thu, 29 Jun 2023 00:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862FD10E013
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 00:37:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 000D061499
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 00:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7FC4C433C9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 00:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687999042;
 bh=Qnunxg3xpkhtDE/Bn8emlaqVboAg+TVm/cxG+ul3zPU=;
 h=From:To:Subject:Date:From;
 b=FbOexMs9B//El5m2mr9VyxvXDAjHWxUi/XO36Ucr1arSrrmc1/kn88xZb9+yvvayp
 lT+iuQvQ++1Sp680SySCpg1F5uo2jkfOaW1HT7r8Ajt8e21gYN0gYWZ9uhiO2759N9
 ImSKOqSwXkzNQB4HbXlEJCceGAcETnzJBEqFcfPVzk2RsBHEbOkcOC0v4xXgiQN4dk
 MeM40yTQ5IuZkb5OwftB+4TvuiLJvbihHzF7bzCMqBhAyO1vqDNi+2yjWZBRHjB4wt
 ui5V8GqVHj+D2W1lgoZ66JOtQi5r0BWNZ2FhqUDRhjHlTgg+grceqf7zW6+oMxkXqf
 4C6kN3+rmR3Gw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id ABBE4C53BC6; Thu, 29 Jun 2023 00:37:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217607] New: null pointer dereference with NVIDIA installer on 
 5.15.118 and  5.15.119
Date: Thu, 29 Jun 2023 00:37:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tgayoso@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-217607-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217607

            Bug ID: 217607
           Summary: null pointer dereference with NVIDIA installer on
                    5.15.118 and  5.15.119
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: tgayoso@gmail.com
        Regression: No

Created attachment 304503
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304503&action=3Dedit
full dmesg output.

Executing the NVIDIA installer causes a null pointer dereference in kernels
5.15.118 and  5.15.119 with the following message:


[   70.642046] BUG: kernel NULL pointer dereference, address: 0000000000000=
2b0
[   70.642804] #PF: supervisor read access in kernel mode
[   70.643019] #PF: error_code(0x0000) - not-present page
[   70.643019] PGD 1107c5067 P4D 1107c5067 PUD 110627067 PMD 0=20
[   70.643019] Oops: 0000 [#1] PREEMPT SMP NOPTI
[   70.643019] CPU: 14 PID: 2274 Comm: Xorg.wrap Not tainted 5.15.119-TUF #1
[   70.643019] Hardware name: ASUSTeK COMPUTER INC. ASUS TUF Gaming A15
FA506IU_TUF506IU/FA506IU, BIOS FA506IU.320 06/01/2022
[   70.643019] RIP: 0010:0xffffffffc08b0be1
[   70.643019] Code: 6c 8e fc 66 0f 1f 44 00 00 48 83 ec 20 48 89 6c 24 08 =
4c
89 64 24 10 48 89 fd 48 89 1c 24 4c 89 6c 24 18 48 8b 9f e8 01 00 00 <48> 8=
b 83
b0 02 00 00 4c 8d a3 b0 02 00 00 49 39 c4 74 41 48 8b 87
[   70.647134] RSP: 0018:ffffab110296bd28 EFLAGS: 00010286
[   70.647594] RAX: ffffffffc08b0bc0 RBX: 0000000000000000 RCX:
000000000000071e
[   70.648592] RDX: 0000000000000000 RSI: 7ddfa014571dcfcf RDI:
ffff8ed1912c8058
[   70.648592] RBP: ffff8ed1912c8058 R08: 0000000000000000 R09:
ffff8ed185485d40
[   70.648592] R10: ffff8ed182e0bb00 R11: 00000000fffffff7 R12:
ffff8ed1827b07b0
[   70.651099] R13: ffff8ed18f013c00 R14: 0000000000008001 R15:
ffff8ed18f013cd0
[   70.651099] FS:  00007efdd7049b80(0000) GS:ffff8ed49f980000(0000)
knlGS:0000000000000000
[   70.651099] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   70.651099] CR2: 00000000000002b0 CR3: 0000000110ba2000 CR4:
0000000000350ee0
[   70.654705] Call Trace:
[   70.654705]  <TASK>
[   70.654705]  ? 0xffffffffbd79e587
[   70.654705]  ? 0xffffffffbd03e2cd
[   70.654705]  ? 0xffffffffbd08d1cb
[   70.659594]  ? 0xffffffffbd0a2002
[   70.659594]  ? 0xffffffffbd7df66b
[   70.659594]  ? 0xffffffffbd800b32
[   70.662874]  ? 0xffffffffc08b0bc0
[   70.662874]  ? 0xffffffffc08b0be1
[   70.662874]  0xffffffffc08b16a5
[   70.662874]  0xffffffffc08a1da1
[   70.666705]  0xffffffffc0208a1f
[   70.666705]  0xffffffffc0209140
[   70.666705]  0xffffffffbd22792c
[   70.666705]  0xffffffffbd074f97
[   70.670905]  0xffffffffbd0cf8ab
[   70.671594]  0xffffffffbd7dfccd
[   70.671594]  ? 0xffffffffbd222b28
[   70.671594]  0xffffffffbd7dbd79
[   70.671594]  ? 0xffffffffbd23ed36
[   70.674623]  ? 0xffffffffbd7dfccd
[   70.674623]  ? 0xffffffffbd7dbd79
[   70.674623]  ? 0xffffffffbd7df4b0
[   70.674623]  0xffffffffbd800081
[   70.674623] RIP: 0033:0x00007efdd723b463
[   70.674623] Code: 8b 15 69 ab 00 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff =
eb
b7 0f 1f 00 64 8b 04 25 18 00 00 00 85 c0 75 14 b8 03 00 00 00 0f 05 <48> 3=
d 00
f0 ff ff 77 45 c3 0f 1f 40 00 48 83 ec 18 89 7c 24 0c e8
[   70.674623] RSP: 002b:00007ffd2b4af598 EFLAGS: 00000246 ORIG_RAX:
0000000000000003
[   70.678704] RAX: 0000000000000000 RBX: 0000000000000001 RCX:
00007efdd723b463
[   70.678704] RDX: 00007ffd2b4af5c0 RSI: 00000000c04064a0 RDI:
0000000000000004
[   70.678704] RBP: 0000000000000001 R08: 0000000000000000 R09:
00007ffd2b4af440
[   70.678704] R10: 00007efdd722ccd0 R11: 0000000000000246 R12:
0000000000402075
[   70.678704] R13: 00007ffd2b4af600 R14: 000000000040206c R15:
0000000000000000
[   70.678704]  </TASK>
[   70.678704] Modules linked in: sctp ip6_udp_tunnel udp_tunnel 8021q garp=
 stp
mrp llc ctr ccm cmac algif_hash algif_skcipher af_alg bnep efivarfs ipv6
nls_iso8859_1 nls_cp437 vfat fat sch_fq_codel mq_deadline snd_seq_midi
snd_seq_midi_event snd_seq drivetemp amdtee tee sp5100_tco watchdog sd_mod
r8153_ecm cdc_ether usbnet r8152 mii uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common videodev uas usb_storage b=
tusb
btintel btrtl snd_usb_audio bluetooth snd_usbmidi_lib snd_rawmidi ecdh_gene=
ric
snd_seq_device ecc mc crc16 amdgpu rtw88_8822ce rtw88_8822c
snd_hda_codec_realtek rtw88_pci drm_ttm_helper ttm snd_hda_codec_generic
mfd_core ledtrig_audio rtw88_core snd_hda_codec_hdmi gpu_sched i2c_algo_bit
mac80211 snd_hda_intel snd_intel_dspcfg drm_kms_helper r8169 crct10dif_pclm=
ul
syscopyarea crc32_pclmul snd_hda_codec sysfillrect crc32c_intel sysimgblt
snd_hwdep ghash_clmulni_intel ucsi_ccg snd_hda_core ucsi_acpi fb_sys_fops
typec_ucsi asus_nb_wmi cfg80211 snd_pci_acp5x
[   70.678704]  aesni_intel realtek hid_multitouch xhci_pci cec ccp asus_wmi
snd_pcm typec snd_rn_pci_acp3x mdio_devres libaes crypto_simd cryptd serio_=
raw
drm platform_profile snd_timer libarc4 snd_pci_acp3x xhci_hcd libphy
sha1_generic i2c_nvidia_gpu i2c_piix4 k10temp video roles backlight
i2c_hid_acpi i2c_hid tpm_crb tpm_tis tpm_tis_core tpm i2c_designware_platfo=
rm
i2c_designware_core loop
[   70.694705] CR2: 00000000000002b0
[   70.694705] ---[ end trace a092af1eaa121724 ]---
[   70.694705] RIP: 0010:0xffffffffc08b0be1
[   70.699594] Code: 6c 8e fc 66 0f 1f 44 00 00 48 83 ec 20 48 89 6c 24 08 =
4c
89 64 24 10 48 89 fd 48 89 1c 24 4c 89 6c 24 18 48 8b 9f e8 01 00 00 <48> 8=
b 83
b0 02 00 00 4c 8d a3 b0 02 00 00 49 39 c4 74 41 48 8b 87
[   70.702706] RSP: 0018:ffffab110296bd28 EFLAGS: 00010286
[   70.702706] RAX: ffffffffc08b0bc0 RBX: 0000000000000000 RCX:
000000000000071e
[   70.706712] RDX: 0000000000000000 RSI: 7ddfa014571dcfcf RDI:
ffff8ed1912c8058
[   70.706712] RBP: ffff8ed1912c8058 R08: 0000000000000000 R09:
ffff8ed185485d40
[   70.706712] R10: ffff8ed182e0bb00 R11: 00000000fffffff7 R12:
ffff8ed1827b07b0
[   70.710901] R13: ffff8ed18f013c00 R14: 0000000000008001 R15:
ffff8ed18f013cd0
[   70.710901] FS:  00007efdd7049b80(0000) GS:ffff8ed49f980000(0000)
knlGS:0000000000000000
[   70.714704] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   70.714704] CR2: 00000000000002b0 CR3: 0000000110ba2000 CR4:
0000000000350ee0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
