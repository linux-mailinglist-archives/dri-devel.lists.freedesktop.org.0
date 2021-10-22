Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB9643764E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 14:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E516E5CE;
	Fri, 22 Oct 2021 12:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C213C6E5CE;
 Fri, 22 Oct 2021 12:02:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="229156764"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="229156764"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 05:02:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="464025771"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 22 Oct 2021 05:01:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Oct 2021 15:01:52 +0300
Date: Fri, 22 Oct 2021 15:01:52 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Claudio Suarez <cssk@net-c.es>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 13/13] drm/i915: replace drm_detect_hdmi_monitor()
 with drm_display_info.is_hdmi
Message-ID: <YXKoMEF/gU98cL9n@intel.com>
References: <20211016184226.3862-1-cssk@net-c.es>
 <20211016184226.3862-14-cssk@net-c.es> <YW8QYsmkm3ZrBAx3@intel.com>
 <YW9L6d7e+RO29VJu@gineta.localdomain> <YXFwB7rN4bvR0Z+m@intel.com>
 <YXKRnUHWuboQKBF1@zorro.micasa>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YXKRnUHWuboQKBF1@zorro.micasa>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 22, 2021 at 12:25:33PM +0200, Claudio Suarez wrote:
> On Thu, Oct 21, 2021 at 04:49:59PM +0300, Ville Syrjälä wrote:
> > On Wed, Oct 20, 2021 at 12:51:21AM +0200, Claudio Suarez wrote:
> > > drm_get_edid() internally calls to drm_connector_update_edid_property()
> > > and then drm_add_display_info(), which parses the EDID.
> > > This happens in the function intel_hdmi_set_edid() and
> > > intel_sdvo_tmds_sink_detect() (via intel_sdvo_get_edid()).
> > > 
> > > Once EDID is parsed, the monitor HDMI support information is available
> > > through drm_display_info.is_hdmi. Retriving the same information with
> > > drm_detect_hdmi_monitor() is less efficient. Change to
> > > drm_display_info.is_hdmi
> > 
> > I meant we need to examine all call chains that can lead to
> > .detect() to make sure all of them do in fact update the
> > display_info beforehand.
> 
> Well, I studied it carefully and, yes, all call chains that can lead to
> drm_display_info.is_hdmi / drm_detect_hdmi_monitor() update display_info
> beforehand. In the case that this doesn't happen, the code is unchanged.
> 
> Do you want I explain the changes in the code here again ? Or do you want
> to me change the commit message to be more clear ? In the first case, I can
> write here a detailed explanation. In the second case I can make a longer commit
> message.
> 
> Or both?

I want all those call chains explained in the commit message,
otherwise I have no easy way to confirm whether the change
is correct or not.

-- 
Ville Syrjälä
Intel
