Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F38784741D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 17:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E602110F0C5;
	Fri,  2 Feb 2024 16:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WsZhLkJX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10C210F0BC
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 16:07:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9E481C0007;
 Fri,  2 Feb 2024 16:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706890059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Weks7RHR+sDFkVJXBmvPTUMZqebWWfxJm3w8ueDMk3U=;
 b=WsZhLkJX3vM9eQMZ1GukgFiUom/09EVzNiqk3KL+QzdjdrLrXimwRw/s37xRgMYJYX1gI9
 dZMX3zOblbYq0GKGxg2OB8G2is7xlDwbQ0bcxxu4vXh7ub/eCeprtxpZHeUFFWG5AYNckW
 ZiYaCUmKxdauSz3v7JTsnBUxOcTzq6wPwIV+D1Lp6EVXOUmILgu3COUzA5VWMtzPAT8tj2
 TGq8vilM9QZpTDpf35HGRcj8r1XGyzf/uxyE7lSawtYw+xVK0Yz3DcrTkTmS7ghVDEmz5g
 2YJxzDZ0hsjhhF/cKg3wYy2OTbEvnhOBt1086/TGASZCS3uFaqFd/boCscFJUw==
Date: Fri, 2 Feb 2024 17:07:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Maxime Ripard <mripard@kernel.org>, Louis Chauvet
 <louis.chauvet@bootlin.com>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, Haneen Mohammed
 <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 marcheu@google.com, seanpaul@google.com, nicolejadeyee@google.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH 2/2] drm/vkms: Use a simpler composition function
Message-ID: <20240202170734.3176dfe4@xps-13>
In-Reply-To: <20240202174913.789a9db9@eldfell>
References: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
 <20240201-yuv-v1-2-3ca376f27632@bootlin.com>
 <20240202105522.43128e19@eldfell> <20240202102601.70b6d49c@xps-13>
 <3nofkwzgnf4yva2wfogdbii47ohpi2wm5vp6aijtg3emxyoowt@twyreqz7ai3g>
 <20240202131322.5471e184@xps-13> <20240202174913.789a9db9@eldfell>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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

Hi Pekka,

pekka.paalanen@haloniitty.fi wrote on Fri, 2 Feb 2024 17:49:13 +0200:

> On Fri, 2 Feb 2024 13:13:22 +0100
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > Hello Maxime,
> >=20
> > + Arthur
> >=20
> > mripard@kernel.org wrote on Fri, 2 Feb 2024 10:53:37 +0100:
> >  =20
> > > Hi Miquel,
> > >=20
> > > On Fri, Feb 02, 2024 at 10:26:01AM +0100, Miquel Raynal wrote:   =20
> > > > pekka.paalanen@haloniitty.fi wrote on Fri, 2 Feb 2024 10:55:22 +020=
0:
> > > >      =20
> > > > > On Thu, 01 Feb 2024 18:31:32 +0100
> > > > > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> > > > >      =20
> > > > > > Change the composition algorithm to iterate over pixels instead=
 of lines.
> > > > > > It allows a simpler management of rotation and pixel access for=
 complex formats.
> > > > > >=20
> > > > > > This new algorithm allows read_pixel function to have access to=
 x/y
> > > > > > coordinates and make it possible to read the correct thing in a=
 block
> > > > > > when block_w and block_h are not 1.
> > > > > > The iteration pixel-by-pixel in the same method also allows a s=
impler
> > > > > > management of rotation with drm_rect_* helpers. This way it's n=
ot needed
> > > > > > anymore to have misterious switch-case distributed in multiple =
places.       =20
> > > > >=20
> > > > > Hi,
> > > > >=20
> > > > > there was a very good reason to write this code using lines:
> > > > > performance. Before lines, it was indeed operating on individual =
pixels.
> > > > >=20
> > > > > Please, include performance measurements before and after this se=
ries
> > > > > to quantify the impact on the previously already supported pixel
> > > > > formats, particularly the 32-bit-per-pixel RGB variants.
> > > > >=20
> > > > > VKMS will be used more and more in CI for userspace projects, and
> > > > > performance actually matters there.
> > > > >=20
> > > > > I'm worrying that this performance degradation here is significan=
t. I
> > > > > believe it is possible to keep blending with lines, if you add ne=
w line
> > > > > getters for reading from rotated, sub-sampled etc. images. That w=
ay you
> > > > > don't have to regress the most common formats' performance.     =
=20
> > > >=20
> > > > While I understand performance is important and should be taken into
> > > > account seriously, I cannot understand how broken testing could be
> > > > considered better. Fast but inaccurate will always be significantly
> > > > less attractive to my eyes.     =20
> > >=20
> > > AFAIK, neither the cover letter nor the commit log claimed it was fix=
ing
> > > something broken, just that it was "better" (according to what
> > > criteria?).   =20
> >=20
> > Better is probably too vague and I agree the "fixing" part is not
> > clearly explained in the commit log. The cover-letter however states:
> >  =20
> > > Patch 2/2: This patch is more complex. My main target was to solve is=
sues
> > > I found in [1], but as it was very complex to do it "in place", I cho=
ose
> > > to rework the composition function.   =20
> > ... =20
> > > [1]: https://lore.kernel.org/dri-devel/20240110-vkms-yuv-v2-0-952fcaa=
5a193@riseup.net/   =20
> >=20
> > If you follow this link you will find all the feedback and especially
> > the "broken" parts. Just to be clear, writing bugs is totally expected
> > and review/testing is supposed to help on this regard. I am not blaming
> > the author in any way, just focusing on getting this code in a more
> > readable shape and hopefully reinforce the testing procedure.
> >  =20
> > > If something is truly broken, it must be stated what exactly is so we
> > > can all come up with a solution that will satisfy everyone.   =20
> >=20
> > Maybe going through the series pointed above will give more context
> > but AFAIU: the YUV composition is not totally right (and the tests used
> > to validate it need to be more complex as well in order to fail).
> >=20
> > Here is a proposal.
> >=20
> > Today's RGB implementation is only optimized in the line-by-line case
> > when there is no rotation. The logic is bit convoluted and may possibly
> > be slightly clarified with a per-format read_line() implementation,
> > at a very light performance cost. Such an improvement would definitely
> > benefit to the clarity of the code, especially when transformations
> > (especially the rotations) come into play because they would be clearly
> > handled differently instead of being "hidden" in the optimized logic.
> > Performances would not change much as this path is not optimized today
> > anyway (the pixel-oriented logic is already used in the rotation case).
> >=20
> > Arthur's YUV implementation is indeed well optimized but the added
> > complexity probably lead to small mistakes in the logic. The
> > per-format read_line() implementation mentioned above could be
> > extended to the YUV format as well, which would leverage Arthur's
> > proposal by re-using his optimized version. Louis will help on this
> > regard. However, for more complex cases such as when there is a
> > rotation, it will be easier (and not sub-optimized compared to the RGB
> > case) to also fallback to a pixel-oriented processing.
> >=20
> > Would this approach make sense? =20
>=20
> Hi,
>=20
> I think it would, if I understand what you mean. Ever since I proposed
> a line-by-line algorithm to improve the performance, I was thinking of
> per-format read_line() functions that would be selected outside of any
> loops. Extending that to support YUV is only natural. I can imagine
> rotation complicates things, and I won't oppose that resulting in a
> much heavier read_line() implementation used in those cases. They might
> perhaps call the original read_line() implementations pixel-by-pixel or
> plane-by-plane (i.e. YUV planes) per pixel. Chroma-siting complicates
> things even further. That way one could compose any
> rotation-format-siting combination by chaining function pointers.

I'll let Louis also validate but on my side I feel like I totally
agree with your feedback.

> I haven't looked at VKMS in a long time, and I am disappointed to find
> that vkms_compose_row() is calling plane->pixel_read() pixel-by-pixel.
> The reading vfunc should be called with many pixels at a time when the
> source FB layout allows it. The whole point of the line-based functions
> was that they repeat the innermost loop in every function body to make
> the per-pixel overhead as small as possible. The VKMS implementations
> benchmarked before and after the original line-based algorithm showed
> that calling a function pointer per-pixel is relatively very expensive.
> Or maybe it was a switch-case.

Indeed, since your initial feedback Louis made a couple of comparisons
and the time penalty is between +5% and +60% depending on the case,
AFAIR.

> Sorry, I didn't realize the optimization had already been lost.

No problem, actually I also lost myself in my first answer as I
initially thought the (mainline) RGB logic was also broken in edge
cases, which it was not, only the YUV logic suffered from some
limitations.

> Btw. I'd suggest renaming vkms_compose_row() to vkms_fetch_row() since
> it's not composing anything and the name mislead me.

Makes sense.

> I think if you inspect the compositing code as of revision
> 8356b97906503a02125c8d03c9b88a61ea46a05a you'll get a better feeling of
> what it was supposed to be.

Excellent, thanks a lot!

Miqu=C3=A8l
