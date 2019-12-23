Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B060D129978
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 18:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0BA6E36F;
	Mon, 23 Dec 2019 17:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7756E339;
 Mon, 23 Dec 2019 17:36:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 09:36:45 -0800
X-IronPort-AV: E=Sophos;i="5.69,348,1571727600"; d="scan'208";a="211625969"
Received: from unknown (HELO localhost) ([10.249.35.31])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 09:36:42 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: Re: [PATCH v2] drm/i915: Re-init lspcon after HPD if lspcon probe
 failed
In-Reply-To: <20191223171310.21192-1-kai.heng.feng@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191223171310.21192-1-kai.heng.feng@canonical.com>
Date: Mon, 23 Dec 2019 19:36:39 +0200
Message-ID: <87o8vzrljs.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 swati2.sharma@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Dec 2019, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> On HP 800 G4 DM, if HDMI cable isn't plugged before boot, the HDMI port
> becomes useless and never responds to cable hotplugging:
> [    3.031904] [drm:lspcon_init [i915]] *ERROR* Failed to probe lspcon
> [    3.031945] [drm:intel_ddi_init [i915]] *ERROR* LSPCON init failed on port D
>
> Seems like the lspcon chip on the system in question only gets powered
> after the cable is plugged.
>
> So let's call lspcon_init() dynamically to properly initialize the
> lspcon chip and make HDMI port work.
>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v2: 
>   - Move lspcon_init() inside of intel_dp_hpd_pulse().
>
>  drivers/gpu/drm/i915/display/intel_dp.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index fe31bbfd6c62..eb395b45527e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -6573,6 +6573,7 @@ enum irqreturn
>  intel_dp_hpd_pulse(struct intel_digital_port *intel_dig_port, bool long_hpd)
>  {
>  	struct intel_dp *intel_dp = &intel_dig_port->dp;
> +	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
>  
>  	if (long_hpd && intel_dig_port->base.type == INTEL_OUTPUT_EDP) {
>  		/*
> @@ -6592,11 +6593,14 @@ intel_dp_hpd_pulse(struct intel_digital_port *intel_dig_port, bool long_hpd)
>  		      intel_dig_port->base.base.name,
>  		      long_hpd ? "long" : "short");
>  
> -	if (long_hpd) {
> +	if (long_hpd && intel_dig_port->base.type != INTEL_OUTPUT_DDI) {

With this change, long hpd handling for DDI on platforms that do not
have LSPCON, or has an active LSPCON, falls through to the short hpd
handling. That's not what you're after, is it?


BR,
Jani.


>  		intel_dp->reset_link_params = true;
>  		return IRQ_NONE;
>  	}
>  
> +	if (long_hpd && HAS_LSPCON(dev_priv) && !intel_dig_port->lspcon.active)
> +		lspcon_init(intel_dig_port);
> +
>  	if (intel_dp->is_mst) {
>  		if (intel_dp_check_mst_status(intel_dp) == -EINVAL) {
>  			/*

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
