Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE9431428E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 23:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898146E93D;
	Mon,  8 Feb 2021 22:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6316E93D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 22:08:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A33164E27
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 22:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1612822113;
 bh=XuEp5Pv5iOgvlmkpqK/1cToINo94jkiopt4zyySLEOQ=;
 h=Date:From:To:Subject:From;
 b=e5QzqwSqVCOG09wzPQ1TrsfxPRZSOvHZHN7G9/4rxfl/+HBJuxk+e/O5/IboUcuVQ
 G5OA6R23TPDQU5m3ggu6q5+wT4MB3EKpx7t/k+guhh1ZBh5d79p/zW3ofq24ioecS+
 PhZPTgD0P8vMlUcmqApc0FvU7ioLw/w2hrlcjwtA=
Date: Mon, 8 Feb 2021 14:08:32 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: dri-devel@lists.freedesktop.org
Subject: Fw: [Bug 211587] New: X: page allocation failure: order:8,
 mode:0x190dc2(GFP_HIGHUSER|__GFP_NORETRY|__GFP_ZERO|__GFP_NOMEMALLOC),
 nodemask=(null),cpuset=/,mems_allowed=0
Message-Id: <20210208140832.2be5ad2f5aacced3dda1d18a@linux-foundation.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

I'm not sure who this belongs to...

Begin forwarded message:

Date: Sat, 06 Feb 2021 01:49:51 +0000
From: bugzilla-daemon@bugzilla.kernel.org
To: akpm@linux-foundation.org
Subject: [Bug 211587] New: X: page allocation failure: order:8, mode:0x190dc2(GFP_HIGHUSER|__GFP_NORETRY|__GFP_ZERO|__GFP_NOMEMALLOC), nodemask=(null),cpuset=/,mems_allowed=0


https://bugzilla.kernel.org/show_bug.cgi?id=211587

            Bug ID: 211587
           Summary: X: page allocation failure: order:8,
                    mode:0x190dc2(GFP_HIGHUSER|__GFP_NORETRY|__GFP_ZERO|__
                    GFP_NOMEMALLOC),
                    nodemask=(null),cpuset=/,mems_allowed=0
           Product: Memory Management
           Version: 2.5
    Kernel Version: v5.11-rc6
          Hardware: i386
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Page Allocator
          Assignee: akpm@linux-foundation.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 295083
  --> https://bugzilla.kernel.org/attachment.cgi?id=295083&action=edit
dmesg (kernel 5.11-rc6, Shuttle XPC FS51, Pentium 4) ... 1st occurence

Got this while running btrfs testsuite on the machine. It's not 100 %
reproducable, but it happened on several occasions.

[...]
X: page allocation failure: order:8,
mode:0x190dc2(GFP_HIGHUSER|__GFP_NORETRY|__GFP_ZERO|__GFP_NOMEMALLOC),
nodemask=(null),cpuset=/,mems_allowed=0
CPU: 0 PID: 199 Comm: X Not tainted 5.11.0-rc6-Pentium4 #4
Hardware name:  /FS51, BIOS 6.00 PG 12/02/2003
Call Trace:
 dump_stack+0x6b/0x89
 warn_alloc+0x87/0xe0
 __alloc_pages_nodemask+0x9ba/0xa6e
 ? lock_acquire+0x86/0x2b4
 ? __kmalloc+0x11a/0x12d
 ? kvmalloc_node+0x43/0x6b
 ttm_pool_alloc+0x135/0x3cd [ttm]
 radeon_ttm_tt_populate+0x72/0x79 [radeon]
 ? radeon_bo_reserve.constprop.0+0x4c/0x4c [radeon]
 ttm_tt_populate+0x2e/0x92 [ttm]
 ttm_bo_handle_move_mem+0x8d/0xd9 [ttm]
 ttm_bo_validate+0xe7/0x140 [ttm]
 ttm_bo_init_reserved+0x23e/0x26b [ttm]
 ttm_bo_init+0x48/0x67 [ttm]
 ? radeon_bo_gpu_offset+0x55/0x55 [radeon]
 radeon_bo_create+0x118/0x1ce [radeon]
 ? radeon_bo_gpu_offset+0x55/0x55 [radeon]
 radeon_gem_object_create+0x93/0x12e [radeon]
 radeon_gem_create_ioctl+0x4a/0xa9 [radeon]
 ? srcu_read_unlock.constprop.0+0x28/0x2b [drm]
 ? radeon_gem_pwrite_ioctl+0x19/0x19 [radeon]
 drm_ioctl_kernel+0x73/0xa9 [drm]
 drm_ioctl+0x225/0x2f7 [drm]
 ? radeon_gem_pwrite_ioctl+0x19/0x19 [radeon]
 ? lock_acquire+0x86/0x2b4
 ? lock_acquire+0x86/0x2b4
 ? lock_release+0x78/0x201
 ? __pm_runtime_resume+0x5e/0x66
 ? trace_hardirqs_on+0x43/0x45
 ? __pm_runtime_resume+0x5e/0x66
 radeon_drm_ioctl+0x3d/0x69 [radeon]
 ? radeon_pmops_runtime_idle+0x83/0x83 [radeon]
 vfs_ioctl+0x1a/0x24
 __ia32_sys_ioctl+0x618/0x632
 ? __vm_munmap+0x60/0x88
 ? __vm_munmap+0x7e/0x88
 ? exit_to_user_mode_prepare+0x16b/0x173
 __do_fast_syscall_32+0x66/0x76
 do_fast_syscall_32+0x29/0x5b
 do_SYSENTER_32+0x15/0x17
 entry_SYSENTER_32+0x9f/0xf2
EIP: 0xb7f76545
Code: c4 01 10 03 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74
b0 01 10 08 03 74 d8 01 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90
8d 76 00 58 b8 77 00 00 00 cd 80 90 8d 76
EAX: ffffffda EBX: 0000000d ECX: c01c645d EDX: bff1a860
ESI: 0232da80 EDI: 00000002 EBP: bff1a818 ESP: bff1a7e8
DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000286
Mem-Info:
active_anon:229 inactive_anon:66945 isolated_anon:0
 active_file:44149 inactive_file:364595 isolated_file:32
 unevictable:0 dirty:25771 writeback:2106
 slab_reclaimable:4183 slab_unreclaimable:6442
 mapped:30206 shmem:1738 pagetables:941 bounce:0
 free:23348 free_pcp:72 free_cma:0
Node 0 active_anon:916kB inactive_anon:267780kB active_file:176596kB
inactive_file:1458380kB unevictable:0kB isolated(anon):0kB isolated(file):128kB
mapped:120824kB dirty:103084kB writeback:8424kB shmem:6952kB shmem_thp: 0kB
shmem_pmdmapped: 0kB anon_thp: 0kB writeback_tmp:0kB kernel_stack:2456kB
pagetables:3764kB all_unreclaimable? no
DMA free:8776kB min:788kB low:984kB high:1180kB reserved_highatomic:0KB
active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:7136kB
unevictable:0kB writepending:188kB present:16000kB managed:15916kB mlocked:0kB
bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 834 1998 1998
Normal free:79860kB min:42468kB low:53084kB high:63700kB
reserved_highatomic:0KB active_anon:0kB inactive_anon:60668kB
active_file:58240kB inactive_file:608540kB unevictable:0kB writepending:12988kB
present:888824kB managed:855428kB mlocked:0kB bounce:0kB free_pcp:36kB
local_pcp:36kB free_cma:0kB
lowmem_reserve[]: 0 0 9311 9311
HighMem free:4756kB min:4608kB low:19408kB high:34208kB reserved_highatomic:0KB
active_anon:916kB inactive_anon:207112kB active_file:118332kB
inactive_file:842684kB unevictable:0kB writepending:98340kB present:1191880kB
managed:1191880kB mlocked:0kB bounce:0kB free_pcp:252kB local_pcp:252kB
free_cma:0kB
lowmem_reserve[]: 0 0 0 0
DMA: 2*4kB (UM) 2*8kB (UM) 1*16kB (U) 1*32kB (U) 2*64kB (UM) 1*128kB (U)
1*256kB (U) 2*512kB (UM) 1*1024kB (U) 1*2048kB (U) 1*4096kB (M) = 8776kB
Normal: 229*4kB (U) 152*8kB (UME) 61*16kB (UME) 30*32kB (UME) 28*64kB (UME)
18*128kB (UE) 20*256kB (UME) 6*512kB (UE) 6*1024kB (UME) 4*2048kB (UME)
12*4096kB (U) = 79844kB
HighMem: 3*4kB (UM) 1*8kB (U) 0*16kB 0*32kB 6*64kB (U) 2*128kB (U) 2*256kB (U)
1*512kB (M) 3*1024kB (M) 0*2048kB 0*4096kB = 4756kB
Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0
hugepages_size=4096kB
410490 total pagecache pages
0 pages in swap cache
Swap cache stats: add 0, delete 0, find 0/0
Free swap  = 8388604kB
Total swap = 8388604kB
524176 pages RAM
297970 pages HighMem/MovableOnly
8370 pages reserved
[...]


 # lspci 
00:00.0 Host bridge: Silicon Integrated Systems [SiS] 651 Host (rev 02)
00:01.0 PCI bridge: Silicon Integrated Systems [SiS] AGP Port (virtual
PCI-to-PCI bridge)
00:02.0 ISA bridge: Silicon Integrated Systems [SiS] SiS962 [MuTIOL Media IO]
LPC Controller (rev 14)
00:02.1 SMBus: Silicon Integrated Systems [SiS] SiS961/2/3 SMBus controller
00:02.5 IDE interface: Silicon Integrated Systems [SiS] 5513 IDE Controller
00:02.7 Multimedia audio controller: Silicon Integrated Systems [SiS] SiS7012
AC'97 Sound Controller (rev a0)
00:03.0 USB controller: Silicon Integrated Systems [SiS] USB 1.1 Controller
(rev 0f)
00:03.1 USB controller: Silicon Integrated Systems [SiS] USB 1.1 Controller
(rev 0f)
00:03.2 USB controller: Silicon Integrated Systems [SiS] USB 1.1 Controller
(rev 0f)
00:03.3 USB controller: Silicon Integrated Systems [SiS] USB 2.0 Controller
00:0a.0 Network controller: Ralink corp. RT2500 Wireless 802.11bg (rev 01)
00:0f.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
RTL-8100/8101L/8139 PCI Fast Ethernet Adapter (rev 10)
00:10.0 FireWire (IEEE 1394): VIA Technologies, Inc. VT6306/7/8 [Fire II(M)]
IEEE 1394 OHCI Controller (rev 46)
01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] RV350
[Radeon 9550/9600/X1050 Series]
01:00.1 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] RV350
[Radeon 9550/9600/X1050 Series] (Secondary)

 # lscpu 
Architecture:                    i686
CPU op-mode(s):                  32-bit
Byte Order:                      Little Endian
Address sizes:                   36 bits physical, 32 bits virtual
CPU(s):                          1
On-line CPU(s) list:             0
Thread(s) per core:              1
Core(s) per socket:              1
Socket(s):                       1
Vendor ID:                       GenuineIntel
CPU family:                      15
Model:                           2
Model name:                      Intel(R) Pentium(R) 4 CPU 3.06GHz
Stepping:                        7
CPU MHz:                         3062.724
BogoMIPS:                        6127.67
Vulnerability Itlb multihit:     Processor vulnerable
Vulnerability L1tf:              Vulnerable
Vulnerability Mds:               Vulnerable: Clear CPU buffers attempted, no
microcode; SMT disabled
Vulnerability Meltdown:          Vulnerable
Vulnerability Spec store bypass: Vulnerable
Vulnerability Spectre v1:        Mitigation; usercopy/swapgs barriers and
__user pointer sanitization
Vulnerability Spectre v2:        Mitigation; Full generic retpoline, STIBP
disabled, RSB filling
Vulnerability Srbds:             Not affected
Vulnerability Tsx async abort:   Not affected
Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep
mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
pebs bts cpuid cid xtpr

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
