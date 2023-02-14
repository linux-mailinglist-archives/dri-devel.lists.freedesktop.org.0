Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EB1696657
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 15:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2EB10E1C9;
	Tue, 14 Feb 2023 14:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C3710E1C6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 14:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676384208; x=1707920208;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zXTf3MmymcGTYiS/8pw46Ic62YElU9b0FxEiZvXIB58=;
 b=aUjnbClh0rHBifaLtHI9+ENaL+uqSBWHMsFmyZSzdp21O3fOrp1wXuku
 UsvUO87YaDMXYpGX9DWtKvsHoDYPWQlT/nyHnA7chm1V0jq+FccyuqE4k
 U1/v7C133xb4W/ijzi12EDXA0fAuoTppNHaXVGVBCmdMcelV5+Fj2leDi
 JLNoZhmuNYQkOyidv9XODScu8MCQ7kMzdMzNazexcVSTj1JD3AG/XUJmH
 +p5QSoJ/iXxD//vGyRjTWw+TnOjwfMbKIMiufZUVkw6nfmHl+FU1jK9xn
 8Y11AirAhA90kXNNL7WBWHZpFjczLiZQJjubVkrFHmGI/ysOebI1+fv0v A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="328879396"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="328879396"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 06:16:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="671231034"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="671231034"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by fmsmga007.fm.intel.com with SMTP; 14 Feb 2023 06:16:41 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 14 Feb 2023 16:16:41 +0200
Date: Tue, 14 Feb 2023 16:16:41 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v3 3/6] drm: lcdif: Determine bus format and flags in
 ->atomic_check()
Message-ID: <Y+uXyfZLyZ7Bm4j8@intel.com>
References: <20230213085612.1026538-1-victor.liu@nxp.com>
 <20230213085612.1026538-4-victor.liu@nxp.com>
 <1755644.VLH7GnMWUR@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1755644.VLH7GnMWUR@steina-w>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, kernel@pengutronix.de,
 Liu Ying <victor.liu@nxp.com>, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org, LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 14, 2023 at 03:12:55PM +0100, Alexander Stein wrote:
> Hi Liu,
> 
> thanks for the update.
> 
> Am Montag, 13. Februar 2023, 09:56:09 CET schrieb Liu Ying:
> > Instead of determining LCDIF output bus format and bus flags in
> > ->atomic_enable(), do that in ->atomic_check().  This is a
> > preparation for the upcoming patch to check consistent bus format
> > and bus flags across all first downstream bridges in ->atomic_check().
> > New lcdif_crtc_state structure is introduced to cache bus format
> > and bus flags states in ->atomic_check() so that they can be read
> > in ->atomic_enable().
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v2->v3:
> > * No change.
> > 
> > v1->v2:
> > * Split from patch 2/2 in v1. (Marek, Alexander)
> > * Add comment on the 'base' member of lcdif_crtc_state structure to
> >   note it should always be the first member. (Lothar)
> > 
> >  drivers/gpu/drm/mxsfb/lcdif_kms.c | 138 ++++++++++++++++++++++--------
> >  1 file changed, 100 insertions(+), 38 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > b/drivers/gpu/drm/mxsfb/lcdif_kms.c index e54200a9fcb9..294cecdf5439 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -30,6 +30,18 @@
> >  #include "lcdif_drv.h"
> >  #include "lcdif_regs.h"
> > 
> > +struct lcdif_crtc_state {
> > +	struct drm_crtc_state	base;	/* always be the first 
> member */
> 
> Is it strictly necessary that base is the first member? to_lcdif_crtc_state() 
> should be able to handle any position within the struct. I mean it's sensible 
> to put it in first place. But the comment somehow bugs me.

NULL pointers is where these things go bad if it't not at
offset 0. Unless you're willing to always handle those
explicitly.

-- 
Ville Syrjälä
Intel
