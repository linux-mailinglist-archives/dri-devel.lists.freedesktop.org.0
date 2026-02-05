Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHnkH/2PhGkh3gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 13:41:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AD8F2B61
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 13:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278F310E89F;
	Thu,  5 Feb 2026 12:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZydxAir8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E54110E89A;
 Thu,  5 Feb 2026 12:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770295289; x=1801831289;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VimFjRK28/j+gUbIr3eJarghf07UCr9oX8jxWPGbwik=;
 b=ZydxAir8TcDsVbDLPGw38C3O+HfrF4WhVbRKgm4OBtubYkcMj3suIoVf
 1lxwjw1nPm8ppCO2YvEtkIOsMk/Rct87P/BCl8wYKA1EkDtz+aoNW9Scz
 5A27qmdpaWxeBWuFqi8IS9qi8PmXfPIpf2AyemDkXYsw5/cA3ql7EUN8t
 BeTm01ZKUCsuTmibqrGVgEWVariMZVh59w4h547hEfK3mDL9jFdq6jczN
 iFSCgY+dojcOZ6CkeFovbbrAnoyh2c6StHQ3SNVjTpSHQNwL75a15Lbvx
 z/PnjrSQU/08F+tU/sRunKfiE1GVoRWEN/cTnrueEC0o5x/iOPYYZ7VpF w==;
X-CSE-ConnectionGUID: trROJIy5SvKA7NJXGZvvmA==
X-CSE-MsgGUID: jP6rfbniSdOJ+B+UbtSQtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="96947936"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="96947936"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 04:41:28 -0800
X-CSE-ConnectionGUID: mhxCuNKwR16muqQBMfSf2g==
X-CSE-MsgGUID: SHLCvZAzQGeIXi7ExROklg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215486668"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.93])
 ([10.245.244.93])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 04:41:25 -0800
Message-ID: <050af3658287690c9f9b29a49bb3e31ecb4c273e.camel@linux.intel.com>
Subject: Re: [PATCH v4] mm: Fix a hmm_range_fault() livelock / starvation
 problem
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Balbir Singh <balbirs@nvidia.com>, intel-xe@lists.freedesktop.org
Cc: Alistair Popple <apopple@nvidia.com>, Ralph Campbell
 <rcampbell@nvidia.com>,  Christoph Hellwig	 <hch@lst.de>, Jason Gunthorpe
 <jgg@mellanox.com>, Jason Gunthorpe <jgg@ziepe.ca>,  Leon Romanovsky	
 <leon@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Matthew Brost
 <matthew.brost@intel.com>, John Hubbard <jhubbard@nvidia.com>, 
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Date: Thu, 05 Feb 2026 13:41:22 +0100
In-Reply-To: <a1fa9630-2661-4a62-9b38-8154d8ef05b1@nvidia.com>
References: <20260205111028.200506-1-thomas.hellstrom@linux.intel.com>
 <a1fa9630-2661-4a62-9b38-8154d8ef05b1@nvidia.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: C2AD8F2B61
X-Rspamd-Action: no action

On Thu, 2026-02-05 at 22:20 +1100, Balbir Singh wrote:
> On 2/5/26 22:10, Thomas Hellstr=C3=B6m wrote:
> > If hmm_range_fault() fails a folio_trylock() in do_swap_page,
> > trying to acquire the lock of a device-private folio for migration,
> > to ram, the function will spin until it succeeds grabbing the lock.
> >=20
> > However, if the process holding the lock is depending on a work
> > item to be completed, which is scheduled on the same CPU as the
> > spinning hmm_range_fault(), that work item might be starved and
> > we end up in a livelock / starvation situation which is never
> > resolved.
> >=20
> > This can happen, for example if the process holding the
> > device-private folio lock is stuck in
> > =C2=A0=C2=A0 migrate_device_unmap()->lru_add_drain_all()
> > The lru_add_drain_all() function requires a short work-item
> > to be run on all online cpus to complete.
> >=20
> > A prerequisite for this to happen is:
> > a) Both zone device and system memory folios are considered in
> > =C2=A0=C2=A0 migrate_device_unmap(), so that there is a reason to call
> > =C2=A0=C2=A0 lru_add_drain_all() for a system memory folio while a
> > =C2=A0=C2=A0 folio lock is held on a zone device folio.
> > b) The zone device folio has an initial mapcount > 1 which causes
> > =C2=A0=C2=A0 at least one migration PTE entry insertion to be deferred =
to
> > =C2=A0=C2=A0 try_to_migrate(), which can happen after the call to
> > =C2=A0=C2=A0 lru_add_drain_all().
> > c) No or voluntary only preemption.
> >=20
> > This all seems pretty unlikely to happen, but indeed is hit by
> > the "xe_exec_system_allocator" igt test.
> >=20
>=20
> Do you have a stack trace from the test? I am trying to visualize the
> livelock/starvation, but I can't from the description.

The spinning thread: (The backtrace varies slightly from time to time:)

[  805.201476] watchdog: BUG: soft lockup - CPU#139 stuck for 52s!
[kworker/u900:1:9985]
[  805.201477] Modules linked in: xt_conntrack nft_chain_nat
xt_MASQUERADE nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bridge
stp llc xfrm_user xfrm_algo xt_addrtype nft_compat x_tables nf_tables
mei_gsc_proxy pmt_crashlog mtd_intel_dg mei_gsc overlay qrtr
snd_hda_codec_intelhdmi snd_hda_codec_hdmi intel_rapl_msr
intel_rapl_common cfg80211 intel_uncore_frequency
intel_uncore_frequency_common intel_ifs i10nm_edac sunrpc binfmt_misc
skx_edac_common nfit xe x86_pkg_temp_thermal intel_powerclamp coretemp
nls_iso8859_1 kvm_intel kvm drm_ttm_helper drm_suballoc_helper
gpu_sched snd_hda_intel cmdlinepart drm_gpuvm snd_intel_dspcfg drm_exec
spi_nor drm_gpusvm_helper snd_hda_codec drm_buddy pmt_telemetry
dax_hmem snd_hwdep pmt_discovery mtd video irqbypass cxl_acpi qat_4xxx
iaa_crypto snd_hda_core pmt_class ttm rapl ses cxl_port snd_pcm
intel_cstate enclosure cxl_core intel_qat isst_if_mmio isst_if_mbox_pci
drm_display_helper snd_timer snd cec idxd crc8 einj ast mei_me
spi_intel_pci rc_core soundcore isst_if_common
[  805.201496]  ipmi_ssif authenc i2c_i801 intel_vsec idxd_bus
spi_intel i2c_algo_bit mei i2c_ismt i2c_smbus wmi joydev input_leds
ipmi_si acpi_power_meter acpi_ipmi ipmi_devintf ipmi_msghandler
acpi_pad mac_hid pfr_telemetry pfr_update sch_fq_codel msr efi_pstore
dm_multipath nfnetlink dmi_sysfs autofs4 btrfs blake2b libblake2b
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor
async_tx xor raid6_pq raid1 raid0 linear rndis_host cdc_ether usbnet
mii nvme hid_generic mpt3sas i40e nvme_core usbhid ahci
ghash_clmulni_intel raid_class nvme_keyring scsi_transport_sas hid
libahci nvme_auth libie hkdf libie_adminq pinctrl_emmitsburg
aesni_intel
[  805.201510] CPU: 139 UID: 0 PID: 9985 Comm: kworker/u900:1 Tainted:
G S      W    L      6.19.0-rc7+ #18 PREEMPT(voluntary)=20
[  805.201512] Tainted: [S]=3DCPU_OUT_OF_SPEC, [W]=3DWARN, [L]=3DSOFTLOCKUP
[  805.201512] Hardware name: Supermicro SYS-421GE-TNRT/X13DEG-OA, BIOS
2.5a 02/21/2025
[  805.201513] Workqueue: xe_page_fault_work_queue
xe_pagefault_queue_work [xe]
[  805.201599] RIP: 0010:_raw_spin_unlock+0x16/0x40
[  805.201602] Code: cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90
90 90 90 0f 1f 44 00 00 55 48 89 e5 c6 07 00 0f 1f 00 65 ff 0d fa a6 40
01 <74> 10 5d 31 c0 31 d2 31 c9 31 f6 31 ff c3 cc cc cc cc 0f 1f 44 00
[  805.201603] RSP: 0018:ffffd2a663a4f678 EFLAGS: 00000247
[  805.201603] RAX: fffff85c67e35080 RBX: ffffd2a663a4f7b8 RCX:
0000000000000000
[  805.201604] RDX: ffff8b88fdd31a00 RSI: 0000000000000000 RDI:
fffff75c86ff5928
[  805.201605] RBP: ffffd2a663a4f678 R08: 0000000000000000 R09:
0000000000000000
[  805.201605] R10: 0000000000000000 R11: 0000000000000000 R12:
0000631d10d42000
[  805.201606] R13: ffffd2a663a4f7b8 R14: 00000001a4ca4067 R15:
74000003ff9f8d42
[  805.201606] FS:  0000000000000000(0000) GS:ffff8bc76202b000(0000)
knlGS:0000000000000000
[  805.201607] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  805.201608] CR2: 0000631d10c00088 CR3: 0000003de3040004 CR4:
0000000000f72ef0
[  805.201609] PKRU: 55555554
[  805.201609] Call Trace:
[  805.201610]  <TASK>
[  805.201610]  do_swap_page+0x17c6/0x1b70
[  805.201612]  ? sysvec_apic_timer_interrupt+0x57/0xc0
[  805.201614]  ? asm_sysvec_apic_timer_interrupt+0x1b/0x20
[  805.201615]  ? __pfx_default_wake_function+0x10/0x10
[  805.201617]  ? ___pte_offset_map+0x1c/0x130
[  805.201619]  __handle_mm_fault+0xa75/0x1020
[  805.201621]  handle_mm_fault+0xeb/0x2f0
[  805.201622]  ? handle_mm_fault+0x11a/0x2f0
[  805.201623]  hmm_vma_fault.isra.0+0x5b/0xb0
[  805.201625]  hmm_vma_walk_pmd+0x5c7/0xc40
[  805.201627]  ? sysvec_apic_timer_interrupt+0x57/0xc0
[  805.201629]  walk_pgd_range+0x5ba/0xbf0
[  805.201631]  __walk_page_range+0x8e/0x220
[  805.201633]  walk_page_range_mm_unsafe+0x149/0x210
[  805.201635]  walk_page_range+0x2a/0x40
[  805.201636]  hmm_range_fault+0x5c/0xb0
[  805.201638]  drm_gpusvm_range_evict+0x11a/0x1d0 [drm_gpusvm_helper]
[  805.201641]  __xe_svm_handle_pagefault+0x5fa/0xf00 [xe]
[  805.201736]  ? select_task_rq_fair+0x9bc/0x2970
[  805.201738]  xe_svm_handle_pagefault+0x3d/0xb0 [xe]
[  805.201827]  xe_pagefault_queue_work+0x233/0x370 [xe]
[  805.201905]  process_one_work+0x18d/0x370
[  805.201907]  worker_thread+0x31a/0x460
[  805.201908]  ? __pfx_worker_thread+0x10/0x10
[  805.201909]  kthread+0x10b/0x220
[  805.201910]  ? __pfx_kthread+0x10/0x10
[  805.201912]  ret_from_fork+0x289/0x2c0
[  805.201913]  ? __pfx_kthread+0x10/0x10
[  805.201915]  ret_from_fork_asm+0x1a/0x30
[  805.201917]  </TASK>

The thread holding the page-lock:

[ 1629.938195] Workqueue: xe_page_fault_work_queue
xe_pagefault_queue_work [xe]
[ 1629.938340] Call Trace:
[ 1629.938341]  <TASK>
[ 1629.938342]  __schedule+0x47f/0x1890
[ 1629.938346]  ? psi_group_change+0x1bd/0x4d0
[ 1629.938350]  ? __pick_eevdf+0x70/0x180
[ 1629.938353]  schedule+0x27/0xf0
[ 1629.938357]  schedule_timeout+0xcf/0x110
[ 1629.938361]  __wait_for_common+0x98/0x180
[ 1629.938364]  ? __pfx_schedule_timeout+0x10/0x10
[ 1629.938368]  wait_for_completion+0x24/0x40
[ 1629.938370]  __flush_work+0x2b6/0x400
[ 1629.938373]  ? kick_pool+0x77/0x1b0
[ 1629.938377]  ? __pfx_wq_barrier_func+0x10/0x10
[ 1629.938382]  flush_work+0x1c/0x30
[ 1629.938384]  __lru_add_drain_all+0x19f/0x2a0
[ 1629.938390]  lru_add_drain_all+0x10/0x20
[ 1629.938392]  migrate_device_unmap+0x433/0x480
[ 1629.938398]  migrate_vma_setup+0x245/0x300
[ 1629.938403]  drm_pagemap_migrate_to_devmem+0x2a8/0xc00
[drm_gpusvm_helper]
[ 1629.938410]  ? krealloc_node_align_noprof+0x12f/0x3a0
[ 1629.938413]  ? __xe_bo_create_locked+0x376/0x840 [xe]
[ 1629.938529]  xe_drm_pagemap_populate_mm+0x25f/0x3a0 [xe]
[ 1629.938721]  drm_pagemap_populate_mm+0x74/0xe0 [drm_gpusvm_helper]
[ 1629.938731]  xe_svm_alloc_vram+0xad/0x270 [xe]
[ 1629.938933]  ? xe_tile_local_pagemap+0x41/0x170 [xe]
[ 1629.939095]  ? ktime_get+0x41/0x100
[ 1629.939098]  __xe_svm_handle_pagefault+0xa90/0xf00 [xe]
[ 1629.939279]  xe_svm_handle_pagefault+0x3d/0xb0 [xe]
[ 1629.939460]  xe_pagefault_queue_work+0x233/0x370 [xe]
[ 1629.939620]  process_one_work+0x18d/0x370
[ 1629.939623]  worker_thread+0x31a/0x460
[ 1629.939626]  ? __pfx_worker_thread+0x10/0x10
[ 1629.939629]  kthread+0x10b/0x220
[ 1629.939632]  ? __pfx_kthread+0x10/0x10
[ 1629.939636]  ret_from_fork+0x289/0x2c0
[ 1629.939639]  ? __pfx_kthread+0x10/0x10
[ 1629.939642]  ret_from_fork_asm+0x1a/0x30
[ 1629.939648]  </TASK>

The worker that this thread waits on in flush_work() is,=20
most likely, the one starved on cpu-time on cpu #139.

Thanks,
Thomas
