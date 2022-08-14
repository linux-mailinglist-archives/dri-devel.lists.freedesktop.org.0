Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFE359267B
	for <lists+dri-devel@lfdr.de>; Sun, 14 Aug 2022 23:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BB98EE45;
	Sun, 14 Aug 2022 21:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64408EE45;
 Sun, 14 Aug 2022 21:12:02 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id j11so4265845qvt.10;
 Sun, 14 Aug 2022 14:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=H1TyYCgDFOLBpbwuT7QI2PWkd8yCNKoZK+SX9krmjpU=;
 b=mRG5JQUdhIJ9GAOwN8zf9CENEzTwv4gDa6MzdHh6vyHy5SopBXHsngmqNlW0ZcDqRa
 bGyruk9vZXUYcbIM+f9S+TI1WlOuqM5r3LLS5nAsBME6YZJuBRPWAhjQh52g4N7SXEJX
 9ZIr/pQI2ox62EHYhyhGMlUY+7IPwjwu8N/P3v6RaEYR3lumwe1OKvTT8Pcy7LtSvE0b
 spyYIdYl/G+ykrDRB40ltWeHnS4r3NA8wMx87u0eiBuNedycL/m4WYVwXwPo4fg8gc74
 P47J6UKsDe1H5x2knvDEg76bqGmlaajALbkHubQvDaqku2DFnC/MOMKxCV8gFVZx9hUk
 6Ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=H1TyYCgDFOLBpbwuT7QI2PWkd8yCNKoZK+SX9krmjpU=;
 b=L46OhDjTkKAXXDrvvZbZw2kTI5lFESb+9vu3o4TT5AFOqktYrVzAQv2X1feuZSiREI
 lEBMVBfx2QLbRBYBMKHtfbP89GLFcN5dm0+VF9L3/600hJTb5ovffGosMWC9jdFldHrn
 LyvZCoG0ZV0Dm0YpmV+Vj/uQVptil3Bq8TXxCpQOHJDbGsu+8OPMpj8+9A9E7RJ1FeXO
 d5xNk2MBilQj8xqUjXxFwMhy8nCLKkRuTIKH542IHVimf6Sqgulr9HfULhUrzYGIXmJl
 vpscOj+b3QCaqi875runMrAYqFvlB/GbFyWKC1P2lXMqpEvgCI8lHh4JFYl4GG7B88vt
 2ZiA==
X-Gm-Message-State: ACgBeo3/EZakJ/RrDIN76oMUtB4qG+RWvhy56tQIza5yiMqnUpNbqwnh
 kHqrs/QB4a1IF7q+sKfdMTL+td/XVwIV7iAdKCQ63ACse15AjYB8HtE=
X-Google-Smtp-Source: AA6agR5S73EueL4IQb54rQCHLhOtWm7QLKarjhQX2plDKNvRGnJq2HlufEHzklXoMPPEdQh7enghLcXtMHJKOUx3i8A=
X-Received: by 2002:a05:6214:c6c:b0:476:99a4:26b9 with SMTP id
 t12-20020a0562140c6c00b0047699a426b9mr11428458qvj.128.1660511521578; Sun, 14
 Aug 2022 14:12:01 -0700 (PDT)
MIME-Version: 1.0
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Mon, 15 Aug 2022 02:11:50 +0500
Message-ID: <CABXGCsM58-8fxVKAVkwsshg+33B_1_t_WesG160AtVBe1ZvKiw@mail.gmail.com>
Subject: [BUG][5.20] refcount_t: underflow; use-after-free
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi folks.
Joined testing 5.20 today (7ebfc85e2cd7).
I encountered a frequently GPU freeze, after which a message appears
in the kernel logs:
[ 220.280990] ------------[ cut here ]------------
[ 220.281000] refcount_t: underflow; use-after-free.
[ 220.281019] WARNING: CPU: 1 PID: 3746 at lib/refcount.c:28
refcount_warn_saturate+0xba/0x110
[ 220.281029] Modules linked in: uinput rfcomm snd_seq_dummy
snd_hrtimer nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink
qrtr bnep sunrpc snd_seq_midi snd_seq_midi_event vfat intel_rapl_msr
fat intel_rapl_common snd_hda_codec_realtek mt76x2u
snd_hda_codec_generic snd_hda_codec_hdmi mt76x2_common iwlmvm
mt76x02_usb edac_mce_amd mt76_usb snd_hda_intel snd_intel_dspcfg
mt76x02_lib snd_intel_sdw_acpi snd_usb_audio snd_hda_codec mt76
kvm_amd uvcvideo mac80211 snd_hda_core btusb eeepc_wmi snd_usbmidi_lib
videobuf2_vmalloc videobuf2_memops kvm btrtl snd_rawmidi asus_wmi
snd_hwdep videobuf2_v4l2 btbcm iwlwifi ledtrig_audio libarc4 btintel
snd_seq videobuf2_common sparse_keymap btmtk irqbypass videodev
snd_seq_device joydev xpad iwlmei platform_profile bluetooth
ff_memless snd_pcm mc rapl
[ 220.281185] video snd_timer cfg80211 wmi_bmof snd pcspkr soundcore
k10temp i2c_piix4 rfkill mei asus_ec_sensors acpi_cpufreq zram
hid_logitech_hidpp amdgpu igb dca drm_ttm_helper ttm crct10dif_pclmul
iommu_v2 crc32_pclmul gpu_sched crc32c_intel ucsi_ccg drm_buddy nvme
typec_ucsi ghash_clmulni_intel drm_display_helper ccp nvme_core typec
sp5100_tco cec wmi ip6_tables ip_tables fuse
[ 220.281258] Unloaded tainted modules: amd64_edac():1 amd64_edac():1
amd64_edac():1 amd64_edac():1 amd64_edac():1 amd64_edac():1
amd64_edac():1 amd64_edac():1 amd64_edac():1 pcc_cpufreq():1
amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 amd64_edac():1 amd64_edac():1 pcc_cpufreq():1
amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 amd64_edac():1
pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 amd64_edac():1
pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 amd64_edac():1
pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1
amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 amd64_edac():1
pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1 pcc_cpufreq():1
[ 220.281388] pcc_cpufreq():1 fjes():1 pcc_cpufreq():1 fjes():1
fjes():1 fjes():1 fjes():1 fjes():1 fjes():1 fjes():1
[ 220.281415] CPU: 1 PID: 3746 Comm: chrome:cs0 Tainted: G W L -------
--- 5.20.0-0.rc0.20220812git7ebfc85e2cd7.10.fc38.x86_64 #1
[ 220.281421] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-I GAMING, BIOS 4403 04/27/2022
[ 220.281426] RIP: 0010:refcount_warn_saturate+0xba/0x110
[ 220.281431] Code: 01 01 e8 79 4a 6f 00 0f 0b e9 42 47 a5 00 80 3d de
7e be 01 00 75 85 48 c7 c7 f8 98 8e 98 c6 05 ce 7e be 01 01 e8 56 4a
6f 00 <0f> 0b e9 1f 47 a5 00 80 3d b9 7e be 01 00 0f 85 5e ff ff ff 48
c7
[ 220.281437] RSP: 0018:ffffb4b0d18d7a80 EFLAGS: 00010282
[ 220.281443] RAX: 0000000000000026 RBX: 0000000000000003 RCX: 0000000000000000
[ 220.281448] RDX: 0000000000000001 RSI: ffffffff988d06dc RDI: 00000000ffffffff
[ 220.281452] RBP: 00000000ffffffff R08: 0000000000000000 R09: ffffb4b0d18d7930
[ 220.281457] R10: 0000000000000003 R11: ffffa0672e2fffe8 R12: ffffa058ca360400
[ 220.281461] R13: ffffa05846c50a18 R14: 00000000fffffe00 R15: 0000000000000003
[ 220.281465] FS: 00007f82683e06c0(0000) GS:ffffa066e2e00000(0000)
knlGS:0000000000000000
[ 220.281470] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 220.281475] CR2: 00003590005cc000 CR3: 00000001fca46000 CR4: 0000000000350ee0
[ 220.281480] Call Trace:
[ 220.281485] <TASK>
[ 220.281490] amdgpu_cs_ioctl+0x4e2/0x2070 [amdgpu]
[ 220.281806] ? amdgpu_cs_find_mapping+0xe0/0xe0 [amdgpu]
[ 220.282028] drm_ioctl_kernel+0xa4/0x150
[ 220.282043] drm_ioctl+0x21f/0x420
[ 220.282053] ? amdgpu_cs_find_mapping+0xe0/0xe0 [amdgpu]
[ 220.282275] ? lock_release+0x14f/0x460
[ 220.282282] ? _raw_spin_unlock_irqrestore+0x30/0x60
[ 220.282290] ? _raw_spin_unlock_irqrestore+0x30/0x60
[ 220.282297] ? lockdep_hardirqs_on+0x7d/0x100
[ 220.282305] ? _raw_spin_unlock_irqrestore+0x40/0x60
[ 220.282317] amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
[ 220.282534] __x64_sys_ioctl+0x90/0xd0
[ 220.282545] do_syscall_64+0x5b/0x80
[ 220.282551] ? futex_wake+0x6c/0x150
[ 220.282568] ? lock_is_held_type+0xe8/0x140
[ 220.282580] ? do_syscall_64+0x67/0x80
[ 220.282585] ? lockdep_hardirqs_on+0x7d/0x100
[ 220.282592] ? do_syscall_64+0x67/0x80
[ 220.282597] ? do_syscall_64+0x67/0x80
[ 220.282602] ? lockdep_hardirqs_on+0x7d/0x100
[ 220.282609] entry_SYSCALL_64_after_hwframe+0x63/0xcd
[ 220.282616] RIP: 0033:0x7f8282a4f8bf
[ 220.282639] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10
00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00
0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00
00
[ 220.282644] RSP: 002b:00007f82683df410 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[ 220.282651] RAX: ffffffffffffffda RBX: 00007f82683df588 RCX: 00007f8282a4f8bf
[ 220.282655] RDX: 00007f82683df4d0 RSI: 00000000c0186444 RDI: 0000000000000018
[ 220.282659] RBP: 00007f82683df4d0 R08: 00007f82683df5e0 R09: 00007f82683df4b0
[ 220.282663] R10: 00001d04000a0600 R11: 0000000000000246 R12: 00000000c0186444
[ 220.282667] R13: 0000000000000018 R14: 00007f82683df588 R15: 0000000000000003
[ 220.282689] </TASK>
[ 220.282693] irq event stamp: 6232311
[ 220.282697] hardirqs last enabled at (6232319): [<ffffffff9718cd7e>]
__up_console_sem+0x5e/0x70
[ 220.282704] hardirqs last disabled at (6232326):
[<ffffffff9718cd63>] __up_console_sem+0x43/0x70
[ 220.282709] softirqs last enabled at (6232072): [<ffffffff970ff669>]
__irq_exit_rcu+0xf9/0x170
[ 220.282716] softirqs last disabled at (6232061):
[<ffffffff970ff669>] __irq_exit_rcu+0xf9/0x170
[ 220.282722] ---[ end trace 0000000000000000 ]---


Full kernel log is here:
https://pastebin.com/gn01DVxE

My GPU hardware is AMD Radeon 6900XT.

-- 
Best Regards,
Mike Gavrilov.
