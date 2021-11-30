Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6105463BA8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 17:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3C46E9BC;
	Tue, 30 Nov 2021 16:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECD86E9BC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 16:22:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="322494392"
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; d="scan'208";a="322494392"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 08:22:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; d="scan'208";a="540465576"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 30 Nov 2021 08:22:49 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 30 Nov 2021 18:22:48 +0200
Date: Tue, 30 Nov 2021 18:22:48 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Zhou Qingyang <zhou1615@umn.edu>
Subject: Re: [PATCH] drm/gma500/cdv: Fix a wild pointer dereference in
 cdv_intel_dp_get_modes()
Message-ID: <YaZP2HzTQw1QJxOK@intel.com>
References: <20211130132328.129383-1-zhou1615@umn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211130132328.129383-1-zhou1615@umn.edu>
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zhao Yakui <yakui.zhao@intel.com>,
 Dave Airlie <airlied@redhat.com>, Alan Cox <alan@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 30, 2021 at 09:23:28PM +0800, Zhou Qingyang wrote:
> In cdv_intel_dp_get_modes(), the third return value of
> drm_mode_duplicate() is assigned to mode and used in
> drm_mode_probed_add(). drm_mode_probed_add() passes mode->head to
> list_add_tail(). list_add_tail() will further call __list_add() and
> there is a dereference of mode->head in __list_add(), which could lead
> to a wild pointer dereference on failure of drm_mode_duplicate().
> 
> Fix this bug by adding a check of mode.
> 
> This bug was found by a static analyzer. The analysis employs
> differential checking to identify inconsistent security operations
> (e.g., checks or kfrees) between two code paths and confirms that the
> inconsistent operations are not recovered in the current function or
> the callers, so they constitute bugs.
> 
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
> 
> Builds with CONFIG_DRM_GMA500=m show no new warnings,
> and our static analyzer no longer warns about this code.
> 
> Fixes: d112a8163f83 ("gma500/cdv: Add eDP support")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> index ba6ad1466374..b389008965a9 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -1773,6 +1773,9 @@ static int cdv_intel_dp_get_modes(struct drm_connector *connector)
>  		if (intel_dp->panel_fixed_mode != NULL) {
>  			struct drm_display_mode *mode;
>  			mode = drm_mode_duplicate(dev, intel_dp->panel_fixed_mode);
> +			if (!mode)
> +				return -ENOMEM;

.get_modes() isn't supposed to return negative values.

> +
>  			drm_mode_probed_add(connector, mode);
>  			return 1;
>  		}
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
