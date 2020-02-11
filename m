Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3857C159366
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 16:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF2F6E51D;
	Tue, 11 Feb 2020 15:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C88A6EE92
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 15:42:00 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g1so4108880wmh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 07:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vUUuF+dCup8mbGiyfTagWxTJQ3SDlUkSN1wBUAZl/f0=;
 b=KtVufVh5J4YJcjWtLhCal+s7uwvEiyOJBo8YjzBJwzxnvUfF4Xw+/4Fza2ZnxY44ym
 Y+yOU0ZDS6F/ztUt9riDJo+N7NCQKtKR5TSB4ky2qUP1qnYK3AqEYHJ/I5nWFsXHKr8+
 9mWITBY9oyrPwe69Qq0YRL0C8pbyRS8EcOCII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vUUuF+dCup8mbGiyfTagWxTJQ3SDlUkSN1wBUAZl/f0=;
 b=RiktBs+42kA2noRv3TSeBUx+T3DPG7tU5TZIIkJZswiHD04A1gUQggD+ColuOIjchS
 +RZdI3149IJCHihM5H18QAZqy9MdZGboGKifcXe6mm9S4bDNQAGiWoRvA1EKu+9eMJF5
 qBMCAwYZQaTmfjkjQphy/Qq3DeGrAiP7yvQHqQt0B0rkwcpQCVTNuuBgRy24Xj6FtP2X
 P626z84UMMzCUP2JAvFUgv2atunS+9Xs3RHnEoi3eLKgLzXhwucyEDeC1temQnsq28Aj
 uCQSwVL2eJFJnuqUiVZxbEy6+j8vFXMRcq8/isr6igd767IMMYIjHcGw+1TMzhPaAHyE
 hWdw==
X-Gm-Message-State: APjAAAUaGO+HiRhH6Ii9k/37ICyMrxWH4TVhX/DKZ7SwOkudnF4kx08y
 yKe3NQmJM32bEdevJ4rOcePKUC9Oa0Q=
X-Google-Smtp-Source: APXvYqzX6zgLVgPd3c3Ssml00Tuhz7drQP8b7PXwnJiJAL4h9/oxBPFu2TtWf9r2mZ2WQzjZvU2JuA==
X-Received: by 2002:a1c:3d46:: with SMTP id k67mr6489396wma.171.1581435719103; 
 Tue, 11 Feb 2020 07:41:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d13sm5858391wrc.64.2020.02.11.07.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 07:41:58 -0800 (PST)
Date: Tue, 11 Feb 2020 16:41:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/tidss: dispc: Rewrite naive plane positioning code
Message-ID: <20200211154156.GH2363188@phenom.ffwll.local>
References: <20200207181824.7233-1-jsarha@ti.com>
 <02abcb19-efca-27a1-6aba-220532393a81@ti.com>
 <20200207184545.GQ13686@intel.com>
 <76f083da-e05f-9dd1-a85f-c7a3a1820f6a@ti.com>
 <20200210132103.GS13686@intel.com>
 <1f396d11-2ce0-ef01-dd6e-8c563568800b@ti.com>
 <20200210160336.GT13686@intel.com>
 <5b985430-3659-68be-4834-9cc2de9daf5e@ti.com>
 <20200211130030.GU13686@intel.com>
 <20200211154021.GG2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211154021.GG2363188@phenom.ffwll.local>
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
Cc: praneeth@ti.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 sam@ravnborg.org, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 04:40:21PM +0100, Daniel Vetter wrote:
> On Tue, Feb 11, 2020 at 03:00:30PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Tue, Feb 11, 2020 at 11:11:34AM +0200, Tomi Valkeinen wrote:
> > > Hi Ville,
> > > =

> > > On 10/02/2020 18:03, Ville Syrj=E4l=E4 wrote:
> > > =

> > > > The usual approach we follow in i915 for things that affect more
> > > > than one plane is is to collect that state into the crtc state.
> > > > That way we get to remember it for the planes that are not part
> > > > of the current commit.
> > > > =

> > > > And when we have state that affects more than one crtc that again
> > > > get collected up one level up in what we call global state
> > > > (basically drm_private_obj with less heavy handed locking scheme).
> > > =

> > > I'm confused. Don't we always have the full state available? Why do y=
ou need to store state into =

> > > custom crtc-state?
> > > =

> > > Here we are interested in the x, y and z positions of all the planes =
on a crtc. Creating a custom =

> > > state object and duplicating that information there seems a bit silly=
, as surely that information is =

> > > tracked by DRM?
> > =

> > You can have it if you add all the planes to the state, which can be
> > a bit expensive. Another option would to peek into the planes' states
> > that aren't in the commit, but that's quite gross due to bypassing
> > the normal locking rules and instead relying on the crtc mutex to
> > sufficiently protect the plane states as well. And I suspect trying
> > to do said peeking during the commit phase when the locks have
> > already been dropped will end badly.
> =

> Yup, don't peek outside of atomic_check.
> =

> Also the peeking only works for planes associated to the crtc. Either
> because that's how the hw works (i915 has fixed plane routing).
> =

> Now if this is only about all the planes currently active on a crtc, then
> you the helpers will already add all those plane states for you, and you
> can just walk them in your commit function. Not exactly sure what you need
> here.

See drm_atomic_add_affected_planes() in case you're rolling your own
stuff.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
