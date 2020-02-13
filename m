Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B242215BCC3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 11:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0CD6F59E;
	Thu, 13 Feb 2020 10:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1F66F5A6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 10:25:49 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id m16so5938439wrx.11
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 02:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rlyvY6F19LNTG8IsIXtfqgzeDY+gtFCa1I4CS9PhzxE=;
 b=JrKF8REUuPAE+6V7ETkWv+rdwS0PQEuhG56vApuTOxnIu9KICVP7aHVlR7ETMwZmmc
 zqDLViOGFVEPaIOWME4cGx2FbWQ2etHR2/acrs+OJCC6FnwSZTkzIYcSC7wK+xvVSEm+
 Q+OxOIL+j4mlLVDizz5fgJVqx5XjUiDXxh1Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rlyvY6F19LNTG8IsIXtfqgzeDY+gtFCa1I4CS9PhzxE=;
 b=d5KOpDBHEGU00ulgao9gPuLgeoCv/EzMpo2gb/VvYJhlsJdsTmrhYq3ZtRhdQAdgRO
 +pLcel6mSeBXO9NjnTAxGOxU6YbcJdtS4luo52uoXKeXNNdRhNymty9poPLlSBYWVdzb
 MwnubUyhYNm39IuDckGTXEUBmTmHa8IdzL3fvtLjAEV2rFmxHJHWmEGe6Wvt+7JbQvCx
 0WKemBsz5cPe/Ic0vD386RL/9I+s+HESQWCulRjlRVi5IjSdyxfTbQJbOL7YgmPv5yuH
 VvgyrjlFtm/YawAJZVDkpVaGqllv1A639OilLLDAxJ2CqtjhOkVJ7ZLLJNIi7ElJNjXY
 yC8w==
X-Gm-Message-State: APjAAAWTGsMb9FrfzP/28Ma7XKghw4W9I6AhDbXKA+F2xw9/THkMh1qL
 CFP+YSxvtgJDa1S1rMnQlXWEDUPYk0g=
X-Google-Smtp-Source: APXvYqyyJ63P5rr+uXvUAotZlKihN/0DuqovFMWF8jAtGdsqUf9pd4zM4TmYcPSgezS7NPUOYd/w3A==
X-Received: by 2002:a5d:5088:: with SMTP id a8mr20491457wrt.162.1581589548366; 
 Thu, 13 Feb 2020 02:25:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c141sm2313333wme.41.2020.02.13.02.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 02:25:47 -0800 (PST)
Date: Thu, 13 Feb 2020 11:25:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v2] drm/tidss: dispc: Rewrite naive plane positioning code
Message-ID: <20200213102545.GU2363188@phenom.ffwll.local>
References: <20200212135936.31326-1-jsarha@ti.com>
 <397e6686-40de-4205-e958-8592b1c3cc6e@ti.com>
 <20200212143354.GC13686@intel.com>
 <8095e3f1-640e-5136-6419-ce2c57f24820@ti.com>
 <CAKMK7uHEnU2LdNZ5KN5DZYzaCEFW0RTy+EpRw3ybQqkf0OLjSg@mail.gmail.com>
 <3cc04f7c-5a79-abb8-9ae2-2a2acd5baa0a@ti.com>
 <CAKMK7uFRC8gCavofePNKuNVXxUtgQn+xwpVQ+xh3xNOFwT400A@mail.gmail.com>
 <7483ceb3-333e-4b94-9cf7-3bf9ea2576c0@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7483ceb3-333e-4b94-9cf7-3bf9ea2576c0@ti.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: praneeth@ti.com, dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 12:03:51PM +0200, Jyri Sarha wrote:
> On 13/02/2020 11:19, Daniel Vetter wrote:
> > On Thu, Feb 13, 2020 at 10:03 AM Jyri Sarha <jsarha@ti.com> wrote:
> >>
> >> On 12/02/2020 22:28, Daniel Vetter wrote:
> >>> On Wed, Feb 12, 2020 at 7:01 PM Jyri Sarha <jsarha@ti.com> wrote:
> >>>>
> >>>> On 12/02/2020 16:33, Ville Syrj=E4l=E4 wrote:
> >>>>> On Wed, Feb 12, 2020 at 04:08:11PM +0200, Jyri Sarha wrote:
> >>>>>> On 12/02/2020 15:59, Jyri Sarha wrote:
> >>>>>>> The old implementation of placing planes on the CRTC while config=
uring
> >>>>>>> the planes was naive and relied on the order in which the planes =
were
> >>>>>>> configured, enabled, and disabled. The situation where a plane's =
zpos
> >>>>>>> was changed on the fly was completely broken. The usual symptoms =
of
> >>>>>>> this problem was scrambled display and a flood of sync lost error=
s,
> >>>>>>> when a plane was active in two layers at the same time, or a miss=
ing
> >>>>>>> plane, in case when a layer was accidentally disabled.
> >>>>>>>
> >>>>>>> The rewrite takes a more straight forward approach when HW is
> >>>>>>> concerned. The plane positioning registers are in the CRTC (actua=
lly
> >>>>>>> OVR) register space and it is more natural to configure them in o=
ne go
> >>>>>>> while configuring the CRTC. To do this we need to make sure we ha=
ve
> >>>>>>> all the planes on updated CRTCs in the new atomic state to be
> >>>>>>> committed. This is done by calling drm_atomic_add_affected_planes=
() in
> >>>>>>> crtc_atomic_check().
> >>>>>>>
> >>>>>>> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> >>>>>>> ---
> >>>>>>>  drivers/gpu/drm/tidss/tidss_crtc.c  | 55 +++++++++++++++++++++++=
+++++-
> >>>>>>>  drivers/gpu/drm/tidss/tidss_dispc.c | 55 +++++++++++------------=
------
> >>>>>>>  drivers/gpu/drm/tidss/tidss_dispc.h |  5 +++
> >>>>>>>  3 files changed, 79 insertions(+), 36 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm=
/tidss/tidss_crtc.c
> >>>>>>> index 032c31ee2820..f7c5fd1094a8 100644
> >>>>>>> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> >>>>>>> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> >>>>>> ...
> >>>>>>> @@ -108,7 +110,54 @@ static int tidss_crtc_atomic_check(struct dr=
m_crtc *crtc,
> >>>>>>>             return -EINVAL;
> >>>>>>>     }
> >>>>>>>
> >>>>>>> -   return dispc_vp_bus_check(dispc, hw_videoport, state);
> >>>>>>> +   ret =3D dispc_vp_bus_check(dispc, hw_videoport, state);
> >>>>>>> +   if (ret)
> >>>>>>> +           return ret;
> >>>>>>> +
> >>>>>>> +   /* Add unchanged planes on this crtc to state for zpos update=
. */
> >>>>>>> +   return drm_atomic_add_affected_planes(state->state, crtc);
> >>>>>>
> >>>>>> Is this a correct way to use drm_atomic_add_affected_planes()?
> >>>>>>
> >>>>>> I saw that some other drivers implement their own mode_config
> >>>>>> atomic_check() and have this call there in
> >>>>>> for_each_new_crtc_in_state()-loop, but I thought it should be fine=
 to
> >>>>>> call it in crtc_atomic_check().
> >>>>>
> >>>>> You seem to be using drm_atomic_helper_check_planes(), which means
> >>>>> crtc.atomic_check() gets called after plane.atomic_check(). So this
> >>>>> might be good or bad depending on whether you'd like the planes you
> >>>>> add here to go through their .atomic_check() or not.
> >>>>>
> >>>>
> >>>> Should have thought of that my self. Extra plane.atomic_check() call=
s do
> >>>> not do any actual harm, but they are potentially expensive. The plan=
es
> >>>> are really only needed there in the commit phase (crtc_enable() or
> >>>> flush()). Well, I'll do my own mode_config.atomic_check() and call
> >>>> drm_atomic_add_affected_planes() in a for_each_new_crtc_in_state()-l=
oop
> >>>> after all the checks.
> >>>
> >>> Also, if you do use the helpers then this should already have happened
> >>> for you. Which makes me wonder why all this work, so maybe there's
> >>> some dependency between all the various check functions you have going
> >>> on? Might be time to roll your own top-level check function that calls
> >>
> >>> stuff in the order your hw needs things to be checked, so that you
> >>> don't add new states late and have to run one check phase twice (which
> >>> is totally fine with the helpers as long as all your check callbacks
> >>> are idempotent, but often just overkill and confusing).
> >>
> >> All the driver specific checks are perfectly independent without any
> >> cross dependencies. And there is no extra data in the plane- or
> >> CRTC-state, nor do the driver specific checks touch the state in any w=
ay.
> >>
> >> I only want all the planes on a crtc to be there, if any of the planes
> >> on the CRTC changes, so that I can write the plane positions from the
> >> scratch directly from the atomic state with each commit.
> > =

> > You /should/ get this already with the atomic helpers, no further
> > action needed. Does it not work?
> > =

> >> Long explanation (if you are interested):
> >>
> >> With the DSS HW the planes are positioned to CRTCs by filling each
> >> plane's id and x,y position to correct overlay register according to t=
he
> >> plane's zpos (each overlay reg has its own static zpos).
> >>
> >> Using the naive implementation, there is a problem if I have plane0 at
> >> zpos0 and another commit comes with plane1 at zpos0 and plane0 disable=
d.
> >> If plane1 in the commit is handled first, it overwrites plane0's
> >> previous position, and plane0 handled afterwards will disable freshly
> >> configured plane1. There is number of other problematic cases.
> >>
> >> Ok, I can easily fix this by storing the plane positions (x,y, and z) =
in
> >> the driver's internal state, and rolling the positions out in the
> >> crtc_enable() or -flush(). But I have understood the atomic drivers
> >> should avoid having any internal state. So the obvious choice would be
> >> to roll out the plane positions directly from the atomic state. Howeve=
r,
> >> there is a problem with that.
> > =

> > Hm I'm not entirely following the problem, but if you have some
> > requirements around the order in which your planes need to be
> > committed, then roll your own plane commit code. At least for the
> > parts of the plane state which need to be committed like that. You can
> > then stuff that into one of your crtc commit functions.
> > =

> > And I guess "commit planes in order of zpos" is probably fairly common
> > driver requirement, we might want to have a shared iterator for that.
> > =

> > Aside: Driver private state is totally fine. Just needs to be attached
> > to one of the drm_*_state objects (you can have private state objects
> > too). What's not ok in atomic is stuffing that kind of data into your
> > drm_crtc structure (or somewhere else like that), that's where the
> > problems happen.
> > =

> =

> The root cause is the plane position being part of the plane-state, but
> in fact the positions being programmed into CRTC registers. I can figure
> out all kind of strategies to deal with situation in plane commit code.
> However, the simplest solution is to write all plane positions from the
> scratch with each commit to all CRTCs with changed planes.
> =

> >> The problem appears when I have more than one plane active on a crtc a=
nd
> >> I just need to update one of the planes. In the situation nothing
> >> changes about the CRTC and the unchanged planes, so it is quite
> >> understandable that the helpers do not add the unchanged planes to the
> >> atomic state. But if I want to roll out the new plane positions from t=
he
> >> scratch with every commit that touches any plane on that CRTC, I need =
to
> >> have the unchanged planes there.
> >>
> >> So the drm_atomic_add_affected_planes()-calls are added just to avoid
> >> any internal plane position state in the driver.
> > =

> > Again, this should all happen already.
> =

> drm_atomic_helper_check() is supposed to add all the planes on the same
> CRTC in the atomic state, if one plane on that CRTC changes?
> =

> If that should be the case, then there is a bug somewhere.

Sry I misread, it only adds it for the case when there's a modeset. If you
need it in more cases (like when zpos changes), you indeed have to do that
yourself. Apologies for the confusion, Tom helped me clear this up with a
quick chat on irc.

Tom said you're working on a patch that calls add_affected_planes at the
right spot in atomic_check, and it sounds like that's all you really need.
-Daniel

> My test changes a property in a single plane, while another plane is
> active on the same CRTC. When I loop the planes with
> for_each_new_plane_in_state() in the crtc_flush() I can only find the
> updated plane.
> =

> Best regards,
> Jyri
> =

> -- =

> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
