Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4459D74033F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 20:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A574010E31D;
	Tue, 27 Jun 2023 18:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp116.ord1d.emailsrvr.com (smtp116.ord1d.emailsrvr.com
 [184.106.54.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADC910E31B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 18:30:28 +0000 (UTC)
X-Auth-ID: kenneth@whitecape.org
Received: by smtp7.relay.ord1d.emailsrvr.com (Authenticated sender:
 kenneth-AT-whitecape.org) with ESMTPSA id 12693200CD; 
 Tue, 27 Jun 2023 14:30:26 -0400 (EDT)
From: Kenneth Graunke <kenneth@whitecape.org>
To: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 6/6] drm/i915/gt: Remove bogus comment on
 IVB_FBC_RT_BASE_UPPER
Date: Tue, 27 Jun 2023 11:30:26 -0700
Message-ID: <1781954.dNn8tgRAG2@mizzik>
In-Reply-To: <20230624171757.3906095-7-lucas.demarchi@intel.com>
References: <20230624171757.3906095-1-lucas.demarchi@intel.com>
 <20230624171757.3906095-7-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6032653.rBunbtZxJn";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Classification-ID: 53191565-0ac6-4928-b75f-6423565aea4a-1-1
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

--nextPart6032653.rBunbtZxJn
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Kenneth Graunke <kenneth@whitecape.org>
Date: Tue, 27 Jun 2023 11:30:26 -0700
Message-ID: <1781954.dNn8tgRAG2@mizzik>
In-Reply-To: <20230624171757.3906095-7-lucas.demarchi@intel.com>
MIME-Version: 1.0

On Saturday, June 24, 2023 10:17:57 AM PDT Lucas De Marchi wrote:
> The comment on the parameter being 0 to avoid the read back doesn't
> apply as this is not a call to wa_mcr_add(), but rather to
> wa_mcr_clr_set(). So, this register is actually checked and it's
> according to the Bspec that the register is RW, not RO.

I think you mean wa_add and wa_write_clr_set here (not mcr).

One thing I've been confused about while reading this code:

static void
wa_write_clr_set(struct i915_wa_list *wal, i915_reg_t reg, u32 clear, u32 set)
{
        wa_add(wal, reg, clear, set, clear, false);
}

The second to last parameter is read_mask aka wa->read.  We're
initializing it to the...bits to clear.  (I would think it should be
(clear | set) to pick up all modified bits.)

wa_verify seems to balk at ((cur ^ wa->set) & wa->read).  But...if
wa->read is just the clear mask, that wouldn't actually verify that
any bits were set at all.  Or am I misunderstanding something?

If not, we may be failing to verify the majority of our workarounds :(

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 848519b58e45..5fe85fad91c1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -666,7 +666,7 @@ static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
>  	/* Wa_1604278689:icl,ehl */
>  	wa_write(wal, IVB_FBC_RT_BASE, 0xFFFFFFFF & ~ILK_FBC_RT_VALID);
>  	wa_write_clr_set(wal, IVB_FBC_RT_BASE_UPPER,
> -			 0, /* write-only register; skip validation */
> +			 0,
>  			 0xFFFFFFFF);
>  
>  	/* Wa_1406306137:icl,ehl */

In this particular example, since clear bits are 0, I don't think any
verification is happening at all.

--Ken

--nextPart6032653.rBunbtZxJn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE6OtbNAgc4e6ibv4ZW1vaBx1JzDgFAmSbKsIACgkQW1vaBx1J
zDgFhQ//RUUMZwtTiu6wAKIdmihN/Vfwa8xMGbyKfpDSagj+asondCOQYql/0L/N
4cGZY9b0+W6Jy5gKu0cv1MnlAe7kViX9STTZ2eGdbgAjjGUBff4khHfGFFRW00iL
nHjVl69KmMHhYaO4neLRQiw5wyp4MxON67I9PtZE2diVzh0bLtYSZAeTZ+/modF+
nDHkCHc/lcircI+3JQ+xL5T8oYRnuS1s0nAKaOq0yWsXS3FXXAyhJSwfC2+UKL6J
dm8/prwXtj97Ztphcf5Lfcom7XRyDyzUlgdWMIwqM2VR5iwl1Tp2Kxc9lMowtHIQ
53WMHRN1acwIugbXoFbFIHJKLbZ0emhRfPK0ho9ycZOWFa/Xu52EIwMYh/oXljtd
HPjFAr1ncW4TP02UcwKBIRNK+CkICbY8EmQAvgcTDUsPKU7YUTvV7FrTnFYoObzd
az2CDvaql80MEwfJjhuYD6nqU6WjkbpUXS37XYkojpG95RCjbwlVSp+D9vd9Gm1V
IcmfJUZGKAbFc2RZIWn0vCiZJ+01jPpNxfUnq3wb5Ga9oK/ht44z9P0M6aI35XAj
TOvCT2BV3KyBEa1lqyLA1rv17VMtfxmvcRPhTlkm4gZaL0XjhxVpgz/PUAt9xTll
uVLTuNx5UeI7PMBS6xVJE8+eexghnK1zGPG3fXK/4ZaJLB24Yps=
=6GTj
-----END PGP SIGNATURE-----

--nextPart6032653.rBunbtZxJn--



