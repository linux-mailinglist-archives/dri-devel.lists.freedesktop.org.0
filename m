Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BB231C9E9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 12:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2376E949;
	Tue, 16 Feb 2021 11:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A196E94A;
 Tue, 16 Feb 2021 11:40:58 +0000 (UTC)
IronPort-SDR: qgfCvzlhRA87xJC5+Y7v/c1CTR5IsqiPc6Cr4WVPkza6tb2CG2+G6UqPsPWhfjDbqJRJikmt9p
 9VTwbM8WFhjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="170524845"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; d="scan'208";a="170524845"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 03:40:57 -0800
IronPort-SDR: 4kV5ifMdVY9iJrYATUkpZJGFsnJHi5+qO0IkY7IxM9P8arvHIg0VaVYfdir6wCj/cYIBdI+Pi9
 LMsAkJsHniLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; d="scan'208";a="400964230"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 16 Feb 2021 03:40:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 16 Feb 2021 13:40:53 +0200
Date: Tue, 16 Feb 2021 13:40:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Chen Lin <chen45464546@163.com>
Subject: Re: [PATCH] drm/i915: Remove unused function pointer typedef
 long_pulse_detect_func
Message-ID: <YCuvRTwGxocZULT1@intel.com>
References: <1613388619-3276-1-git-send-email-chen45464546@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1613388619-3276-1-git-send-email-chen45464546@163.com>
X-Patchwork-Hint: comment
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen Lin <chen.lin5@zte.com.cn>, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 15, 2021 at 07:30:19PM +0800, Chen Lin wrote:
> From: Chen Lin <chen.lin5@zte.com.cn>
> =

> Remove the 'long_pulse_detect_func' typedef as it is not used.
> =

> Signed-off-by: Chen Lin <chen.lin5@zte.com.cn>
> ---
>  drivers/gpu/drm/i915/i915_irq.c |    1 -
>  1 file changed, 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_=
irq.c
> index 6cdb052..c294ac6 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -78,7 +78,6 @@ static inline void pmu_irq_stats(struct drm_i915_privat=
e *i915,
>  	WRITE_ONCE(i915->pmu.irq_count, i915->pmu.irq_count + 1);
>  }
>  =

> -typedef bool (*long_pulse_detect_func)(enum hpd_pin pin, u32 val);
>  typedef u32 (*hotplug_enables_func)(struct drm_i915_private *i915,
>  				    enum hpd_pin pin);

I thought we used in when passing it as an argument to
intel_get_hpd_pins(), but looks like that's not the case.
I guess we should unify this stuff by either removing both
these typedefs and adjusting intel_hpd_hotplug_enables()
accordingly, or we should use the typedef in intel_get_hpd_pins() as
well.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
