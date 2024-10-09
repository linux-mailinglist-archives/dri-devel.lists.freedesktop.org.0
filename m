Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6B3996497
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 11:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BED10E152;
	Wed,  9 Oct 2024 09:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5XpvUSG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5719710E152;
 Wed,  9 Oct 2024 09:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728465232; x=1760001232;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9TP0WjfU+hcaixoy+bZ6ZKceceIXrMZNxOYFFh2JXxE=;
 b=Y5XpvUSGGn8eVPA6acTHAjcMcMMGiRyPoinQebXCwFhSIXFa1pvzoJY7
 eL4NHrzI3oeqOrJYJ4TER1iM6n8TE2Q1HKHSghtMZpRzevfuF+cMC0LqF
 ucLHTCnlocPB0F6OGj7Xl0+ysAih77O7E71fC3FjqtCQ8HqarZiACHmlz
 4FVmoB0FOKjsImKceg3aXdKk2767wMSsdayNW8JBzczWjravYJdO66dds
 ye+y894j7Q89/Y97s3OUUITXf09zi2kw8B8vosGzFWjiRQVZd+vt2B6l4
 7kcKQvROWnNUKyO2pqPTwCEHy7+DeXjFWu5RNOIhxR0FqCdF7ELQc1ckO g==;
X-CSE-ConnectionGUID: B5YGJyN1SVG5c35mciTSHw==
X-CSE-MsgGUID: In6ZrnOWQRGpLVCqjQYf5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31452540"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="31452540"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 02:13:52 -0700
X-CSE-ConnectionGUID: 91FDdqdkSsW+v+tRyXz0dg==
X-CSE-MsgGUID: ozr4sKpfT56ZBHF5tJBZzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="76290234"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.243])
 ([10.245.245.243])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 02:13:48 -0700
Message-ID: <b21d911286a620b16ea1a30c704491876962812a.camel@linux.intel.com>
Subject: Re: [PATCH RESEND] locking/ww_mutex: Adjust to lockdep nest_lock
 requirements
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Peter Zijlstra
 <peterz@infradead.org>,  Ingo Molnar <mingo@redhat.com>, Will Deacon
 <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng
 <boqun.feng@gmail.com>, Maarten Lankhorst <maarten@lankhorst.se>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org,  intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Date: Wed, 09 Oct 2024 11:13:46 +0200
In-Reply-To: <202410091542.f6c4a438-oliver.sang@intel.com>
References: <202410091542.f6c4a438-oliver.sang@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Wed, 2024-10-09 at 15:42 +0800, kernel test robot wrote:
>=20
>=20
> Hello,
>=20
> kernel test robot noticed
> "WARNING:at_kernel/locking/lockdep.c:#__lock_acquire" on:
>=20
> commit: d417c66b8b12b5706c9df4ddf5367af540f195c6 ("[PATCH RESEND]
> locking/ww_mutex: Adjust to lockdep nest_lock requirements")
> url:

This is weird. This is an overflow warning indicating that the number
of locks held overflows the 12-bit unsigned hlock->references.

I don't see it on local testing where hlock->references exactly maxes
out with 2048 which is the expected value from 2047 locks in the test
plus one extra dummy lock from the patch.

OTOH there might be a reason why the number of locks originally was set
to 2047, and why we don't see more instances of this error. Could it be
gcc-12 packing problem perhaps.

Anyway if this is indeed the problem, it should suffice to lower the
number of locks in the selftest to 2046...

I'll send out an additional version of the patch to do just that.

/Thomas


> https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/locking-w=
w_mutex-Adjust-to-lockdep-nest_lock-requirements/20241002-205818
> base:
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git=C2=A0d00b83d416e=
7
> 3bc3fa4d21b14bec920e88b70ce6
> patch link:
> https://lore.kernel.org/all/20241002125611.361001-1-thomas.hellstrom@linu=
x.intel.com/
> patch subject: [PATCH RESEND] locking/ww_mutex: Adjust to lockdep
> nest_lock requirements
>=20
> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-977d51cf-1_20240508
> with following parameters:
>=20
> 	group: locking
>=20
>=20
>=20
> compiler: gcc-12
> test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz
> (Skylake) with 16G memory
>=20
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>=20
>=20
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Closes:
> > https://lore.kernel.org/oe-lkp/202410091542.f6c4a438-oliver.sang@intel.=
com
>=20
>=20
> [=C2=A0=C2=A0 63.327071][=C2=A0 T246] ------------[ cut here ]-----------=
-
> [=C2=A0=C2=A0 63.332388][=C2=A0 T246] DEBUG_LOCKS_WARN_ON(hlock->referenc=
es <
> references)
> [ 63.332410][ T246] WARNING: CPU: 2 PID: 246 at
> kernel/locking/lockdep.c:5058 __lock_acquire
> (kernel/locking/lockdep.c:5058 (discriminator 9))=20
> [=C2=A0=C2=A0 63.348622][=C2=A0 T246] Modules linked in: test_ww_mutex(+)
> openvswitch nf_conncount nf_nat nf_conntrack nf_defrag_ipv6
> nf_defrag_ipv4 psample btrfs blake2b_generic xor zstd_compress
> raid6_pq libcrc32c intel_rapl_msr intel_rapl_common
> x86_pkg_temp_thermal intel_powerclamp sd_mod coretemp sg kvm_intel
> ipmi_devintf ipmi_msghandler i915 kvm binfmt_misc drm_buddy intel_gtt
> drm_display_helper crct10dif_pclmul crc32_pclmul crc32c_intel mei_wdt
> ghash_clmulni_intel ttm wmi_bmof sha512_ssse3 ahci rapl
> drm_kms_helper libahci video intel_cstate intel_uncore serio_raw
> libata mei_me i2c_i801 mei i2c_smbus intel_pch_thermal ie31200_edac
> wmi acpi_pad tpm_infineon loop fuse drm dm_mod ip_tables sch_fq_codel
> [=C2=A0=C2=A0 63.409553][=C2=A0 T246] CPU: 2 PID: 246 Comm: kworker/u16:5=
 Tainted: G
> S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 6.10.0-04481-gd417c66b8b12 #1
> [=C2=A0=C2=A0 63.419907][=C2=A0 T246] Hardware name: HP HP Z238 Microtowe=
r
> Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
> [=C2=A0=C2=A0 63.429471][=C2=A0 T246] Workqueue: test-ww_mutex stress_ino=
rder_work
> [test_ww_mutex]
> [ 63.436889][ T246] RIP: 0010:__lock_acquire
> (kernel/locking/lockdep.c:5058 (discriminator 9))=20
> [ 63.442284][ T246] Code: d2 0f 85 15 0c 00 00 44 8b 0d 7d df c7 04
> 45 85 c9 0f 85 d0 fe ff ff 48 c7 c6 c0 c1 2a 84 48 c7 c7 00 91 2a 84
> e8 8d 39 e5 ff <0f> 0b e9 b6 fe ff ff 41 be 02 00 00 00 e9 11 f7 ff
> ff 31 db e9 bb
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
> =C2=A0=C2=A0 0:	d2 0f=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	rorb=C2=A0=C2=A0 %cl,(%rdi)
> =C2=A0=C2=A0 2:	85 15 0c 00 00 44=C2=A0=C2=A0=C2=A0=C2=A0	test=C2=A0=C2=
=A0 %edx,0x4400000c(%rip)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> # 0x44000014
> =C2=A0=C2=A0 8:	8b 0d 7d df c7 04=C2=A0=C2=A0=C2=A0=C2=A0	mov=C2=A0=C2=A0=
=C2=A0 0x4c7df7d(%rip),%ecx=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #
> 0x4c7df8b
> =C2=A0=C2=A0 e:	45 85 c9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	test=C2=A0=C2=A0 %r9d,%r9d
> =C2=A0 11:	0f 85 d0 fe ff ff=C2=A0=C2=A0=C2=A0=C2=A0	jne=C2=A0=C2=A0=C2=
=A0 0xfffffffffffffee7
> =C2=A0 17:	48 c7 c6 c0 c1 2a 84=C2=A0	mov=C2=A0=C2=A0=C2=A0 $0xffffffff84=
2ac1c0,%rsi
> =C2=A0 1e:	48 c7 c7 00 91 2a 84=C2=A0	mov=C2=A0=C2=A0=C2=A0 $0xffffffff84=
2a9100,%rdi
> =C2=A0 25:	e8 8d 39 e5 ff=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	callq=
=C2=A0 0xffffffffffe539b7
> =C2=A0 2a:*	0f 0b=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	ud2=C2=A0=C2=A0=C2=A0=C2=A0		<--=
 trapping
> instruction
> =C2=A0 2c:	e9 b6 fe ff ff=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	jmpq=
=C2=A0=C2=A0 0xfffffffffffffee7
> =C2=A0 31:	41 be 02 00 00 00=C2=A0=C2=A0=C2=A0=C2=A0	mov=C2=A0=C2=A0=C2=
=A0 $0x2,%r14d
> =C2=A0 37:	e9 11 f7 ff ff=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	jmpq=
=C2=A0=C2=A0 0xfffffffffffff74d
> =C2=A0 3c:	31 db=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	xor=C2=A0=C2=A0=C2=A0 %ebx,%ebx
> =C2=A0 3e:	e9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	.byte 0xe9
> =C2=A0 3f:	bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	.byte 0xbb
>=20
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =C2=A0=C2=A0 0:	0f 0b=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	ud2=C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0 2:	e9 b6 fe ff ff=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	=
jmpq=C2=A0=C2=A0 0xfffffffffffffebd
> =C2=A0=C2=A0 7:	41 be 02 00 00 00=C2=A0=C2=A0=C2=A0=C2=A0	mov=C2=A0=C2=A0=
=C2=A0 $0x2,%r14d
> =C2=A0=C2=A0 d:	e9 11 f7 ff ff=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	=
jmpq=C2=A0=C2=A0 0xfffffffffffff723
> =C2=A0 12:	31 db=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	xor=C2=A0=C2=A0=C2=A0 %ebx,%ebx
> =C2=A0 14:	e9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	.byte 0xe9
> =C2=A0 15:	bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	.byte 0xbb
> [=C2=A0=C2=A0 63.461748][=C2=A0 T246] RSP: 0018:ffffc9000141f7a8 EFLAGS: =
00010086
> [=C2=A0=C2=A0 63.467683][=C2=A0 T246] RAX: 0000000000000000 RBX: 00000000=
00000001
> RCX: 0000000000000027
> [=C2=A0=C2=A0 63.475525][=C2=A0 T246] RDX: 0000000000000027 RSI: 00000000=
00000004
> RDI: ffff8883b5330c48
> [=C2=A0=C2=A0 63.483354][=C2=A0 T246] RBP: ffff888430688000 R08: 00000000=
00000001
> R09: ffffed1076a66189
> [=C2=A0=C2=A0 63.491172][=C2=A0 T246] R10: ffff8883b5330c4b R11: 00000000=
00000001
> R12: ffff888430688f58
> [=C2=A0=C2=A0 63.499015][=C2=A0 T246] R13: 00000000000000a0 R14: ffff8884=
1d5b1f28
> R15: 0000000000000000
> [=C2=A0=C2=A0 63.506860][=C2=A0 T246] FS:=C2=A0 0000000000000000(0000)
> GS:ffff8883b5300000(0000) knlGS:0000000000000000
> [=C2=A0=C2=A0 63.515659][=C2=A0 T246] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR=
0:
> 0000000080050033
> [=C2=A0=C2=A0 63.522116][=C2=A0 T246] CR2: 00005566d67bd842 CR3: 00000004=
3b67e002
> CR4: 00000000003706f0
> [=C2=A0=C2=A0 63.529942][=C2=A0 T246] DR0: 0000000000000000 DR1: 00000000=
00000000
> DR2: 0000000000000000
> [=C2=A0=C2=A0 63.537768][=C2=A0 T246] DR3: 0000000000000000 DR6: 00000000=
fffe0ff0
> DR7: 0000000000000400
> [=C2=A0=C2=A0 63.545591][=C2=A0 T246] Call Trace:
> [=C2=A0=C2=A0 63.548744][=C2=A0 T246]=C2=A0 <TASK>
> [ 63.551537][ T246] ? __warn (kernel/panic.c:693)=20
> [ 63.555470][ T246] ? __lock_acquire (kernel/locking/lockdep.c:5058
> (discriminator 9))=20
> [ 63.560262][ T246] ? report_bug (lib/bug.c:180 lib/bug.c:219)=20
> [ 63.564637][ T246] ? handle_bug (arch/x86/kernel/traps.c:239)=20
> [ 63.568838][ T246] ? exc_invalid_op (arch/x86/kernel/traps.c:260
> (discriminator 1))=20
> [ 63.573389][ T246] ? asm_exc_invalid_op
> (arch/x86/include/asm/idtentry.h:621)=20
> [ 63.578283][ T246] ? __lock_acquire (kernel/locking/lockdep.c:5058
> (discriminator 9))=20
> [ 63.583090][ T246] ? __lock_acquire (kernel/locking/lockdep.c:5058
> (discriminator 9))=20
> [ 63.587884][ T246] lock_acquire (kernel/locking/lockdep.c:466
> kernel/locking/lockdep.c:5758 kernel/locking/lockdep.c:5721)=20
> [ 63.592243][ T246] ? stress_inorder_work (kernel/locking/test-
> ww_mutex.c:456) test_ww_mutex
> [ 63.598787][ T246] ? __pfx_lock_acquire
> (kernel/locking/lockdep.c:5724)=20
> [ 63.603676][ T246] ? __pfx_do_raw_spin_lock
> (kernel/locking/spinlock_debug.c:114)=20
> [ 63.608899][ T246] ? __pfx___might_resched
> (kernel/sched/core.c:8392)=20
> [ 63.614036][ T246] ? __ww_mutex_lock+0x94c/0x2b50=20
> [ 63.619954][ T246] __ww_mutex_lock+0x1f9/0x2b50=20
> [ 63.625696][ T246] ? stress_inorder_work (kernel/locking/test-
> ww_mutex.c:456) test_ww_mutex
> [ 63.632218][ T246] ? stress_inorder_work (kernel/locking/test-
> ww_mutex.c:456) test_ww_mutex
> [ 63.638750][ T246] ? __pfx___ww_mutex_lock+0x10/0x10=20
> [ 63.644940][ T246] ? __mutex_unlock_slowpath
> (arch/x86/include/asm/atomic64_64.h:101 include/linux/atomic/atomic-
> arch-fallback.h:4329 include/linux/atomic/atomic-long.h:1506
> include/linux/atomic/atomic-instrumented.h:4481
> kernel/locking/mutex.c:929)=20
> [ 63.650454][ T246] ? lock_is_held_type
> (kernel/locking/lockdep.c:5497 kernel/locking/lockdep.c:5827)=20
> [ 63.655348][ T246] ? __pfx___might_resched
> (kernel/sched/core.c:8392)=20
> [ 63.660502][ T246] ? ww_mutex_lock (kernel/locking/mutex.c:878)=20
> [ 63.665047][ T246] ww_mutex_lock (kernel/locking/mutex.c:878)=20
> [ 63.669432][ T246] stress_inorder_work (kernel/locking/test-
> ww_mutex.c:456) test_ww_mutex
> [ 63.675813][ T246] ? __pfx_stress_inorder_work (kernel/locking/test-
> ww_mutex.c:434) test_ww_mutex
> [ 63.682709][ T246] ? lock_is_held_type
> (kernel/locking/lockdep.c:5497 kernel/locking/lockdep.c:5827)=20
> [ 63.687600][ T246] process_one_work (kernel/workqueue.c:3236)=20
> [ 63.692398][ T246] ? __pfx_lock_acquire
> (kernel/locking/lockdep.c:5724)=20
> [ 63.697307][ T246] ? __pfx_process_one_work
> (kernel/workqueue.c:3133)=20
> [ 63.702545][ T246] ? assign_work (kernel/workqueue.c:1202)=20
> [ 63.707003][ T246] ? lock_is_held_type
> (kernel/locking/lockdep.c:5497 kernel/locking/lockdep.c:5827)=20
> [ 63.711899][ T246] worker_thread (kernel/workqueue.c:3306
> kernel/workqueue.c:3390)=20
> [ 63.716353][ T246] ? __pfx_worker_thread (kernel/workqueue.c:3339)=20
> [ 63.721334][ T246] kthread (kernel/kthread.c:389)=20
> [ 63.725270][ T246] ? __pfx_kthread (kernel/kthread.c:342)=20
> [ 63.729732][ T246] ret_from_fork (arch/x86/kernel/process.c:153)=20
> [ 63.734019][ T246] ? __pfx_kthread (kernel/kthread.c:342)=20
> [ 63.738485][ T246] ret_from_fork_asm (arch/x86/entry/entry_64.S:257)
> [=C2=A0=C2=A0 63.743119][=C2=A0 T246]=C2=A0 </TASK>
> [=C2=A0=C2=A0 63.746012][=C2=A0 T246] irq event stamp: 10527
> [ 63.750118][ T246] hardirqs last enabled at (10527):
> finish_task_switch+0x1b6/0x950=20
> [ 63.760389][ T246] hardirqs last disabled at (10526): __schedule
> (kernel/sched/core.c:6416 (discriminator 1))=20
> [ 63.769458][ T246] softirqs last enabled at (10478): handle_softirqs
> (arch/x86/include/asm/preempt.h:26 kernel/softirq.c:401
> kernel/softirq.c:582)=20
> [ 63.778864][ T246] softirqs last disabled at (10473): __irq_exit_rcu
> (kernel/softirq.c:589 kernel/softirq.c:428 kernel/softirq.c:637)=20
> [=C2=A0=C2=A0 63.788185][=C2=A0 T246] ---[ end trace 0000000000000000 ]--=
-
>=20
>=20
>=20
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20241009/202410091542.f6c4a438-ol=
iver.sang@intel.com
>=20
>=20
>=20

