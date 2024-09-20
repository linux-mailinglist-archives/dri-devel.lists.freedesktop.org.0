Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922E397D49E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 13:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DBB10E06F;
	Fri, 20 Sep 2024 11:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQoslblg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D9C10E06F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 11:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726830930; x=1758366930;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PMJuszb6NEIe8aTmWmpq9SImQmbXDJNYCQ+VXXofyP4=;
 b=EQoslblgbKbk58PvvW9QafdF0kFaASEXp+jCorjqiUIeEfVAjJqHM84q
 YTHHTF3UOzne7SFtYNrzu63D7qNfDEYUENO/q2kUuTfxLVZDV49uWXx8d
 /YwP8YnIL8ZYzD/cPz+0LT5cAMlANgQ/kcTFIJEHTSy20wvJCcZxFLluS
 Y10ryx/+HJA8bWbTcm0GEzx8F73pMR0NV0foEegzmxwfcBzOdsux30K9h
 q1UqMyvF1lWRa8m2d6KS4jFKOX7YHwDg6f3FV8RkwcmilJAQR/1uK74Xn
 PDlO+JF7x+obPRpXgdWlsogsRMEYHEq1n9QTeyBS8HbGmymzXPPaxP8Hj A==;
X-CSE-ConnectionGUID: CWfMJUo8Q8uHy0Nua8iWoQ==
X-CSE-MsgGUID: mLi/9ucKSnm7UryawFjdKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25311226"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="25311226"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 04:15:30 -0700
X-CSE-ConnectionGUID: 0Mi517sFR7y6r4i2CgfIvg==
X-CSE-MsgGUID: qRI4xGHKSbWHBN54th8Eig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70396646"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 20 Sep 2024 04:15:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 20 Sep 2024 14:15:27 +0300
Date: Fri, 20 Sep 2024 14:15:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Vidith Madhu <vmadhu@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: Changes to `vrr_enabled` property
Message-ID: <Zu1ZTxVhjD3hmLHt@intel.com>
References: <dd6a9d79-8a90-89c7-86de-47548a397a9@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd6a9d79-8a90-89c7-86de-47548a397a9@nvidia.com>
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

On Thu, Sep 19, 2024 at 01:14:03PM -0500, Vidith Madhu wrote:
> Hi all,
> I'd like to discuss a potential opportunity to enhance the `vrr_enabled` property of `drm_crtc_state`. Currently, this property is a Boolean flag, but this exposes some ambiguity and potential disconnect between client and driver/display behavior. Namely, it's unclear to the client whether it must allow a modeset for changes to `vrr_enabled`. I understand that the DP spec mandates seamless VRR transitions, but there is no such requirement for HDMI. Therefore, it is possible for clients to toggle `vrr_enabled` without setting `allow_modeset`, when in fact the display requires a modeset and/or display blanking. There are multiple ways this might be handled, each of which has flaws:
> 
> 1. The driver proceeds with a modeset/blanking transition anyways, if the display requires it. As I understand, this is how amdgpu and i915 work [1, 2]. This is a problem because any Wayland compositor that has the "Automatic" option for VRR may transition in and out at unexpected moments, causing disruptive blanking effects.

i915 does not need a full modeset to toggle VRR. 
Originally we did, but no more.

> 
> 2. The driver initially forces all VRR-capable displays into VRR mode, and controls whether the refresh rate is fixed or variable on-the-fly. This is a problem because many displays have features like ULMB, motion interpolation, black frame insertion, etc.  that are unavailable when the display is in VRR mode. This is how the NVIDIA driver currently handles the situation; there have been user complaints about this [3].

Currently i915 always puts the display into "VRR mode"
(ie. just sets the "ignore MSA timings" bit in DPCD), but
I think we could change that to be set only VRR is actually
enabled (if displays are actually using that as an indication
to disable random features, which might not even be what [3]
is saying because it talks about g-sync and not vrr).

Still shouldn't require a full modeset IIRC. Though I haven't
checked what implications this would have for the adaptive sync
SDP.

No idea what HDMI VRR toggling would entail.

> 
> 3. The driver rejects the request. This is a uAPI violation, as currently `allow_modeset` is not required for changes to `vrr_enabled`.

The uapi does not specify that AFAIK.

IIRC I told the kwin people that they shouldn't depend on being able
to toggle VRR without a modeset but IIRC they said something along
the lines of "it's too hard to enable VRR already when lighting up
the display", hence you couldn't use i915+VRR+kwin until we
eliminated the full modeset from the driver.

> 
> I would suggest the following approach: Make `vrr_enabled` an enum of {TRUE, INACTIVE, FALSE}. FALSE would shut off VRR on the display (potentially with a modeset), and TRUE/INACTIVE would turn it on (again, potentially with modeset). INACTIVE would have the driver lock a fixed refresh rate while keeping VRR enabled on display. Transitioning between (TRUE/INACTIVE) and (FALSE) on any CRTC would require `allow_modeset` in `drm_atomic_state` to be set, else the request will fail. In addition, it would be the driver's responsibility to implement the distinction between TRUE and INACTIVE. With this change, clients are forced to declare their intentions clearly, and driver-side ambiguity is eliminated.

You would need to introduce a new property instead of breaking
the old one. Dunno if this would help kwin at all though, if
they couldn't set the current property at modeset time then
not sure how they could set the new property either. Shrug.

>  
> I would appreciate any feedback or discussion about this.
> 
> References:
> 1. https://gitlab.freedesktop.org/drm/amd/-/issues/2200#note_2160244
> 2. https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7542#note_1643183
> 3. https://forums.developer.nvidia.com/t/cant-enable-ulmb-2-on-wayland/277478
> 
> Thanks,
> Vidith

-- 
Ville Syrjälä
Intel
