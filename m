Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8788C975D
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 01:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E488F10E2DF;
	Sun, 19 May 2024 23:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="RnOBP9ts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 411 seconds by postgrey-1.36 at gabe;
 Sun, 19 May 2024 23:13:47 UTC
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [91.218.175.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E931610E2DF
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 23:13:47 +0000 (UTC)
X-Envelope-To: oliver.sang@intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716160012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EjPbvxfPWKN4uO1RV19FptYrj9baoes5ODzgRfOovGI=;
 b=RnOBP9tstxKStTFsR6JuY3r4CaXCx8FhWbwG+HNTzwYcucJbkF1f6R67iRSUiXegEnrDgZ
 PpXUhikB5cb1P6Di8OD88JwkJZBi4LWOXAd4jgqgi99I2w0NJ5KwiwrGoE4f+5A0aH7Vve
 zijFCQJ504V0TNVgfoZnOKbB2rKWE+I=
X-Envelope-To: surenb@google.com
X-Envelope-To: oe-lkp@lists.linux.dev
X-Envelope-To: lkp@intel.com
X-Envelope-To: linux-mm@kvack.org
X-Envelope-To: akpm@linux-foundation.org
X-Envelope-To: rdunlap@infradead.org
X-Envelope-To: keescook@chromium.org
X-Envelope-To: viro@zeniv.linux.org.uk
X-Envelope-To: alex.gaynor@gmail.com
X-Envelope-To: aliceryhl@google.com
X-Envelope-To: a.hindborg@samsung.com
X-Envelope-To: benno.lossin@proton.me
X-Envelope-To: bjorn3_gh@protonmail.com
X-Envelope-To: boqun.feng@gmail.com
X-Envelope-To: cl@linux.com
X-Envelope-To: dennis@kernel.org
X-Envelope-To: gary@garyguo.net
X-Envelope-To: ojeda@kernel.org
X-Envelope-To: pasha.tatashin@soleen.com
X-Envelope-To: peterz@infradead.org
X-Envelope-To: tj@kernel.org
X-Envelope-To: vbabka@suse.cz
X-Envelope-To: wedsonaf@gmail.com
X-Envelope-To: linux-hardening@vger.kernel.org
X-Envelope-To: jani.nikula@linux.intel.com
X-Envelope-To: joonas.lahtinen@linux.intel.com
X-Envelope-To: rodrigo.vivi@intel.com
X-Envelope-To: tursulin@ursulin.net
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: intel-gfx@lists.freedesktop.org
X-Envelope-To: dri-devel@lists.freedesktop.org
Date: Sun, 19 May 2024 19:06:45 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: kernel test robot <oliver.sang@intel.com>
Cc: Suren Baghdasaryan <surenb@google.com>, oe-lkp@lists.linux.dev, 
 lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <keescook@chromium.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
 Andreas Hindborg <a.hindborg@samsung.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, 
 Christoph Lameter <cl@linux.com>, Dennis Zhou <dennis@kernel.org>,
 Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, linux-hardening@vger.kernel.org, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [linux-next:master] [mm/slab]  7bd230a266:
 WARNING:at_mm/util.c:#kvmalloc_node_noprof
Message-ID: <a7qrk7rkfbg44mhfehup3cgwi7bhcuqys72tg2ri7ck7sggfnx@643nnjnpxwzt>
References: <202405151008.6ddd1aaf-oliver.sang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405151008.6ddd1aaf-oliver.sang@intel.com>
X-Migadu-Flow: FLOW_OUT
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

this looks like an i915 bug

On Wed, May 15, 2024 at 10:41:19AM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> as we understand, this commit is not the root-cause of this WARNING. the WARNING
> just shows in another way by commit changes.
> 
> 53ed0af496422959 7bd230a26648ac68ab3731ebbc4
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>           6:6          -83%            :6     dmesg.RIP:kvmalloc_node
>            :6           33%           6:6     dmesg.RIP:kvmalloc_node_noprof
>           6:6          -83%            :6     dmesg.WARNING:at_mm/util.c:#kvmalloc_node
>            :6           33%           6:6     dmesg.WARNING:at_mm/util.c:#kvmalloc_node_noprof
> 
> 
> but we failed to bisect "dmesg.WARNING:at_mm/util.c:#kvmalloc_node".
> 
> we still made this report FYI what we observed in our tests, not sure if it
> could give somebody some hints to find the real problem then judge if a fix
> is needed.
> 
> below is full report.
> 
> 
> 
> kernel test robot noticed "WARNING:at_mm/util.c:#kvmalloc_node_noprof" on:
> 
> commit: 7bd230a26648ac68ab3731ebbc449090f0ac6a37 ("mm/slab: enable slab allocation tagging for kmalloc and friends")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master 6ba6c795dc73c22ce2c86006f17c4aa802db2a60]
> 
> in testcase: igt
> version: igt-x86_64-86712f2ef-1_20240511
> with following parameters:
> 
> 	group: gem_exec_reloc
> 
> 
> 
> compiler: gcc-13
> test machine: 20 threads 1 sockets (Commet Lake) with 16G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202405151008.6ddd1aaf-oliver.sang@intel.com
> 
> 
> [  940.101700][ T5353] ------------[ cut here ]------------
> [ 940.107107][ T5353] WARNING: CPU: 1 PID: 5353 at mm/util.c:649 kvmalloc_node_noprof (mm/util.c:649 (discriminator 1)) 
> [  940.116178][ T5353] Modules linked in: netconsole btrfs blake2b_generic xor zstd_compress intel_rapl_msr intel_rapl_common intel_uncore_frequency intel_uncore_frequency_common raid6_pq libcrc32c x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel sd_mod t10_pi crc64_rocksoft_generic crc64_rocksoft ipmi_devintf crc64 sg ipmi_msghandler kvm crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel i915 sha512_ssse3 sdhci_pci drm_buddy cqhci ahci rapl intel_gtt drm_display_helper sdhci libahci mei_me ttm intel_cstate i2c_designware_platform ppdev intel_uncore intel_wmi_thunderbolt wmi_bmof libata mei i2c_designware_core idma64 drm_kms_helper mmc_core i2c_i801 i2c_smbus intel_pch_thermal parport_pc video parport pinctrl_cannonlake wmi acpi_pad acpi_tad serio_raw binfmt_misc drm fuse loop dm_mod ip_tables
> [  940.188041][ T5353] CPU: 1 PID: 5353 Comm: gem_exec_reloc Not tainted 6.9.0-rc4-00085-g7bd230a26648 #1
> [ 940.197459][ T5353] RIP: 0010:kvmalloc_node_noprof (mm/util.c:649 (discriminator 1)) 
> [ 940.203412][ T5353] Code: 04 a3 0d 00 48 83 c4 18 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e c3 cc cc cc cc 49 be 00 00 00 00 00 20 00 00 eb 9f 80 e7 20 75 de <0f> 0b eb da 48 c7 c7 10 ec af 84 e8 0e a6 18 00 e9 3f ff ff ff 48
> All code
> ========
>    0:	04 a3                	add    $0xa3,%al
>    2:	0d 00 48 83 c4       	or     $0xc4834800,%eax
>    7:	18 48 83             	sbb    %cl,-0x7d(%rax)
>    a:	c4                   	(bad)  
>    b:	08 5b 5d             	or     %bl,0x5d(%rbx)
>    e:	41 5c                	pop    %r12
>   10:	41 5d                	pop    %r13
>   12:	41 5e                	pop    %r14
>   14:	c3                   	retq   
>   15:	cc                   	int3   
>   16:	cc                   	int3   
>   17:	cc                   	int3   
>   18:	cc                   	int3   
>   19:	49 be 00 00 00 00 00 	movabs $0x200000000000,%r14
>   20:	20 00 00 
>   23:	eb 9f                	jmp    0xffffffffffffffc4
>   25:	80 e7 20             	and    $0x20,%bh
>   28:	75 de                	jne    0x8
>   2a:*	0f 0b                	ud2    		<-- trapping instruction
>   2c:	eb da                	jmp    0x8
>   2e:	48 c7 c7 10 ec af 84 	mov    $0xffffffff84afec10,%rdi
>   35:	e8 0e a6 18 00       	callq  0x18a648
>   3a:	e9 3f ff ff ff       	jmpq   0xffffffffffffff7e
>   3f:	48                   	rex.W
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	0f 0b                	ud2    
>    2:	eb da                	jmp    0xffffffffffffffde
>    4:	48 c7 c7 10 ec af 84 	mov    $0xffffffff84afec10,%rdi
>    b:	e8 0e a6 18 00       	callq  0x18a61e
>   10:	e9 3f ff ff ff       	jmpq   0xffffffffffffff54
>   15:	48                   	rex.W
> [  940.222971][ T5353] RSP: 0018:ffffc90000b576f8 EFLAGS: 00010246
> [  940.228978][ T5353] RAX: 0000000000000000 RBX: 00000000000000c0 RCX: 0000000000000013
> [  940.236885][ T5353] RDX: 000000000007ffff RSI: 0000000080000000 RDI: 0000000000000000
> [  940.244792][ T5353] RBP: 0000000080000000 R08: 0000000000000001 R09: 0000000000000000
> [  940.252700][ T5353] R10: ffffc90000b576f8 R11: 0000000000000000 R12: 00000000ffffffff
> [  940.260626][ T5353] R13: 0000000000000000 R14: 0000000004000000 R15: ffffc90000b579a8
> [  940.268566][ T5353] FS:  00007f2043c5e8c0(0000) GS:ffff8883ee080000(0000) knlGS:0000000000000000
> [  940.277455][ T5353] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  940.283988][ T5353] CR2: 00007f2043b5d000 CR3: 000000022f74a002 CR4: 00000000003706f0
> [  940.291922][ T5353] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  940.299872][ T5353] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  940.307791][ T5353] Call Trace:
> [  940.311021][ T5353]  <TASK>
> [ 940.313926][ T5353] ? __warn (kernel/panic.c:694) 
> [ 940.317930][ T5353] ? kvmalloc_node_noprof (mm/util.c:649 (discriminator 1)) 
> [ 940.323187][ T5353] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
> [ 940.327596][ T5353] ? handle_bug (arch/x86/kernel/traps.c:239 (discriminator 1)) 
> [ 940.331835][ T5353] ? exc_invalid_op (arch/x86/kernel/traps.c:260 (discriminator 1)) 
> [ 940.336419][ T5353] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
> [ 940.341348][ T5353] ? kvmalloc_node_noprof (mm/util.c:649 (discriminator 1)) 
> [ 940.346602][ T5353] ? kvmalloc_node_noprof (mm/util.c:640) 
> [ 940.351795][ T5353] eb_copy_relocations (drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1685) i915
> [ 940.357636][ T5353] eb_relocate_parse_slow (drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1815) i915
> [ 940.363616][ T5353] i915_gem_do_execbuffer (drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1960 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3466) i915
> [ 940.369790][ T5353] ? unwind_get_return_address (arch/x86/kernel/unwind_orc.c:369 (discriminator 1)) 
> [ 940.375305][ T5353] ? arch_stack_walk (arch/x86/kernel/stacktrace.c:26) 
> [ 940.380084][ T5353] ? __pfx_i915_gem_do_execbuffer (drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3359) i915
> [ 940.386673][ T5353] ? kasan_save_track (arch/x86/include/asm/current.h:49 (discriminator 1) mm/kasan/common.c:60 (discriminator 1) mm/kasan/common.c:69 (discriminator 1)) 
> [ 940.391449][ T5353] ? __kasan_kmalloc (mm/kasan/common.c:370 mm/kasan/common.c:387) 
> [ 940.396121][ T5353] ? __pfx___might_resched (kernel/sched/core.c:10152) 
> [ 940.401339][ T5353] ? check_heap_object (arch/x86/include/asm/bitops.h:206 (discriminator 1) arch/x86/include/asm/bitops.h:238 (discriminator 1) include/asm-generic/bitops/instrumented-non-atomic.h:142 (discriminator 1) include/linux/page-flags.h:527 (discriminator 1) mm/usercopy.c:194 (discriminator 1)) 
> [ 940.406359][ T5353] i915_gem_execbuffer2_ioctl (drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3612) i915
> [ 940.412769][ T5353] ? __pfx_i915_gem_execbuffer2_ioctl (drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3572) i915
> [ 940.419658][ T5353] drm_ioctl_kernel (drivers/gpu/drm/drm_ioctl.c:744) drm
> [ 940.425039][ T5353] ? __pfx_drm_ioctl_kernel (drivers/gpu/drm/drm_ioctl.c:729) drm
> [ 940.430914][ T5353] drm_ioctl (drivers/gpu/drm/drm_ioctl.c:842) drm
> [ 940.435660][ T5353] ? __pfx_i915_gem_execbuffer2_ioctl (drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3572) i915
> [ 940.442610][ T5353] ? __pfx_drm_ioctl (drivers/gpu/drm/drm_ioctl.c:763) drm
> [ 940.447822][ T5353] ? __fget_light (include/linux/atomic/atomic-arch-fallback.h:479 (discriminator 2) include/linux/atomic/atomic-instrumented.h:50 (discriminator 2) fs/file.c:1145 (discriminator 2)) 
> [ 940.452318][ T5353] __x64_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:904 fs/ioctl.c:890 fs/ioctl.c:890) 
> [ 940.457008][ T5353] do_syscall_64 (arch/x86/entry/common.c:52 (discriminator 1) arch/x86/entry/common.c:83 (discriminator 1)) 
> [ 940.461440][ T5353] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
> [  940.467236][ T5353] RIP: 0033:0x7f2046007c5b
> [ 940.471588][ T5353] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> All code
> ========
>    0:	00 48 89             	add    %cl,-0x77(%rax)
>    3:	44 24 18             	rex.R and $0x18,%al
>    6:	31 c0                	xor    %eax,%eax
>    8:	48 8d 44 24 60       	lea    0x60(%rsp),%rax
>    d:	c7 04 24 10 00 00 00 	movl   $0x10,(%rsp)
>   14:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
>   19:	48 8d 44 24 20       	lea    0x20(%rsp),%rax
>   1e:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
>   23:	b8 10 00 00 00       	mov    $0x10,%eax
>   28:	0f 05                	syscall 
>   2a:*	89 c2                	mov    %eax,%edx		<-- trapping instruction
>   2c:	3d 00 f0 ff ff       	cmp    $0xfffff000,%eax
>   31:	77 1c                	ja     0x4f
>   33:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
>   38:	64                   	fs
>   39:	48                   	rex.W
>   3a:	2b                   	.byte 0x2b
>   3b:	04 25                	add    $0x25,%al
>   3d:	28 00                	sub    %al,(%rax)
> 	...
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	89 c2                	mov    %eax,%edx
>    2:	3d 00 f0 ff ff       	cmp    $0xfffff000,%eax
>    7:	77 1c                	ja     0x25
>    9:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
>    e:	64                   	fs
>    f:	48                   	rex.W
>   10:	2b                   	.byte 0x2b
>   11:	04 25                	add    $0x25,%al
>   13:	28 00                	sub    %al,(%rax)
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240515/202405151008.6ddd1aaf-oliver.sang@intel.com
> 
> 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
