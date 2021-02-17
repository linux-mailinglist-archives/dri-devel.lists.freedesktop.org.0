Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 784E931DEF6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 19:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8076E9AC;
	Wed, 17 Feb 2021 18:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339066E9AC;
 Wed, 17 Feb 2021 18:19:19 +0000 (UTC)
IronPort-SDR: YSTstMiHTgLANwvcNlRa6PhDEd0aSb+lhj6v88QkQu9WHkcrQbLhahrEjuHITQloBrRKNwnTsf
 jeKdsA+4Ka9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="162409033"
X-IronPort-AV: E=Sophos;i="5.81,185,1610438400"; d="scan'208";a="162409033"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 10:19:01 -0800
IronPort-SDR: 10/4LOWbbDnZydEs+vFTlUYsXzTSAzQnuDjBVxyDtp4FHP9x+tcj8xiNBV49xXOPLYOR6BMZ3y
 Q5hA4fy5S5Tw==
X-IronPort-AV: E=Sophos;i="5.81,185,1610438400"; d="scan'208";a="401386165"
Received: from gfreude-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.209.147.126])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 10:19:00 -0800
Date: Wed, 17 Feb 2021 13:18:58 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v3 2/2] drm/i915/icp+: Use icp_hpd_irq_setup() instead of
 spt_hpd_irq_setup()
Message-ID: <YC1eEmjZigHbYYyy@intel.com>
References: <20210217025337.1929015-1-lyude@redhat.com>
 <20210217025337.1929015-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210217025337.1929015-2-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 16, 2021 at 09:53:37PM -0500, Lyude Paul wrote:
> While reviewing patches for handling workarounds related to gen9 bc, Imre
> from Intel discovered that we're using spt_hpd_irq_setup() on ICP+ PCHs
> despite it being almost the same as icp_hpd_irq_setup(). Since we need to
> be calling icp_hpd_irq_setup() to ensure that CML-S/TGP platforms function
> correctly anyway, let's move platforms using PCH_ICP which aren't handled
> by gen11_hpd_irq_setup() over to icp_hpd_irq_setup().
> 
> Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>


makes sense to me...


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
>  drivers/gpu/drm/i915/i915_irq.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index f86b147f588f..7ec61187a315 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -4320,6 +4320,8 @@ void intel_irq_init(struct drm_i915_private *dev_priv)
>  			dev_priv->display.hpd_irq_setup = gen11_hpd_irq_setup;
>  		else if (IS_GEN9_LP(dev_priv))
>  			dev_priv->display.hpd_irq_setup = bxt_hpd_irq_setup;
> +		else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
> +			dev_priv->display.hpd_irq_setup = icp_hpd_irq_setup;
>  		else if (INTEL_PCH_TYPE(dev_priv) >= PCH_SPT)
>  			dev_priv->display.hpd_irq_setup = spt_hpd_irq_setup;
>  		else
> -- 
> 2.29.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
