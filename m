Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0693913711E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 16:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFA66EA39;
	Fri, 10 Jan 2020 15:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74206EA34;
 Fri, 10 Jan 2020 15:26:05 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 07:26:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,417,1571727600"; d="scan'208";a="216694447"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 10 Jan 2020 07:25:56 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 Jan 2020 17:25:56 +0200
Date: Fri, 10 Jan 2020 17:25:56 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 03/23] drm/i915: Don't use struct
 drm_driver.get_scanout_position()
Message-ID: <20200110152556.GK13686@intel.com>
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-4-tzimmermann@suse.de>
 <87eew7o73u.fsf@intel.com>
 <761ae94c-aaf1-9167-9c44-06824304fdfd@suse.de>
 <875zhjo1op.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875zhjo1op.fsf@intel.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexandre.torgue@st.com, thellstrom@vmware.com, sean@poorly.run,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, sunpeng.li@amd.com,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com, vincent.abriou@st.com, mcoquelin.stm32@gmail.com,
 rodrigosiqueiramelo@gmail.com, philippe.cornu@st.com, yannick.fertre@st.com,
 Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 10, 2020 at 03:56:06PM +0200, Jani Nikula wrote:
> On Fri, 10 Jan 2020, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > Hi
> >
> > Am 10.01.20 um 12:59 schrieb Jani Nikula:
> >> On Fri, 10 Jan 2020, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>> The callback struct drm_driver.get_scanout_position() is deprecated in
> >>> favor of struct drm_crtc_helper_funcs.get_scanout_position().
> >>>
> >>> i915 doesn't use CRTC helpers. The patch duplicates the caller
> >>> drm_calc_vbltimestamp_from_scanoutpos() for i915, such that the callb=
ack
> >>> function is not needed.
> >>>
> >>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>> ---
> >>>  drivers/gpu/drm/i915/i915_drv.c |   3 +-
> >>>  drivers/gpu/drm/i915/i915_irq.c | 117 ++++++++++++++++++++++++++++++=
--
> >>>  drivers/gpu/drm/i915/i915_irq.h |   9 +--
> >>>  3 files changed, 119 insertions(+), 10 deletions(-)
> >> =

> >> Not really enthusiastic about the diffstat in a "cleanup" series.
> >
> > Well, the cleanup is about the content of drm_driver :)
> >
> >> =

> >> I wonder if you could add a generic helper version of
> >> drm_calc_vbltimestamp_from_scanoutpos where you pass the
> >> get_scanout_position function as a parameter. Both
> >> drm_calc_vbltimestamp_from_scanoutpos and the new
> >> i915_calc_vbltimestamp_from_scanoutpos would then be fairly thin
> >> wrappers passing in the relevant get_scanout_position function.
> >
> > Of course. Will be in v2 of the series.
> =

> Please give Ville (Cc'd) a moment before sending v2 in case he wants to
> chime in on this.

Passing the function pointer was one option I considered for this a while
back. Can't remeber what other solutions I condsidered. But I guess I
didn't like any of them enough to make an actual patch.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
