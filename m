Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3435129EDB2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 14:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87FC6E8B3;
	Thu, 29 Oct 2020 13:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A44C6E8B3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 13:55:41 +0000 (UTC)
IronPort-SDR: riKGOzQjMcu3CL2/HBNNM72ZyNeOfU6iH2UD5Dmme9QT002Sknh9wSC2o5i4FOnPZdoIjijKzV
 HX9a+HuE4WQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="147715012"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="147715012"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 06:55:40 -0700
IronPort-SDR: Du3X9t6xagkPsN2/Sv5B+bivqyTTsCAT/vWsvdJNaQKJcrlFFNdLoVsoajmAGWIkci9JyN/rvt
 kne/E2suFL5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="350972042"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 29 Oct 2020 06:55:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 29 Oct 2020 15:55:37 +0200
Date: Thu, 29 Oct 2020 15:55:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/2] drm/atomic: Pass the full state to CRTC atomic begin
 and flush
Message-ID: <20201029135537.GB6112@intel.com>
References: <20201028123222.1732139-1-maxime@cerno.tech>
 <20201028123222.1732139-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201028123222.1732139-2-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 28, 2020 at 01:32:22PM +0100, Maxime Ripard wrote:
> The current atomic helpers have either their object state being passed as
> an argument or the full atomic state.
> =

> The former is the pattern that was done at first, before switching to the
> latter for new hooks or when it was needed.
> =

> Let's start convert all the remaining helpers to provide a consistent
> interface, starting with the CRTC's atomic_begin and atomic_flush.
> =

> The conversion was done using the coccinelle script below, built tested on
> all the drivers and actually tested on vc4.
> =

<snip>
> @@ -323,26 +323,27 @@ static void ingenic_drm_crtc_atomic_begin(struct dr=
m_crtc *crtc,
>  }
>  =

>  static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> -					  struct drm_crtc_state *oldstate)
> +					  struct drm_atomic_state *state)
>  {
>  	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
> -	struct drm_crtc_state *state =3D crtc->state;
> -	struct drm_pending_vblank_event *event =3D state->event;
> +	struct drm_crtc_state *crtc_state =3D crtc->state;

Looks like quite a few places could use a followup to
switch to get_{old,new}_crtc_state().

Patch lgtm
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
