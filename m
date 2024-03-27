Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C88A88E6E9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 15:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7E710FD53;
	Wed, 27 Mar 2024 14:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOWDf7Hc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF9710FD47;
 Wed, 27 Mar 2024 14:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711550748; x=1743086748;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/5qiKqaCyR7pBgTHGy2VTXfxVqpS4C0C0Xowhm0+RYE=;
 b=XOWDf7Hcjt4J8evUlE0xJJ9zlddUMgAzL6fkYZ/3PLayhTjXxkVktQAu
 pZ/2Vrg8Mz5NxakO3BsyWjtI9jgU+sZ+XNPsdJi5+dGsbCkbdXTgYMwTH
 0tI4lwIokJyk6R1hO8RjooxQ7TaJGJCvhcxOd5Z1AD1YkJN+OLCalx3Sh
 b9JfrmLcpZDRYkm2C4qnDm3XqO8lsw2yCN3R3g82uA3yoH5QfUXAV+d58
 vPZNh+Hn9QbdsInN49M5xCV02ZLYDmMNaXGr3SCZ/tvlmCDRNDzcwmZmK
 SY2nE3fkjWJidzLX66JwgZaXWvbbYRepOTPLyk11lTt+x6Z64fvzwIjxM A==;
X-CSE-ConnectionGUID: bS74WkRwSrq7nQ8IJZCkCQ==
X-CSE-MsgGUID: gTeoLAmPTtScVdj2fud3Wg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6843477"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="6843477"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 07:45:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="20965502"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 07:45:45 -0700
Date: Wed, 27 Mar 2024 16:46:14 +0200
From: Imre Deak <imre.deak@intel.com>
To: Manasi Navare <navaremanasi@chromium.org>
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 01/11] drm/i915/dp: Fix DSC line buffer depth programming
Message-ID: <ZgQxNqTm/7KllNni@ideak-desk.fi.intel.com>
References: <20240320201152.3487892-1-imre.deak@intel.com>
 <20240320201152.3487892-2-imre.deak@intel.com>
 <2a35ee1b-4ef4-49e2-a481-d6929e522f16@intel.com>
 <CAE72mNmxJ9Fj8z=4RBZt1xAorN8KWtSfUNXy8VPgT7GcQ6WdRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE72mNmxJ9Fj8z=4RBZt1xAorN8KWtSfUNXy8VPgT7GcQ6WdRQ@mail.gmail.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 26, 2024 at 12:50:17PM -0700, Manasi Navare wrote:
Hi,

> Hi Imre,
> 
> Thanks for the DSC fixes.
>
> Would the line buf depth calculation that was getting set to 0 impact
> DSC on all platforms or was this issue only specific to MTL and was
> getting set correctly with older platforms?

Only those configs are affected where both the source and the sink supports
DSC1.2, so ADL is not affected.

> We didnt notice any DSC issues/corruptions with ADL based systems.

Yes, that makes sense.

> The actual change makes sense, just want to confirm if this applies to
> all platforms or any particular?

The change will make a difference only on MTL+.

> With that clarification:
> 
> Reviewed-by: Manasi Navare <navaremanasi@chromium.org>

Thanks.

> Regards
> Manasi
> 
> On Tue, Mar 26, 2024 at 3:01 AM Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com> wrote:
> >
> >
> > On 3/21/2024 1:41 AM, Imre Deak wrote:
> > > Fix the calculation of the DSC line buffer depth. This is limited both
> > > by the source's and sink's maximum line buffer depth, but the former one
> > > was not taken into account. On all Intel platform's the source's maximum
> > > buffer depth is 13, so the overall limit is simply the minimum of the
> > > source/sink's limit, regardless of the DSC version.
> > >
> > > This leaves the DSI DSC line buffer depth calculation as-is, trusting
> > > VBT.
> > >
> > > On DSC version 1.2 for sinks reporting a maximum line buffer depth of 16
> > > the line buffer depth was incorrectly programmed as 0, leading to a
> > > corruption in color gradients / lines on the decompressed screen image.
> > >
> > > Cc: dri-devel@lists.freedesktop.org
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> >
> > LGTM.
> >
> > Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >
> > > ---
> > >   drivers/gpu/drm/i915/display/intel_dp.c | 16 ++++++----------
> > >   include/drm/display/drm_dsc.h           |  3 ---
> > >   2 files changed, 6 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > > index af7ca00e9bc0a..dbe65651bf277 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > @@ -89,6 +89,9 @@
> > >   #define DP_DSC_MAX_ENC_THROUGHPUT_0         340000
> > >   #define DP_DSC_MAX_ENC_THROUGHPUT_1         400000
> > >
> > > +/* Max DSC line buffer depth supported by HW. */
> > > +#define INTEL_DP_DSC_MAX_LINE_BUF_DEPTH              13
> > > +
> > >   /* DP DSC FEC Overhead factor in ppm = 1/(0.972261) = 1.028530 */
> > >   #define DP_DSC_FEC_OVERHEAD_FACTOR          1028530
> > >
> > > @@ -1703,7 +1706,6 @@ static int intel_dp_dsc_compute_params(const struct intel_connector *connector,
> > >   {
> > >       struct drm_i915_private *i915 = to_i915(connector->base.dev);
> > >       struct drm_dsc_config *vdsc_cfg = &crtc_state->dsc.config;
> > > -     u8 line_buf_depth;
> > >       int ret;
> > >
> > >       /*
> > > @@ -1732,20 +1734,14 @@ static int intel_dp_dsc_compute_params(const struct intel_connector *connector,
> > >                       connector->dp.dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT] &
> > >                       DP_DSC_RGB;
> > >
> > > -     line_buf_depth = drm_dp_dsc_sink_line_buf_depth(connector->dp.dsc_dpcd);
> > > -     if (!line_buf_depth) {
> > > +     vdsc_cfg->line_buf_depth = min(INTEL_DP_DSC_MAX_LINE_BUF_DEPTH,
> > > +                                    drm_dp_dsc_sink_line_buf_depth(connector->dp.dsc_dpcd));
> > > +     if (!vdsc_cfg->line_buf_depth) {
> > >               drm_dbg_kms(&i915->drm,
> > >                           "DSC Sink Line Buffer Depth invalid\n");
> > >               return -EINVAL;
> > >       }
> > >
> > > -     if (vdsc_cfg->dsc_version_minor == 2)
> > > -             vdsc_cfg->line_buf_depth = (line_buf_depth == DSC_1_2_MAX_LINEBUF_DEPTH_BITS) ?
> > > -                     DSC_1_2_MAX_LINEBUF_DEPTH_VAL : line_buf_depth;
> > > -     else
> > > -             vdsc_cfg->line_buf_depth = (line_buf_depth > DSC_1_1_MAX_LINEBUF_DEPTH_BITS) ?
> > > -                     DSC_1_1_MAX_LINEBUF_DEPTH_BITS : line_buf_depth;
> > > -
> > >       vdsc_cfg->block_pred_enable =
> > >               connector->dp.dsc_dpcd[DP_DSC_BLK_PREDICTION_SUPPORT - DP_DSC_SUPPORT] &
> > >               DP_DSC_BLK_PREDICTION_IS_SUPPORTED;
> > > diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_dsc.h
> > > index bc90273d06a62..bbbe7438473d3 100644
> > > --- a/include/drm/display/drm_dsc.h
> > > +++ b/include/drm/display/drm_dsc.h
> > > @@ -40,9 +40,6 @@
> > >   #define DSC_PPS_RC_RANGE_MINQP_SHIFT                11
> > >   #define DSC_PPS_RC_RANGE_MAXQP_SHIFT                6
> > >   #define DSC_PPS_NATIVE_420_SHIFT            1
> > > -#define DSC_1_2_MAX_LINEBUF_DEPTH_BITS               16
> > > -#define DSC_1_2_MAX_LINEBUF_DEPTH_VAL                0
> > > -#define DSC_1_1_MAX_LINEBUF_DEPTH_BITS               13
> > >
> > >   /**
> > >    * struct drm_dsc_rc_range_parameters - DSC Rate Control range parameters
