Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D41273BF1C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 21:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAF710E6AA;
	Fri, 23 Jun 2023 19:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 511 seconds by postgrey-1.36 at gabe;
 Fri, 23 Jun 2023 19:56:47 UTC
Received: from smtp122.ord1d.emailsrvr.com (smtp122.ord1d.emailsrvr.com
 [184.106.54.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD6410E6A8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 19:56:47 +0000 (UTC)
X-Auth-ID: kenneth@whitecape.org
Received: by smtp24.relay.ord1d.emailsrvr.com (Authenticated sender:
 kenneth-AT-whitecape.org) with ESMTPSA id 11DEBA013F; 
 Fri, 23 Jun 2023 15:48:13 -0400 (EDT)
From: Kenneth Graunke <kenneth@whitecape.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/3] drm/i915/gt: Fix context workarounds with non-masked
 regs
Date: Fri, 23 Jun 2023 12:48:13 -0700
Message-ID: <2063427.kFxYfkjxrY@mizzik>
In-Reply-To: <ehp36knxqfilobajjyk54oamk3n43s3cja5webx3q4jzm6xrlm@idrattdnr3fa>
References: <20230622182731.3765039-1-lucas.demarchi@intel.com>
 <3337022.2OMYdDKdcH@mizzik>
 <ehp36knxqfilobajjyk54oamk3n43s3cja5webx3q4jzm6xrlm@idrattdnr3fa>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1867622.CKnAoKXUt6";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Classification-ID: 5fd2a755-ac59-4319-8aa7-670f466f52f6-1-1
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
Cc: intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart1867622.CKnAoKXUt6
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Kenneth Graunke <kenneth@whitecape.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Fri, 23 Jun 2023 12:48:13 -0700
Message-ID: <2063427.kFxYfkjxrY@mizzik>
MIME-Version: 1.0

On Friday, June 23, 2023 8:49:05 AM PDT Lucas De Marchi wrote:
> On Thu, Jun 22, 2023 at 04:37:21PM -0700, Kenneth Graunke wrote:
> >On Thursday, June 22, 2023 11:27:30 AM PDT Lucas De Marchi wrote:
> >> Most of the context workarounds tweak masked registers, but not all. For
> >> masked registers, when writing the value it's sufficient to just write
> >> the wa->set_bits since that will take care of both the clr and set bits
> >> as well as not overwriting other bits.
> >>
> >> However there are some workarounds, the registers are non-masked. Up
> >> until now the driver was simply emitting a MI_LOAD_REGISTER_IMM with the
> >> set_bits to program the register via the GPU in the WA bb. This has the
> >> side effect of overwriting the content of the register outside of bits
> >> that should be set and also doesn't handle the bits that should be
> >> cleared.
> >>
> >> Kenneth reported that on DG2, mesa was seeing a weird behavior due to
> >> the kernel programming of L3SQCREG5 in dg2_ctx_gt_tuning_init(). With
> >> the GPU idle, that register could be read via intel_reg as 0x00e001ff,
> >> but during a 3D workload it would change to 0x0000007f. So the
> >> programming of that tuning was affecting more than the bits in
> >> L3_PWM_TIMER_INIT_VAL_MASK. Matt Roper noticed the lack of rmw for the
> >> context workarounds due to the use of MI_LOAD_REGISTER_IMM.
> >>
> >> So, for registers that are not masked, read its value via mmio, modify
> >> and then set it in the buffer to be written by the GPU. This should take
> >> care in a simple way of programming just the bits required by the
> >> tuning/workaround. If in future there are registers that involved that
> >> can't be read by the CPU, a more complex approach may be required like
> >> a) issuing additional instructions to read and modify; or b) scan the
> >> golden context and patch it in place before saving it; or something
> >> else. But for now this should suffice.
> >>
> >> Scanning the context workarounds for all platforms, these are the
> >> impacted ones with the respective registers
> >>
> >> 	mtl: DRAW_WATERMARK
> >> 	mtl/dg2: XEHP_L3SQCREG5, XEHP_FF_MODE2
> >> 	gen12: GEN12_FF_MODE2
> >
> >Speaking of GEN12_FF_MODE2...there's a big scary comment above that
> >workaround write which says that register "will return the wrong value
> >when read."  I think with this patch, we'll start doing a RMW cycle for
> >the register, which could mix in some of this "wrong value".  The
> >comment mentions that the intention is to write the whole register,
> >as the default value is 0 for all fields.
> 
> Good point. That also means we don't need to backport this patch to
> stable kernel to any gen12, since overwritting the other bits is
> actually the intended behavior.
> 
> >
> >Maybe what we want to do is change gen12_ctx_gt_tuning_init to do
> >
> >    wa_write(wal, GEN12_FF_MODE2, FF_MODE2_TDS_TIMER_128);
> >
> >so it has a clear mask of ~0 instead of FF_MODE2_TDS_TIMER_MASK, and
> 
> In order to ignore read back when verifying, we would still need to use
> wa_add(), but changing the mask. We don't have a wa_write() that ends up
> with { .clr = ~0, .read_mask = 0 }.
> 
> 	wa_add(wal,
> 	       GEN12_FF_MODE2,
> 	       ~0, FF_MODE2_TDS_TIMER_128,
> 	       0, false);

Good point!  Though, I just noticed another bug here:

gen12_ctx_workarounds_init sets FF_MODE2_GS_TIMER_224 to avoid hangs
in the HS/DS unit, after gen12_ctx_gt_tuning_init set TDS_TIMER_128
for performance.  One of those is going to clobber the other; we're
likely losing the TDS tuning today.  Combining those workarounds into
one place seems like an easy way to fix that.

> >then in this patch update your condition below from
> >
> >+		if (wa->masked_reg || wa->set == U32_MAX) {
> >
> >to
> >
> >+		if (wa->masked_reg || wa->set == U32_MAX || wa->clear == U32_MAX) {
> 
> yeah... and maybe also warn if wa->read is 0, which means it's one
> of the registers we can't/shouldn't read from the CPU.
> 
> >
> >because if we're clearing all bits then we don't care about doing a
> >read-modify-write either.
> 
> thanks
> Lucas De Marchi
> 
> >
> >--Ken
> 
> 
> 


--nextPart1867622.CKnAoKXUt6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE6OtbNAgc4e6ibv4ZW1vaBx1JzDgFAmSV9v0ACgkQW1vaBx1J
zDjrZg//afm16ckrRi/gJT1PqXX0Vr6kGCfIH6eHyHu3tM2IFEUjbgTAUD8us+yf
Vzao0Z+8ImfMZMWqYCqlkOdh+tzYq4uqOVpKnT37M6IR5eJ9084I3owuwijetrEn
rekrPBwW+pDwzVMY8mVjZlnyU7NKoSuYsiWQrENy2POCVFd2yb/hIL3lKhzfeAs7
x1kGY3K/mMGc3n5s7WgmSdOnR1n0E47ux8L3RkIb0quRTl6RUUpXuo23gwCvKahp
+Xkg0Ze/qAp7e++XuzGbLdZOjKQFNu8TvhpNhh9+YQsQGfG9NqZR4NrETRacF5Ve
ERFwhoyRZulx6nJEgXE4IyIHZFr5GJcv6/l17mmhHLsbP+70KL9zJzhpSN/LRiWN
u6bw8tOvaM6GWpuAgmvXARzOevI3NuSmovPPynEMHdNjDfHmB9gdmWfKSjqNDJMx
CNj8ucEhyYUCJQ8kd41l5MCgYu6+tOUOLxA4fC5YlG82AywCR6tiPacAlaShaXi6
5dd9WTIig6EpFe0mfRM30X2BHo2rZgaeYqfK0vaiif63g0cOaoUKi83D4NMUQWYf
gidVjzA+gi9gvXJou+xy63mNMrOaNLW1M5cuySpb08kZ1/y3Srrq8R+Mw8ePfSMt
cKV/sXMObB8ASqcpZ5Yi6eg1ohmg8KJ4aUGYdNBw2fKAC83DdnQ=
=Palk
-----END PGP SIGNATURE-----

--nextPart1867622.CKnAoKXUt6--



