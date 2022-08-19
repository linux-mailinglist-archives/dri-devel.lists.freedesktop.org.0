Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F70599B96
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 14:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3116F10EAC5;
	Fri, 19 Aug 2022 12:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6B610EB9C;
 Fri, 19 Aug 2022 12:13:08 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4M8LHm2YrCz9tKP;
 Fri, 19 Aug 2022 12:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1660911188; bh=plrV05ojK26Wf/yBYf8XRy+dwdDvjPN7FxVlOsShQQA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FJ03wUpv4yvEWrQXGKyKMhg600RJxxGWDQB8RYdxfMJcx0+5mp8kwn44cZmcSZJ0i
 IWuViaCOEZ8CcR4fWz5JNPkSel+O+k/04z9tXIc7gbjfQCTtLR3XBWc3k2/b4aq5fQ
 6RrwxBIHbREQjdM/Gbo5jCBMZPiDDYGlF2+n5KVI=
X-Riseup-User-ID: 883DDC69CA82767B5BE2DB0AD100FF4FFB80C35EBC2D4B584B6F27B16357C36F
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4M8LHk20KVz5vcM;
 Fri, 19 Aug 2022 12:13:05 +0000 (UTC)
Message-ID: <a588de9f-958a-fce9-b4d3-2ea45d092b44@riseup.net>
Date: Fri, 19 Aug 2022 09:13:04 -0300
MIME-Version: 1.0
Subject: Re: [BUG][5.20] refcount_t: underflow; use-after-free
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
References: <CABXGCsM58-8fxVKAVkwsshg+33B_1_t_WesG160AtVBe1ZvKiw@mail.gmail.com>
 <be6f1ce4-46b1-7a80-230c-b99f203ce8ad@riseup.net>
 <CABXGCsMFYnE+Wn2EAWuC8DSVj=TVprj6ABZwRK-hXcw-1hnMyw@mail.gmail.com>
 <CABXGCsMpGabZ32j_ObEHa_har2W8M8RWuqnx3d=yJT2NX_ztNg@mail.gmail.com>
 <20220817160751.moqhebkiuiydraka@mail.igalia.com>
 <CABXGCsOM9An-+EeaGWm0OA1FN2p94=BF210Lhy0tiO6ye9onWQ@mail.gmail.com>
 <dd2ee57a-2ab2-db94-36d9-8faced18fe61@riseup.net>
 <CABXGCsMc_D_iJ-r-_s8q13Vq6dgfQg1tnp-0aojfv5Q8izTrfw@mail.gmail.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <CABXGCsMc_D_iJ-r-_s8q13Vq6dgfQg1tnp-0aojfv5Q8izTrfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/17/22 17:57, Mikhail Gavrilov wrote:
> On Wed, Aug 17, 2022 at 11:43 PM Maíra Canal <mairacanal@riseup.net> wrote:
>>
>> Hi Mikhail,
>>
>> Looks like 45ecaea738830b9d521c93520c8f201359dcbd95 ("drm/sched: Partial
>> revert of 'drm/sched: Keep s_fence->parent pointer'") introduced the
>> error. Try reverting it and check if the use-after-free still happens.
> 
> Thanks, but unfortunately, this did not lead to the expected result.
> Again happens use-after-free in an incomprehensible context.
> From the new: added warning "suspicious RCU usage" but it looks like
> it is completely not related to the use-after-free issue.
> 

Hi Mikhail,

Could you please specify the steps to reproduce this use-after-free? I
will try to reproduce it on the RX5700 XT and bisect the issue.

Best Regards,
- Maíra Canal

> [ 215.434115] ------------[ cut here ]------------
> [ 215.434184] refcount_t: underflow; use-after-free.
> [ 215.434204] WARNING: CPU: 7 PID: 1258 at lib/refcount.c:28
> refcount_warn_saturate+0xba/0x110
> [ 215.434214] Modules linked in: uinput rfcomm snd_seq_dummy
> snd_hrtimer nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast
> nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
> nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
> nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink
> qrtr bnep sunrpc binfmt_misc snd_seq_midi snd_seq_midi_event
> intel_rapl_msr intel_rapl_common snd_hda_codec_realtek vfat
> snd_hda_codec_generic snd_hda_codec_hdmi mt76x2u fat mt76x2_common
> snd_hda_intel mt76x02_usb snd_intel_dspcfg snd_intel_sdw_acpi mt76_usb
> iwlmvm edac_mce_amd snd_usb_audio snd_hda_codec mt76x02_lib
> snd_hda_core snd_usbmidi_lib snd_hwdep snd_rawmidi uvcvideo mt76
> kvm_amd snd_seq videobuf2_vmalloc videobuf2_memops snd_seq_device
> mac80211 videobuf2_v4l2 videobuf2_common kvm btusb iwlwifi snd_pcm
> btrtl videodev libarc4 eeepc_wmi btbcm asus_wmi iwlmei btintel
> ledtrig_audio xpad irqbypass sparse_keymap btmtk platform_profile
> joydev
> [ 215.434436] hid_logitech_hidpp rapl ff_memless mc snd_timer
> bluetooth cfg80211 video pcspkr wmi_bmof snd soundcore k10temp
> i2c_piix4 rfkill mei asus_ec_sensors acpi_cpufreq zram amdgpu
> drm_ttm_helper ttm iommu_v2 ucsi_ccg gpu_sched crct10dif_pclmul
> crc32_pclmul typec_ucsi drm_buddy crc32c_intel ghash_clmulni_intel ccp
> igb sp5100_tco typec drm_display_helper nvme dca nvme_core cec wmi
> ip6_tables ip_tables fuse
> [ 215.434528] Unloaded tainted modules: amd64_edac():1 amd64_edac():1
> amd64_edac():1 amd64_edac():1 amd64_edac():1 amd64_edac():1
> amd64_edac():1 amd64_edac():1 amd64_edac():1 amd64_edac():1
> amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
> pcc_cpufreq():1 amd64_edac():1 amd64_edac():1 pcc_cpufreq():1
> pcc_cpufreq():1 amd64_edac():1 amd64_edac():1 pcc_cpufreq():1
> amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
> amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
> amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
> amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
> amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1
> amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1
> pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1
> amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1
> pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1
> pcc_cpufreq():1 pcc_cpufreq():1 pcc_cpufreq():1 fjes():1
> [ 215.434672] pcc_cpufreq():1 fjes():1 pcc_cpufreq():1 fjes():1
> pcc_cpufreq():1 fjes():1 fjes():1 fjes():1 fjes():1 fjes():1
> [ 215.434702] CPU: 7 PID: 1258 Comm: kworker/7:3 Tainted: G W L
> ------- --- 6.0.0-0.rc1.20220817git3cc40a443a04.14.fc38.x86_64 #1
> [ 215.434709] Hardware name: System manufacturer System Product
> Name/ROG STRIX X570-I GAMING, BIOS 4403 04/27/2022
> [ 215.434715] Workqueue: events drm_sched_entity_kill_jobs_work [gpu_sched]
> [ 215.434728] RIP: 0010:refcount_warn_saturate+0xba/0x110
> [ 215.434734] Code: 01 01 e8 59 59 6f 00 0f 0b e9 22 46 a5 00 80 3d be
> 7d be 01 00 75 85 48 c7 c7 c0 99 8e 92 c6 05 ae 7d be 01 01 e8 36 59
> 6f 00 <0f> 0b e9 ff 45 a5 00 80 3d 99 7d be 01 00 0f 85 5e ff ff ff 48
> c7
> [ 215.434740] RSP: 0018:ffff9ccb0237fe60 EFLAGS: 00010286
> [ 215.434747] RAX: 0000000000000026 RBX: ffff8d531f6f2828 RCX: 0000000000000000
> [ 215.434753] RDX: 0000000000000001 RSI: ffffffff928d07a4 RDI: 00000000ffffffff
> [ 215.434757] RBP: ffff8d61e47f5600 R08: 0000000000000000 R09: ffff9ccb0237fd10
> [ 215.434762] R10: 0000000000000003 R11: ffff8d622e2fffe8 R12: ffff8d61e47fc800
> [ 215.434767] R13: ffff8d5313e95500 R14: ffff8d61e47fc805 R15: ffff8d531f6f2830
> [ 215.434772] FS: 0000000000000000(0000) GS:ffff8d61e4600000(0000)
> knlGS:0000000000000000
> [ 215.434777] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 215.434782] CR2: 00007f0c8b815048 CR3: 00000001ab0e8000 CR4: 0000000000350ee0
> [ 215.434788] Call Trace:
> [ 215.434792] <TASK>
> [ 215.434797] process_one_work+0x2a0/0x600
> [ 215.434819] worker_thread+0x4f/0x3a0
> [ 215.434830] ? process_one_work+0x600/0x600
> [ 215.434836] kthread+0xf5/0x120
> [ 215.434842] ? kthread_complete_and_exit+0x20/0x20
> [ 215.434854] ret_from_fork+0x22/0x30
> [ 215.434881] </TASK>
> [ 215.434885] irq event stamp: 134873
> [ 215.434890] hardirqs last enabled at (134881): [<ffffffff9118ce7e>]
> __up_console_sem+0x5e/0x70
> [ 215.434897] hardirqs last disabled at (134888): [<ffffffff9118ce63>]
> __up_console_sem+0x43/0x70
> [ 215.434903] softirqs last enabled at (131264): [<ffffffff910ff769>]
> __irq_exit_rcu+0xf9/0x170
> [ 215.434910] softirqs last disabled at (131257): [<ffffffff910ff769>]
> __irq_exit_rcu+0xf9/0x170
> [ 215.434917] ---[ end trace 0000000000000000 ]---
> 
> Full kerner log: https://pastebin.com/qED477Pz
> 
