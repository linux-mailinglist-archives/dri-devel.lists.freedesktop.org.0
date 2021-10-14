Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E873B42D61F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 11:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421AB6E14D;
	Thu, 14 Oct 2021 09:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D69E6E14B;
 Thu, 14 Oct 2021 09:33:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4C2F01F782;
 Thu, 14 Oct 2021 09:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634203984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2760sGFl5oJpeELLEsVmFeL7VhzN7ZXzcDPL7h4xml4=;
 b=s1ut4aprVploAh4/uWEuuu/padESxEDPMJjjNNXaA+w08/a4mY8lrrLu2soZTjmB/U1g7C
 xMqMFZ/SGNtZYyG5Y9p1/xD2939EYCAdLO3ShHLNLfdmQqVd8W6hg9p4m7EJztOySzXJiA
 o2n4Icv9ck6ze0iCNv06H7X5dBAT3NA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634203984;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2760sGFl5oJpeELLEsVmFeL7VhzN7ZXzcDPL7h4xml4=;
 b=X3pC7ItKtE7Kn2pf1Q2emOI1rHwvh4XVYF6etVyjZf5oVeIY6MGZx28MD0Xn5D7Weq8NqB
 ew4ndopHpfCCsCDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA76113D7C;
 Thu, 14 Oct 2021 09:33:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gCdsOE/5Z2HaXgAAMHmgww
 (envelope-from <vbabka@suse.cz>); Thu, 14 Oct 2021 09:33:03 +0000
Message-ID: <4d99add1-5cf7-c608-a131-18959b85e5dc@suse.cz>
Date: Thu, 14 Oct 2021 11:33:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: kernel test robot <oliver.sang@intel.com>
Cc: 0day robot <lkp@intel.com>, Dmitry Vyukov <dvyukov@google.com>,
 Marco Elver <elver@google.com>, Vijayanand Jitta <vjitta@codeaurora.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Oliver Glitta
 <glittao@gmail.com>, Imran Khan <imran.f.khan@oracle.com>,
 LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 kasan-dev@googlegroups.com, Mike Rapoport <rppt@kernel.org>
References: <20211014085450.GC18719@xsang-OptiPlex-9020>
From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [lib/stackdepot] 1cd8ce52c5:
 BUG:unable_to_handle_page_fault_for_address
In-Reply-To: <20211014085450.GC18719@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/14/21 10:54, kernel test robot wrote:
> 
> 
> Greeting,
> 
> FYI, we noticed the following commit (built with gcc-9):
> 
> commit: 1cd8ce52c520c26c513899fb5aee42b8e5f60d0d ("[PATCH v2] lib/stackdepot: allow optional init and stack_table allocation by kvmalloc()")
> url: https://github.com/0day-ci/linux/commits/Vlastimil-Babka/lib-stackdepot-allow-optional-init-and-stack_table-allocation-by-kvmalloc/20211012-170816
> base: git://anongit.freedesktop.org/drm-intel for-linux-next
> 
> in testcase: rcutorture
> version: 
> with following parameters:
> 
> 	runtime: 300s
> 	test: cpuhotplug
> 	torture_type: srcud
> 
> test-description: rcutorture is rcutorture kernel module load/unload test.
> test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
> 
> 
> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> 
> +---------------------------------------------+------------+------------+
> |                                             | a94a6d76c9 | 1cd8ce52c5 |
> +---------------------------------------------+------------+------------+
> | boot_successes                              | 30         | 0          |
> | boot_failures                               | 0          | 7          |
> | BUG:kernel_NULL_pointer_dereference,address | 0          | 2          |
> | Oops:#[##]                                  | 0          | 7          |
> | EIP:stack_depot_save                        | 0          | 7          |
> | Kernel_panic-not_syncing:Fatal_exception    | 0          | 7          |
> | BUG:unable_to_handle_page_fault_for_address | 0          | 5          |
> +---------------------------------------------+------------+------------+
> 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> 
> 
> 
> [  319.147926][  T259] BUG: unable to handle page fault for address: 0ec74110
> [  319.149309][  T259] #PF: supervisor read access in kernel mode
> [  319.150362][  T259] #PF: error_code(0x0000) - not-present page
> [  319.151372][  T259] *pde = 00000000
> [  319.151964][  T259] Oops: 0000 [#1] SMP
> [  319.152617][  T259] CPU: 0 PID: 259 Comm: systemd-rc-loca Not tainted 5.15.0-rc1-00270-g1cd8ce52c520 #1
> [  319.154514][  T259] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
> [  319.156200][  T259] EIP: stack_depot_save+0x12a/0x4d0


Cc Mike Rapoport, looks like:
- memblock_alloc() should have failed (I think, because page allocator
  already took over?), but didn't. So apparently we got some area that wasn't
  fully mapped.
- using slab_is_available() is not accurate enough to detect when to use
memblock or page allocator (kvmalloc in case of my patch). I have used it
because memblock_alloc_internal() checks the same condition to issue a warning.

Relevant part of dmesg.xz that was attached:
[    1.589075][    T0] Dentry cache hash table entries: 524288 (order: 9, 2097152 bytes, linear)
[    1.592396][    T0] Inode-cache hash table entries: 262144 (order: 8, 1048576 bytes, linear)
[    2.916844][    T0] allocated 31496920 bytes of page_ext

- this means we were allocating from page allocator by alloc_pages_exact_nid() already

[    2.918197][    T0] mem auto-init: stack:off, heap alloc:off, heap free:on
[    2.919683][    T0] mem auto-init: clearing system memory may take some time...
[    2.921239][    T0] Initializing HighMem for node 0 (000b67fe:000bffe0)
[   23.023619][    T0] Initializing Movable for node 0 (00000000:00000000)
[  245.194520][    T0] Checking if this processor honours the WP bit even in supervisor mode...Ok.
[  245.196847][    T0] Memory: 2914460K/3145208K available (20645K kernel code, 5953K rwdata, 12624K rodata, 760K init, 8112K bss, 230748K reserved, 0K cma-reserved, 155528K highmem)
[  245.200521][    T0] Stack Depot allocating hash table with memblock_alloc

- initializing stack depot as part of initializing page_owner, uses memblock_alloc()
  because slab_is_available() is still false

[  245.212005][    T0] Node 0, zone   Normal: page owner found early allocated 0 pages
[  245.213867][    T0] Node 0, zone  HighMem: page owner found early allocated 0 pages
[  245.216126][    T0] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1

- printed by slub's kmem_cache_init() after create_kmalloc_caches() setting slab_state
  to UP, making slab_is_available() true, but too late

In my local testing of the patch, when stackdepot was initialized through
page owner init, it was using kvmalloc() so slab_is_available() was true.
Looks like the exact order of slab vs page_owner alloc is non-deterministic,
could be arch-dependent or just random ordering of init calls. A wrong order
will exploit the apparent fact that slab_is_available() is not a good
indicator of using memblock vs page allocator, and we would need a better one.
Thoughts?
