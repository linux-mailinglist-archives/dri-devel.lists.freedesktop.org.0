Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1157A43BC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 10:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8867B10E198;
	Mon, 18 Sep 2023 08:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2520610E198;
 Mon, 18 Sep 2023 08:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695024030; x=1726560030;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tsAgitR9y5fKKxQCAVG/LWTl79CBzZ1RhuN4SOIjgrQ=;
 b=NIyADV6Cryv1r1iPNeuHSJXwh9e/CUO+whhzuauWP0lSr7N6wpvcRHZY
 MSz/ffsnGJIjQfOQFwUGBq7BZTUVugkXZwg0IMgfh7+oJUEnJMdPVUkgd
 yvyAkMvvkyzc2VKe0Y+UhZ83Xf4aiU0os0RRVg+RWB5KfB/VG97Sd3A5K
 L5cGoOSthr8tBta4mvZ5s+rhSz75V0Ea4IejEnd/eeDSjqy7D2Rh08dlv
 oIlTA60v4m7vEIpeFeQfg2gkIV/eqB2GucR/Ci8j9N99K7RHv2DspdIa4
 k0NGfkLy1O9UlOU6a6nwZOD1+1e+6roRaXCzZfydTpDJvhri2Xiey9cWd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="465939406"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="465939406"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 01:00:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="888936902"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="888936902"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by fmsmga001.fm.intel.com with SMTP; 18 Sep 2023 00:59:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 18 Sep 2023 11:00:25 +0300
Date: Mon, 18 Sep 2023 11:00:25 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 0/4] drm/i915/vlv_dsi: Add quirks for x86 android tablets
 (v2)
Message-ID: <ZQgDmTO0PxvO0lhX@intel.com>
References: <20230916125455.237325-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230916125455.237325-1-hdegoede@redhat.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 16, 2023 at 02:54:51PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Some vlv/chv tablets ship with Android as factory OS. The factory OS
> BSP style kernel on these tablets does not use the normal x86 hw
> autodetection instead it hardcodes a whole bunch of things including
> using panel drivers instead of relying on VBT MIPI sequences to
> turn the panel/backlight on/off.
> 
> The normal i915 driver (which does not use panel drivers) mostly works
> since the VBT still needs to contain valid info for the GOP, but because
> of the Android kernel relying on panel drivers with various things
> hardcoded some DMI quirks are necessary to fix some issues on these
> devices.
> 
> Some of these issues also are related to which I2C bus to use for
> MIPI sequence elements which do I2C transfers. This series also
> includes a patch adding some extra debugging to mipi_exec_i2c() to
> help with debugging similar issues in the future.
> 
> These patches have been posted before but back then I did not get around
> to follow up on the series:
> https://lore.kernel.org/intel-gfx/20220225214934.383168-1-hdegoede@redhat.com/
> 
> Changes compared to this old version:
> - Drop the changes how the I2C bus number is found, instead just have
>   the quirks set the right number directly where necessary. This should
>   avoid any chances of causing regressions on devices where the quirks
>   do not apply.
> 
> - New quirk for backlight control issues on Lenovo Yoga Tab 3
> 
> - Address Jani Nikula's remark about __func__ being redundant when using
>   drm_dbg_kms()
> 
> 
> Regards,
> 
> Hans
> 
> 
> 
> Hans de Goede (4):
>   drm/i915/vlv_dsi: Add DMI quirk for wrong panel modeline in BIOS on
>     Asus TF103C (v2)
>   drm/i915/vlv_dsi: Add DMI quirk for wrong I2C bus and panel size on
>     Lenovo Yoga Tablet 2 series (v2)
>   drm/i915/vlv_dsi: Add DMI quirk for backlight control issues on Lenovo
>     Yoga Tab 3

Please file a bug for each of these and attach the usual drm.debug=0xe
dmesg + VBT + any other relevant information there. Otherwise a few
years from now I'll be cursing at these commits as well for not leaving
a decent papertrail...

>   drm/i915/dsi: Add some debug logging to mipi_exec_i2c (v2)
> 
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c |   3 +
>  drivers/gpu/drm/i915/display/vlv_dsi.c       | 124 +++++++++++++++++++
>  2 files changed, 127 insertions(+)
> 
> -- 
> 2.41.0

-- 
Ville Syrjälä
Intel
