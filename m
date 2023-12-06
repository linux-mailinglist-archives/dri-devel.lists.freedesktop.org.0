Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2719C8070B6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 14:15:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFBF10E0FC;
	Wed,  6 Dec 2023 13:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9B610E0FC;
 Wed,  6 Dec 2023 13:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sn/1S5HOyC2PG+SZr4wemHaRyshdDrNDeMB/D0JweA4=; b=F1tXwsiN34va8nnkGGhyV1Zg6R
 ZbEM4C8WG6LPEkUo+FAzrxmiCPdEMbnDGAuNdiLtQaJKI1MMu/vjNDIHTvSnyN9UjRDeOQIQLeFqv
 nnmvfKQa8zs7xnbqX168UAhPEmdWtUkQs0b47U7vmLuPmpqpxcz+t0ClBL//b+L/9dqYYUDbdmjMV
 1NdOjMPB+P8XcGDGu9PFheRLNBJpDH4ZKWyZDQfmdq6GGoOVw2OdjVss8UScs0SBFTdmbaToFputL
 79s9R183dU0or6i8ZrAszg8rwJ5EhV+R1Gl0/c9dmuRSNAPKNWr68Ic9DRSyO0UTGm/IUPmR489my
 WcgdXsBg==;
Received: from [102.213.205.115] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rArkX-00AxH1-Vg; Wed, 06 Dec 2023 14:15:38 +0100
Date: Wed, 6 Dec 2023 12:15:27 -0100
From: Melissa Wen <mwen@igalia.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [RFC PATCH v3 05/23] drm/vkms: Avoid reading beyond LUT array
Message-ID: <20231206131527.ov6wwynnuy3q7l6f@mail.igalia.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-6-harry.wentland@amd.com>
 <51c79cb2-7e64-4336-972c-976c7da74a8b@riseup.net>
 <20231206121843.aafv2h535t37l6kz@mail.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206121843.aafv2h535t37l6kz@mail.igalia.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/06, Melissa Wen wrote:
> On 11/10, Arthur Grillo wrote:
> > 
> > 
> > On 08/11/23 13:36, Harry Wentland wrote:
> > > When the floor LUT index (drm_fixp2int(lut_index) is the last
> > > index of the array the ceil LUT index will point to an entry
> > > beyond the array. Make sure we guard against it and use the
> > > value of the floor LUT index.
> > > 
> > > v3:
> > >  - Drop bits from commit description that didn't contribute
> > >    anything of value
> > > 
> > > Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > > Cc: Arthur Grillo <arthurgrillo@riseup.net>
> > 
> > LGTM
> > Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>
> 
> Nice catch. Thanks!
> 
> I'll already apply this one to drm-misc-next too.

It's a reminder to myself to add the missing fixes tag:

Fixes: db1f254f2cfaf ("drm/vkms: Add support to 1D gamma LUT")
Reviewed-by: Melissa Wen <mwen@igalia.com>
> 
> CC'ing other VKMS maintainers/reviewers.
> 
> Melissa
> 
> > 
> > Best Regards,
> > ~Arthur Grillo
> > 
> > > ---
> > >  drivers/gpu/drm/vkms/vkms_composer.c | 14 ++++++++++----
> > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > > index 6f942896036e..25b6b73bece8 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > > @@ -123,6 +123,8 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
> > >  				      enum lut_channel channel)
> > >  {
> > >  	s64 lut_index = get_lut_index(lut, channel_value);
> > > +	u16 *floor_lut_value, *ceil_lut_value;
> > > +	u16 floor_channel_value, ceil_channel_value;
> > >  
> > >  	/*
> > >  	 * This checks if `struct drm_color_lut` has any gap added by the compiler
> > > @@ -130,11 +132,15 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
> > >  	 */
> > >  	static_assert(sizeof(struct drm_color_lut) == sizeof(__u16) * 4);
> > >  
> > > -	u16 *floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
> > > -	u16 *ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
> > > +	floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
> > > +	if (drm_fixp2int(lut_index) == (lut->lut_length - 1))
> > > +		/* We're at the end of the LUT array, use same value for ceil and floor */
> > > +		ceil_lut_value = floor_lut_value;
> > > +	else
> > > +		ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
> > >  
> > > -	u16 floor_channel_value = floor_lut_value[channel];
> > > -	u16 ceil_channel_value = ceil_lut_value[channel];
> > > +	floor_channel_value = floor_lut_value[channel];
> > > +	ceil_channel_value = ceil_lut_value[channel];
> > >  
> > >  	return lerp_u16(floor_channel_value, ceil_channel_value,
> > >  			lut_index & DRM_FIXED_DECIMAL_MASK);
