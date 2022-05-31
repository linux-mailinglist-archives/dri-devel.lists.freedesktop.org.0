Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFE5539550
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 19:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDC210E421;
	Tue, 31 May 2022 17:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEF110E421;
 Tue, 31 May 2022 17:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654017291; x=1685553291;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oQ5qWdw9TfBLAA45Rumqx0SOfQUck34ZG4C4qOlHMbY=;
 b=CaFGITtW8epW51t/XF0yjLzeGWgFnQmWzyWd1ABpVHqv1bHuJNawDVGG
 7GWfztrNvy+huIVyLrEEXRYJbz7M+SsZAvper2xPwZ1cUiNRT5q6Sl7Et
 9zlq4de4c/Ri/i/QIJCzqC8AAIHgAa/pM1GfNK+Mq1xAvE6AOqqnmdem1
 e7u37Y2UQuQMEWsV7n1A5DAc9kjN60Qt9oo1yp/qoRFepofP0MYbVth+m
 ULyfxmkORdEF+WwWP2gVyADYWzc7bO+4pYi7TauszK7rA/HKzI5McGsOD
 bSBWY5guGd4NcAQN4f/mhSTgf83YK7nIhla2Ij+ZfTT4Zfw8f00I5apPg Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="262959257"
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; d="scan'208";a="262959257"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 10:14:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; d="scan'208";a="576501524"
Received: from mdnavare-mobl1.jf.intel.com ([10.165.21.211])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 10:14:37 -0700
Date: Tue, 31 May 2022 10:14:51 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [RFC V3 2/2] drm/i915/vrr: Set drm crtc vrr_enabled property
Message-ID: <20220531171451.GB257110@mdnavare-mobl1.jf.intel.com>
References: <20220517072636.3516381-1-bhanuprakash.modem@intel.com>
 <20220517072636.3516381-3-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220517072636.3516381-3-bhanuprakash.modem@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 17, 2022 at 12:56:36PM +0530, Bhanuprakash Modem wrote:
> This function sets the vrr_enabled property for crtc based
> on the platform support and the request from userspace.
> 
> V2: Check for platform support before updating the prop.
> V3: Don't attach vrr_enabled prop, as it is alreay attached.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_vrr.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 396f2f994fa0..7263b35550de 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -160,6 +160,10 @@ void intel_vrr_enable(struct intel_encoder *encoder,
>  	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
>  	u32 trans_vrr_ctl;
>  
> +	if (HAS_VRR(dev_priv))
> +		drm_mode_crtc_set_vrr_enabled_property(crtc_state->uapi.crtc,
> +						       crtc_state->vrr.enable);

But here if userspace has accidently set the CRTC vrr enabled prop to
true without cheking VRR capabile prop, this will be true and here the
driver will still not
reset it. If that is the purpose of adding this then we should infact
set this to false if !HAS_VRR

Manasi

> +
>  	if (!crtc_state->vrr.enable)
>  		return;
>  
> @@ -211,6 +215,10 @@ void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
>  	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
>  	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
>  
> +	if (HAS_VRR(dev_priv))
> +		drm_mode_crtc_set_vrr_enabled_property(old_crtc_state->uapi.crtc,
> +						       false);
> +
>  	if (!old_crtc_state->vrr.enable)
>  		return;
>  
> -- 
> 2.35.1
> 
