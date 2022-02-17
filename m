Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8394BAB3F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 21:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6EF10E806;
	Thu, 17 Feb 2022 20:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9342610E806;
 Thu, 17 Feb 2022 20:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645130807; x=1676666807;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VEEIDdvxGF7pcHb/ansVeDZAEThlI8mKafUOCU8W0IM=;
 b=T3blNuFe/d8NyyXGvAGbxGycDlMq2crBEruPLiJWMLGUCiJG2k8px4pS
 xDjs5863DxYMCKOF8oFkaRGqBsMI+D99cd5NUHRH+cQ0GgYTXW7G3dXA+
 i95A1KkV34EY6yNzJxlJABW4APOUuRu2EV7OjSoEmDPLSbBF78HH3315K
 m05SG57C2H+2Tz2kPCG2FSEsHg4lln3K+Yaxh/nUJG57Uqq7nuVk1XoYL
 F/rHrjLrJyWIfhhT8qieDZLJ3PL1bFdgWE6lQzTvOKI3dpeB2S0DLXDYP
 BZzhaywt32ZdLEhvGf5OrDQjIS2bAyx902PMzqfs0m0TiU2dTMQN4DTmP w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="337415159"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="337415159"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 12:46:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="530504371"
Received: from dburke-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.88.148])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 12:46:44 -0800
Date: Thu, 17 Feb 2022 12:46:43 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: Re: [PATCH 3/3] drm/i915: Fix for PHY_MISC_TC1 offset
Message-ID: <20220217204643.snk5uk5yv2snmyla@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220215055154.15363-1-ramalingam.c@intel.com>
 <20220215055154.15363-4-ramalingam.c@intel.com>
 <Ygy68/f1ERpTKJJW@intel.com>
 <392e942460079346d1ce9d3a17db11f9d02a17f5.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <392e942460079346d1ce9d3a17db11f9d02a17f5.camel@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 16, 2022 at 09:36:02AM +0000, Hogander, Jouni wrote:
>On Wed, 2022-02-16 at 10:50 +0200, Ville Syrjälä wrote:
>> On Tue, Feb 15, 2022 at 11:21:54AM +0530, Ramalingam C wrote:
>> > From: Jouni Högander <jouni.hogander@intel.com>
>> >
>> > Currently ICL_PHY_MISC macro is returning offset 0x64C10 for PHY_E
>> > port. Correct offset is 0x64C14.
>>
>> Why is it PHY_E and not PHY_F?
>
>This is a valid question. It seems we have followed intel_phy_is_snps()
>here:
>
>// snip
>else if (IS_DG2(dev_priv))
>		/*
>		 * All four "combo" ports and the TC1 port (PHY E) use
>		 * Synopsis PHYs.
>		 */
>		return phy <= PHY_E;
>// snip

And this is actually the bug that we had. We wouldn't need to bring the
incomplete support for the 5th port if this single had changed:  it's
often preferred to prepare the driver first and enable the port/phy as
the last step:

-		return phy <= PHY_E;
+		return phy <= PHY_D;

With possibly a change in the commit above. Because in
drivers/gpu/drm/i915/display/intel_snps_phy.c we do:

intel_snps_phy_wait_for_calibration()
{
...
         for_each_phy_masked(phy, ~0) {
                 if (!intel_phy_is_snps(i915, phy))
                         continue;
...
}

Relying on intel_phy_is_snps() to mask out the unavailable phys.

However, since now we almost have the extra port wired up, I'm not going
to push back on it. Let's just add a comment on the commit message.
And since going with this approach is also acked by Ville who preferred
to contain the additional mapping inside intel_phy_snps.c:

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi


>
>According to spec port E is "No connection". Better place to fix this
>could be intel_phy_is_snps() itself?
>
>>
>> > Fix this by handling PHY_E port seprately.
>> >
>> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> > Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
>> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_snps_phy.c | 2 +-
>> >  drivers/gpu/drm/i915/i915_reg.h               | 6 ++++--
>> >  2 files changed, 5 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_snps_phy.c
>> > b/drivers/gpu/drm/i915/display/intel_snps_phy.c
>> > index c60575cb5368..f08061c748b3 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_snps_phy.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_snps_phy.c
>> > @@ -32,7 +32,7 @@ void intel_snps_phy_wait_for_calibration(struct
>> > drm_i915_private *i915)
>> >  		if (!intel_phy_is_snps(i915, phy))
>> >  			continue;
>> >
>> > -		if (intel_de_wait_for_clear(i915, ICL_PHY_MISC(phy),
>> > +		if (intel_de_wait_for_clear(i915, DG2_PHY_MISC(phy),
>> >  					    DG2_PHY_DP_TX_ACK_MASK,
>> > 25))
>> >  			drm_err(&i915->drm, "SNPS PHY %c failed to
>> > calibrate after 25ms.\n",
>> >  				phy);
>> > diff --git a/drivers/gpu/drm/i915/i915_reg.h
>> > b/drivers/gpu/drm/i915/i915_reg.h
>> > index 4d12abb2d7ff..354c25f483cb 100644
>> > --- a/drivers/gpu/drm/i915/i915_reg.h
>> > +++ b/drivers/gpu/drm/i915/i915_reg.h
>> > @@ -9559,8 +9559,10 @@ enum skl_power_gate {
>> >
>> >  #define _ICL_PHY_MISC_A		0x64C00
>> >  #define _ICL_PHY_MISC_B		0x64C04
>> > -#define ICL_PHY_MISC(port)	_MMIO_PORT(port, _ICL_PHY_MISC_A, \
>> > -						 _ICL_PHY_MISC_B)
>> > +#define _DG2_PHY_MISC_TC1	0x64C14 /* TC1="PHY E" but offset as if
>> > "PHY F" */
>> > +#define ICL_PHY_MISC(port)	_MMIO_PORT(port, _ICL_PHY_MISC_A,
>> > _ICL_PHY_MISC_B)
>> > +#define DG2_PHY_MISC(port)	((port) == PHY_E ?
>> > _MMIO(_DG2_PHY_MISC_TC1) : \
>> > +				 ICL_PHY_MISC(port))
>> >  #define  ICL_PHY_MISC_MUX_DDID			(1 << 28)
>> >  #define  ICL_PHY_MISC_DE_IO_COMP_PWR_DOWN	(1 << 23)
>> >  #define  DG2_PHY_DP_TX_ACK_MASK			REG_GENMASK(23,
>> > 20)
>> > --
>> > 2.20.1
>
>BR,
>
>Jouni Högander
