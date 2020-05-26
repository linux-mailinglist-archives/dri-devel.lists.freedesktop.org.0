Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB791DE070
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DB36E9A7;
	Fri, 22 May 2020 06:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE716E28A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 00:47:02 +0000 (UTC)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1jbvpK-00DESM-Ds; Fri, 22 May 2020 00:46:18 +0000
Date: Fri, 22 May 2020 01:46:18 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200522004618.GA3151350@ZenIV.linux.org.uk>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200521172704.GF23230@ZenIV.linux.org.uk>
 <bdc8dc64-622c-3b0d-1ae1-48222cf34358@roeck-us.net>
 <20200521224612.GJ23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521224612.GJ23230@ZenIV.linux.org.uk>
X-Mailman-Approved-At: Fri, 22 May 2020 06:56:07 +0000
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
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 ira.weiny@intel.com, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
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

On Thu, May 21, 2020 at 11:46:12PM +0100, Al Viro wrote:
> On Thu, May 21, 2020 at 03:20:46PM -0700, Guenter Roeck wrote:
> > On 5/21/20 10:27 AM, Al Viro wrote:
> > > On Tue, May 19, 2020 at 09:54:22AM -0700, Guenter Roeck wrote:
> > >> On Mon, May 18, 2020 at 11:48:43AM -0700, ira.weiny@intel.com wrote:
> > >>> From: Ira Weiny <ira.weiny@intel.com>
> > >>>
> > >>> The kunmap_atomic clean up failed to remove one set of pagefault/preempt
> > >>> enables when vaddr is not in the fixmap.
> > >>>
> > >>> Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
> > >>> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > >>
> > >> microblazeel works with this patch, as do the nosmp sparc32 boot tests,
> > >> but sparc32 boot tests with SMP enabled still fail with lots of messages
> > >> such as:
> > > 
> > > BTW, what's your setup for sparc32 boot tests?  IOW, how do you manage to
> > > shrink the damn thing enough to have the loader cope with it?  I hadn't
> > > been able to do that for the current mainline ;-/
> > > 
> > 
> > defconfig seems to work just fine, even after enabling various debug
> > and file system options.
> 
> The hell?  How do you manage to get the kernel in?  sparc32_defconfig
> ends up with 5316876 bytes unpacked...

Incidentally, trying to load it via -kernel/-initrd leads to
Configuration device id QEMU version 1 machine id 64
Probing SBus slot 0 offset 0
Probing SBus slot 1 offset 0
Probing SBus slot 2 offset 0
Probing SBus slot 3 offset 0
Probing SBus slot 15 offset 0
Invalid FCode start byte
CPUs: 1 x TI,TMS390Z55
UUID: 00000000-0000-0000-0000-000000000000
Welcome to OpenBIOS v1.1 built on Dec 27 2018 19:17
  Type 'help' for detailed information
[sparc] Kernel already loaded
switching to new context:
PROMLIB: obio_ranges 1
PROMLIB: Sun Boot Prom Version 3 Revision 2
Linux version 5.7.0-rc1-00002-gcf51e129b968 (al@duke) (gcc version 6.3.0 20170516 (Debian 6.3.0-18), GNU ld (GNU Binutils for Debian) 2.28) #32 Thu May 21 18:36:07 EDT 2020
printk: bootconsole [earlyprom0] enabled
ARCH: SUN4M
TYPE: Sun4m SparcStation10/20
Ethernet address: 52:54:00:12:34:56
303MB HIGHMEM available.
OF stdout device is: /obio/zs@0,100000:a
PROM: Built device tree with 30051 bytes of memory.
Booting Linux...
Power off control detected.
Kernel panic - not syncing: Failed to allocate memory for percpu areas.
CPU: 0 PID: 0 Comm: swapper Not tainted 5.7.0-rc1-00002-gcf51e129b968 #32
[f04f92a8 : 
setup_per_cpu_areas+0x58/0x90 ] 
[f04edbf4 : 
start_kernel+0xc0/0x4a0 ] 
[f04ed43c : 
continue_boot+0x324/0x334 ] 
[00000000 : 
0x0 ] 

Press Stop-A (L1-A) from sun keyboard or send break
twice on console to return to the boot prom
---[ end Kernel panic - not syncing: Failed to allocate memory for percpu areas. ]---

Giving guest more RAM doesn't change the outcome (well, the number HIGHMEM line is
obviously higher, but that's it).

So which sparc32 kernel have you booted with defconfig and how have you done
that?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
