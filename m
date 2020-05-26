Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DA71D850F
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 20:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E6F6E46B;
	Mon, 18 May 2020 18:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458176E463
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 18:17:06 +0000 (UTC)
IronPort-SDR: KG1o7fVLqPIR3X2xRfCCQFRbWO/Xh6lYG+0gM7HoD2O9vAIBSRHreYtg1otaygAaYRmgcsF/yB
 JgJ38mt5yMcQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 11:17:06 -0700
IronPort-SDR: iIaavOVZIuwCXVkyk0MZaKAti/TdPkYwe2b9MZrf6aG25XCVUgvBkao1mU5EV+8o9zdQQCW4/q
 TBMzQd6THLmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; d="scan'208";a="299311850"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by fmsmga002.fm.intel.com with ESMTP; 18 May 2020 11:17:05 -0700
Date: Mon, 18 May 2020 11:17:05 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH V3 10/15] arch/kmap: Define kmap_atomic_prot() for all
 arch's
Message-ID: <20200518181705.GD3025231@iweiny-DESK2.sc.intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
 <20200507150004.1423069-11-ira.weiny@intel.com>
 <20200517173722.GA33341@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200517173722.GA33341@roeck-us.net>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 17, 2020 at 10:37:22AM -0700, Guenter Roeck wrote:
> Hi,
> 
> On Thu, May 07, 2020 at 07:59:58AM -0700, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > To support kmap_atomic_prot(), all architectures need to support
> > protections passed to their kmap_atomic_high() function.  Pass
> > protections into kmap_atomic_high() and change the name to
> > kmap_atomic_high_prot() to match.
> > 
> > Then define kmap_atomic_prot() as a core function which calls
> > kmap_atomic_high_prot() when needed.
> > 
> > Finally, redefine kmap_atomic() as a wrapper of kmap_atomic_prot() with
> > the default kmap_prot exported by the architectures.
> > 
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> 
> This patch causes a variety of crashes whem booting powerpc images in qemu.

PowerPC has the same issue as microblaze and sparc.

I'm preping a patch with all three fixed which fixes the kunmap_atomic clean up
patch...

Sorry for not seeing this last night...

Hopefully this can explain all the problems.  It is clearly a bug.

Ira

> 
> There are lots of warnings such as:
> 
> WARNING: CPU: 0 PID: 0 at lib/locking-selftest.c:743 irqsafe1_hard_spin_12+0x50/0xb0
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.7.0-rc5-next-20200515 #1
> NIP:  c0660c7c LR: c0660c44 CTR: c0660c2c
> REGS: c1223e68 TRAP: 0700   Tainted: G        W          (5.7.0-rc5-next-20200515)
> MSR:  00021000 <CE,ME>  CR: 28000224  XER: 20000000
> 
> GPR00: c0669c78 c1223f20 c113d560 c0660c44 00000000 00000001 c1223ea8 00000001
> GPR08: 00000000 00000001 0000fffc ffffffff 88000222 00000000 00000000 00000000
> GPR16: 00000000 00000000 00000000 00000000 c0000000 00000000 00000000 c1125084
> GPR24: c1125084 c1230000 c1879538 fffffffc 00000001 00000000 c1011afc c1230000
> NIP [c0660c7c] irqsafe1_hard_spin_12+0x50/0xb0
> LR [c0660c44] irqsafe1_hard_spin_12+0x18/0xb0
> Call Trace:
> [c1223f20] [c1880000] megasas_mgmt_info+0xee4/0x1008 (unreliable)
> [c1223f40] [c0669c78] dotest+0x38/0x550
> [c1223f70] [c066aa4c] locking_selftest+0x8bc/0x1d54
> [c1223fa0] [c10e0bc8] start_kernel+0x3ec/0x510
> [c1223ff0] [c00003a0] set_ivor+0x118/0x154
> Instruction dump:
> 81420000 38e80001 3d4a0001 2c080000 91420000 90e20488 40820008 91020470
> 81290000 5529031e 7d290034 5529d97e <0f090000> 3fe0c11c 3bff3964 3bff00ac
> irq event stamp: 588
> hardirqs last  enabled at (587): [<c00b9fe4>] vprintk_emit+0x1b4/0x33c
> hardirqs last disabled at (588): [<c0660c44>] irqsafe1_hard_spin_12+0x18/0xb0
> softirqs last  enabled at (0): [<00000000>] 0x0
> softirqs last disabled at (0): [<00000000>] 0x0
> ---[ end trace b18fe9e172f99d03 ]---
> 
> This is followed by:
> 
> BUG: sleeping function called from invalid context at lib/mpi/mpi-pow.c:245
> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 14, name: cryptomgr_test
> INFO: lockdep is turned off.
> CPU: 0 PID: 14 Comm: cryptomgr_test Tainted: G        W         5.7.0-rc5-next-20200515 #1
> Call Trace:
> [ce221b58] [c008755c] ___might_sleep+0x280/0x2a8 (unreliable)
> [ce221b78] [c06bc524] mpi_powm+0x634/0xc50
> [ce221c38] [c05eafdc] rsa_dec+0x88/0x134
> [ce221c78] [c05f3b40] test_akcipher_one+0x678/0x804
> [ce221dc8] [c05f3d7c] alg_test_akcipher+0xb0/0x130
> [ce221df8] [c05ee674] alg_test.part.0+0xb4/0x458
> [ce221ed8] [c05ed2b0] cryptomgr_test+0x30/0x50
> [ce221ef8] [c007cd74] kthread+0x134/0x170
> [ce221f38] [c001433c] ret_from_kernel_thread+0x14/0x1c
> Kernel panic - not syncing: Aiee, killing interrupt handler!
> CPU: 0 PID: 14 Comm: cryptomgr_test Tainted: G        W         5.7.0-rc5-next-20200515 #1
> Call Trace:
> [ce221e08] [c00530fc] panic+0x148/0x34c (unreliable)
> [ce221e68] [c0056460] do_exit+0xac0/0xb40
> [ce221eb8] [c00f5be8] find_kallsyms_symbol_value+0x0/0x128
> [ce221ed8] [c05ed2d0] crypto_alg_put+0x0/0x70
> [ce221ef8] [c007cd74] kthread+0x134/0x170
> [ce221f38] [c001433c] ret_from_kernel_thread+0x14/0x1c
> 
> Bisect log is attached. The patch can not easily be reverted since
> it results in compile errors.
> 
> Note that similar failures are seen with sparc32 images. Those bisect
> to a different patch, but reverting that patch doesn't fix the problem.
> The failure pattern (warnings followed by a crash in cryptomgr_test)
> is the same.
> 
> Guenter
> 
> ---
> # bad: [bdecf38f228bcca73b31ada98b5b7ba1215eb9c9] Add linux-next specific files for 20200515
> # good: [2ef96a5bb12be62ef75b5828c0aab838ebb29cb8] Linux 5.7-rc5
> git bisect start 'HEAD' 'v5.7-rc5'
> # good: [3674d7aa7a8e61d993886c2fb7c896c5ef85e988] Merge remote-tracking branch 'crypto/master'
> git bisect good 3674d7aa7a8e61d993886c2fb7c896c5ef85e988
> # good: [87f6f21783522e6d62127cf33ae5e95f50874beb] Merge remote-tracking branch 'spi/for-next'
> git bisect good 87f6f21783522e6d62127cf33ae5e95f50874beb
> # good: [5c428e8277d5d97c85126387d4e00aa5adde4400] Merge remote-tracking branch 'staging/staging-next'
> git bisect good 5c428e8277d5d97c85126387d4e00aa5adde4400
> # good: [f68de67ed934e7bdef4799fd7777c86f33f14982] Merge remote-tracking branch 'hyperv/hyperv-next'
> git bisect good f68de67ed934e7bdef4799fd7777c86f33f14982
> # bad: [54acd2dc52b069da59639eea0d0c92726f32fb01] mm/memblock: fix a typo in comment "implict"->"implicit"
> git bisect bad 54acd2dc52b069da59639eea0d0c92726f32fb01
> # good: [784a17aa58a529b84f7cc50f351ed4acf3bd11f3] mm: remove the pgprot argument to __vmalloc
> git bisect good 784a17aa58a529b84f7cc50f351ed4acf3bd11f3
> # good: [6cd8137ff37e9a37aee2d2a8889c8beb8eab192f] khugepaged: replace the usage of system(3) in the test
> git bisect good 6cd8137ff37e9a37aee2d2a8889c8beb8eab192f
> # bad: [6987da379826ed01b8a1cf046b67cc8cc10117cc] sparc: remove unnecessary includes
> git bisect bad 6987da379826ed01b8a1cf046b67cc8cc10117cc
> # good: [bc17b545388f64c09e83e367898e28f60277c584] mm/hugetlb: define a generic fallback for is_hugepage_only_range()
> git bisect good bc17b545388f64c09e83e367898e28f60277c584
> # good: [9b5aa5b43f957f03a1f4a9aff5f7924e2ebbc011] arch-kmap_atomic-consolidate-duplicate-code-checkpatch-fixes
> git bisect good 9b5aa5b43f957f03a1f4a9aff5f7924e2ebbc011
> # bad: [89194ba5ee31567eeee9c81101b334c8e3248198] arch/kmap: define kmap_atomic_prot() for all arch's
> git bisect bad 89194ba5ee31567eeee9c81101b334c8e3248198
> # good: [022785d2bea99f8bc2a37b7b6c525eea26f6ac59] arch-kunmap_atomic-consolidate-duplicate-code-checkpatch-fixes
> git bisect good 022785d2bea99f8bc2a37b7b6c525eea26f6ac59
> # good: [a13c2f39e3f0519ddee57d26cc66ec70e3546106] arch/kmap: don't hard code kmap_prot values
> git bisect good a13c2f39e3f0519ddee57d26cc66ec70e3546106
> # first bad commit: [89194ba5ee31567eeee9c81101b334c8e3248198] arch/kmap: define kmap_atomic_prot() for all arch's
> 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
