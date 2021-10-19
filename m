Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7233F434184
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 00:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A663E6E049;
	Tue, 19 Oct 2021 22:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABE56E02B;
 Tue, 19 Oct 2021 22:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1634683253; bh=wO90rGU6MhdAHFHZM4DSTSVrgFBdt+grYWoEJdFQb5o=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 b=LcyS7cA+lr21Qf2IXkL+iVBukZ+htLmi/0EnuDi8za6fmtPBBmhu3358Sy9SxuDtl
 pxOT3e4q8mYLTcaeJAg7BIpaj4RLxnUbjtBlvw4e1kkdpV2gezQoOlUAd9Ro6nqpER
 iYuXXnjek58793jA/WM/LFYxFkKwsB6nfpNunp+o=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Wed, 20 Oct 2021 00:40:23 +0200 (CEST)
X-EA-Auth: rjXwpQ396seHTSefM986rJ+z/3H3+BzurlzyNXwUfcqw/AEL5XVBNOJkTIPVCCi7ulQ2bi9qCPxsXZRs0J5aCF77eKqTbF9k
Date: Wed, 20 Oct 2021 00:40:20 +0200
From: Claudio Suarez <cssk@net-c.es>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 01/13] gpu/drm: make drm_add_edid_modes() consistent
 when updating connector->display_info
Message-ID: <YW9JVOUrG0Ubnvtf@gineta.localdomain>
References: <20211016184226.3862-1-cssk@net-c.es>
 <20211016184226.3862-2-cssk@net-c.es> <YW8P3GPGezUhoBcW@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YW8P3GPGezUhoBcW@intel.com>
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

On Tue, Oct 19, 2021 at 09:35:08PM +0300, Ville Syrjälä wrote:
> On Sat, Oct 16, 2021 at 08:42:14PM +0200, Claudio Suarez wrote:
> > According to the documentation, drm_add_edid_modes
> > "... Also fills out the &drm_display_info structure and ELD in @connector
> > with any information which can be derived from the edid."
> > 
> > drm_add_edid_modes accepts a struct edid *edid parameter which may have a
> > value or may be null. When it is not null, connector->display_info and
> > connector->eld are updated according to the edid. When edid=NULL, only
> > connector->eld is reset. Reset connector->display_info to be consistent
> > and accurate.
> > 
> > Signed-off-by: Claudio Suarez <cssk@net-c.es>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 6325877c5fd6..c643db17782c 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -5356,14 +5356,13 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
> >  	int num_modes = 0;
> >  	u32 quirks;
> >  
> > -	if (edid == NULL) {
> > -		clear_eld(connector);
> > -		return 0;
> > -	}
> >  	if (!drm_edid_is_valid(edid)) {
> 
> OK, so drm_edid_is_valid() will happily accept NULL and considers
> it invalid. You may want to mention that explicitly in the commit
> message.

Thank you for your comments, I appreciate :)
I'm sending new mails with the new commit messages.

> > +		/* edid == NULL or invalid here */
> >  		clear_eld(connector);
> > -		drm_warn(connector->dev, "%s: EDID invalid.\n",
> > -			 connector->name);
> > +		drm_reset_display_info(connector);
> > +		if (edid)
> > +			drm_warn(connector->dev, "%s: EDID invalid.\n",
> > +				 connector->name);
> 
> Could you respin this to use the standard [CONNECTOR:%d:%s] form
> while at it? Or I guess a patch to mass convert the whole drm_edid.c
> might be another option.

Good point.
I like the idea of a new patch. I'll start working on it. I can change
this drm_warn here to avoid merge conflicts.

> Patch looks good.
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Thanks!

BR
Claudio Suarez.


