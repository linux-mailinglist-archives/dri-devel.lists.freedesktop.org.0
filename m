Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E61063A2E3A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 16:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBB86E3DF;
	Thu, 10 Jun 2021 14:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9B46E3DF;
 Thu, 10 Jun 2021 14:30:18 +0000 (UTC)
IronPort-SDR: 4HL1JWuFaFgmAz/x4ytBsiBIyJLn8z48uj8jmrknfDy+Hs056qzGbVC7Ip1zeELvxauaoFkVhp
 RYSeCj8kKiMQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="205268239"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="205268239"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 07:29:57 -0700
IronPort-SDR: CqbxeVTzHSnV4mW82zmiqTzAQw4SyA7B/76zpUXzQnUE6QC1QDpmbU9GAm7vCNgeujLfxXY/iE
 sK0JzxoJquPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="441234105"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 10 Jun 2021 07:29:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Jun 2021 17:29:52 +0300
Date: Thu, 10 Jun 2021 17:29:52 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH 4/4] drm/i915/display: Add handling for new "active bpc"
 property
Message-ID: <YMIh4G1CY8EYVEuI@intel.com>
References: <20210604171723.10276-1-wse@tuxedocomputers.com>
 <20210604171723.10276-5-wse@tuxedocomputers.com>
 <YLpjTMegcjT22vQE@intel.com>
 <bd6a27e7-3ae5-ecb1-2fef-e5f8c1b6a2ac@tuxedocomputers.com>
 <96d10ed0-f8a2-1d0b-62dd-9d6173722506@tuxedocomputers.com>
 <210b4108-74a7-bf42-eab8-b98239ce3f1a@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <210b4108-74a7-bf42-eab8-b98239ce3f1a@tuxedocomputers.com>
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, rodrigo.vivi@intel.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 08, 2021 at 07:19:31PM +0200, Werner Sembach wrote:
> 
> Am 07.06.21 um 22:33 schrieb Werner Sembach:
> > Am 07.06.21 um 08:47 schrieb Werner Sembach:
> >>
> >> Am 04.06.21 um 19:30 schrieb Ville Syrjälä:
> >>> On Fri, Jun 04, 2021 at 07:17:23PM +0200, Werner Sembach wrote:
> >>>> This commits implements the "active bpc" drm property for the Intel 
> >>>> GPU driver.
> >>>>
> >>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> >>>> ---
> >>>>   drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
> >>>>   drivers/gpu/drm/i915/display/intel_dp.c      |  8 ++++++--
> >>>>   drivers/gpu/drm/i915/display/intel_dp_mst.c  |  4 +++-
> >>>>   drivers/gpu/drm/i915/display/intel_hdmi.c    |  4 +++-
> >>>>   4 files changed, 25 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c 
> >>>> b/drivers/gpu/drm/i915/display/intel_display.c
> >>>> index 64e9107d70f7..f7898d9d7438 100644
> >>>> --- a/drivers/gpu/drm/i915/display/intel_display.c
> >>>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> >>>> @@ -10164,6 +10164,8 @@ static void intel_atomic_commit_tail(struct 
> >>>> intel_atomic_state *state)
> >>>>       struct drm_i915_private *dev_priv = to_i915(dev);
> >>>>       struct intel_crtc_state *new_crtc_state, *old_crtc_state;
> >>>>       struct intel_crtc *crtc;
> >>>> +    struct drm_connector *connector;
> >>>> +    struct drm_connector_state *new_conn_state;
> >>>>       u64 put_domains[I915_MAX_PIPES] = {};
> >>>>       intel_wakeref_t wakeref = 0;
> >>>>       int i;
> >>>> @@ -10324,6 +10326,17 @@ static void 
> >>>> intel_atomic_commit_tail(struct intel_atomic_state *state)
> >>>>       }
> >>>>       intel_runtime_pm_put(&dev_priv->runtime_pm, state->wakeref);
> >>>>   +    /* Extract information from crtc to communicate it to 
> >>>> userspace as connector properties */
> >>>> +    for_each_new_connector_in_state(&state->base, connector, 
> >>>> new_conn_state, i) {
> >>>> +        struct drm_crtc *crtc = new_conn_state->crtc;
> >>>> +        if (crtc) {
> >>>> +            new_crtc_state = 
> >>>> to_intel_crtc_state(drm_atomic_get_new_crtc_state(&state->base, 
> >>>> crtc));
> >>> intel_atomic_get_new_crtc_state()
> >> Thanks, will use that.
> >>>
> >>>> + new_conn_state->active_bpc = new_crtc_state->pipe_bpp / 3;
> >>>> +        }
> >>>> +        else
> >>>> +            new_conn_state->active_bpc = 0;
> >>>> +    }
> >>> This also seems too late. I think the whole thing should be
> >>> done somewhere around the normal swap_state() stuff.
> >> Ok, will look into it.
> > So I tried to put it in intel_atomic_commit() after 
> > drm_atomic_helper_swap_state() and before 
> > INIT_WORK(&state->base.commit_work, intel_atomic_commit_work) (which 
> > creates a worker for intel_atomic_commit_tail), but somewhere in 
> > between, the connector_state seems to change: The bpc written with the 
> > for_each_new_connector_in_state() loop, gets discarded.
> 
> This was not the problem. Setting the drm property immutable made it 
> (also?) immutable from the driver context, which I didn't test separately.
> 
> Removed the immutable again and moved the loop.

Immutable props are special. See __drm_object_property_get_value().

-- 
Ville Syrjälä
Intel
