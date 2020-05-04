Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2794A1C3F7E
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 18:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4B889FCA;
	Mon,  4 May 2020 16:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0196489F5B;
 Mon,  4 May 2020 16:12:18 +0000 (UTC)
IronPort-SDR: q2YgEtAaloXL/5ulHk/iVDH6MfJLbf0dkvoIaRL4zlUOJMO6ERnvLaUt61d//KFavYV8NHIVix
 jRQaC+5UCoNQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 09:12:18 -0700
IronPort-SDR: NjIs5eVckiefVYzs1nbR8TZZP08x1SCNuBp/AYXeYKVd5KTbFssOqilwxELtBYPR4imLSjI+d2
 TGTnF4ViDebw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,352,1583222400"; d="scan'208";a="262866242"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 04 May 2020 09:12:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 May 2020 19:12:13 +0300
Date: Mon, 4 May 2020 19:12:13 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sultan Alsawaf <sultan@kerneltoast.com>
Subject: Re: [PATCH] drm/i915: Don't enable WaIncreaseLatencyIPCEnabled when
 IPC is disabled
Message-ID: <20200504161213.GD6112@intel.com>
References: <20200430214654.51314-1-sultan@kerneltoast.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430214654.51314-1-sultan@kerneltoast.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 02:46:54PM -0700, Sultan Alsawaf wrote:
> From: Sultan Alsawaf <sultan@kerneltoast.com>
> =

> In commit 5a7d202b1574, a logical AND was erroneously changed to an OR,
> causing WaIncreaseLatencyIPCEnabled to be enabled unconditionally for
> kabylake and coffeelake, even when IPC is disabled. Fix the logic so
> that WaIncreaseLatencyIPCEnabled is only used when IPC is enabled.
> =

> Fixes: 5a7d202b1574 ("drm/i915: Drop WaIncreaseLatencyIPCEnabled/1140 for=
 cnl")
> Cc: stable@vger.kernel.org # 5.3.x+
> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> ---
>  drivers/gpu/drm/i915/intel_pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel=
_pm.c
> index 8375054ba27d..a52986a9e7a6 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -4992,7 +4992,7 @@ static void skl_compute_plane_wm(const struct intel=
_crtc_state *crtc_state,
>  	 * WaIncreaseLatencyIPCEnabled: kbl,cfl
>  	 * Display WA #1141: kbl,cfl
>  	 */
> -	if ((IS_KABYLAKE(dev_priv) || IS_COFFEELAKE(dev_priv)) ||
> +	if ((IS_KABYLAKE(dev_priv) || IS_COFFEELAKE(dev_priv)) &&

Whoops. Thanks for the fix. Pushed.

>  	    dev_priv->ipc_enabled)
>  		latency +=3D 4;
>  =

> -- =

> 2.26.2

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
