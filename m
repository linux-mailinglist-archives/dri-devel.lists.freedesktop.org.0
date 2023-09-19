Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 260167A5C74
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 10:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726ED10E255;
	Tue, 19 Sep 2023 08:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vulcan.natalenko.name (vulcan.natalenko.name
 [IPv6:2001:19f0:6c00:8846:5400:ff:fe0c:dfa0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB00F10E385;
 Tue, 19 Sep 2023 08:27:02 +0000 (UTC)
Received: from spock.localnet (unknown [94.142.239.106])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vulcan.natalenko.name (Postfix) with ESMTPSA id 0534B15056DD;
 Tue, 19 Sep 2023 10:26:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1695112017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5DpoUTV40LCsydLxis5oK2vBsi3VmjrYvAC+A4qrtyU=;
 b=CgPQrqAxppjXQPRqXIdPmULt6G+XP6CB77jCfYZvdyQ/+eGruHWUfFeGVBE2uGUBcnBpHZ
 XX5weA3iqdVZ5oPx8YrL4WYzLXIBmbvjOaHlomxQo6X5izEERDUnHYZBwvjffs45ktSRYT
 XEa+gsnK/UJZmtDYqVdk1CCoBV3+Ai8=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: linux-kernel@vger.kernel.org
Subject: [REGRESSION] [BISECTED] Panic in gen8_ggtt_insert_entries() with v6.5
Date: Tue, 19 Sep 2023 10:26:42 +0200
Message-ID: <6287208.lOV4Wx5bFT@natalenko.name>
In-Reply-To: <4857570.31r3eYUQgx@natalenko.name>
References: <4857570.31r3eYUQgx@natalenko.name>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5175558.31r3eYUQgx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Wilcox <willy@infradead.org>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Nathan Chancellor <nathan@kernel.org>,
 linux-mm@kvack.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Fei Yang <fei.yang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart5175558.31r3eYUQgx
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: linux-kernel@vger.kernel.org
Date: Tue, 19 Sep 2023 10:26:42 +0200
Message-ID: <6287208.lOV4Wx5bFT@natalenko.name>
In-Reply-To: <4857570.31r3eYUQgx@natalenko.name>
References: <4857570.31r3eYUQgx@natalenko.name>
MIME-Version: 1.0

/cc Matthew Wilcox and Andrew Morton because of folios (please see below).

On sobota 2. z=C3=A1=C5=99=C3=AD 2023 18:14:12 CEST Oleksandr Natalenko wro=
te:
> Hello.
>=20
> Since v6.5 kernel the following HW:
>=20
> * Lenovo T460s laptop with Skylake GT2 [HD Graphics 520] (rev 07)
> * Lenovo T490s laptop with WhiskeyLake-U GT2 [UHD Graphics 620] (rev 02)
>=20
> is affected by the following crash once KDE on either X11 or Wayland is s=
tarted:
>=20
> i915 0000:00:02.0: enabling device (0006 -> 0007)
> i915 0000:00:02.0: vgaarb: deactivate vga console
> i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=3Dio+mem,decod=
es=3Dio+mem:owns=3Dmem
> i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/skl_dmc_ver1_=
27.bin (v1.27)
> [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on minor 1
> fbcon: i915drmfb (fb0) is primary device
> i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
> =E2=80=A6
> memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL, pid=3D674 'kwin_wayl=
and'
> BUG: unable to handle page fault for address: ffffb422c2800000
> #PF: supervisor write access in kernel mode
> #PF: error_code(0x0002) - not-present page
> PGD 100000067 P4D 100000067 PUD 1001df067 PMD 10d1cf067 PTE 0
> Oops: 0002 [#1] PREEMPT SMP PTI
> CPU: 1 PID: 674 Comm: kwin_wayland Not tainted 6.5.0-pf1 #1 a6c58ff41a7b8=
bb16a19f5af9e0e9bce20f9f38d
> Hardware name: LENOVO 20FAS2BM0F/20FAS2BM0F, BIOS N1CET90W (1.58 ) 11/15/=
2022
> RIP: 0010:gen8_ggtt_insert_entries+0xc2/0x140 [i915]
> =E2=80=A6
> Call Trace:
>  <TASK>
>  intel_ggtt_bind_vma+0x3e/0x60 [i915 a83fdc6539431252dba13053979a8b680af8=
6836]
>  i915_vma_bind+0x216/0x4b0 [i915 a83fdc6539431252dba13053979a8b680af86836]
>  i915_vma_pin_ww+0x405/0xa80 [i915 a83fdc6539431252dba13053979a8b680af868=
36]
>  __i915_ggtt_pin+0x5a/0x130 [i915 a83fdc6539431252dba13053979a8b680af8683=
6]
>  i915_ggtt_pin+0x78/0x1f0 [i915 a83fdc6539431252dba13053979a8b680af86836]
>  __intel_context_do_pin_ww+0x312/0x700 [i915 a83fdc6539431252dba13053979a=
8b680af86836]
>  i915_gem_do_execbuffer+0xfc6/0x2720 [i915 a83fdc6539431252dba13053979a8b=
680af86836]
>  i915_gem_execbuffer2_ioctl+0x111/0x260 [i915 a83fdc6539431252dba13053979=
a8b680af86836]
>  drm_ioctl_kernel+0xca/0x170
>  drm_ioctl+0x30f/0x580
>  __x64_sys_ioctl+0x94/0xd0
>  do_syscall_64+0x5d/0x90
>  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> =E2=80=A6
> note: kwin_wayland[674] exited with irqs disabled
>=20
> RIP seems to translate into this:
>=20
> $ scripts/faddr2line drivers/gpu/drm/i915/gt/intel_ggtt.o gen8_ggtt_inser=
t_entries+0xc2
> gen8_ggtt_insert_entries+0xc2/0x150:
> writeq at /home/pf/work/devel/own/pf-kernel/linux/./arch/x86/include/asm/=
io.h:99
> (inlined by) gen8_set_pte at /home/pf/work/devel/own/pf-kernel/linux/driv=
ers/gpu/drm/i915/gt/intel_ggtt.c:257
> (inlined by) gen8_ggtt_insert_entries at /home/pf/work/devel/own/pf-kerne=
l/linux/drivers/gpu/drm/i915/gt/intel_ggtt.c:300
>=20
> Probably, recent PTE-related changes are relevant:
>=20
> $ git log --oneline --no-merges v6.4..v6.5 -- drivers/gpu/drm/i915/gt/int=
el_ggtt.c
> 3532e75dfadcf drm/i915/uc: perma-pin firmwares
> 4722e2ebe6f21 drm/i915/gt: Fix second parameter type of pre-gen8 pte_enco=
de callbacks
> 9275277d53248 drm/i915: use pat_index instead of cache_level
> 5e352e32aec23 drm/i915: preparation for using PAT index
> 341ad0e8e2542 drm/i915/mtl: Add PTE encode function
>=20
> Also note Lenovo T14s laptop with TigerLake-LP GT2 [Iris Xe Graphics] (re=
v 01) is not affected by this issue.
>=20
> Full dmesg with DRM debug enabled is available in the bugreport I've repo=
rted earlier [1]. I'm sending this email to make the issue more visible.
>=20
> Please help.
>=20
> Thanks.
>=20
> [1] https://gitlab.freedesktop.org/drm/intel/-/issues/9256

Matthew,

Andrzej asked me to try to revert commits 0b62af28f249, e0b72c14d8dc and 1e=
0877d58b1e, and reverting those fixed the i915 crash for me. The e0b72c14d8=
dc and 1e0877d58b1e commits look like just prerequisites, so I assume 0b62a=
f28f249 ("i915: convert shmem_sg_free_table() to use a folio_batch") is the=
 culprit here.

Could you please check this?

Our conversation with Andrzej is available at drm-intel GitLab [1].

Thanks.

[1] https://gitlab.freedesktop.org/drm/intel/-/issues/9256

=2D-=20
Oleksandr Natalenko (post-factum)
--nextPart5175558.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmUJW0IACgkQil/iNcg8
M0u5uBAApduFPj6LOIAuUkER/LVRTlUix96/7+Vicvx3THz78Y4PT6fIiuqYgimO
STxfJCl2FlFA6ZkFy2YxlV6CpSa5jVzHNWK52WtTxnoULjyrAWcPm2chiErS5/RK
LckCBH1T2wS0eVWnYg0Fy6sCQH/ganfdAgzr/EFDo19I2PQIW3Ae7+i42wWGC6Qb
k8Jua0IVE956ZREX5aAKDqUPc2AZQ3/mDPXz8QgEKN+xWcQbuJmjbPDb98xAwO3c
X80MdYO0tLCDObl/b7H1HI+dFGTMQif3Trs470W0JGrbbvleigyKvftcyNWwKzki
PbQBpTPW7LlaNSS6nYK238HBgXCkaT1MgqiOLIR41iUo053tsZb/iyuT07iv8qTv
Sz4dQnYvIj3HGg+3g+3bE9UmECSwRbZup+BKP7GAQgiQYUAUH/5ZnZ7CxS5E96gd
IeBfNjnay6DezmsE3//Uskn06OlO6Tw5fqahwieC/ozLVgcluJPR0cr/DQIJ3w/X
ExBgry2KEaVfITBPqKNe2VU9qCdN7Mxt0FXeuQ6k5K8XDKOLqR/9J0ps7hXA0FlG
dA0oiY9VYbljOLJ0WAKWyrJEqS51gEKD+YMG+EpiId4Lq2M51W3G5+eGJdWG1BTp
x53sAg3MqZ/gVLS6Q/O8jPsbmD2CmjQA3Kj9Q48TvoJI8kiXpdA=
=0Db+
-----END PGP SIGNATURE-----

--nextPart5175558.31r3eYUQgx--



