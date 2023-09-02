Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0172D7908AB
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 18:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D78C10E241;
	Sat,  2 Sep 2023 16:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 467 seconds by postgrey-1.36 at gabe;
 Sat, 02 Sep 2023 16:22:17 UTC
Received: from vulcan.natalenko.name (vulcan.natalenko.name
 [IPv6:2001:19f0:6c00:8846:5400:ff:fe0c:dfa0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E7510E241;
 Sat,  2 Sep 2023 16:22:17 +0000 (UTC)
Received: from spock.localnet (unknown [94.142.239.106])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vulcan.natalenko.name (Postfix) with ESMTPSA id 19BC814DCE08;
 Sat,  2 Sep 2023 18:14:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1693671262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=6aoq5kOuumUNefWZYwWm0v4bD/rnwjQr+nyFobpfYeA=;
 b=GPc1/eOybPkKhuH52tWwNEmDcQ2kDJ5vMwiVYUh46S4YrdmJvrfANoakMSYpEIzBG3APPr
 U26ZA9tag5zrxAAdhjjFP5yChQt9xaBXKXCsC4p/dI95NmD3E/zBovOWwP5Rifo1dedPSo
 WJbz7Xy3SDKqjbTuXSWA52a6/+jgY/Q=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: linux-kernel@vger.kernel.org
Subject: [REGRESSION] Panic in gen8_ggtt_insert_entries() with v6.5
Date: Sat, 02 Sep 2023 18:14:12 +0200
Message-ID: <4857570.31r3eYUQgx@natalenko.name>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4509088.LvFx2qVVIh";
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
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Nathan Chancellor <nathan@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Fei Yang <fei.yang@intel.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart4509088.LvFx2qVVIh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: linux-kernel@vger.kernel.org
Subject: [REGRESSION] Panic in gen8_ggtt_insert_entries() with v6.5
Date: Sat, 02 Sep 2023 18:14:12 +0200
Message-ID: <4857570.31r3eYUQgx@natalenko.name>
MIME-Version: 1.0

Hello.

Since v6.5 kernel the following HW:

* Lenovo T460s laptop with Skylake GT2 [HD Graphics 520] (rev 07)
* Lenovo T490s laptop with WhiskeyLake-U GT2 [UHD Graphics 620] (rev 02)

is affected by the following crash once KDE on either X11 or Wayland is sta=
rted:

i915 0000:00:02.0: enabling device (0006 -> 0007)
i915 0000:00:02.0: vgaarb: deactivate vga console
i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=3Dio+mem,decodes=
=3Dio+mem:owns=3Dmem
i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/skl_dmc_ver1_27=
=2Ebin (v1.27)
[drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on minor 1
fbcon: i915drmfb (fb0) is primary device
i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
=E2=80=A6
memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL, pid=3D674 'kwin_waylan=
d'
BUG: unable to handle page fault for address: ffffb422c2800000
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 100000067 P4D 100000067 PUD 1001df067 PMD 10d1cf067 PTE 0
Oops: 0002 [#1] PREEMPT SMP PTI
CPU: 1 PID: 674 Comm: kwin_wayland Not tainted 6.5.0-pf1 #1 a6c58ff41a7b8bb=
16a19f5af9e0e9bce20f9f38d
Hardware name: LENOVO 20FAS2BM0F/20FAS2BM0F, BIOS N1CET90W (1.58 ) 11/15/20=
22
RIP: 0010:gen8_ggtt_insert_entries+0xc2/0x140 [i915]
=E2=80=A6
Call Trace:
 <TASK>
 intel_ggtt_bind_vma+0x3e/0x60 [i915 a83fdc6539431252dba13053979a8b680af868=
36]
 i915_vma_bind+0x216/0x4b0 [i915 a83fdc6539431252dba13053979a8b680af86836]
 i915_vma_pin_ww+0x405/0xa80 [i915 a83fdc6539431252dba13053979a8b680af86836]
 __i915_ggtt_pin+0x5a/0x130 [i915 a83fdc6539431252dba13053979a8b680af86836]
 i915_ggtt_pin+0x78/0x1f0 [i915 a83fdc6539431252dba13053979a8b680af86836]
 __intel_context_do_pin_ww+0x312/0x700 [i915 a83fdc6539431252dba13053979a8b=
680af86836]
 i915_gem_do_execbuffer+0xfc6/0x2720 [i915 a83fdc6539431252dba13053979a8b68=
0af86836]
 i915_gem_execbuffer2_ioctl+0x111/0x260 [i915 a83fdc6539431252dba13053979a8=
b680af86836]
 drm_ioctl_kernel+0xca/0x170
 drm_ioctl+0x30f/0x580
 __x64_sys_ioctl+0x94/0xd0
 do_syscall_64+0x5d/0x90
 entry_SYSCALL_64_after_hwframe+0x6e/0xd8
=E2=80=A6
note: kwin_wayland[674] exited with irqs disabled

RIP seems to translate into this:

$ scripts/faddr2line drivers/gpu/drm/i915/gt/intel_ggtt.o gen8_ggtt_insert_=
entries+0xc2
gen8_ggtt_insert_entries+0xc2/0x150:
writeq at /home/pf/work/devel/own/pf-kernel/linux/./arch/x86/include/asm/io=
=2Eh:99
(inlined by) gen8_set_pte at /home/pf/work/devel/own/pf-kernel/linux/driver=
s/gpu/drm/i915/gt/intel_ggtt.c:257
(inlined by) gen8_ggtt_insert_entries at /home/pf/work/devel/own/pf-kernel/=
linux/drivers/gpu/drm/i915/gt/intel_ggtt.c:300

Probably, recent PTE-related changes are relevant:

$ git log --oneline --no-merges v6.4..v6.5 -- drivers/gpu/drm/i915/gt/intel=
_ggtt.c
3532e75dfadcf drm/i915/uc: perma-pin firmwares
4722e2ebe6f21 drm/i915/gt: Fix second parameter type of pre-gen8 pte_encode=
 callbacks
9275277d53248 drm/i915: use pat_index instead of cache_level
5e352e32aec23 drm/i915: preparation for using PAT index
341ad0e8e2542 drm/i915/mtl: Add PTE encode function

Also note Lenovo T14s laptop with TigerLake-LP GT2 [Iris Xe Graphics] (rev =
01) is not affected by this issue.

=46ull dmesg with DRM debug enabled is available in the bugreport I've repo=
rted earlier [1]. I'm sending this email to make the issue more visible.

Please help.

Thanks.

[1] https://gitlab.freedesktop.org/drm/intel/-/issues/9256

=2D-=20
Oleksandr Natalenko (post-factum)
--nextPart4509088.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmTzX1QACgkQil/iNcg8
M0vFXRAAwAHRXC8rN19Hemh9k7QDFYw0D6Tp6TJQ9n35nI65xPaRCZj8ISw8RQTY
Z1V0QBvTKsDbf355IOn1ode7H9x3zsLBRTqU+lH4WO8BuXEKva1kDYHUCGVjzfXH
aL0VEoBiuWr+u236AsDhkjQLC0LhFrfgaqixP92eyINQoBhSXD3LEbNdx0MhMTp6
wT5C6T/9Wyz5vsZPjX8Wu9fCCdTM1UYrBCy0k6xNP899krYvpU61ENIa0pdGvo6K
VCLGj+Yh9UyZ60Lxd8jUYjilclrUm3CpQBzDZdRqVjJX0BJG/M/sUccAofPh1GIH
lKkMohhNftMacoVnhqMWmpIYLkAdGAONFieG3v3VgTBtpPPC/WmQMpjGgsHJFc+5
cfL2LBMGD79xR7yhmgOKZleyLDBKmd7v5M+5vJievsN4p459BtLBBWECg1fXIg7X
wNgCDL6gvYahbnV3iyOffHRsyDqBCEL/8zp9HDkGqhMrlZEgsMY/fl8H7nI+jn/A
2d951wwoJ8YOY+8F61V18kE+9UQG7HQC9tqAeSiqnMneOGf++2SJ6K0vUUtys0x/
Kucyj0DQ6s1VIY4am0lvfpS5bLrP1nKLyBWe7F5irghjd/PK+oZDjZFYhe5Q4KAB
/BJ9zM8yYgfzLl8bX4VNdUlTOMGDNwJFJUGJSbri1vSkZHy9gII=
=0iUR
-----END PGP SIGNATURE-----

--nextPart4509088.LvFx2qVVIh--



