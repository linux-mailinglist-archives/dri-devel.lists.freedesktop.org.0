Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD9A605B12
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 11:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C84310E509;
	Thu, 20 Oct 2022 09:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A4D10E509;
 Thu, 20 Oct 2022 09:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666257916; x=1697793916;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YtbstwztZn175mOQf8JVm1NZbgkpB72bmnUHfJwpMTs=;
 b=knHDOXXQCnFn/jh5P/vtoKNyxrQch7nhNNpyAiGxDdvy7OtIKI4/Y51g
 OuCj13i63fwSyyLND1/p4d/lmWym9z8out7vxWS6v45S9vVVsrhmZaA8F
 5VN4RtL1r/0l+wF6Y24kih3fpnZsm5epm3nl16HYB2z26d/huOsvNHDWb
 goBIKiPFD00FQxe1WZRJ4FaCHaiwBEhuuiFQYq6hbSut8adSeJFHjd0F0
 xqJF3QZb8hH6xSVU0KBk503qXBiCy0jSkoh92hdof562jI8ahYj1Q335C
 OjI8nxEv8azZgFFDKHtT75rGliMIIqrAEkhxZ7ip5JcJdUhv0APN+Yylu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="286379071"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="286379071"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 02:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="692872651"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="692872651"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga008.fm.intel.com with SMTP; 20 Oct 2022 02:25:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 20 Oct 2022 12:25:06 +0300
Date: Thu, 20 Oct 2022 12:25:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH 01/15] drm/i915/hdmi: do dual mode detect
 only if connected
Message-ID: <Y1ET8qxKaOYN54LM@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
 <20fb913a93c60fd24fc51b441ccea7bc75e82dd1.1665496046.git.jani.nikula@intel.com>
 <Y0hb0VOaYZk5TptS@intel.com> <Y0hmBn6NrUrBexyY@intel.com>
 <Y1BOx7oVQHPgoVzE@intel.com> <87edv2hnz1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87edv2hnz1.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 11:57:06AM +0300, Jani Nikula wrote:
> On Wed, 19 Oct 2022, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Thu, Oct 13, 2022 at 10:24:54PM +0300, Ville Syrjälä wrote:
> >> On Thu, Oct 13, 2022 at 09:41:21PM +0300, Ville Syrjälä wrote:
> >> > On Tue, Oct 11, 2022 at 04:49:35PM +0300, Jani Nikula wrote:
> >> > > -	intel_hdmi_dp_dual_mode_detect(connector, edid != NULL);
> >> > > -
> >> > > -	intel_display_power_put(dev_priv, POWER_DOMAIN_GMBUS, wakeref);
> >> > > -
> >> > >  	to_intel_connector(connector)->detect_edid = edid;
> >> > >  	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
> >> > 
> >> > We didn't have this digital input thing before. What happens with
> >> > HDMI->VGA dongles for example?
> >> > 
> >> > Hmm. This whole thing might already be broken on those. I suspect
> >> > I've only used my HDMI->VGA dongle on LSPCON machines, so never
> >> > noticed this. Need to go plug that thing into a native HDMI port...
> >> 
> >> Except I must have left it elsewhere since I can't find it here.
> >> So can't test right now unfortunately.
> >> 
> >> I first thought this digital check thing might be due to
> >> the DVI-I shenanigans in intel_crt_detect_ddc(), but that
> >> was added for am unspecified gen2 machine in commit f5afcd3dd0dc
> >> ("drm/i915/crt: Check for a analog monitor in case of DVI-I")
> >> so not even relevant here. And I don't think I've ever seen
> >> a g4x+ machine with an actual DVI-I port.
> >
> > Good news everyone, I found such a board: Intel DG43GT.
> > Well, I didn't physically find one but I found the manual
> > online. And some coreboot repo even had the vbt handily
> > available. And yes, it does show the same DDC pins being
> > used for the DVI-D port and CRT port. So I guess given
> > that these digital checks do make some sense.
> 
> So what's the conclusion wrt the patch at hand?

Seems fine as is for the moment. We'll know more once I locate
my dongle again.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

-- 
Ville Syrjälä
Intel
