Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6A026119D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 14:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FDB6E81A;
	Tue,  8 Sep 2020 12:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9336E1D6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 12:49:31 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 7D87A5C4CC6;
 Tue,  8 Sep 2020 14:49:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1599569369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vohbHx+KdBMX2EzdqSsM6vNF04Tb3ZHZoZ6qz4lcfE0=;
 b=jGg7ZsMQSOgS0AQe0NRuKBfBWFSH3JgUAWrcutRt+bVBtF4Fbjd5pYNqkPx3vn4sbSQuRl
 oKey2G9a8ErcZm3pODU0VjUg2kmuOpd6DRK00WVlNd0/fzRIQLFXLsq77aKzwZ/ApAhjXA
 20GY1GfnHBpIHu0jxOeQJx5HLInt8W0=
MIME-Version: 1.0
Date: Tue, 08 Sep 2020 14:49:29 +0200
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: mxsfb: check framebuffer pitch
In-Reply-To: <20200908123304.GG6047@pendragon.ideasonboard.com>
References: <20200907160343.124405-1-stefan@agner.ch>
 <20200907161712.GF6047@pendragon.ideasonboard.com>
 <20200907181855.GE2352366@phenom.ffwll.local>
 <86615b4b1551d4a6f1cfcc13b38e616c@agner.ch>
 <dc5a16d0-4d2a-366a-7716-29dd8db1a12a@ti.com>
 <20200908084855.GH2352366@phenom.ffwll.local>
 <bed1ef4f988626962317519cb7d8928e@agner.ch>
 <CAKMK7uG2NgN1fGFTDnP=0Yow4B051pHhYWw-Uu-cZT3t0UPKWg@mail.gmail.com>
 <20200908123304.GG6047@pendragon.ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <545fd348c6bd51626cedc0fdcf3afa1d@agner.ch>
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
Cc: Marek Vasut <marex@denx.de>, Sascha Hauer <kernel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dl-linux-imx <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-08 14:33, Laurent Pinchart wrote:
> On Tue, Sep 08, 2020 at 02:29:02PM +0200, Daniel Vetter wrote:
>> On Tue, Sep 8, 2020 at 2:07 PM Stefan Agner <stefan@agner.ch> wrote:
>> > On 2020-09-08 10:48, Daniel Vetter wrote:
>> >> On Tue, Sep 08, 2020 at 11:18:25AM +0300, Tomi Valkeinen wrote:
>> >>> On 08/09/2020 10:55, Stefan Agner wrote:
>> >>>> On 2020-09-07 20:18, Daniel Vetter wrote:
>> >>>>> On Mon, Sep 07, 2020 at 07:17:12PM +0300, Laurent Pinchart wrote:
>> >>>>>> Hi Stefan,
>> >>>>>>
>> >>>>>> Thank you for the patch.
>> >>>>>>
>> >>>>>> On Mon, Sep 07, 2020 at 06:03:43PM +0200, Stefan Agner wrote:
>> >>>>>>> The lcdif IP does not support a framebuffer pitch (stride) other than
>> >>>>>>> the CRTC width. Check for equality and reject the state otherwise.
>> >>>>>>>
>> >>>>>>> This prevents a distorted picture when using 640x800 and running the
>> >>>>>>> Mesa graphics stack. Mesa tires to use a cache aligned stride, which
>> >>>>>>
>> >>>>>> s/tires/tries/
>> >>>>>>
>> >>>>>>> leads at that particular resolution to width != stride. Currently
>> >>>>>>> Mesa has no fallback behavior, but rejecting this configuration allows
>> >>>>>>> userspace to handle the issue correctly.
>> >>>>>>
>> >>>>>> I'm increasingly impressed by how featureful this IP core is :-)
>> >>>>>>
>> >>>>>>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> >>>>>>> ---
>> >>>>>>>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 22 ++++++++++++++++++----
>> >>>>>>>  1 file changed, 18 insertions(+), 4 deletions(-)
>> >>>>>>>
>> >>>>>>> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> >>>>>>> index b721b8b262ce..79aa14027f91 100644
>> >>>>>>> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> >>>>>>> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> >>>>>>> @@ -403,14 +403,28 @@ static int mxsfb_plane_atomic_check(struct drm_plane *plane,
>> >>>>>>>  {
>> >>>>>>>         struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
>> >>>>>>>         struct drm_crtc_state *crtc_state;
>> >>>>>>> +       unsigned int pitch;
>> >>>>>>> +       int ret;
>> >>>>>>>
>> >>>>>>>         crtc_state = drm_atomic_get_new_crtc_state(plane_state->state,
>> >>>>>>>                                                    &mxsfb->crtc);
>> >>>>>>>
>> >>>>>>> -       return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>> >>>>>>> -                                                  DRM_PLANE_HELPER_NO_SCALING,
>> >>>>>>> -                                                  DRM_PLANE_HELPER_NO_SCALING,
>> >>>>>>> -                                                  false, true);
>> >>>>>>> +       ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>> >>>>>>> +                                                 DRM_PLANE_HELPER_NO_SCALING,
>> >>>>>>> +                                                 DRM_PLANE_HELPER_NO_SCALING,
>> >>>>>>> +                                                 false, true);
>> >>>>>>> +       if (ret || !plane_state->visible)
>> >>>>>>
>> >>>>>> Would it be more explict to check for !plane_state->fb ? Otherwise I'll
>> >>>>>> have to verify that !fb always implies !visible :-)
>> >>>>>>
>> >>>>>>> +               return ret;
>> >>>>>>> +
>> >>>>>>> +       pitch = crtc_state->mode.hdisplay *
>> >>>>>>> +               plane_state->fb->format->cpp[0];
>> >>>>>>
>> >>>>>> This holds on a single line.
>> >>>>>>
>> >>>>>>> +       if (plane_state->fb->pitches[0] != pitch) {
>> >>>>>>> +               dev_err(plane->dev->dev,
>> >>>>>>> +                       "Invalid pitch: fb and crtc widths must be the same");
>> >>>>>>
>> >>>>>> I'd turn this into a dev_dbg(), printing error messages to the kernel
>> >>>>>> log in response to user-triggered conditions is a bit too verbose and
>> >>>>>> could flood the log.
>> >>>>>>
>> >>>>>> Wouldn't it be best to catch this issue when creating the framebuffer ?
>> >>>>>
>> >>>>> Yeah this should be verified at addfb time. We try to validate as early as
>> >>>>> possible.
>> >>>>> -Daniel
>> >>>>>
>> >>>>
>> >>>> Sounds sensible. From what I can tell fb_create is the proper callback
>> >>>> to implement this at addfb time. Will give this a try.
>> >>>>
>> >>>> FWIW, I got the idea from drivers/gpu/drm/tilcdc/tilcdc_plane.c. Maybe
>> >>>> should be moved to addfb there too?
>> >>>
>> >>> But you don't know the crtc width when creating the framebuffer.
>> >>
>> >> Hm right this is a different check. What we could check in fb_create for
>> >> both is that the logical fb size matches exactly the pitch. That's not
>> >> sufficient criteria, but it will at least catch some of them already.
>> >>
>> >> But yeah we'd need both here.
>> >
>> > After validating width of framebuffer against pitch, the only thing we
>> > need to check here is that the width matches. From what I can tell,
>> > least for mxsfb, this should be covered by
>> > drm_atomic_helper_check_plane_state's can_position parameter set to
>> > false.
>>
>> This only checks against the src rectangle of the crtc state, there's
>> nothing forcing that the size of the fb matches the src rectangle
>> exactly. I guess we could maybe add that as another parameter for hw
>> like yours or tilcdc. Naming is a bit tricky, maybe
>> require_matching_fb or src_must_match_fb or something like that.
> 
> Can we turn those parameters into flags ? false, true, false is hard to
> read.
> 

Since it must match, in this case, it would be false, true, true,
obviously ;-)

I guess this would mean to convert the two existing boolean parameters
to flags first, and then introduce a new flag handling fb size vs. CRTC
src.

Hm, this gets all a bit more involved. It is actually not the issue at
hand (in my case the fb width does match the CRTC). Not sure if that
case is actually a problem in real world? I can give this a shot still,
if preferred. But I would do it independently of the framebuffer pitch
validation.

--
Stefan

>> > So I think in my case I can get away by only checking the framebuffer.
>>
>> You still need both I think.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
