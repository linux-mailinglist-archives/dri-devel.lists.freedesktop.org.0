Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B62A61FEC3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 20:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3732C10E3BF;
	Mon,  7 Nov 2022 19:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852D710E3BF;
 Mon,  7 Nov 2022 19:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667849833; x=1699385833;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=r0vAOoO2Li7vvBK9JKjeTn5g1cV1l7oWFilSA5GEbYY=;
 b=G0yu7Ezsf6BtM9zsiAmdd4WgroAP5oHYU8V4JOvEwoxekVa321v2/L0U
 C7dm/gcfIYnCr0eDJkn3KQjQG/BPNZ8wBPnAJNVxoyvNWQuG9c++p9ekN
 uI8DBfFq0+xQnBGiGQR8qkfsgoYerFeNM7pOJUDxghJ+xXop9xP+wMqN2
 nLhK2SENPjoF48NpmojpL1mSfvIPgNkb/TM4jlCMKuz1jC8UVWE/lg61t
 obEZpwYpiP8f0zqdFeK10fF1ifAcM0R553wlDmAmZbSEiQLEaRjYQ2N7y
 bqqw3ZELBaEOPqy7HblKohLnpWPWxu2gRzNvR5HrqV9IvheY3LgdbywW/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="396801909"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="396801909"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 11:37:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="965294238"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="965294238"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga005.fm.intel.com with SMTP; 07 Nov 2022 11:37:09 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 07 Nov 2022 21:37:08 +0200
Date: Mon, 7 Nov 2022 21:37:08 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [RFC PATCH 0/3] Support for Solid Fill Planes
Message-ID: <Y2leZDfLj/5963wl@intel.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221028225952.160-1-quic_jesszhan@quicinc.com>
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
Cc: daniel.vetter@ffwll.ch, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote:
> Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
> properties. When the color fill value is set, and the framebuffer is set
> to NULL, memory fetch will be disabled.

Thinking a bit more universally I wonder if there should be
some kind of enum property:

enum plane_pixel_source {
	FB,
	COLOR,
	LIVE_FOO,
	LIVE_BAR,
	...
}

> In addition, loosen the NULL FB checks within the atomic commit callstack
> to allow a NULL FB when color_fill is nonzero and add FB checks in
> methods where the FB was previously assumed to be non-NULL.
> 
> Finally, have the DPU driver use drm_plane_state.color_fill and
> drm_plane_state.color_fill_format instead of dpu_plane_state.color_fill,
> and add extra checks in the DPU atomic commit callstack to account for a
> NULL FB in cases where color_fill is set.
> 
> Some drivers support hardware that have optimizations for solid fill
> planes. This series aims to expose these capabilities to userspace as
> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> hardware composer HAL) that can be set by apps like the Android Gears
> app.
> 
> Userspace can set the color_fill value by setting COLOR_FILL_FORMAT to a
> DRM format, setting COLOR_FILL to a color fill value, and setting the
> framebuffer to NULL.

Is there some real reason for the format property? Ie. why not 
just do what was the plan for the crttc background color and
specify the color in full 16bpc format and just pick as many
msbs from that as the hw can use?

> 
> Jessica Zhang (3):
>   drm: Introduce color fill properties for drm plane
>   drm: Adjust atomic checks for solid fill color
>   drm/msm/dpu: Use color_fill property for DPU planes
> 
>  drivers/gpu/drm/drm_atomic.c              | 68 ++++++++++++-----------
>  drivers/gpu/drm/drm_atomic_helper.c       | 34 +++++++-----
>  drivers/gpu/drm/drm_atomic_uapi.c         |  8 +++
>  drivers/gpu/drm/drm_blend.c               | 38 +++++++++++++
>  drivers/gpu/drm/drm_plane.c               |  8 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 66 ++++++++++++++--------
>  include/drm/drm_atomic_helper.h           |  5 +-
>  include/drm/drm_blend.h                   |  2 +
>  include/drm/drm_plane.h                   | 28 ++++++++++
>  10 files changed, 188 insertions(+), 76 deletions(-)
> 
> -- 
> 2.38.0

-- 
Ville Syrjälä
Intel
