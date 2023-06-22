Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE41E73AD54
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 01:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B2110E5B6;
	Thu, 22 Jun 2023 23:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 564 seconds by postgrey-1.36 at gabe;
 Thu, 22 Jun 2023 23:46:48 UTC
Received: from smtp69.iad3a.emailsrvr.com (smtp69.iad3a.emailsrvr.com
 [173.203.187.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51E710E0A1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 23:46:48 +0000 (UTC)
X-Auth-ID: kenneth@whitecape.org
Received: by smtp25.relay.iad3a.emailsrvr.com (Authenticated sender:
 kenneth-AT-whitecape.org) with ESMTPSA id 5FD2C23976; 
 Thu, 22 Jun 2023 19:37:22 -0400 (EDT)
From: Kenneth Graunke <kenneth@whitecape.org>
To: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/3] drm/i915/gt: Fix context workarounds with non-masked
 regs
Date: Thu, 22 Jun 2023 16:37:21 -0700
Message-ID: <3337022.2OMYdDKdcH@mizzik>
In-Reply-To: <20230622182731.3765039-2-lucas.demarchi@intel.com>
References: <20230622182731.3765039-1-lucas.demarchi@intel.com>
 <20230622182731.3765039-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart23769370.ZV0zXJHA5L";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Classification-ID: fa98ef4b-1604-47dd-b2b5-2b1b6ee0f044-1-1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart23769370.ZV0zXJHA5L
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Kenneth Graunke <kenneth@whitecape.org>
Date: Thu, 22 Jun 2023 16:37:21 -0700
Message-ID: <3337022.2OMYdDKdcH@mizzik>
In-Reply-To: <20230622182731.3765039-2-lucas.demarchi@intel.com>
MIME-Version: 1.0

On Thursday, June 22, 2023 11:27:30 AM PDT Lucas De Marchi wrote:
> Most of the context workarounds tweak masked registers, but not all. For
> masked registers, when writing the value it's sufficient to just write
> the wa->set_bits since that will take care of both the clr and set bits
> as well as not overwriting other bits.
> 
> However there are some workarounds, the registers are non-masked. Up
> until now the driver was simply emitting a MI_LOAD_REGISTER_IMM with the
> set_bits to program the register via the GPU in the WA bb. This has the
> side effect of overwriting the content of the register outside of bits
> that should be set and also doesn't handle the bits that should be
> cleared.
> 
> Kenneth reported that on DG2, mesa was seeing a weird behavior due to
> the kernel programming of L3SQCREG5 in dg2_ctx_gt_tuning_init(). With
> the GPU idle, that register could be read via intel_reg as 0x00e001ff,
> but during a 3D workload it would change to 0x0000007f. So the
> programming of that tuning was affecting more than the bits in
> L3_PWM_TIMER_INIT_VAL_MASK. Matt Roper noticed the lack of rmw for the
> context workarounds due to the use of MI_LOAD_REGISTER_IMM.
> 
> So, for registers that are not masked, read its value via mmio, modify
> and then set it in the buffer to be written by the GPU. This should take
> care in a simple way of programming just the bits required by the
> tuning/workaround. If in future there are registers that involved that
> can't be read by the CPU, a more complex approach may be required like
> a) issuing additional instructions to read and modify; or b) scan the
> golden context and patch it in place before saving it; or something
> else. But for now this should suffice.
> 
> Scanning the context workarounds for all platforms, these are the
> impacted ones with the respective registers
> 
> 	mtl: DRAW_WATERMARK
> 	mtl/dg2: XEHP_L3SQCREG5, XEHP_FF_MODE2
> 	gen12: GEN12_FF_MODE2

Speaking of GEN12_FF_MODE2...there's a big scary comment above that
workaround write which says that register "will return the wrong value
when read."  I think with this patch, we'll start doing a RMW cycle for
the register, which could mix in some of this "wrong value".  The
comment mentions that the intention is to write the whole register,
as the default value is 0 for all fields.

Maybe what we want to do is change gen12_ctx_gt_tuning_init to do

    wa_write(wal, GEN12_FF_MODE2, FF_MODE2_TDS_TIMER_128);

so it has a clear mask of ~0 instead of FF_MODE2_TDS_TIMER_MASK, and
then in this patch update your condition below from

+		if (wa->masked_reg || wa->set == U32_MAX) {

to

+		if (wa->masked_reg || wa->set == U32_MAX || wa->clear == U32_MAX) {

because if we're clearing all bits then we don't care about doing a
read-modify-write either.

--Ken

--nextPart23769370.ZV0zXJHA5L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE6OtbNAgc4e6ibv4ZW1vaBx1JzDgFAmSU2zEACgkQW1vaBx1J
zDi2Dg//a2kNxu7B2APmRk9aNgVr1so4zaW2qGlqsfqUmUZFVIU0fBOE1KKE7C2p
15II2rsMTU1695AdfR83F/qt8AV3thWOd7drE7f3jh1TTxahlZVdipqLvJ/UG8FK
GVjUO90+UWNI9WJycrB6QjdnVlgWz/VsBfzBuZH8TQDdp+ko4hwhoPEzqHSlpsNd
XPvZyDiDU7Xoj59/sGUbFOrBoZANC56HKsLeaVpLLof2KCOi5LUZzmQ+kIYrkmYa
zvsMuLhfWEtcS15bwSY6eTFT9NqV00/PuQAt0Jdg/IfGx7wm1OIYRnpHYnDAimUz
+JgKXAEFBC3dyWucfUSQb6/UPEuHm+9COXnFso3sOFaWCVBEBklRuobEk+O0RmXe
naIuGsgV2vGtzhFGrmKu9NLNO86qgaENMOjhdS+9t+Z0ws+3I/SNyXB2TkAZ0k21
nEDgMVaO+FkjivyqDfiDwoiTIvtLrONWB7SSv7wdZze3mws2GpY14X3yF7GLkNCJ
TWjVGnntSIjF7gLnnNnK5hnWl1uN/NrjQpf2j8WkIvUu32C0dErddY0PwNZFT6Tp
yjtONwRcs3/4IJaAdyPC5u2/Qu9DkGubTqdcwsvNeTEPMC+bKAUgkyiI3anKtw5e
4S1oTin2BTwRx5q4pNy3tDKvKLEYiDVCEWCiHMc9loek7EvPd1Q=
=t4AT
-----END PGP SIGNATURE-----

--nextPart23769370.ZV0zXJHA5L--



