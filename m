Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83DE40AA46
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 11:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33FE6E448;
	Tue, 14 Sep 2021 09:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788316E441;
 Tue, 14 Sep 2021 09:09:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="201441794"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="201441794"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 02:09:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="543866223"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.216.6])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 02:09:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, Aaron Ma <aaron.ma@canonical.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH] drm/i915/dp: add a delay before setting panel brightness
 after power on
In-Reply-To: <20210913193509.3575-1-anarsoul@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210913193509.3575-1-anarsoul@gmail.com>
Date: Tue, 14 Sep 2021 12:09:03 +0300
Message-ID: <87r1dr34nk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Sep 2021, Vasily Khoruzhick <anarsoul@gmail.com> wrote:
> Panel in my Dell XPS 7590, that uses Intel's HDR backlight interface to
> control brightness, apparently needs a delay before setting brightness
> after power on. Without this delay the panel does accept the setting
> and may come up with some arbitrary brightness (sometimes it's too dark,
> sometimes it's too bright, I wasn't able to find a system).
>
> I don't have access to the spec, so I'm not sure if it's expected
> behavior or a quirk for particular device.
>
> Delay was chosen by experiment: it works with 100ms, but fails with
> anything lower than 75ms.

Looks like we don't respect the panel delays for DPCD backlight. The
values are used for setting up the panel power sequencer, and thus PWM
based backlight, but we should probably use the delays in DPCD backlight
code too.

BR,
Jani.


>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 4f8337c7fd2e..c4f35e1b5870 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -210,6 +210,10 @@ intel_dp_aux_hdr_enable_backlight(const struct intel_crtc_state *crtc_state,
>  
>  	ctrl = old_ctrl;
>  	if (panel->backlight.edp.intel.sdr_uses_aux) {
> +		/* Wait 100ms to ensure that panel is ready otherwise it may not
> +		 * set chosen backlight level
> +		 */
> +		msleep(100);
>  		ctrl |= INTEL_EDP_HDR_TCON_BRIGHTNESS_AUX_ENABLE;
>  		intel_dp_aux_hdr_set_aux_backlight(conn_state, level);
>  	} else {

-- 
Jani Nikula, Intel Open Source Graphics Center
