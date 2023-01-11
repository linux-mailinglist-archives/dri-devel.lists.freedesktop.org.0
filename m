Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7E9665C80
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 14:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E30C10E742;
	Wed, 11 Jan 2023 13:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D6610E742
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 13:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673443697; x=1704979697;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PtskIoi2cO5x++sUE8DcGDRufr5h9+de6G0pqTc9SZ4=;
 b=loZyuRJdbFOtPDt+idpOamsxclR5UKA+f/1wrT0OGljy5qFhQJfqPZwS
 ZuoOo9syBT3Oh2PfmDfxGr4uUlrb5J6JEXmza6/0bT+hF1L1GqXTGZHOR
 uoeLrLO646QxsHNGadDeUBic6pMzPSy0CT1vQkGj0HqiQAh6UN/W+9zw4
 LNLRQAQF+DxUStqnJHRE74BYxMWVhYJLUQihcKf3pmWP8PDanghiBPPT7
 OUZTuyC/xO537wSnGGovTm52Uuz4bP7+B8pyN9yJ3PS8TLaaWUM0dLldI
 poiuJHuwD297FAG+wBfawsCFwvERC3WwFEejzHrMtKjTyYe2ZL6mkqsQw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="325418947"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="325418947"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 05:28:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="746149601"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="746149601"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by FMSMGA003.fm.intel.com with SMTP; 11 Jan 2023 05:28:12 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 11 Jan 2023 15:28:12 +0200
Date: Wed, 11 Jan 2023 15:28:12 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vc4: Check for valid formats
Message-ID: <Y765bF+c2y5b22P4@intel.com>
References: <20230102135757.262676-1-mcanal@igalia.com>
 <a4d642d8-5556-7efb-308f-ab5f9c7284b0@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4d642d8-5556-7efb-308f-ab5f9c7284b0@suse.de>
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
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Emma Anholt <emma@anholt.net>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 02, 2023 at 03:20:06PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.01.23 um 14:57 schrieb Maíra Canal:
> > Currently, vc4 is not checking valid formats before creating a
> > framebuffer, which is triggering the IGT test
> > igt@kms_addfb_basic@addfb25-bad-modifier to fail, as vc4 accepts
> > to create a framebuffer with an invalid modifier. Therefore, check
> > for valid formats before creating framebuffers on vc4 and vc5 in
> > order to avoid creating framebuffers with invalid formats.
> > 
> > Signed-off-by: Maíra Canal <mcanal@igalia.com>
> > ---
> >   drivers/gpu/drm/vc4/vc4_kms.c | 23 ++++++++++++++++++++++-
> >   1 file changed, 22 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> > index 53d9f30460cf..5d1afd66fcc1 100644
> > --- a/drivers/gpu/drm/vc4/vc4_kms.c
> > +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> > @@ -500,6 +500,27 @@ static struct drm_framebuffer *vc4_fb_create(struct drm_device *dev,
> > 		mode_cmd = &mode_cmd_local;
> > 	}
> > 
> > +	if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
> > +				      mode_cmd->modifier[0])) {
> > +		drm_dbg_kms(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
> > +			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
> > +		return ERR_PTR(-EINVAL);
> > +	}
> 
> This might be a stupid question, but why doesn't drm_fbgem_fb_create() 
> do this test already? It seems like a no-brainer and *not* testing for 
> the plane formats should be the exception.

That was the approach I tried originally but there were a bunch of
problems with various drivers it at the time. Dunno if all of those
got sorted out or not. IIRC the idea floating around for ancient
drivers was to skip the check based on plane->format_default. Looks
like we're already using that approach in the setcrtc ioctl.

-- 
Ville Syrjälä
Intel
