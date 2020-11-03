Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2962A53DE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 22:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B126F37F;
	Tue,  3 Nov 2020 21:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200966EEAE;
 Tue,  3 Nov 2020 21:05:31 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id m8so14556733ljj.0;
 Tue, 03 Nov 2020 13:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=j1S+p/W/XEeD5q3GUSyqutthSsTm/18f+f5pdu9MOpM=;
 b=Hc7XuCrbNMijEVGJmt5FKGLZjRdeOPNXiZpbVk81vQ1400B4DevFzuRghz1CjeaXYs
 kqXWESrlDufhBHm2yRKp91hrDD9i20AUeD++BV93+nOko9bELWKdwMaT6UbgpnHk//RH
 D6qrIT7TAxcUT8bC0XiQ416i1q/SBbKAWUhhL+cTcONx3Ldi6dwqoMymZCckDkigYH8t
 kRyEyKDSXPzRwM+iZ4kWO4CuVWlq7EjRWYeJLPVuZsz2hLlhBwG4DaIP7eVELy3AmRDp
 p2koNjohhDEUouRl35wJipI7Bw1f4koMfD7n8Z87xdBtWV2Exqh2K4byaGBGec+pEav5
 ldJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=j1S+p/W/XEeD5q3GUSyqutthSsTm/18f+f5pdu9MOpM=;
 b=roNqY3cX46uXPHD2alXrofxYtb2ackuPmE2YnKRdwN8uEFuwFa6dCPpA4z5UHx3/Mr
 pWeVR5dhIIK1wez2gU807/tMIGZLDWtpo2fcQiWK+2j4usXJrXHCntQz2jtgAi8N35+D
 BBl+X2dSu4qNaSnpl8ltYR8/O/9dj6VpTHg8gKKNOOFwvsPsm4QZursQqwyo9jWlhhPh
 fSndlEQpKzPnm2lPsvZIhqD9SK/PZifR4GHeZPrVEfvBSDdjF5HNb9Jda6ikMQ+UAuWo
 zQEUKEwSqgVffT7cyy07Q+Je+OpVJLHf13Y8iMyQktw2QsUpR3bEXPDlVLynjzqgdDZS
 y7+Q==
X-Gm-Message-State: AOAM532XioeEwluMeyN58YgzlzKGqtUXpS5SRmrLMsDpdeUSlit8ujBP
 W/wzAzm9mKAsRSTvhRaXmrIrRhEJ27SXxHEN7skieUVI5W+WX1cM
X-Google-Smtp-Source: ABdhPJxZCmO5fsMpwMo9agbDn3W1D6glAhqyjScP33UWkzj0/GOL7LeFhlHY/LAIQtguz9GAQIBsAEyFds9CJ/quqts=
X-Received: by 2002:a2e:6a08:: with SMTP id f8mr8627154ljc.254.1604437528410; 
 Tue, 03 Nov 2020 13:05:28 -0800 (PST)
MIME-Version: 1.0
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 4 Nov 2020 02:05:17 +0500
Message-ID: <CABXGCsM-+UgHjMFriOPD8vg2va1uTVgQ0BJ5PZzvCu=avGyrpw@mail.gmail.com>
Subject: [bugreport] [5.10-rc1] Oops: 0000 [#1] SMP NOPTI bug which always
 starts as page allocation failure
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
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

Hi folks.
I observed hard reproductible the set of bugs.
It always started as
1) kworker/u64:2: page allocation failure: order:5,
mode:0x40dc0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO),
nodemask=(null),cpuset=/,mems_allowed=0
Continious as:
2) WARNING: CPU: 21 PID: 806649 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7505
amdgpu_dm_atomic_commit_tail+0x23bd/0x24e0 [amdgpu]
And ended as:
3) BUG: unable to handle page fault for address: 0000000000012488
Which annoing because lead to completely computer hang.

Example of one log:

[11561.927250] kworker/u64:10: page allocation failure: order:5,
mode:0x40dc0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO),
nodemask=(null),cpuset=/,mems_allowed=0
[11561.927472] CPU: 18 PID: 39985 Comm: kworker/u64:10 Not tainted
5.10.0-0.rc1.20201028gited8780e3f2ec.57.fc34.x86_64 #1
[11561.927475] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-I GAMING, BIOS 2802 10/21/2020
[11561.927485] Workqueue: events_unbound commit_work [drm_kms_helper]
[11561.927489] Call Trace:
[11561.927496]  dump_stack+0x8b/0xb0
[11561.927501]  warn_alloc.cold+0x75/0xd9
[11561.927507]  ? _cond_resched+0x16/0x50
[11561.927512]  ? __alloc_pages_direct_compact+0x159/0x180
[11561.927518]  __alloc_pages_slowpath.constprop.0+0x103f/0x1070
[11561.927531]  __alloc_pages_nodemask+0x37d/0x400
[11561.927538]  kmalloc_order+0x33/0xc0
[11561.927542]  kmalloc_order_trace+0x19/0x110
[11561.927614]  dc_create_state+0x26/0x60 [amdgpu]
[11561.927677]  amdgpu_dm_atomic_commit_tail+0x1cee/0x24e0 [amdgpu]
[11561.927686]  ? find_busiest_group+0x33/0x350
[11561.927698]  ? __lock_acquire+0x3b0/0x21f0
[11561.927707]  ? lock_acquire+0xc8/0x400
[11561.927710]  ? wait_for_completion_timeout+0x3b/0xf0
[11561.927715]  ? mark_held_locks+0x50/0x80
[11561.927719]  ? lockdep_hardirqs_on_prepare+0xff/0x180
[11561.927722]  ? _raw_spin_unlock_irq+0x24/0x40
[11561.927726]  ? _raw_spin_unlock_irq+0x24/0x40
[11561.927729]  ? wait_for_completion_timeout+0xdb/0xf0
[11561.927740]  commit_tail+0x94/0x130 [drm_kms_helper]
[11561.927745]  process_one_work+0x27d/0x5b0
[11561.927753]  worker_thread+0x55/0x3c0
[11561.927756]  ? process_one_work+0x5b0/0x5b0
[11561.927760]  kthread+0x13a/0x150
[11561.927763]  ? __kthread_bind_mask+0x60/0x60
[11561.927769]  ret_from_fork+0x22/0x30
[11561.927809] Mem-Info:
[11561.927816] active_anon:933848 inactive_anon:4558268 isolated_anon:118
                active_file:154021 inactive_file:80446 isolated_file:0
                unevictable:1586 dirty:32469 writeback:700
                slab_reclaimable:185330 slab_unreclaimable:176202
                mapped:514440 shmem:592199 pagetables:81732 bounce:0
                free:99082 free_pcp:2104 free_cma:0
[11561.927820] Node 0 active_anon:3735392kB inactive_anon:18233072kB
active_file:616084kB inactive_file:321784kB unevictable:6344kB
isolated(anon):472kB isolated(file):0kB mapped:2057760kB
dirty:129876kB writeback:2800kB shmem:2368796kB shmem_thp: 0kB
shmem_pmdmapped: 0kB anon_thp: 0kB writeback_tmp:8kB
kernel_stack:96608kB all_unreclaimable? no
[11561.927824] Node 0 DMA free:11800kB min:32kB low:44kB high:56kB
reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB
present:15992kB managed:15900kB mlocked:0kB pagetables:0kB bounce:0kB
free_pcp:0kB local_pcp:0kB free_cma:0kB
[11561.927829] lowmem_reserve[]: 0 3136 31809 31809 31809
[11561.927839] Node 0 DMA32 free:142632kB min:26264kB low:29472kB
high:32680kB reserved_highatomic:0KB active_anon:131568kB
inactive_anon:1625184kB active_file:57556kB inactive_file:13532kB
unevictable:0kB writepending:2428kB present:3317760kB
managed:3317572kB mlocked:0kB pagetables:25624kB bounce:0kB
free_pcp:1764kB local_pcp:0kB free_cma:0kB
[11561.927844] lowmem_reserve[]: 0 0 28673 28673 28673
[11561.927854] Node 0 Normal free:241896kB min:240300kB low:269660kB
high:299020kB reserved_highatomic:2048KB active_anon:3603472kB
inactive_anon:16607812kB active_file:558660kB inactive_file:308056kB
unevictable:6344kB writepending:130596kB present:30133248kB
managed:29370624kB mlocked:6344kB pagetables:301304kB bounce:0kB
free_pcp:6656kB local_pcp:60kB free_cma:0kB
[11561.927859] lowmem_reserve[]: 0 0 0 0 0
[11561.927871] Node 0 DMA: 0*4kB 1*8kB (U) 1*16kB (U) 0*32kB 2*64kB
(U) 1*128kB (U) 1*256kB (U) 0*512kB 1*1024kB (U) 1*2048kB (M) 2*4096kB
(M) = 11800kB
[11561.927900] Node 0 DMA32: 15432*4kB (UME) 4963*8kB (UME) 2169*16kB
(UME) 201*32kB (UM) 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB
0*4096kB = 142568kB
[11561.927923] Node 0 Normal: 49027*4kB (UMEH) 5656*8kB (MH) 20*16kB
(H) 10*32kB (H) 2*64kB (H) 2*128kB (H) 0*256kB 0*512kB 0*1024kB
0*2048kB 0*4096kB = 242380kB
[11561.927951] Node 0 hugepages_total=0 hugepages_free=0
hugepages_surp=0 hugepages_size=1048576kB
[11561.927954] Node 0 hugepages_total=0 hugepages_free=0
hugepages_surp=0 hugepages_size=2048kB
[11561.927956] 847580 total pagecache pages
[11561.927967] 19862 pages in swap cache
[11561.927970] Swap cache stats: add 1361095, delete 1341244, find 18038/25678
[11561.927972] Free swap  = 65956644kB
[11561.927974] Total swap = 71303160kB
[11561.927977] 8366750 pages RAM
[11561.927979] 0 pages HighMem/MovableOnly
[11561.927981] 190726 pages reserved
[11561.927984] 0 pages cma reserved
[11561.927986] 0 pages hwpoisoned
[11561.928023] ------------[ cut here ]------------
[11561.928084] WARNING: CPU: 18 PID: 39985 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7511
amdgpu_dm_atomic_commit_tail+0x23bd/0x24e0 [amdgpu]
[11561.928087] Modules linked in: tun uinput nls_utf8 isofs rfcomm
xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tftp
nf_conntrack_tftp bridge stp llc nft_objref nf_conntrack_netbios_ns
nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
nft_chain_nat ip6table_nat ip6table_mangle ip6table_raw
ip6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 iptable_mangle iptable_raw iptable_security ip_set
nf_tables nfnetlink ip6table_filter ip6_tables cmac iptable_filter
bnep sunrpc vfat fat hid_logitech_hidpp iwlmvm mt76x2u mt76x2_common
mt76x02_usb mt76_usb mt76x02_lib mt76 mac80211 uvcvideo
videobuf2_vmalloc videobuf2_memops btusb videobuf2_v4l2 btrtl btbcm
videobuf2_common btintel joydev bluetooth videodev libarc4 iwlwifi
hid_logitech_dj xpad ecdh_generic ff_memless ecc cfg80211
snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio
snd_hda_codec_hdmi snd_hda_intel
[11561.928191]  snd_intel_dspcfg snd_usb_audio snd_hda_codec
snd_usbmidi_lib snd_rawmidi edac_mce_amd snd_hda_core snd_hwdep
kvm_amd snd_seq eeepc_wmi snd_seq_device asus_wmi sparse_keymap kvm
snd_pcm irqbypass sp5100_tco snd_timer rfkill mc rapl video wmi_bmof
pcspkr snd i2c_piix4 k10temp soundcore acpi_cpufreq binfmt_misc zram
ip_tables uas usb_storage amdgpu iommu_v2 gpu_sched ttm drm_kms_helper
crct10dif_pclmul crc32_pclmul crc32c_intel cec drm ghash_clmulni_intel
igb ccp nvme dca nvme_core i2c_algo_bit wmi pinctrl_amd fuse
[11561.928282] CPU: 18 PID: 39985 Comm: kworker/u64:10 Not tainted
5.10.0-0.rc1.20201028gited8780e3f2ec.57.fc34.x86_64 #1
[11561.928284] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-I GAMING, BIOS 2802 10/21/2020
[11561.928291] Workqueue: events_unbound commit_work [drm_kms_helper]
[11561.928353] RIP: 0010:amdgpu_dm_atomic_commit_tail+0x23bd/0x24e0 [amdgpu]
[11561.928356] Code: ff ff 48 89 df c6 85 c0 fd ff ff 01 c7 85 bc fd
ff ff 37 00 00 00 c7 85 c4 fd ff ff 20 00 00 00 e8 d8 f9 11 00 e9 f9
fa ff ff <0f> 0b 48 8b 85 98 fd ff ff 31 f6 48 8b b8 20 ef 01 00 e8 6c
48 12
[11561.928359] RSP: 0018:ffffb42e15ebbb50 EFLAGS: 00010246
[11561.928362] RAX: 0000000000000000 RBX: 00000a83e545ffc4 RCX: 0000000000000001
[11561.928365] RDX: 0000000000000001 RSI: ffffffffa598f1c0 RDI: 0000000000000246
[11561.928367] RBP: ffffb42e15ebbe30 R08: 0000000000000000 R09: 0000000000000001
[11561.928370] R10: 0000000000007c49 R11: 0000000000000000 R12: 0000000000000000
[11561.928372] R13: ffffffffc0ad1710 R14: 0000000000000000 R15: ffff8d11a52cce40
[11561.928375] FS:  0000000000000000(0000) GS:ffff8d1848e00000(0000)
knlGS:0000000000000000
[11561.928377] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[11561.928380] CR2: 00007f4cde169000 CR3: 0000000320828000 CR4: 0000000000350ee0
[11561.928382] Call Trace:
[11561.928391]  ? find_busiest_group+0x33/0x350
[11561.928403]  ? __lock_acquire+0x3b0/0x21f0
[11561.928411]  ? lock_acquire+0xc8/0x400
[11561.928415]  ? wait_for_completion_timeout+0x3b/0xf0
[11561.928420]  ? mark_held_locks+0x50/0x80
[11561.928425]  ? lockdep_hardirqs_on_prepare+0xff/0x180
[11561.928428]  ? _raw_spin_unlock_irq+0x24/0x40
[11561.928432]  ? _raw_spin_unlock_irq+0x24/0x40
[11561.928435]  ? wait_for_completion_timeout+0xdb/0xf0
[11561.928446]  commit_tail+0x94/0x130 [drm_kms_helper]
[11561.928451]  process_one_work+0x27d/0x5b0
[11561.928459]  worker_thread+0x55/0x3c0
[11561.928462]  ? process_one_work+0x5b0/0x5b0
[11561.928466]  kthread+0x13a/0x150
[11561.928469]  ? __kthread_bind_mask+0x60/0x60
[11561.928474]  ret_from_fork+0x22/0x30
[11561.928485] CPU: 18 PID: 39985 Comm: kworker/u64:10 Not tainted
5.10.0-0.rc1.20201028gited8780e3f2ec.57.fc34.x86_64 #1
[11561.928487] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-I GAMING, BIOS 2802 10/21/2020
[11561.928493] Workqueue: events_unbound commit_work [drm_kms_helper]
[11561.928496] Call Trace:
[11561.928499]  dump_stack+0x8b/0xb0
[11561.928558]  ? amdgpu_dm_atomic_commit_tail+0x23bd/0x24e0 [amdgpu]
[11561.928561]  __warn.cold+0x24/0x83
[11561.928619]  ? amdgpu_dm_atomic_commit_tail+0x23bd/0x24e0 [amdgpu]
[11561.928624]  report_bug+0x9a/0xc0
[11561.928630]  handle_bug+0x3a/0xa0
[11561.928633]  exc_invalid_op+0x14/0x70
[11561.928636]  asm_exc_invalid_op+0x12/0x20
[11561.928692] RIP: 0010:amdgpu_dm_atomic_commit_tail+0x23bd/0x24e0 [amdgpu]
[11561.928695] Code: ff ff 48 89 df c6 85 c0 fd ff ff 01 c7 85 bc fd
ff ff 37 00 00 00 c7 85 c4 fd ff ff 20 00 00 00 e8 d8 f9 11 00 e9 f9
fa ff ff <0f> 0b 48 8b 85 98 fd ff ff 31 f6 48 8b b8 20 ef 01 00 e8 6c
48 12
[11561.928697] RSP: 0018:ffffb42e15ebbb50 EFLAGS: 00010246
[11561.928701] RAX: 0000000000000000 RBX: 00000a83e545ffc4 RCX: 0000000000000001
[11561.928703] RDX: 0000000000000001 RSI: ffffffffa598f1c0 RDI: 0000000000000246
[11561.928705] RBP: ffffb42e15ebbe30 R08: 0000000000000000 R09: 0000000000000001
[11561.928707] R10: 0000000000007c49 R11: 0000000000000000 R12: 0000000000000000
[11561.928710] R13: ffffffffc0ad1710 R14: 0000000000000000 R15: ffff8d11a52cce40
[11561.928727]  ? find_busiest_group+0x33/0x350
[11561.928738]  ? __lock_acquire+0x3b0/0x21f0
[11561.928747]  ? lock_acquire+0xc8/0x400
[11561.928750]  ? wait_for_completion_timeout+0x3b/0xf0
[11561.928756]  ? mark_held_locks+0x50/0x80
[11561.928762]  ? lockdep_hardirqs_on_prepare+0xff/0x180
[11561.928765]  ? _raw_spin_unlock_irq+0x24/0x40
[11561.928771]  ? _raw_spin_unlock_irq+0x24/0x40
[11561.928775]  ? wait_for_completion_timeout+0xdb/0xf0
[11561.928791]  commit_tail+0x94/0x130 [drm_kms_helper]
[11561.928799]  process_one_work+0x27d/0x5b0
[11561.928810]  worker_thread+0x55/0x3c0
[11561.928814]  ? process_one_work+0x5b0/0x5b0
[11561.928820]  kthread+0x13a/0x150
[11561.928823]  ? __kthread_bind_mask+0x60/0x60
[11561.928828]  ret_from_fork+0x22/0x30
[11561.928861] irq event stamp: 296033
[11561.928864] hardirqs last  enabled at (296041):
[<ffffffffa4163191>] console_unlock+0x511/0x640
[11561.928867] hardirqs last disabled at (296048):
[<ffffffffa41630f8>] console_unlock+0x478/0x640
[11561.928870] softirqs last  enabled at (296032):
[<ffffffffa4e01112>] asm_call_irq_on_stack+0x12/0x20
[11561.928873] softirqs last disabled at (296011):
[<ffffffffa4e01112>] asm_call_irq_on_stack+0x12/0x20
[11561.928875] ---[ end trace b3e87a1bce96e088 ]---
[11561.928881] BUG: unable to handle page fault for address: 0000000000012488
[11561.928883] #PF: supervisor read access in kernel mode
[11561.928883] #PF: error_code(0x0000) - not-present page
[11561.928884] PGD 0 P4D 0
[11561.928887] Oops: 0000 [#1] SMP NOPTI
[11561.928888] CPU: 18 PID: 39985 Comm: kworker/u64:10 Tainted: G
  W        --------- ---
5.10.0-0.rc1.20201028gited8780e3f2ec.57.fc34.x86_64 #1
[11561.928889] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-I GAMING, BIOS 2802 10/21/2020
[11561.928894] Workqueue: events_unbound commit_work [drm_kms_helper]
[11561.928951] RIP: 0010:dc_resource_state_copy_construct+0x18/0x130 [amdgpu]
[11561.928952] Code: 00 49 83 c4 01 44 39 e0 7f b5 5b 5d 41 5c 41 5d
c3 c3 0f 1f 44 00 00 41 56 ba 90 24 01 00 41 55 41 54 49 89 f4 55 4c
89 e5 53 <44> 8b ae 88 24 01 00 48 89 fe 4c 89 e7 e8 16 ef 4b e4 49 8d
84 24
[11561.928953] RSP: 0018:ffffb42e15ebbb20 EFLAGS: 00010246
[11561.928954] RAX: ffff8d1159400010 RBX: 00000a83e545ffc4 RCX: 0000000000000001
[11561.928955] RDX: 0000000000012490 RSI: 0000000000000000 RDI: ffff8d11c3380000
[11561.928956] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000001
[11561.928957] R10: 0000000000007c49 R11: 0000000000000000 R12: 0000000000000000
[11561.928957] R13: ffffffffc0ad1710 R14: 0000000000000000 R15: ffff8d11a52cce40
[11561.928959] FS:  0000000000000000(0000) GS:ffff8d1848e00000(0000)
knlGS:0000000000000000
[11561.928959] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[11561.928960] CR2: 0000000000012488 CR3: 0000000320828000 CR4: 0000000000350ee0
[11561.928961] Call Trace:
[11561.929018]  amdgpu_dm_atomic_commit_tail+0x23d4/0x24e0 [amdgpu]
[11561.929022]  ? find_busiest_group+0x33/0x350
[11561.929025]  ? __lock_acquire+0x3b0/0x21f0
[11561.929028]  ? lock_acquire+0xc8/0x400
[11561.929029]  ? wait_for_completion_timeout+0x3b/0xf0
[11561.929031]  ? mark_held_locks+0x50/0x80
[11561.929032]  ? lockdep_hardirqs_on_prepare+0xff/0x180
[11561.929033]  ? _raw_spin_unlock_irq+0x24/0x40
[11561.929035]  ? _raw_spin_unlock_irq+0x24/0x40
[11561.929036]  ? wait_for_completion_timeout+0xdb/0xf0
[11561.929042]  commit_tail+0x94/0x130 [drm_kms_helper]
[11561.929043]  process_one_work+0x27d/0x5b0
[11561.929046]  worker_thread+0x55/0x3c0
[11561.929047]  ? process_one_work+0x5b0/0x5b0
[11561.929048]  kthread+0x13a/0x150
[11561.929050]  ? __kthread_bind_mask+0x60/0x60
[11561.929051]  ret_from_fork+0x22/0x30
[11561.929055] Modules linked in: tun uinput nls_utf8 isofs rfcomm
xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tftp
nf_conntrack_tftp bridge stp llc nft_objref nf_conntrack_netbios_ns
nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
nft_chain_nat ip6table_nat ip6table_mangle ip6table_raw
ip6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 iptable_mangle iptable_raw iptable_security ip_set
nf_tables nfnetlink ip6table_filter ip6_tables cmac iptable_filter
bnep sunrpc vfat fat hid_logitech_hidpp iwlmvm mt76x2u mt76x2_common
mt76x02_usb mt76_usb mt76x02_lib mt76 mac80211 uvcvideo
videobuf2_vmalloc videobuf2_memops btusb videobuf2_v4l2 btrtl btbcm
videobuf2_common btintel joydev bluetooth videodev libarc4 iwlwifi
hid_logitech_dj xpad ecdh_generic ff_memless ecc cfg80211
snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio
snd_hda_codec_hdmi snd_hda_intel
[11561.929080]  snd_intel_dspcfg snd_usb_audio snd_hda_codec
snd_usbmidi_lib snd_rawmidi edac_mce_amd snd_hda_core snd_hwdep
kvm_amd snd_seq eeepc_wmi snd_seq_device asus_wmi sparse_keymap kvm
snd_pcm irqbypass sp5100_tco snd_timer rfkill mc rapl video wmi_bmof
pcspkr snd i2c_piix4 k10temp soundcore acpi_cpufreq binfmt_misc zram
ip_tables uas usb_storage amdgpu iommu_v2 gpu_sched ttm drm_kms_helper
crct10dif_pclmul crc32_pclmul crc32c_intel cec drm ghash_clmulni_intel
igb ccp nvme dca nvme_core i2c_algo_bit wmi pinctrl_amd fuse
[11561.929099] CR2: 0000000000012488
[11561.929100] ---[ end trace b3e87a1bce96e089 ]---
[11561.929156] RIP: 0010:dc_resource_state_copy_construct+0x18/0x130 [amdgpu]
[11561.929157] Code: 00 49 83 c4 01 44 39 e0 7f b5 5b 5d 41 5c 41 5d
c3 c3 0f 1f 44 00 00 41 56 ba 90 24 01 00 41 55 41 54 49 89 f4 55 4c
89 e5 53 <44> 8b ae 88 24 01 00 48 89 fe 4c 89 e7 e8 16 ef 4b e4 49 8d
84 24
[11561.929158] RSP: 0018:ffffb42e15ebbb20 EFLAGS: 00010246
[11561.929159] RAX: ffff8d1159400010 RBX: 00000a83e545ffc4 RCX: 0000000000000001
[11561.929160] RDX: 0000000000012490 RSI: 0000000000000000 RDI: ffff8d11c3380000
[11561.929161] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000001
[11561.929161] R10: 0000000000007c49 R11: 0000000000000000 R12: 0000000000000000
[11561.929162] R13: ffffffffc0ad1710 R14: 0000000000000000 R15: ffff8d11a52cce40
[11561.929163] FS:  0000000000000000(0000) GS:ffff8d1848e00000(0000)
knlGS:0000000000000000
[11561.929164] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[11561.929165] CR2: 0000000000012488 CR3: 0000000320828000 CR4: 0000000000350ee0
[11561.929167] BUG: sleeping function called from invalid context at
include/linux/percpu-rwsem.h:49
[11561.929168] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid:
39985, name: kworker/u64:10
[11561.929169] INFO: lockdep is turned off.
[11561.929169] irq event stamp: 296082
[11561.929171] hardirqs last  enabled at (296081):
[<ffffffffa4163191>] console_unlock+0x511/0x640
[11561.929172] hardirqs last disabled at (296082):
[<ffffffffa4d14d52>] irqentry_enter+0x22/0x60
[11561.929174] softirqs last  enabled at (296032):
[<ffffffffa4e01112>] asm_call_irq_on_stack+0x12/0x20
[11561.929175] softirqs last disabled at (296011):
[<ffffffffa4e01112>] asm_call_irq_on_stack+0x12/0x20
[11561.929176] CPU: 18 PID: 39985 Comm: kworker/u64:10 Tainted: G
D W        --------- ---
5.10.0-0.rc1.20201028gited8780e3f2ec.57.fc34.x86_64 #1
[11561.929177] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-I GAMING, BIOS 2802 10/21/2020
[11561.929182] Workqueue: events_unbound commit_work [drm_kms_helper]
[11561.929183] Call Trace:
[11561.929184]  dump_stack+0x8b/0xb0
[11561.929185]  ___might_sleep.cold+0xb6/0xc6
[11561.929187]  exit_signals+0x1c/0x2d0
[11561.929189]  do_exit+0xa0/0xbb0
[11561.929191]  ? kthread+0x13a/0x150
[11561.929193]  rewind_stack_do_exit+0x17/0x20
[11561.929194] RIP: 0000:0x0
[11561.929196] Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
[11561.929197] RSP: 0000:0000000000000000 EFLAGS: 00000000 ORIG_RAX:
0000000000000000
[11561.929198] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[11561.929199] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[11561.929200] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[11561.929200] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[11561.929201] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[11597.118287] msedge:cs0 (6933) used greatest stack depth: 10520 bytes left
[11622.871513] brave:cs0 (6082) used greatest stack depth: 10120 bytes left
[11646.646066] GpuWatchdog[4876]: segfault at 0 ip 000055e94f08a429 sp
00007fa9b92d0420 error 6 in gitkraken[55e94b73e000+5cb7000]
[11646.646079] Code: 00 79 09 48 8b 7d c0 e8 85 f6 bd fe c7 45 c0 aa
aa aa aa 0f ae f0 41 8b 84 24 e0 00 00 00 89 45 c0 48 8d 7d c0 e8 e7
96 6b fc <c7> 04 25 00 00 00 00 37 13 00 00 48 83 c4 38 5b 41 5c 41 5d
41 5e

Here are complete versions of kernel logs described bug:
[1] https://pastebin.com/u5WApFtG
[2] https://pastebin.com/CQ8VyTXW
[3] https://pastebin.com/RrgtRvxk
[4] https://pastebin.com/wQseWsx5

Can anyone figure out what's going on here?
Thanks.

--
Best Regards,
Mike Gavrilov.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
