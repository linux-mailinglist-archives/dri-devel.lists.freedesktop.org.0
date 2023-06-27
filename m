Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ABE74036D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 20:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B1B10E31C;
	Tue, 27 Jun 2023 18:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp91.ord1d.emailsrvr.com (smtp91.ord1d.emailsrvr.com
 [184.106.54.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080E710E030
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 18:32:43 +0000 (UTC)
X-Auth-ID: kenneth@whitecape.org
Received: by smtp20.relay.ord1d.emailsrvr.com (Authenticated sender:
 kenneth-AT-whitecape.org) with ESMTPSA id 56EA9C00C3; 
 Tue, 27 Jun 2023 14:32:42 -0400 (EDT)
From: Kenneth Graunke <kenneth@whitecape.org>
To: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 3/6] drm/i915/gt: Fix context workarounds with
 non-masked regs
Date: Tue, 27 Jun 2023 11:32:41 -0700
Message-ID: <2394779.plcHdMng3P@mizzik>
In-Reply-To: <20230624171757.3906095-4-lucas.demarchi@intel.com>
References: <20230624171757.3906095-1-lucas.demarchi@intel.com>
 <20230624171757.3906095-4-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1998544.zc32cALAvA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Classification-ID: 328b814d-c42b-4e4a-9f32-aff72065059c-1-1
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
 Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart1998544.zc32cALAvA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Kenneth Graunke <kenneth@whitecape.org>
Date: Tue, 27 Jun 2023 11:32:41 -0700
Message-ID: <2394779.plcHdMng3P@mizzik>
In-Reply-To: <20230624171757.3906095-4-lucas.demarchi@intel.com>
MIME-Version: 1.0

On Saturday, June 24, 2023 10:17:54 AM PDT Lucas De Marchi wrote:
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
> 
> ICL has some non-masked registers in the context workarounds:
> GEN8_L3CNTLREG, IVB_FBC_RT_BASE and VB_FBC_RT_BASE_UPPER, but there
> shouldn't be an impact. The first is already being manually read and the
> other 2 are intentionally overwriting the entire register. Same
> reasoning applies to GEN12_FF_MODE2: the WA is intentionally
> overwriting all the bits to avoid a read-modify-write.
> 
> v2:  Reword commit message wrt GEN12_FF_MODE2 and the changed behavior
> on preparatory patches.
> 
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Link: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23783#note_1968971
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 27 ++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 7d48bd57b6ef..9291c2b4ca0e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -986,6 +986,9 @@ void intel_engine_init_ctx_wa(struct intel_engine_cs *engine)
>  int intel_engine_emit_ctx_wa(struct i915_request *rq)
>  {
>  	struct i915_wa_list *wal = &rq->engine->ctx_wa_list;
> +	struct intel_uncore *uncore = rq->engine->uncore;
> +	enum forcewake_domains fw;
> +	unsigned long flags;
>  	struct i915_wa *wa;
>  	unsigned int i;
>  	u32 *cs;
> @@ -1002,13 +1005,35 @@ int intel_engine_emit_ctx_wa(struct i915_request *rq)
>  	if (IS_ERR(cs))
>  		return PTR_ERR(cs);
>  
> +	fw = wal_get_fw_for_rmw(uncore, wal);
> +
> +	intel_gt_mcr_lock(wal->gt, &flags);
> +	spin_lock(&uncore->lock);
> +	intel_uncore_forcewake_get__locked(uncore, fw);
> +
>  	*cs++ = MI_LOAD_REGISTER_IMM(wal->count);
>  	for (i = 0, wa = wal->list; i < wal->count; i++, wa++) {
> +		u32 val;
> +
> +		if (wa->masked_reg || wa->set == U32_MAX) {

I think you still want:

		if (wa->masked_reg || wa->set == U32_MAX || wa->clr == U32_MAX) {

since there's no point to doing a read just to mask off 100% of the
values.  Harmless, of course, but unnecessary.

Either way, patches 1-5 are:
Reviewed-by: Kenneth Graunke <kenneth@whitecape.org>

> +			val = wa->set;
> +		} else {
> +			val = wa->is_mcr ?
> +				intel_gt_mcr_read_any_fw(wal->gt, wa->mcr_reg) :
> +				intel_uncore_read_fw(uncore, wa->reg);
> +			val &= ~wa->clr;
> +			val |= wa->set;
> +		}
> +
>  		*cs++ = i915_mmio_reg_offset(wa->reg);
> -		*cs++ = wa->set;
> +		*cs++ = val;
>  	}
>  	*cs++ = MI_NOOP;
>  
> +	intel_uncore_forcewake_put__locked(uncore, fw);
> +	spin_unlock(&uncore->lock);
> +	intel_gt_mcr_unlock(wal->gt, flags);
> +
>  	intel_ring_advance(rq, cs);
>  
>  	ret = rq->engine->emit_flush(rq, EMIT_BARRIER);
> 


--nextPart1998544.zc32cALAvA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE6OtbNAgc4e6ibv4ZW1vaBx1JzDgFAmSbK0kACgkQW1vaBx1J
zDjd8w//a4WG9AmBKc6BhTpwU3zxgTq6JVyT3MWSDriwXpwR6LzbluYcIIiD/onu
UtqqH4h/ihAOhh75GUlEtxg+rFPdukNKaBy3oT54Hk+OoJ7467z2V1X5xnYUUEyP
CCEepEBZPGYYLHj0Ybb2UUKUg3RNcIpKjyzGjnPHnmBIoggc7wYMYIvfl4NBB+MB
8RL8fGnRK871t5OnOWKgGwDgS5RvaMjwrHg/A22ZkWJBqOhE0YAbI24fkEc7B5Di
SZ1b/otTcJ8qkF1PjyjkUIkDy4DnH/r/74r5guRdUKtoVhBxsfTIOFscjS0UH4vJ
Y5AMebhNrSUbgawM519ZMAor3UHAoKtwfRA03eOpK9nXbNkeMnAiHyavgtl1M9XZ
SKqBUHOuDwPLVjxX1HTGe8OvVsv96sXw+LfX0Bnh6pz1i9yhvBiruHJJ6CkzO1dy
3mnHBRfdM9PEhQbSEwJ/wJpnBVP0ob376EccdfECS8KQ6KgDAo9aVQfTsg0njLX8
8ztadWE+1orMDXXlEz7ADdQOxmR+l3s+8t4HSZ3hrQYi/039PBuuyKvaCHK+8EAC
+1Bpsjy8PLH4D7jw2mtsA2CG6NNFuDxjCnSF8EHDlDxdiYxacB2N1W0uA1KP836X
c/dNz9+qjPRUdX/YkmbKGaskGlsMzYdZ5mrXPS0mBVG6Z/EDFW8=
=6h7K
-----END PGP SIGNATURE-----

--nextPart1998544.zc32cALAvA--



