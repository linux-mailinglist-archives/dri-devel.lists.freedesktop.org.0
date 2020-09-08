Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A7F260CA3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 09:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A9889CCE;
	Tue,  8 Sep 2020 07:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61B089CCE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 07:55:56 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 6C7F05C3BD6;
 Tue,  8 Sep 2020 09:55:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1599551754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X93b1AlSU972vWQ+6u3RASECywrcJyvf5qdmfnyVL4w=;
 b=ogDS3j32qzhAEWYD8aPKZv+4w3RpValDrIyQrHshuslfD6MDcg9MPmIRUUh2OtU7fCHbFK
 EIpPWEjiIndN/LdULkEuLVHQkixEMH+9ZKoV6vVO070Yf8a4I4VNB17HuBGxHwNVHZSnGo
 r+KS56k3cpSQ3cMYeW/HsajATy6Dhjo=
MIME-Version: 1.0
Date: Tue, 08 Sep 2020 09:55:53 +0200
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, jsarha@ti.com,
 tomi.valkeinen@ti.com
Subject: Re: [PATCH] drm: mxsfb: check framebuffer pitch
In-Reply-To: <20200907181855.GE2352366@phenom.ffwll.local>
References: <20200907160343.124405-1-stefan@agner.ch>
 <20200907161712.GF6047@pendragon.ideasonboard.com>
 <20200907181855.GE2352366@phenom.ffwll.local>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <86615b4b1551d4a6f1cfcc13b38e616c@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: marex@denx.de, airlied@linux.ie, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-07 20:18, Daniel Vetter wrote:
> On Mon, Sep 07, 2020 at 07:17:12PM +0300, Laurent Pinchart wrote:
>> Hi Stefan,
>>
>> Thank you for the patch.
>>
>> On Mon, Sep 07, 2020 at 06:03:43PM +0200, Stefan Agner wrote:
>> > The lcdif IP does not support a framebuffer pitch (stride) other than
>> > the CRTC width. Check for equality and reject the state otherwise.
>> >
>> > This prevents a distorted picture when using 640x800 and running the
>> > Mesa graphics stack. Mesa tires to use a cache aligned stride, which
>>
>> s/tires/tries/
>>
>> > leads at that particular resolution to width != stride. Currently
>> > Mesa has no fallback behavior, but rejecting this configuration allows
>> > userspace to handle the issue correctly.
>>
>> I'm increasingly impressed by how featureful this IP core is :-)
>>
>> > Signed-off-by: Stefan Agner <stefan@agner.ch>
>> > ---
>> >  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 22 ++++++++++++++++++----
>> >  1 file changed, 18 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> > index b721b8b262ce..79aa14027f91 100644
>> > --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> > @@ -403,14 +403,28 @@ static int mxsfb_plane_atomic_check(struct drm_plane *plane,
>> >  {
>> >  	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
>> >  	struct drm_crtc_state *crtc_state;
>> > +	unsigned int pitch;
>> > +	int ret;
>> >
>> >  	crtc_state = drm_atomic_get_new_crtc_state(plane_state->state,
>> >  						   &mxsfb->crtc);
>> >
>> > -	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>> > -						   DRM_PLANE_HELPER_NO_SCALING,
>> > -						   DRM_PLANE_HELPER_NO_SCALING,
>> > -						   false, true);
>> > +	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>> > +						  DRM_PLANE_HELPER_NO_SCALING,
>> > +						  DRM_PLANE_HELPER_NO_SCALING,
>> > +						  false, true);
>> > +	if (ret || !plane_state->visible)
>>
>> Would it be more explict to check for !plane_state->fb ? Otherwise I'll
>> have to verify that !fb always implies !visible :-)
>>
>> > +		return ret;
>> > +
>> > +	pitch = crtc_state->mode.hdisplay *
>> > +		plane_state->fb->format->cpp[0];
>>
>> This holds on a single line.
>>
>> > +	if (plane_state->fb->pitches[0] != pitch) {
>> > +		dev_err(plane->dev->dev,
>> > +			"Invalid pitch: fb and crtc widths must be the same");
>>
>> I'd turn this into a dev_dbg(), printing error messages to the kernel
>> log in response to user-triggered conditions is a bit too verbose and
>> could flood the log.
>>
>> Wouldn't it be best to catch this issue when creating the framebuffer ?
> 
> Yeah this should be verified at addfb time. We try to validate as early as
> possible.
> -Daniel
> 

Sounds sensible. From what I can tell fb_create is the proper callback
to implement this at addfb time. Will give this a try.

FWIW, I got the idea from drivers/gpu/drm/tilcdc/tilcdc_plane.c. Maybe
should be moved to addfb there too?

[added Jyri/Tomi]

--
Stefan

>>
>> > +		return -EINVAL;
>> > +	}
>> > +
>> > +	return 0;
>> >  }
>> >
>> >  static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
>>
>> --
>> Regards,
>>
>> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
