Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017745ACDEF
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 10:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E6310E222;
	Mon,  5 Sep 2022 08:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA9710E21E;
 Mon,  5 Sep 2022 08:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662367455; x=1693903455;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:message-id:date;
 bh=nkHjrVD4emWC4r4IQzp4zCX1/KwviOvkm/4V+N1maYM=;
 b=bLzBdkgLb3XEkwKwomlMGqmEt60vkEeZUkmCE7U0GBFj2UE6xQd+42v1
 G0gOmBkYHEpKd/eoS/INNdnpsJXAAwctkE23TfJfRzVu0AL5g7fQqC4aW
 F4NU70uzNIIUnPAtBQr1ER2HZEUpgChGGzGIZcF/Q6F7AGHOjnD7Jg+ba
 ByHuQogwhU5/KGrfJS7zRF6ISI5EkmTt/tVyhR6CP9fTHYwvuYDB/Xd3K
 V1vtQZ+GljPKY9fIJf2uLPjhOYOHkrMyYN5Y0zxTMvUPUjKxXtzbx2VRW
 A/EF/qoL1pvmK3CN6nLmNBzuQx2J+jddhcWXwccbhi0PyTGHcAkdbXCQj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="360295673"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; d="scan'208";a="360295673"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 01:44:14 -0700
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; d="scan'208";a="942024872"
Received: from mchiappe-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.15.7])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 01:44:12 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220826210233.406482-1-matthew.d.roper@intel.com>
References: <20220826210233.406482-1-matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH] Revert "drm/i915/dg2: Add preemption changes
 for Wa_14015141709"
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <166236745011.17509.17865778985614469573@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Mon, 05 Sep 2022 11:44:10 +0300
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Matt Roper (2022-08-27 00:02:33)
> This reverts commit ca6920811aa5428270dd78af0a7a36b10119065a.
>=20
> The intent of Wa_14015141709 was to inform us that userspace can no
> longer control object-level preemption as it has on past platforms
> (i.e., by twiddling register bit CS_CHICKEN1[0]).  The description of
> the workaround in the spec wasn't terribly well-written, and when we
> requested clarification from the hardware teams we were told that on the
> kernel side we should also probably stop setting
> FF_SLICE_CS_CHICKEN1[14], which is the register bit that directs the
> hardware to honor the settings in per-context register CS_CHICKEN1.  It
> turns out that this guidance about FF_SLICE_CS_CHICKEN1[14] was a
> mistake; even though CS_CHICKEN1[0] is non-operational and useless to
> userspace, there are other bits in the register that do still work and
> might need to be adjusted by userspace in the future (e.g., to implement
> other workarounds that show up).  If we don't set
> FF_SLICE_CS_CHICKEN1[14] in i915, then those future workarounds would
> not take effect.

Here we should be referencing Mesa/Compute runtime/etc. patches that
intend to use these other bits.

This is to ensure that they're actually aware of the hardware changes
ongoing and we end up with fully functional stack and not kernel doing
something other than the userspace attempts to do.

> This miscommunication came to light because another workaround
> (Wa_16013994831) has now shown up that requires userspace to adjust the
> value of CS_CHICKEN[10] in certain circumstances.  To ensure userspace's
> updates to this chicken bit are handled properly by the hardware, we
> need to make sure that FF_SLICE_CS_CHICKEN1[14] is once again set by the
> kernel.
>=20
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Not too many Cc:s for a patch that impacts uAPI. Even the original patch
being reverted definitely should have Cc:d mesa and some mesa devs.

> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 2 +-
>  drivers/gpu/drm/i915/i915_drv.h             | 3 ---
>  2 files changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/dr=
m/i915/gt/intel_workarounds.c
> index 3cdb8294e13f..69a0c6a74474 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2389,7 +2389,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, =
struct i915_wa_list *wal)
>                              FF_DOP_CLOCK_GATE_DISABLE);
>         }
> =20
> -       if (HAS_PERCTX_PREEMPT_CTRL(i915)) {
> +       if (IS_GRAPHICS_VER(i915, 9, 12)) {
>                 /* FtrPerCtxtPreemptionGranularityControl:skl,bxt,kbl,cfl=
,cnl,icl,tgl */

According to the commit description, this is not the W/A being supported
anymore by the whitelisting. Even if it's the same register we're talking a=
bout
different bits and different reasons.

We should clearly indicate that.

Can we have a followup patch where the reasoning is explained more
clearly and the userspace side changes are being referenced and at least
some userspace folks Cc'd?

Regards, Joonas

>                 wa_masked_en(wal,
>                              GEN7_FF_SLICE_CS_CHICKEN1,
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index 2b00ef3626db..d6a1ab6f65de 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1352,9 +1352,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define HAS_GUC_DEPRIVILEGE(dev_priv) \
>         (INTEL_INFO(dev_priv)->has_guc_deprivilege)
> =20
> -#define HAS_PERCTX_PREEMPT_CTRL(i915) \
> -       ((GRAPHICS_VER(i915) >=3D 9) &&  GRAPHICS_VER_FULL(i915) < IP_VER=
(12, 55))
> -
>  #define HAS_D12_PLANE_MINIMIZATION(dev_priv) (IS_ROCKETLAKE(dev_priv) ||=
 \
>                                               IS_ALDERLAKE_S(dev_priv))
> =20
> --=20
> 2.37.2
>=20
