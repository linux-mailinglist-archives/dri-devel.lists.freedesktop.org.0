Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C17BD5975E6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 20:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E92E2BDF3;
	Wed, 17 Aug 2022 18:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD179F2D9;
 Wed, 17 Aug 2022 18:43:07 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4M7H2f3dTnzDqNy;
 Wed, 17 Aug 2022 18:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1660761786; bh=pybABoossopvyk5GCmIybMdFUdJj94XeORKmXmsyBkA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eWqxU8J9ICiUUIl9vGm2Y3qok3XUsEQbxMFbBPn4fbBPgkLwD5DxaEeU/gI2KiT6G
 6LLrlqzWb0pX4pLF+03bTaRAMS8lpUpqB0HoSWGzdGYX+IIpspnbpLOwiupiGLLkf8
 DhLr7oSeiPcN6V9tFjhwb2z9/KX9CT4k6coU5H+c=
X-Riseup-User-ID: 174D87B460C20107E9EA535CD40FAE534F423A2963B4AE97779D65618A1E54BC
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4M7H2c1rhwz5vRK;
 Wed, 17 Aug 2022 18:43:04 +0000 (UTC)
Message-ID: <dd2ee57a-2ab2-db94-36d9-8faced18fe61@riseup.net>
Date: Wed, 17 Aug 2022 15:43:00 -0300
MIME-Version: 1.0
Subject: Re: [BUG][5.20] refcount_t: underflow; use-after-free
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Melissa Wen <mwen@igalia.com>
References: <CABXGCsM58-8fxVKAVkwsshg+33B_1_t_WesG160AtVBe1ZvKiw@mail.gmail.com>
 <be6f1ce4-46b1-7a80-230c-b99f203ce8ad@riseup.net>
 <CABXGCsMFYnE+Wn2EAWuC8DSVj=TVprj6ABZwRK-hXcw-1hnMyw@mail.gmail.com>
 <CABXGCsMpGabZ32j_ObEHa_har2W8M8RWuqnx3d=yJT2NX_ztNg@mail.gmail.com>
 <20220817160751.moqhebkiuiydraka@mail.igalia.com>
 <CABXGCsOM9An-+EeaGWm0OA1FN2p94=BF210Lhy0tiO6ye9onWQ@mail.gmail.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <CABXGCsOM9An-+EeaGWm0OA1FN2p94=BF210Lhy0tiO6ye9onWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/17/22 14:44, Mikhail Gavrilov wrote:
> On Wed, Aug 17, 2022 at 9:08 PM Melissa Wen <mwen@igalia.com> wrote:
>>
>> Hi Mikhail,
>>
>> IIUC, you got this second user-after-free by applying the first version
>> of Maíra's patch, right? So, that version was adding another unbalanced
>> unlock to the cs ioctl flow, but it was solved in the latest version,
>> that you can find here: https://patchwork.freedesktop.org/patch/497680/
>> If this is the situation, can you check this last version?
>>
>> Thanks,
>>
>> Melissa
> 
> With the last version warning "bad unlock balance detected!" was gone,
> but the user-after-free issue remains.
> And again "Workqueue: events drm_sched_entity_kill_jobs_work [gpu_sched]".

Hi Mikhail,

Looks like 45ecaea738830b9d521c93520c8f201359dcbd95 ("drm/sched: Partial 
revert of 'drm/sched: Keep s_fence->parent pointer'") introduced the 
error. Try reverting it and check if the use-after-free still happens.

Best Regards,
- Maíra Canal

> 
> [  297.834779] ------------[ cut here ]------------
> [  297.834818] refcount_t: underflow; use-after-free.
> [  297.834831] WARNING: CPU: 30 PID: 2377 at lib/refcount.c:28
> refcount_warn_saturate+0xba/0x110
> [  297.834838] Modules linked in: uinput rfcomm snd_seq_dummy
> snd_hrtimer nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast
> nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
> nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
> nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink
> qrtr bnep sunrpc binfmt_misc snd_seq_midi snd_seq_midi_event mt76x2u
> mt76x2_common mt76x02_usb mt76_usb mt76x02_lib snd_hda_codec_realtek
> iwlmvm intel_rapl_msr snd_hda_codec_generic snd_hda_codec_hdmi mt76
> vfat fat snd_hda_intel intel_rapl_common mac80211 snd_intel_dspcfg
> snd_intel_sdw_acpi snd_usb_audio snd_hda_codec snd_usbmidi_lib btusb
> edac_mce_amd iwlwifi libarc4 uvcvideo snd_hda_core btrtl snd_rawmidi
> snd_hwdep videobuf2_vmalloc btbcm kvm_amd videobuf2_memops snd_seq
> iwlmei btintel videobuf2_v4l2 eeepc_wmi snd_seq_device
> videobuf2_common btmtk kvm xpad videodev joydev irqbypass snd_pcm
> asus_wmi hid_logitech_hidpp ff_memless cfg80211 bluetooth rapl mc
> [  297.834932]  ledtrig_audio snd_timer sparse_keymap platform_profile
> wmi_bmof snd video pcspkr k10temp i2c_piix4 rfkill soundcore mei
> asus_ec_sensors acpi_cpufreq zram amdgpu drm_ttm_helper ttm
> crct10dif_pclmul crc32_pclmul crc32c_intel iommu_v2 ucsi_ccg gpu_sched
> typec_ucsi drm_buddy ghash_clmulni_intel drm_display_helper ccp igb
> typec sp5100_tco nvme cec nvme_core dca wmi ip6_tables ip_tables fuse
> [  297.834978] Unloaded tainted modules: amd64_edac():1 amd64_edac():1
> amd64_edac():1 amd64_edac():1 amd64_edac():1 amd64_edac():1
> amd64_edac():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
> pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1
> amd64_edac():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
> pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
> pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 amd64_edac():1
> pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
> pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
> pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
> amd64_edac():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
> pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1
> amd64_edac():1 amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1
> amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 amd64_edac():1
> pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
> pcc_cpufreq():1 pcc_cpufreq():1 pcc_cpufreq():1 fjes():1
> [  297.835055]  pcc_cpufreq():1 fjes():1 pcc_cpufreq():1 fjes():1
> pcc_cpufreq():1 fjes():1 fjes():1 fjes():1 fjes():1 fjes():1
> [  297.835071] CPU: 30 PID: 2377 Comm: kworker/30:6 Tainted: G
> W    L    -------  ---
> 6.0.0-0.rc1.20220817git3cc40a443a04.14.fc38.x86_64 #1
> [  297.835075] Hardware name: System manufacturer System Product
> Name/ROG STRIX X570-I GAMING, BIOS 4403 04/27/2022
> [  297.835078] Workqueue: events drm_sched_entity_kill_jobs_work [gpu_sched]
> [  297.835085] RIP: 0010:refcount_warn_saturate+0xba/0x110
> [  297.835088] Code: 01 01 e8 59 59 6f 00 0f 0b e9 22 46 a5 00 80 3d
> be 7d be 01 00 75 85 48 c7 c7 c0 99 8e aa c6 05 ae 7d be 01 01 e8 36
> 59 6f 00 <0f> 0b e9 ff 45 a5 00 80 3d 99 7d be 01 00 0f 85 5e ff ff ff
> 48 c7
> [  297.835091] RSP: 0018:ffffbd3506df7e60 EFLAGS: 00010286
> [  297.835095] RAX: 0000000000000026 RBX: ffff961b250cbc28 RCX: 0000000000000000
> [  297.835097] RDX: 0000000000000001 RSI: ffffffffaa8d07a4 RDI: 00000000ffffffff
> [  297.835100] RBP: ffff96276a3f5600 R08: 0000000000000000 R09: ffffbd3506df7d10
> [  297.835102] R10: 0000000000000003 R11: ffff9627ae2fffe8 R12: ffff96276a3fc800
> [  297.835105] R13: ffff9618c03e6600 R14: ffff96276a3fc805 R15: ffff961b250cbc30
> [  297.835108] FS:  0000000000000000(0000) GS:ffff96276a200000(0000)
> knlGS:0000000000000000
> [  297.835110] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  297.835113] CR2: 0000621001e4a000 CR3: 000000018d958000 CR4: 0000000000350ee0
> [  297.835116] Call Trace:
> [  297.835118]  <TASK>
> [  297.835121]  process_one_work+0x2a0/0x600
> [  297.835133]  worker_thread+0x4f/0x3a0
> [  297.835139]  ? process_one_work+0x600/0x600
> [  297.835142]  kthread+0xf5/0x120
> [  297.835145]  ? kthread_complete_and_exit+0x20/0x20
> [  297.835151]  ret_from_fork+0x22/0x30
> [  297.835166]  </TASK>
> [  297.835168] irq event stamp: 198245
> [  297.835171] hardirqs last  enabled at (198253):
> [<ffffffffa918ce7e>] __up_console_sem+0x5e/0x70
> [  297.835175] hardirqs last disabled at (198260):
> [<ffffffffa918ce63>] __up_console_sem+0x43/0x70
> [  297.835177] softirqs last  enabled at (196454):
> [<ffffffffa9de3a4e>] addrconf_verify_rtnl+0x23e/0x920
> [  297.835182] softirqs last disabled at (196448):
> [<ffffffffa9de3835>] addrconf_verify_rtnl+0x25/0x920
> [  297.835185] ---[ end trace 0000000000000000 ]---
> 
> 
> Fill kernel log: https://pastebin.com/zbbY2zDU
> 
