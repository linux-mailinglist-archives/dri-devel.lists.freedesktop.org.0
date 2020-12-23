Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C92F72E1EED
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 16:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB8C6E128;
	Wed, 23 Dec 2020 15:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F051A6E128;
 Wed, 23 Dec 2020 15:53:21 +0000 (UTC)
IronPort-SDR: rRKd3KtAg1b6DQepbKNMBMl2+3OvkIMpwv8gTRcKZQKNKzQPI6iERmLkjIwHxhL/hs3G3AVeKi
 0beM7MOu7pTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9844"; a="176178969"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="176178969"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 07:53:20 -0800
IronPort-SDR: LcfTWhSxhk8EdsCtrv5srFHUgfO6xDzFpzVWsgv+BXMZvxZ/XcJ1BW5E8GfW0ZEDsReAm/JJYN
 4ZiFUPCGG0Mw==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="374038616"
Received: from odonov3x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.250.144])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 07:53:18 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/9] drm/i915: Add support for Intel's eDP backlight
 controls
In-Reply-To: <20201204223603.249878-1-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201204223603.249878-1-lyude@redhat.com>
Date: Wed, 23 Dec 2020 17:53:15 +0200
Message-ID: <874kkco6xg.fsf@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Dec 2020, Lyude Paul <lyude@redhat.com> wrote:
> A while ago we ran into issues while trying to enable the eDP backlight
> control interface as defined by VESA, in order to make the DPCD
> backlight controls on newer laptop panels work. The issue ended up being
> much more complicated however, as we also apparently needed to add
> support for an Intel-specific DPCD backlight control interface as the
> VESA interface is broken on many laptop panels. For lack of a better
> name, we just call this the Intel HDR backlight interface.
>
> While this only adds support for the SDR backlight mode (I think), this
> will fix a lot of user's laptop panels that we weren't able to properly
> automatically detect DPCD backlight controls on previously.
>
> Series-wide changes in v3:
> * Pass down brightness values to enable/disable backlight callbacks in a
>   separate patch
> * Rebase
>
> Lyude Paul (9):
>   drm/i915/dp: Program source OUI on eDP panels
>   drm/i915: Rename pwm_* backlight callbacks to ext_pwm_*
>   drm/i915: Pass down brightness values to enable/disable backlight
>     callbacks
>   drm/i915/dp: Rename eDP VESA backlight interface functions
>   drm/i915/dp: Add register definitions for Intel HDR backlight
>     interface

Pushed the above patches to din to move things forward, thanks for the
patches.

Still looking at the below.

BR,
Jani.


>   drm/i915: Keep track of pwm-related backlight hooks separately
>   drm/i915/dp: Enable Intel's HDR backlight interface (only SDR for now)
>   drm/i915/dp: Allow forcing specific interfaces through
>     enable_dpcd_backlight
>   drm/dp: Revert "drm/dp: Introduce EDID-based quirks"
>
>  drivers/gpu/drm/drm_dp_helper.c               |  83 +---
>  drivers/gpu/drm/drm_dp_mst_topology.c         |   3 +-
>  .../drm/i915/display/intel_display_types.h    |  18 +-
>  drivers/gpu/drm/i915/display/intel_dp.c       |  42 +-
>  .../drm/i915/display/intel_dp_aux_backlight.c | 394 +++++++++++++---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   3 +-
>  .../i915/display/intel_dsi_dcs_backlight.c    |   7 +-
>  drivers/gpu/drm/i915/display/intel_panel.c    | 435 ++++++++++--------
>  drivers/gpu/drm/i915/display/intel_panel.h    |   4 +
>  drivers/gpu/drm/i915/display/intel_psr.c      |   2 +-
>  drivers/gpu/drm/i915/i915_params.c            |   2 +-
>  include/drm/drm_dp_helper.h                   |  21 +-
>  12 files changed, 655 insertions(+), 359 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
