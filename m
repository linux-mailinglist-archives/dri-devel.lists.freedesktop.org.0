Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FEA605A58
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 10:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701BE10E5C9;
	Thu, 20 Oct 2022 08:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F77110E58E;
 Thu, 20 Oct 2022 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666256231; x=1697792231;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=EdtSg1WK4ANdomtziiahTdQ6y5cQf8LE9lU61vZDH3g=;
 b=WRbjipVrsByr7gqjFEc4PuzIpDxj5bKjxxhBSQMsQcp91qSR5p9vyWyg
 dMe1ENyKSI2FQ5mjHdToW5eBuTink5Wlvm7KYIJaPaEwTZLPVTIUzHbNN
 Ehd2E8yS3iU6f3fScnXCK3XZnE7yximk1ieniWLgfBSHoubaNPrJd97zo
 +4sq14WfLt5+9u6SN8SQyVBY45bjGgZF0VvZ45A2Sq0z2sWuSopGdSiVq
 2FC7hk5mkUby534X9O2ArPP3vqgz5NjcOBE3U0GpnGEzQRi0TmCSaQeZI
 GueX0/by04f2+QGI5NDApTPwf1KZ6t/ZqQyz5kbjrhxHlhRm5DJ3A3cV1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="305391851"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="305391851"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 01:57:10 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="629692431"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="629692431"
Received: from xhallade-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.45.249])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 01:57:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 01/15] drm/i915/hdmi: do dual mode detect
 only if connected
In-Reply-To: <Y1BOx7oVQHPgoVzE@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1665496046.git.jani.nikula@intel.com>
 <20fb913a93c60fd24fc51b441ccea7bc75e82dd1.1665496046.git.jani.nikula@intel.com>
 <Y0hb0VOaYZk5TptS@intel.com> <Y0hmBn6NrUrBexyY@intel.com>
 <Y1BOx7oVQHPgoVzE@intel.com>
Date: Thu, 20 Oct 2022 11:57:06 +0300
Message-ID: <87edv2hnz1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 19 Oct 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, Oct 13, 2022 at 10:24:54PM +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
>> On Thu, Oct 13, 2022 at 09:41:21PM +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
>> > On Tue, Oct 11, 2022 at 04:49:35PM +0300, Jani Nikula wrote:
>> > > -	intel_hdmi_dp_dual_mode_detect(connector, edid !=3D NULL);
>> > > -
>> > > -	intel_display_power_put(dev_priv, POWER_DOMAIN_GMBUS, wakeref);
>> > > -
>> > >  	to_intel_connector(connector)->detect_edid =3D edid;
>> > >  	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
>> >=20
>> > We didn't have this digital input thing before. What happens with
>> > HDMI->VGA dongles for example?
>> >=20
>> > Hmm. This whole thing might already be broken on those. I suspect
>> > I've only used my HDMI->VGA dongle on LSPCON machines, so never
>> > noticed this. Need to go plug that thing into a native HDMI port...
>>=20
>> Except I must have left it elsewhere since I can't find it here.
>> So can't test right now unfortunately.
>>=20
>> I first thought this digital check thing might be due to
>> the DVI-I shenanigans in intel_crt_detect_ddc(), but that
>> was added for am unspecified gen2 machine in commit f5afcd3dd0dc
>> ("drm/i915/crt: Check for a analog monitor in case of DVI-I")
>> so not even relevant here. And I don't think I've ever seen
>> a g4x+ machine with an actual DVI-I port.
>
> Good news everyone, I found such a board: Intel DG43GT.
> Well, I didn't physically find one but I found the manual
> online. And some coreboot repo even had the vbt handily
> available. And yes, it does show the same DDC pins being
> used for the DVI-D port and CRT port. So I guess given
> that these digital checks do make some sense.

So what's the conclusion wrt the patch at hand?

BR,
Jani.

--=20
Jani Nikula, Intel Open Source Graphics Center
